<?php

namespace App\Controllers;
use App\Models\TariffModel;

class TariffController extends BaseController
{
    public $tariffModel;


    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);
        $this->tariffModel = new TariffModel();
        // Preload any models, libraries, etc, here.
    }

    
    public function addTariff()
    {
        $session = session();

        if ($this->request->is('post')) {
            $data = $this->request->getPost();

            if ($this->tariffModel->save($data)) {
                $session->setFlashdata("message", "Тариф добавлен");
            }
        }
        return view('layouts/admin_header')
        . view('admin/add_tariff')
        . view('layouts/admin_footer');
    }

    public function editTariffs()
    {
        echo 'all tariffs page';
    }

    public function editTariff($tariff_id)
    {
        echo 'edit tariff page';
    }

    

}