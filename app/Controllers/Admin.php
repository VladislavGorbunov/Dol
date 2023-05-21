<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Cities;
use App\Models\RepresentativesModel;

class Admin extends BaseController
{

    public $RepresentativesModel;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->RepresentativesModel = new RepresentativesModel();
        $this->CitiesModel = new Cities();
        // Preload any models, libraries, etc, here.
    }

    // Форма авторизации админа   
    public function Index()
    {
        return view('admin/authAdmin');
    }

    // Проверка логина и пароля, открытие сессии
    public function Auth()
    {
        $login = $this->request->getVar('login');
        $password = $this->request->getVar('password');

        if ($login == 'admin' && $password == 'admin') {
            $_SESSION['logged'] = 'logged';
            return redirect()->to(site_url("/admin/panel"));
        } else {
            return redirect()->to(site_url("/admin"));
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
            'representatives' => $this->RepresentativesModel->AllRepresentatives()->paginate(10),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        .view('admin/representatives', $data)
        .view('layouts/admin_footer');
    }

    public function ActivatedRepresentatives()
    {

        $data = [
            'representatives' => $this->RepresentativesModel->ActivatedRepresentatives()->paginate(10),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        .view('admin/representatives', $data)
        .view('layouts/admin_footer');
    }

    public function NotActivatedRepresentatives()
    {
        $data = [
            'representatives' => $this->RepresentativesModel->NotActivatedRepresentatives()->paginate(10),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        .view('admin/representatives', $data)
        .view('layouts/admin_footer');
    }

    public function GetRepresentative($id)
    {
        $data['info'] = $this->RepresentativesModel->GetRepresentative($id);
        $data['city'] = $this->CitiesModel->GetCity($data['info'][0]['cities_id']);
        return view('layouts/admin_header')
        .view('admin/representatives_view', $data)
        .view('layouts/admin_footer');
    }

    // Выход из админки
    public function Logout()
    {
        
        unset($_SESSION['logged']);
        session_destroy();
        return redirect()->to(site_url("/admin"));
    }
    
    
}