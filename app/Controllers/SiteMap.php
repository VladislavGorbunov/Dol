<?php

namespace App\Controllers;

use Config\Services;
use App\Models\CampsModel;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;

class SiteMap extends BaseController
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

        $this->Camps = new CampsModel();
        $this->Cities = new Cities();
        $this->Types = new Types();
        $this->Seasons = new Seasons();
        // Preload any models, libraries, etc, here.
    }

    public function index()
    {
        $data['cities'] = $this->Cities->findAll();
        $data['seasons'] = $this->Seasons->findAll();
        $data['types'] = $this->Types->findAll();

        return view('sitemap/index', $data);
    }


}