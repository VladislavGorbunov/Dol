<?php

namespace App\Controllers;

use App\Models\Camps;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;

class Site extends BaseController
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

    public function index()
    {
        $data['cities'] = $this->Cities->findAll();
        $data['seasons'] = $this->Seasons->findAll();
        
        return view('layouts/header', $data) 
        .view('site/index')
        .view('layouts/footer');
    }

    public function Login()
    {
        $session = session();
        $cities = new Cities();
        $data['cities'] = $cities->getAllCity();
        return view('site/login', $data);
    }

    public function FilterCamp($region_slug = null, $type = null, $season = null, $age = null)
    {   
        $data['cities'] = $this->Cities->findAll();

        $filter = [];

        $filter['region'] = $region_slug;
        $filter['type'] = $type;
        $filter['season'] = $season;
        $filter['age'] = $age;

        if (!$region = $this->Cities->where('slug', $filter['region'])->first()) $this->error404();
        
        // Проверка существует ли такой тип в БД
        if ($filter['type'] != 'type-all') {
            if (!$type = $this->Types->where('slug', $filter['type'])->first()) $this->error404();
            $type = $type['types_id'];
            //$data['type'] = $type['types_id'];
            //$data['phrase']
        } else {
            $type = null;
        }   

        // Проверка существует ли такой сезон в БД
        if ($filter['season'] != 'season-all') {
            if (!$season = $this->Seasons->where('slug', $filter['season'])->first()) $this->error404();
            $season = $season['seasons_id'];
        } else {
            $season = null;
        }   


        $region = $region['cities_id'];
        
        $data['camps'] = $this->Camps->getCamps($region, $type, $season, $age)->getResultArray();

        // echo '<pre>';
        // print_r($data['camps']);
        // echo '</pre>';

        return view('layouts/header-short', $data) 
        .view('site/filter_page')
        .view('layouts/footer');

    }
}
