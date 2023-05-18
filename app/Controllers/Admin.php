<?php

namespace App\Controllers;

use Config\Services;

class Admin extends BaseController
{

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
    
        session_start();
        // Preload any models, libraries, etc, here.
    }

    // Форма авторизации админа   
    public function Index()
    {
        return view('site/authAdmin');
    }


    public function Auth()
    {
        $login = $this->request->getVar('login');
        $password = $this->request->getVar('password');

        if ($login == 'admin' && $password == 'admin') {
            echo 'ok';
        } else {
            echo 'error';
        }
    }
    
    
}