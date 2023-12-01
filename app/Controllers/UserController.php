<?php

namespace App\Controllers;

use Config\Services;
use App\Models\RepresentativesModel;

class UserController extends BaseController
{
    private $session;
    private $user;
    public $req;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $this->session = session();
        $this->user = new RepresentativesModel();
        // Preload any models, libraries, etc, here.
    }

    public function editUser()
    {
        
        if ($this->request->getMethod(true) === 'POST') {
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


}