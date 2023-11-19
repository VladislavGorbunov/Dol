<?php

namespace App\Controllers;

use App\Models\CampsModel;
use App\Models\RepresentativesModel;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\CampsTypes;
use App\Models\CampsSeasons;
use App\Models\Images;
use App\Models\Shifts;
use App\Controllers\RecaptchaController;
use App\Models\BookingsModel;

use CodeIgniter\Files\File;
use CodeIgniter\Cookie\Cookie;


class PanelController extends BaseController
{
    public $RepresentativesModel;
    public $CampsModel;
    public $CitiesModel;
    public $TypesModel;
    public $SeasonsModel;
    public $CampsTypes;
    public $CampsSeasons;
    public $ImagesModel;
    public $ShiftsModel;
    public $RecaptchaController;
    public $BookingsModel;
    public $booking_count;

    private $delete_chars = ['<script>', '%', '_', '(', ')', '"', '\'', '?', 'script', '#'];
    
    
    protected $helpers = ['form'];
    protected $imagesFolder;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->CampsModel = new CampsModel();
        $this->RepresentativesModel = new RepresentativesModel();
        $this->CitiesModel = new Cities();
        $this->TypesModel = new Types();
        $this->SeasonsModel = new Seasons();
        $this->CampsTypes = new CampsTypes();
        $this->CampsSeasons = new CampsSeasons();
        $this->ImagesModel = new Images();
        $this->ShiftsModel = new Shifts();
        $this->BookingsModel = new BookingsModel();
        $this->RecaptchaController = new RecaptchaController();

        $this->imagesFolder = $_SERVER['DOCUMENT_ROOT'] . '/public/images/camps';

        $session->set(['booking_count' => $this->booking_count = count($this->BookingsModel->where('representative_id', $session->get('id'))->where('confirmed', 0)->findAll())]);
        
