<?php

namespace App\Filters;

use CodeIgniter\Filters\FilterInterface;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;


class Auth implements FilterInterface
{
    public function before(RequestInterface $request, $arguments = null)
    {
        global $config;
        $session = \Config\Services::session($config);
        
        if (isset($_SESSION['logged'])) {
            if($_SESSION['logged'] != TRUE){
            // then redirct to login page
            return redirect()->to(site_url("/admin"));

            }
        }
    
    }

    public function after(RequestInterface $request, ResponseInterface $response, $arguments = null)
    {
        // Do something here
    }
}