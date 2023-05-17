<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Cities;
use App\Models\RepresentativesModel;

class Registration extends BaseController
{

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        session_start();

       
        //$this->metroModel = new MetroModel();
        

        // Preload any models, libraries, etc, here.
    }

    
    public function Index()
    {
        $this->validation = \Config\Services::validation(); 
        $cities = new Cities();
        $data['cities'] = $cities->getAllCity();
        return view('site/registration', $data);
    }
    
   
    public function Save()
    {
        $this->validation = \Config\Services::validation(); 
        
        // Правила валидации
        $rules = [
            'cities_id' => 'required',
            'organization' => 'required',
            'inn' => 'required',
            'director'  => 'required',
            'director_phone' => 'required',
            'firstname_manager' => 'required',
            'lastname_manager' => 'required',
            'post'  => 'required',
            'email_manager' => 'required',
            'phone_manager' => 'required',
            'password' => 'required',
        ];
          
        if($this->validate($rules)){
            $model = new RepresentativesModel();

            $data = [
                'cities_id'     => $this->request->getVar('cities_id'),
                'organization'    => $this->request->getVar('organization'),
                'inn'     => $this->request->getVar('inn'),
                'director'    => $this->request->getVar('director'),
                'director_phone'     => $this->request->getVar('director_phone'),
                'firstname_manager'    => $this->request->getVar('firstname_manager'),
                'lastname_manager'     => $this->request->getVar('lastname_manager'),
                'post'    => $this->request->getVar('post'),
                'email_manager'    => $this->request->getVar('email_manager'),
                'phone_manager'     => $this->request->getVar('phone_manager'),
                'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT)
            ];

            $model->save($data);
            return redirect()->to(site_url("/"));
            
        }else{
            $_SESSION['error'] = $this->validation->listErrors();
            return redirect()->to(site_url("/registration"));
        }
       
    }
}