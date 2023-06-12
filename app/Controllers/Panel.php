<?php

namespace App\Controllers;

use Config\Services;
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
        echo '<pre>';
        print_r($_POST);
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