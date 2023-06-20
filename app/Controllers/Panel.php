<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\RepresentativesModel;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Images;


use CodeIgniter\Files\File;

class Panel extends BaseController
{
    public $RepresentativesModel;
    protected $helpers = ['form'];

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->CampsModel = new Camps();
        $this->RepresentativesModel = new RepresentativesModel();
        $this->CitiesModel = new Cities();
        $this->TypesModel = new Types();
        $this->ImagesModel = new Images();
        
        // Preload any models, libraries, etc, here.
    }

    public function Index()
    {
        $session = session();
       
        $data['user'] = $this->RepresentativesModel->where('user_id', $session->get('id'))->first();

        //var_dump($data['user']);
        return view('layouts/panel_header', $data)
        .view('panel/index')
        .view('layouts/panel_footer');
    }


    // Проверка логина и пароля, открытие сессии
    public function Auth()
    {
        $session = session();
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');

        $data = $this->RepresentativesModel->where('email_manager', $email)->first();

        if (empty($data) || $data['activated'] == 0) {
            $session->setFlashdata('msg', 'Профиль не найден или не активен.');
            return redirect()->to('/login');
            die;
        }

        if($data){
            $pass = $data['password'];
            $authenticatePassword = password_verify($password, $pass);
            if($authenticatePassword){
                $ses_data = [
                    'id' => $data['user_id'],
                    'name' => $data['firstname_manager'],
                    'email' => $data['email_manager'],
                    'isLoggedIn' => TRUE
                ];
                $session->set($ses_data);
                return redirect()->to('/panel');
            
            }else{
                $session->setFlashdata('msg', 'Неверный пароль.');
                return redirect()->to('/login');
            }
        }else{
            $session->setFlashdata('msg', 'Неверный email.');
            return redirect()->to('/login');
        }
    }


    public function addCampForm()
    {
        $data['cities'] = $this->CitiesModel->findAll();
        $data['types'] = $this->TypesModel->findAll();

        return view('layouts/panel_header', $data)
        .view('panel/add-camp')
        .view('layouts/panel_footer');
    }

    public function addCamp()
    {
        $validation = \Config\Services::validation();
    

        $validation->setRules([
            'title' => ['label' => 'Название лагеря', 'rules' => 'required'],
            'cities_id' => ['label' => 'Регион', 'rules' => 'required'],
            'adress' => ['label' => 'Адрес', 'rules' => 'required'],
            'year' => ['label' => 'Год основания', 'rules' => 'required'],
            'min_age' => ['label' => 'Минимальный возраст', 'rules' => 'required'],
            'max_age' => ['label' => 'Максимальный возраст', 'rules' => 'required'],
            'security' => ['label' => 'Охраняемая территория', 'rules' => 'required'],
            'free_transfer' => ['label' => 'Охраняемая территория', 'rules' => 'required'],
            'coords' => ['label' => 'Координаты', 'rules' => 'required'],
            //'types.*.type' => ['label' => 'Типы лагеря', 'rules' => 'required'],
            'cover' => ['label' => 'Обложка', 'rules' => 'required'],
            'description' => ['label' => 'Описание лагеря', 'rules' => 'required'],
            'placement' => ['label' => 'Размещение', 'rules' => 'required'],
            'advantages' => ['label' => 'Преимущества лагеря', 'rules' => 'required'],
            'daily_shedule' => ['label' => 'Распорядок дня', 'rules' => 'required'],
        ]);

        $session = session();
        $data['title'] = $this->request->getVar('title');
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
        $data['description'] = $this->request->getVar('description');
        $data['placement'] = $this->request->getVar('placement');
        $data['advantages'] = $this->request->getVar('advantages');
        $data['daily_schedule'] = $this->request->getVar('daily_schedule');
        $data['slug'] = $this->SlugCreate($data['title']);

        // echo '<pre>';
        // var_dump($types_data['types']);
        // echo '</pre>';
        // die;
        if (!$validation->run($data)) {
            
            $session->setFlashdata('msg-error', validation_list_errors());
            return redirect()->to('/panel/add-camp');
            die;
        }

        if ($this->CampsModel->insert($data)) {

            $camp = $this->CampsModel->where('slug', $data['slug'])->first();
            $camps_id = $camp['camps_id'];
            
            // Путь до папки для загружаемых изображений лагеря
            $home = $_SERVER['DOCUMENT_ROOT'] . "/";
            $home = $home . '/public/images/camps/'. $data['slug'];

            
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
                    }
                }
            }
    

            // Загрузка изображений
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
                        }
                    }
                }
                $session->setFlashdata('msg-success', 'Лагерь добавлен в базу данных и отправлен на проверку.');
                return redirect()->to('/panel');
            }

            //$this->TypesModel->insert($data);
        } else {
            $session->setFlashdata('msg-error', 'При добавлении лагеря произошла ошибка. Обратитесь в службу поддержки.');
            return redirect()->to('/panel');
            
        }


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