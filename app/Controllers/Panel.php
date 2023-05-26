<?php

namespace App\Controllers;

use Config\Services;
use App\Models\RepresentativesModel;

class Panel extends BaseController
{

    public $RepresentativesModel;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->RepresentativesModel = new RepresentativesModel();
        
        // Preload any models, libraries, etc, here.
    }



    // Проверка логина и пароля, открытие сессии
    public function Auth()
    {
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');

        $result = $this->RepresentativesModel->where('email_manager', $email)->findAll();

        if (!empty($result) && $result[0]['activated'] == 1) {
            echo 'ok';
            $_SESSION['logged'] = 'logged';
        } else {
            echo 'Профиль не найден или не активирован!';
        }
    }

    // Главная страница админки
    public function Panel()
    {
        return view('layouts/admin_header')
        .view('admin/index')
        .view('layouts/admin_footer');
    }

    public function AllRepresentatives()
    {
        
        // Пагинация
        $data = [
            'representatives' => $this->RepresentativesModel->AllRepresentatives()->paginate(15),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        .view('admin/representatives', $data)
        .view('layouts/admin_footer');
    }

    public function ActivatedRepresentatives()
    {

        $data = [
            'representatives' => $this->RepresentativesModel->ActivatedRepresentatives()->paginate(15),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        .view('admin/representatives', $data)
        .view('layouts/admin_footer');
    }

    public function NotActivatedRepresentatives()
    {
        $data = [
            'representatives' => $this->RepresentativesModel->NotActivatedRepresentatives()->paginate(15),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        .view('admin/representatives', $data)
        .view('layouts/admin_footer');
    }

    public function GetRepresentative(int $id)
    {
        $data['info'] = $this->RepresentativesModel->GetRepresentative($id);
        $data['city'] = $this->CitiesModel->GetCity($data['info'][0]['cities_id']);
        return view('layouts/admin_header')
        .view('admin/representatives_edit', $data)
        .view('layouts/admin_footer');
    }

    public function UpdateRepresentative()
    {
        
            $organization = str_replace('"', "", $this->request->getVar('organization'));
            $organization = str_replace("'", "", $this->request->getVar('organization'));
            
            $id = $this->request->getVar('user_id');

            $data = [
                'cities_id' => $this->request->getVar('cities_id'),
                'organization' => $organization,
                'inn' => $this->request->getVar('inn'),
                'director' => $this->request->getVar('director'),
                'director_phone' => $this->request->getVar('director_phone'),
                'firstname_manager' => $this->request->getVar('firstname_manager'),
                'lastname_manager' => $this->request->getVar('lastname_manager'),
                'post' => $this->request->getVar('post'),
                'email_manager' => $this->request->getVar('email_manager'),
                'phone_manager' => $this->request->getVar('phone_manager'),
                'activated' => $this->request->getVar('activated'),
                // 'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT)
            ];

            $this->RepresentativesModel->update($id, $data);
            return redirect()->to(site_url("/admin/panel/representatives"));
    }

    // Выход из админки
    public function Logout()
    {
        
        unset($_SESSION['logged']);
        session_destroy();
        return redirect()->to(site_url("/admin"));
    }
    
    
}