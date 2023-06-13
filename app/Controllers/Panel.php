<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\RepresentativesModel;
use App\Models\Cities;
use App\Models\Types;

class Panel extends BaseController
{

    public $RepresentativesModel;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->CampsModel = new Camps();
        $this->RepresentativesModel = new RepresentativesModel();
        $this->CitiesModel = new Cities();
        $this->TypesModel = new Types();
        
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

        if ($this->CampsModel->insert($data)) {
            echo 'Всё ок';
            //$this->TypesModel->insert($data);
        } else {
            echo 'Лагерь не добавлен';
        }
        

        echo '<pre>';
        print_r($data);
        echo '</pre>';

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