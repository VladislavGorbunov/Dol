<?php

namespace App\Controllers;

use Config\Services;

class Admin extends BaseController
{

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
    
        session_start();

        if ($_SESSION['logged_in'] = 1) {
            return redirect()->to(site_url("/myadmin/panel"));
        }

        // Preload any models, libraries, etc, here.
    }

    // Форма авторизации админа   
    public function Index()
    {
        return view('admin/authAdmin');
    }


    public function Auth()
    {
        $login = $this->request->getVar('login');
        $password = $this->request->getVar('password');

        if ($login == 'admin' && $password == 'admin') {
            $_SESSION['auth'] = 1;
            return redirect()->to(site_url("/myadmin/panel"));
        } else {
            echo 'error';
        }
    }

    public function Panel()
    {
        echo 'admin panel';
    }
    
    
}