        // Preload any models, libraries, etc, here.
    }


    public function Index()
    {
        $session = session();
        
        $data['user'] = $this->RepresentativesModel->where('user_id', $session->get('id'))->first();
        $data['camps'] = $this->CampsModel->where('representatives_id', $data['user']['user_id'])->findAll();
        
        // Создание массива лагерей для главной страницы панели
        for ($i = 0; $i < count($data['camps']); $i++) {
            $data['camps'][$i] = [
                'slug' => $data['camps'][$i]['slug'],
                'title' => $data['camps'][$i]['title'],
                'camps_id' => $data['camps'][$i]['camps_id'],
                'adress' => $data['camps'][$i]['adress'],
                'shifts' => $this->ShiftsModel->where(['camps_id' => $data['camps'][$i]['camps_id']])->findAll(),
                'cover' => $this->ImagesModel->where(['cover' => 1, 'camps_id' => $data['camps'][$i]['camps_id']])->first()
            ];
        }
       
        return view('layouts/panel_header', $data)
        .view('panel/index')
        .view('layouts/panel_footer');
    }


    // Проверка логина и пароля, открытие сессии
    public function Auth()
    {
        $session = session();
        $validation = \Config\Services::validation();

        $rules = ([
            'email' => ['label' => 'Email', 'rules' => 'required|valid_email'],
            'password' => ['label' => 'Пароль', 'rules' => 'required|alpha_numeric_punct'],
        ]);


        $email = str_replace($this->delete_chars, '', $this->request->getVar('email')); 
        $password = str_replace($this->delete_chars, '', $this->request->getVar('password'));

        if (!$this->validate($rules)) {
            $session->setFlashdata('msg-error', $this->validator->getErrors());
            return redirect()->back()->withInput();
        }

        if (empty($_POST['h-captcha-response'])) {
            $error = ['Пройдите проверку на робота, нажмите на кнопку "Я человек".'];
            $session->setFlashdata('msg-error', $error);
            return redirect()->to('/login');
        }

        $captcha_result = $this->RecaptchaController->RecaptchaCheck($_POST['h-captcha-response']);
       
        $data = $this->RepresentativesModel->where('email_manager', $email)->first();

        if (empty($data) || $data['activated'] == 0) {
            $error = ['Профиль не найден или не активен.'];
            $session->setFlashdata('msg-error', $error);
            return redirect()->to('/login');
            die;
        }

        if (empty($captcha_result)) {
            $error = ['Вы не прошли проверку на робота. Попробуйте еще раз.'];
            $session->setFlashdata('msg-error', $error);
            return redirect()->to('/login');
            die;
        }

        if ($data) {
            $pass = $data['password'];
            $authenticatePassword = password_verify($password, $pass);

            if ($authenticatePassword) {
                $ses_data = [
                    'id' => $data['user_id'],
                    'name' => $data['firstname_manager'],
                    'email' => $data['email_manager'],
                    'isLoggedIn' => TRUE
                ];

                $session->set($ses_data);

                return redirect()->to('/panel');
            
            } else {
                $error = ['Неверный email или пароль'];
                $session->setFlashdata('msg-error', $error);
                return redirect()->to('/login');
            }
        } else {
            $error = ['Неверный email или пароль'];
            $session->setFlashdata('msg-error', $error);
            return redirect()->to('/login');
        }
    }


    public function addCampForm()
    {
        $data['cities'] = $this->CitiesModel->findAll();
        $data['types'] = $this->TypesModel->findAll();
        $data['seasons'] = $this->SeasonsModel->findAll();

        return view('layouts/panel_header', $data)
        .view('panel/add-camp')
        .view('layouts/panel_footer');
    }

    public function addCamp()
    {
        $session = session();
        $validation = \Config\Services::validation();
        $image = \Config\Services::image('gd');

        // Удаляем запрещённые символы из полей
        foreach($this->request->getVar() as $key => $var) {
            if (!is_array($var)) $data[$key] = str_replace($this->delete_chars, '', $var);
        }
        
    
        $data['representatives_id'] = str_replace($this->delete_chars, '', $session->get('id'));
        $types_data['types'] = $this->request->getVar('types');
        $seasons_data['seasons'] = $this->request->getVar('seasons');
        $data['slug'] = $this->SlugCreate($data['title']);
        
       
        $rules = ([
            'title' => ['label' => 'Название лагеря', 'rules' => 'required|max_length[25]'],
            'camp_base' => ['label' => 'Название базы', 'rules' => 'required'],
            'cities_id' => ['label' => 'Регион', 'rules' => 'required|integer'],
            //'representatives_id' => ['label' => 'ID представителя', 'rules' => 'required'],
            'adress' => ['label' => 'Адрес', 'rules' => 'required'],
            'year' => ['label' => 'Год основания', 'rules' => 'required|integer'],
            'min_age' => ['label' => 'Минимальный возраст', 'rules' => 'required|integer'],
            'max_age' => ['label' => 'Максимальный возраст', 'rules' => 'required|integer'],
            'security' => ['label' => 'Охраняемая территория', 'rules' => 'required'],
            'free_transfer' => ['label' => 'Охраняемая территория', 'rules' => 'required'],
            'coords' => ['label' => 'Координаты', 'rules' => 'required'],
            'description' => ['label' => 'Описание лагеря', 'rules' => 'required'],
            'placement' => ['label' => 'Размещение', 'rules' => 'required'],
            'advantages' => ['label' => 'Преимущества лагеря', 'rules' => 'required'],
            'daily_schedule' => ['label' => 'Распорядок дня', 'rules' => 'required'],
        ]);

    

        if (!$this->validate($rules)) {
            return redirect()->back()->withInput();
        }



        if (!$types_data['types']) {
            $session->setFlashdata('msg-error', 'Не выбраны типы лагеря');
            return redirect()->to('/panel/add-camp');
            die;
        }

        if (!$seasons_data['seasons']) {
            $session->setFlashdata('msg-error', 'Не выбраны сезоны');
            return redirect()->to('/panel/add-camp');
            die;
        }

        if (!$validation->run($data)) {
            $session->setFlashdata('msg-error', validation_list_errors());
            return redirect()->to('/panel/add-camp');
            die;
        }

        if (count($types_data['types']) > 6) {
            $session->setFlashdata('msg-error', 'Отметьте не более 6 типов к которому относится ваш лагерь!');
            return redirect()->to('/panel/add-camp');
        }

        if ($this->CampsModel->where('title', $data['title'])->first()) {
            $session->setFlashdata('msg-error', 'Лагерь с таким названием уже есть. Попробуйте изменить имя или обратитесь в службу поддержки.');
            return redirect()->to('/panel/add-camp');
        }

        
        if ($this->CampsModel->insert($data)) {

            $camp = $this->CampsModel->where('slug', $data['slug'])->first();
            $camps_id = $camp['camps_id'];

            // Добавление в БД типов лагеря
            foreach ($types_data['types'] as $key => $type) {
                $types = [
                    'camps_id' => $camps_id,
                    'types_id' => $type,
                ];

                // Если произошла ошибка добавления типов, удаляем лагерь и выводим сообщение
                if (!$this->CampsTypes->insert($types)) {
                    $this->CampsModel->where(['camps_id' => $camps_id])->delete();
                    $session->setFlashdata('msg-error', 'Произошла ошибка добавления типов лагеря. Попробуйте снова или обратитесь в службу поддержки.');
                    return redirect()->to('/panel');
                }
            }

            // Добавление в БД сезонов лагеря
            foreach ($seasons_data['seasons'] as $key => $season) {
                $seasons = [
                    'camps_id' => $camps_id,
                    'seasons_id' => $season,
                ];
                
                // Если произошла ошибка добавления сезонов, удаляем лагерь и выводим сообщение
                if (!$this->CampsSeasons->insert($seasons)) {
                    $this->CampsModel->where(['camps_id' => $camps_id])->delete();
                    $session->setFlashdata('msg-error', 'Произошла ошибка добавления сезонов лагеря. Попробуйте снова или обратитесь в службу поддержки.');
                    return redirect()->to('/panel');
                }
            }

            // Путь до папки для загружаемых оригинальных изображений лагеря
            $home = $this->imagesFolder .'/'. $data['slug'];

            if ($cover = $this->request->getFile('cover')) {
                if ($cover->isValid() && ! $cover->hasMoved()) {

                    if ($cover->getClientMimeType() !== 'image/jpeg') {
                        $session->setFlashdata('msg', 'Обложка не соответствуют допустимому расширению. Допустимые расширения: JPG и PNG.
                        ');
                        
                    } else {
                        $newNameCover = $cover->getRandomName();
                        $cover->move($home, $newNameCover);
                        $data_cover = [
                            'camps_id' => $camps_id,
                            'name_img' => $newNameCover,
                            'cover' => 1,
                        ];

                        $this->ImagesModel->save($data_cover);

                        if (!file_exists($home .'/cover/')) {
                        // Создание папки для маленьких изображений
                            mkdir($home .'/cover/');
                        }
                        $cover_flag = $image->withFile($home .'/'. $newNameCover)
                        ->fit(400, 340, 'center')
                        ->save($home .'/cover/'. $newNameCover);

                        // Удаление оригинальной обложки
                        unlink($home .'/'. $newNameCover);
                    }
                }
            }
    

            // Загрузка дополнительных изображений
            if ($imagefiles = $this->request->getFiles()) {
                
                foreach ($imagefiles['images'] as $img) {
                    if ($img->isValid() && ! $img->hasMoved()) {

                        if ($img->getClientMimeType() !== 'image/jpeg') {
                            $session->setFlashdata('msg', 'Некоторые изображения не загружены так как не соответствуют допустимому расширению. Допустимые расширения: JPG и PNG.
                            ');
                            
                        } else {
                            $newName = $img->getRandomName();
                            $img->move($home, $newName);
                            $data_image = [
                                'camps_id' => $camps_id,
                                'name_img' => $newName,
                                'cover' => 0,
                            ];

                            $this->ImagesModel->save($data_image);

                            if (!file_exists($home .'/photo/')) {
                                // Создание папки для маленьких изображений
                                    mkdir($home .'/photo/');
                                }
                            
                            $images_flag = $image->withFile($home .'/'. $newName)
                            ->resize(1000, 550, true, 'width')
                            ->crop(1000, 550, 0, 0)
                            ->save($home .'/photo/'. $newName);

                            // Удаление оригинальных изображений
                            unlink($home .'/'. $newName);
                        }
                    }
                }

                $session->setFlashdata('msg-success', 'Лагерь добавлен в базу данных и отправлен на проверку.');
                return redirect()->to('/panel');
            }

        } else {
            $session->setFlashdata('msg-error', 'При добавлении лагеря произошла ошибка. Обратитесь в службу поддержки. Код ошибки: Controller#panel#216');
            return redirect()->to('/panel');
        }
    }

    // Метод редактирования данных лагеря
    public function editCampForm($camp_id)
    {
        $session = session();
        $data['cities'] = $this->CitiesModel->findAll();
        $data['types'] = $this->TypesModel->findAll();
        $data['campsTypes'] = $this->CampsTypes->where('camps_id', $camp_id)->findAll();
        $data['cover'] = $this->ImagesModel->where(['camps_id'=> $camp_id, 'cover' => 1])->findAll();

        $data['seasons'] = $this->SeasonsModel->findAll();
        $data['campsSeasons'] = $this->CampsSeasons->where('camps_id', $camp_id)->findAll();

        $data['camp'] = $this->CampsModel->where('camps_id', $camp_id)->first();
        
        if ($data['camp']['representatives_id'] != $session->get('id')) {
            $session->setFlashdata('msg-error', 'Ошибка: невозможно редактировать этот лагерь.');
            return redirect()->to('/panel');
        }

        $data['camp']['city'] = $this->CitiesModel->where('cities_id', $data['camp']['cities_id'])->first();
        return view('layouts/panel_header', $data)
        .view('panel/edit-camp')
        .view('layouts/panel_footer');
    }


    
    public function updateCamp($camp_id) 
    {
        $session = session();

        $data['camp'] = $this->CampsModel->where('camps_id', $camp_id)->first();
        
        if ($data['camp']['representatives_id'] != $session->get('id')) {
            $session->setFlashdata('msg-error', 'Ошибка: невозможно редактировать этот лагерь.');
            return redirect()->to('/panel');
        }
        
        $data['camps_id'] = $camp_id;
        $data['camp_base'] = $this->request->getVar('camp_base');
        $data['year'] = $this->request->getVar('year');
        $data['min_age'] = $this->request->getVar('min_age');
        $data['max_age'] = $this->request->getVar('max_age');
        $data['security'] = $this->request->getVar('security');
        $data['free_transfer'] = $this->request->getVar('free_transfer');
        $data['vk_link'] = $this->request->getVar('vk_link');
        $data['site_link'] = $this->request->getVar('site_link');
        $data['cities_id'] = $this->request->getVar('cities_id');
        $data['adress'] = $this->request->getVar('adress');
        $data['coords'] = $this->request->getVar('coords');
        $types_data['types'] = $this->request->getVar('types');
        $seasons_data['seasons'] = $this->request->getVar('seasons');
        $data['description'] = $this->request->getVar('description');
        $data['placement'] = $this->request->getVar('placement');
        $data['advantages'] = $this->request->getVar('advantages');
        $data['daily_schedule'] = $this->request->getVar('daily_schedule');
        
        // Удаляем все сезоны перед добавлением новых
        $delete_seasons = $this->CampsSeasons->where('camps_id', $camp_id)->delete();
        // Удаляем все типы перед добавлением новых
        $delete_types = $this->CampsTypes->where('camps_id', $camp_id)->delete();

        // Добавление в БД сезонов лагеря
        foreach ($seasons_data['seasons'] as $key => $season) {
            $seasons = [
                'camps_id' => $camp_id,
                'seasons_id' => $season,
            ];
            
            // Если произошла ошибка добавления сезонов, выводим сообщение
            if (!$this->CampsSeasons->insert($seasons)) {
                $session->setFlashdata('msg-error', 'Произошла ошибка изменения сезонов лагеря. Попробуйте снова или обратитесь в службу поддержки.');
                return redirect()->to('/panel');
            }
        }


        // Добавление в БД типов лагеря
        foreach ($types_data['types'] as $key => $type) {
            $types = [
                'camps_id' => $camp_id,
                'types_id' => $type,
            ];
            
            // Если произошла ошибка добавления сезонов, выводим сообщение
            if (!$this->CampsTypes->insert($types)) {
                $session->setFlashdata('msg-error', 'Произошла ошибка изменения типов лагеря. Попробуйте снова или обратитесь в службу поддержки.');
                return redirect()->to('/panel');
            }
        }
        

        if ($this->CampsModel->save($data)) {
            $session->setFlashdata('msg-success', 'Данные обновлены.');
            return redirect()->to('/panel');
        } else {
            echo 'ошибка';
            die;
        }
    }

    
    /*
    * Метод удаления лагеря из базы по id
    */ 
    public function deleteCamp($camp_id)
    {
        helper('filesystem');
        $session = session();
        if ($data = $this->CampsModel->where('camps_id', $camp_id)->first()) {
        
            if ($data['representatives_id'] == $session->get('id')) {
                
                // Путь до папки изображений лагеря
                $images_folder = $this->imagesFolder .'/'. $data['slug'];
                if (!is_dir($images_folder)) {
                    $session->setFlashdata('msg-error', 'Ошибка удаления изображений.');
                    return redirect()->to('/panel');
                }

                if (delete_files($images_folder, true) && rmdir($images_folder) && $camp = $this->CampsModel->where('camps_id', $camp_id)->delete()) {
                    $session->setFlashdata('msg-success', 'Лагерь удалён.');
                } else {
                    $session->setFlashdata('msg-error', 'При удалении произошла ошибка. Код ошибки: Controller#panel#349');
                }
                
            } else {
                $session->setFlashdata('msg-error', 'Ошибка: невозможно удалить этот лагерь.');
            }
        } else {
            $session->setFlashdata('msg-error', 'Ошибка: вы пытаетесь удалить несуществующий лагерь.');
        }

        return redirect()->to('/panel');
        
    }

    /* 
    ** Метод обновления обложки лагеря 
    */
    public function updateCover() 
    {
        $this->response->setHeader('Location', '/')->setHeader('Content-Type', 'application/json');

        // Путь до папки для загружаемых оригинальных изображений лагеря
        $home = $this->imagesFolder . '/' . $_POST['camp_slug'] . '/cover';
        
        $oldCover = $this->ImagesModel->where(['camps_id' => $_POST['camps_id'], 'cover' => 1])->first(); // Старая обложка

        if ($cover = $this->request->getFile('cover_new')) { // Получаем новый файл обложки
            $newNameCover = $cover->getRandomName(); // Задаём рандомное имя новой обложке

            if ($cover->move($home, $newNameCover)) { // Сохраняем новый файл в папку
                unlink($home .'/'. $oldCover['name_img']); // Удаляем старую обложку из папки
            } else {
                $data = ['msg' => 'Файл не сохранен'];
                return json_encode($data);
            }
        } else {
            $data = ['msg' => 'Файл не получен'];
            return json_encode($data);
        }
        
        $data_cover = [
            'camps_id' => $_POST['camps_id'],
            'name_img' => $newNameCover,
            'cover' => 1,
        ];


        if ($this->ImagesModel->save($data_cover)) { // Добавляем новую обложку в БД
            $this->ImagesModel->where('id', $oldCover['id'])->delete(); // Удаляем старую обложку из БД
        } else {
            $data = ['msg' => 'Ошибка при добавлении обложки'];
            return json_encode($data);
        }
        
        $data = ['msg' => 'Обложка обновлена', 'src' =>  $_POST['camp_slug'] . '/cover/' . $newNameCover];
        $data = json_encode($data);
        return $data;
    }


    public function SlugCreate($text)
    {
        $converter = array(
            'а' => 'a',    'б' => 'b',    'в' => 'v',    'г' => 'g',    'д' => 'd',
            'е' => 'e',    'ё' => 'e',    'ж' => 'zh',   'з' => 'z',    'и' => 'i',
            'й' => 'y',    'к' => 'k',    'л' => 'l',    'м' => 'm',    'н' => 'n',
            'о' => 'o',    'п' => 'p',    'р' => 'r',    'с' => 's',    'т' => 't',
            'у' => 'u',    'ф' => 'f',    'х' => 'h',    'ц' => 'c',    'ч' => 'ch',
            'ш' => 'sh',   'щ' => 'sch',  'ь' => '',     'ы' => 'y',    'ъ' => '',
            'э' => 'e',    'ю' => 'yu',   'я' => 'ya',
     
            'А' => 'A',    'Б' => 'B',    'В' => 'V',    'Г' => 'G',    'Д' => 'D',
            'Е' => 'E',    'Ё' => 'E',    'Ж' => 'Zh',   'З' => 'Z',    'И' => 'I',
            'Й' => 'Y',    'К' => 'K',    'Л' => 'L',    'М' => 'M',    'Н' => 'N',
            'О' => 'O',    'П' => 'P',    'Р' => 'R',    'С' => 'S',    'Т' => 'T',
            'У' => 'U',    'Ф' => 'F',    'Х' => 'H',    'Ц' => 'C',    'Ч' => 'Ch',
            'Ш' => 'Sh',   'Щ' => 'Sch',  'Ь' => '',     'Ы' => 'Y',    'Ъ' => '',
            'Э' => 'E',    'Ю' => 'Yu',   'Я' => 'Ya',
        );
     
        $text = strtr($text, $converter);
        $text = strtolower($text);
        $text = str_replace(' ', '-', $text);
        return preg_replace("/[^a-zA-Z0-9\s-]/", "", $text);
    }


    // Выход из панели
    public function Logout()
    {
        $session = session();
        $session->remove('id');
        $session->remove('name');
        $session->remove('email');
        $session->remove('isLoggedIn');
        return redirect()->to('/login');
    }


}