<?php

namespace App\Controllers;

use Config\Services;

class Admin extends BaseController
{


    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);
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
            $_SESSION['logged'] = TRUE;
            return redirect()->to(site_url("/admin/panel"));
        } else {
            return redirect()->to(site_url("/admin"));
        }
    }

    // Главная страница админки
    public function Panel()
    {
        return view('admin/index');
    }

    // Выход из админки
    public function Logout()
    {
        
        $_SESSION['logged'] = 0;
        return redirect()->to(site_url("/admin"));
    }
    
    
}