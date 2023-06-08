<?php

namespace App\Controllers;

use Config\Services;
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
        $pager = service('pager');

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

        $region_id = $region['cities_id'];
        
        $page = (int) ($this->request->getGet('page') ?? 1);

        if ($this->request->getGet('page') == 0) $page = 1;

        $kol = 3;  //количество записей для вывода
        $art = ($page * $kol) - $kol; // определяем, с какой записи нам выводить

        $camps_data = $this->Camps->getCamps($region_id, $type, $season, $age, $art, $kol);
        $camps = $camps_data['builder']->getResultArray(); // Получаем лагеря
        $total = $camps_data['count_row']; // Получаем кол-во записей
        
         // Call makeLinks() to make pagination links.
         $pager_links = $pager->makeLinks($page, $kol, $total);

        // Создание массива лагерей
        for ($i = 0; $i < count($camps); $i++) {
            $data['camps'][$i] = [
                'camp' => $camps[$i]['camp'],
                'camp_id' => $camps[$i]['camps_id'],
                'count_reviews' => $camps[$i]['count_reviews'],
                'avg_rating' => $camps[$i]['avg_rating'],
                'types' => $this->Camps->getTypes($camps[$i]['camps_id'])->getResultArray(), // Выборка типов для каждого лагеря
            ];

        }

        $data['title'] = 'Детские лагеря ' . $region['title_in'];

        $data['pager_links'] = $pager_links;

        return view('layouts/header-short', $data) 
        .view('site/filter_page')
        .view('layouts/footer');

    }

}