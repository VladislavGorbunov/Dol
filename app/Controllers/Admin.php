<?php

namespace App\Controllers;

use Config\Services;

class Admin extends BaseController
{


    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
    
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
            $_SESSION['logged'] = 1;
            return redirect()->to(site_url("/admin/panel"));
        } 
    }

    public function Panel()
    {
        return view('admin/index');
    }

    public function Logout()
    {
        unset($_SESSION['logged']);
        $_SESSION['logged'] = FALSE;
        return redirect()->to(site_url("/admin"));
    }
    
    
}