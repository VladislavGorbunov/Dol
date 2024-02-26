<?php

namespace App\Controllers;

use Config\Services;
use App\Models\RepresentativesModel;
use App\Controllers\EmailController;

class UserController extends BaseController
{
    private $session;
    private $user;
    public $req;
    public $emailController;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $this->session = session();
        $this->user = new RepresentativesModel();
        $this->emailController = new EmailController();

        // Preload any models, libraries, etc, here.
    }

    public function editUser()
    {
        
        if ($this->request->is('post')) {
            $this->response->setHeader('Location', '/')->setHeader('Content-Type', 'application/json');
            
            $data['user_id'] = $this->request->getPost('user_id');
            $data['organization'] = $this->request->getPost('organization');
            $data['inn'] = $this->request->getPost('inn');
            $data['director'] = $this->request->getPost('director');
            $data['director_phone'] = $this->request->getPost('director_phone');
            $data['post'] = $this->request->getPost('post');
            $data['phone_manager'] = $this->request->getPost('phone_manager');
            $data['firstname_manager'] = $this->request->getPost('firstname_manager');
            $data['lastname_manager'] = $this->request->getPost('lastname_manager');
            $data['email_manager'] = $this->request->getPost('email_manager');
           
            if ($this->user->save($data)) {
                $data = ['success' => true];
            } else {
                $data = ['success' => false];
            }

            return json_encode($data);
        } else {
            $data['user'] = $this->user->where('user_id', $this->session->get('id'))->first();

            return view('layouts/panel_header', $data)
            .view('panel/user-edit')
            .view('layouts/panel_footer');
        }
    }



    public function PasswordReset()
    {
        $this->response->setHeader('Location', '/')->setHeader('Content-Type', 'application/json');
        $email = $this->request->getPost('email');
        if ($user = $this->user->where('email_manager', $email)->first()) {
            $password = $this->PasswordRandom();

            // Хешируем пароль перез записью в БД
            $passwordHash = password_hash($password, PASSWORD_DEFAULT);

            $newPassword = [
                'password' => $passwordHash
            ];

            if ($this->user->update($user['user_id'], $newPassword)) {
                // Отправка письма на почту с новым паролем
                $this->emailController->sendEmailPasswordReset($email, $password);
                $status = true;
            } else {
                $status = false;
            }
        } else {
            $status = false;
            $password = null;
        }

        $data = ['status' => $status, 'new_password' => $password];
        return json_encode($data);
    }


    public function PasswordRandom()
    {
        $length = 8;
        $password = '';
	    $arr = [
		    'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 
		    'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 
		    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 
		    'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 
		    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '!'
        ];
 
	    for ($i = 0; $i < $length; $i++) {
		    $password .= $arr[random_int(0, count($arr) - 1)];
	    }

	    return $password;
    }



}