<?php

namespace App\Controllers;

use App\Models\Cities;
use App\Models\RepresentativesModel;

class Registration extends BaseController
{
    public $CitiesModel;
    public $RepresentativesModel;
    public $email;
    protected $validation;
    private $delete_chars = ['<script>', '%', '_', '(', ')', '"', '\'', '?', 'script', '#'];

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);

        $this->CitiesModel = new Cities();
        $this->RepresentativesModel = new RepresentativesModel();
        $this->email = \Config\Services::email();
        
        // Preload any models, libraries, etc, here.
    }

    // Форма регистрации представителя лагеря    
    public function Index()
    {
        $session = session();
        $this->validation = \Config\Services::validation(); 
        $data['cities'] = $this->CitiesModel->getAllCity();
        return view('site/registration', $data);
    }
    
    // Добавление данных в БД
    public function Save()
    {
        $session = session();
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
            'email_manager' => 'required|is_unique[representatives.email_manager]',
            'phone_manager' => 'required',
            'password' => 'required',
        ];
          
        if ($this->validate($rules)) {
        
            $password = $this->request->getVar('password');

            $organization = str_replace('"', "", $this->request->getVar('organization'));
            $organization = str_replace("'", "", $this->request->getVar('organization'));
            
            $data = [
                'cities_id' => str_replace($this->delete_chars, '', $this->request->getVar('cities_id')),
                'organization' => str_replace($this->delete_chars, '',$organization),
                'inn' => str_replace($this->delete_chars, '', $this->request->getVar('inn')),
                'director' => str_replace($this->delete_chars, '', $this->request->getVar('director')),
                'director_phone' => str_replace($this->delete_chars, '', $this->request->getVar('director_phone')),
                'firstname_manager' => str_replace($this->delete_chars, '', $this->request->getVar('firstname_manager')),
                'lastname_manager' => str_replace($this->delete_chars, '', $this->request->getVar('lastname_manager')),
                'post' => str_replace($this->delete_chars, '', $this->request->getVar('post')),
                'email_manager' => str_replace($this->delete_chars, '', $this->request->getVar('email_manager')),
                'phone_manager' => str_replace($this->delete_chars, '', $this->request->getVar('phone_manager')),
                'password' => password_hash(str_replace($this->delete_chars, '', $this->request->getVar('password')), PASSWORD_DEFAULT)
            ];

            if ($this->RepresentativesModel->save($data)) {
                $this->SendEmailReg($data['email_manager'], $password);
                $msg = 'Ваша анкета отправлена на проверку. Мы уведомим Вас когда активируем Ваш личный кабинет.';
                $session->setFlashdata('msg', $msg);
                return redirect()->to(site_url("/login"));
            } else {
                $error = 'При регистрации произошла ошибка.';
                $session->setFlashdata('error', $error);
                return redirect()->to(site_url("/registration"));
            }
             
        } else {
            $_SESSION['error'] = $this->validation->listErrors();
            return redirect()->to(site_url("/registration"));
        }
       
    }


    public function SendEmailReg($emailto, $password)
    {
        
        $this->email->setFrom('ПоЛагерям', 'ByCamps');
        $this->email->setTo($emailto);
        $this->email->setSubject('Регистрация');
        $this->email->setMessage('Благодарим Вас за регистрацию. После проверки мы активируем ваш аккаунт. Ваш логин: ' .$emailto. ' Ваш пароль: '. $password .'  ');
        $this->email->send();
    }
}