<?php

namespace App\Controllers;

use App\Models\Cities;
use App\Models\RepresentativesModel;
use App\Models\CampsModel;

class Admin extends BaseController
{

    public $RepresentativesModel;
    public $CitiesModel;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->RepresentativesModel = new RepresentativesModel();
        $this->CampsModel = new CampsModel();
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
        . view('admin/index')
        . view('layouts/admin_footer');
    }

    public function AllRepresentatives()
    {

        // Пагинация
        $data = [
            'representatives' => $this->RepresentativesModel->AllRepresentatives()->paginate(15),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        . view('admin/representatives', $data)
        . view('layouts/admin_footer');
    }

    public function ActivatedRepresentatives()
    {

        $data = [
            'representatives' => $this->RepresentativesModel->ActivatedRepresentatives()->paginate(15),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        . view('admin/representatives', $data)
        . view('layouts/admin_footer');
    }

    public function NotActivatedRepresentatives()
    {
        $data = [
            'representatives' => $this->RepresentativesModel->NotActivatedRepresentatives()->paginate(15),
            'pager' => $this->RepresentativesModel->pager,
        ];

        return view('layouts/admin_header')
        . view('admin/representatives', $data)
        . view('layouts/admin_footer');
    }

    public function GetRepresentative(int $id)
    {
        $data['info'] = $this->RepresentativesModel->GetRepresentative($id);
        $data['city'] = $this->CitiesModel->GetCity($data['info'][0]['cities_id']);
        return view('layouts/admin_header')
        . view('admin/representatives_edit', $data)
        . view('layouts/admin_footer');
    }

    public function UpdateRepresentative()
    {

        $organization = str_replace('"', "", $this->request->getVar('organization'));
        $organization = str_replace("'", "", $this->request->getVar('organization'));

        $id = $this->request->getVar('user_id');

        $data = [
            'cities_id' => $this->request->getVar('cities_id'),
            'organization' => $organization,
            'inn' => $this->request->getVar('inn'),
            'director' => $this->request->getVar('director'),
            'director_phone' => $this->request->getVar('director_phone'),
            'firstname_manager' => $this->request->getVar('firstname_manager'),
            'lastname_manager' => $this->request->getVar('lastname_manager'),
            'post' => $this->request->getVar('post'),
            'email_manager' => $this->request->getVar('email_manager'),
            'phone_manager' => $this->request->getVar('phone_manager'),
            'activated' => $this->request->getVar('activated'),
            'premium' => $this->request->getVar('premium'),
            // 'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT)
        ];

        $this->RepresentativesModel->update($id, $data);
        return redirect()->to(site_url("/admin/representatives"));
    }

    public function deleteRepresentative(int $id)
    {
        $this->RepresentativesModel->delete(['user_id' => $id]);
        return redirect()->to(site_url("/admin/representatives"));
    }

    public function searchRepresentative() 
    {
        $this->response->setHeader('Location', '/')->setHeader('Content-Type', 'application/json');
        $inn = $this->request->getPost('inn');
        $representative = $this->RepresentativesModel->select('user_id')->where('inn', $inn)->first();
        if (!empty($representative)) {
            $data = [
                'representative' => $representative,
                'success' => true
            ];
        } else {
            $data = [
                'success' => false
            ];
        }
        
        return json_encode($data);
    }

    public function AllCamps()
    {
        // Пагинация
        $data = [
            'camps' => $this->CampsModel->AllCamps()->paginate(15),
            'pager' => $this->CampsModel->pager,
        ];

        return view('layouts/admin_header')
        . view('admin/camps', $data)
        . view('layouts/admin_footer');
    }

    public function ActivatedCamps()
    {
        $data = [
            'camps' => $this->CampsModel->ActivatedCamps()->paginate(15),
            'pager' => $this->CampsModel->pager,
        ];

        return view('layouts/admin_header')
        . view('admin/camps', $data)
        . view('layouts/admin_footer');
    }

    public function NotActivatedCamps()
    {
        $data = [
            'camps' => $this->CampsModel->NotActivatedCamps()->paginate(15),
            'pager' => $this->CampsModel->pager,
        ];

        return view('layouts/admin_header')
        . view('admin/camps', $data)
        . view('layouts/admin_footer');
    }


    // Выход из админки
    public function Logout()
    {
        unset($_SESSION['logged']);
        session_destroy();
        return redirect()->to(site_url("/admin"));
    }

}
