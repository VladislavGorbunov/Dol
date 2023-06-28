<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;

class Camp extends BaseController
{
    public $Camps;
    public $Cities;
    public $Types;
    public $Seasons;
    

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->Camps = new Camps();
        $this->Cities = new Cities();
        $this->Types = new Types();
        $this->Seasons = new Seasons();
        // Preload any models, libraries, etc, here.
    }

    public function GetCamp($camp)
    {
        // $data['cities'] = $this->Cities->findAll();
        // $data['seasons'] = $this->Seasons->findAll();
        $data['camp'] = $this->Camps->where('slug', $camp)->first();
        if (!$data['camp']) {
            $this->error404();
        }
        $data['title'] = 'Детский лагерь - ' . $data['camp']['title'];
        return view('layouts/header-short', $data) 
        .view('site/camp')
        .view('layouts/footer');
    }

    

   
}