<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\Images;
use App\Models\Shifts;

class Site extends BaseController
{
    public $Camps;
    public $Cities;
    public $Types;
    public $Seasons;
    public $Images;
    public $ShiftsModel;
    

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->Camps = new Camps();
        $this->Cities = new Cities();
        $this->Types = new Types();
        $this->Seasons = new Seasons();
        $this->Images = new Images();
        $this->ShiftsModel = new Shifts();
        // Preload any models, libraries, etc, here.
    }

    public function index()
    {
        $data['cities'] = $this->Cities->findAll();
        $data['seasons'] = $this->Seasons->findAll();
        $data['types'] = $this->Types->findAll();

        $camps = $this->Camps->getBestCamps()->getResultArray();

        // Создание массива лагерей
        for ($i = 0; $i < count($camps); $i++) {
            $data['camps'][$i] = [
                'camp' => $camps[$i]['camp'],
                'slug' => $camps[$i]['slug'],
                'cover' => $this->Images->where(['camps_id' => $camps[$i]['camps_id'], 'cover' => 1])->first(),
                'camp_id' => $camps[$i]['camps_id'],
                'adress' => $camps[$i]['adress'],
                'types' => $this->Camps->getTypes($camps[$i]['camps_id'])->getResultArray(), // Выборка типов для каждого лагеря
            ];

        }
        $data['title'] = 'Поиск и бронирование путёвок в детские лагеря по всей России';
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
        $data['types'] = $this->Types->findAll();
        $data['seasons'] = $this->Seasons->findAll();

        $filter = [];

        $filter['region'] = $region_slug;
        $filter['type'] = $type;
        $filter['season'] = $season;
        $filter['age'] = $age;

        if (!$region = $this->Cities->where('slug', $filter['region'])->first()) {
            $this->error404();
        } else {
            // region_filter_select для установки selected в фильтре
            $data['region_filter_select'] = $region['title'];
        }
        
        // Проверка существует ли такой тип в БД
        if ($filter['type'] != 'type-all') {
            if (!$types = $this->Types->where('slug', $filter['type'])->first()) {
                $this->error404();
            } else {
                $type = $types['types_id'];
                // type_filter_select для установки selected в фильтре
                $data['type_filter_select'] = $types['title'];
            } 
        } else {
            $type = null;
        }   

        // Проверка существует ли такой сезон в БД
        if ($filter['season'] != 'season-all') {
            if (!$seasons = $this->Seasons->where('slug', $filter['season'])->first()) {
                $this->error404();
            } else {
                $season = $seasons['seasons_id'];
                // season_filter_select для установки selected в фильтре
                $data['season_filter_select'] = $seasons['title'];
            }
           
        } else {
            $season = null;
        }   

        $region_id = $region['cities_id'];
        
        $page = (int) ($this->request->getGet('page') ?? 1);

        if ($this->request->getGet('page') == 0) $page = 1;

        $kol = 10;  //количество записей для вывода на страницу
        $art = ($page * $kol) - $kol; // определяем, с какой записи нам выводить

        $camps_data = $this->Camps->getCamps($region_id, $type, $season, $age, $art, $kol);
        
        $camps = $camps_data['builder']->getResultArray(); // Получаем лагеря
        
        $total = $camps_data['count_row']; // Получаем кол-во записей
        
         // Call makeLinks() to make pagination links.
         $pager_links = $pager->makeLinks($page, $kol, $total, 'default_full');

        $db      = \Config\Database::connect();
        $builder = $db->table('shifts');

        // Создание массива лагерей
        for ($i = 0; $i < count($camps); $i++) {

            $builder->selectMin('price')->where('camps_id', $camps[$i]['camps_id']);
            $query = $builder->get();

            $data['camps'][$i] = [
                'camp' => $camps[$i]['camp'],
                'slug' => $camps[$i]['slug'],
                'cover' => $this->Images->where(['camps_id' => $camps[$i]['camps_id'], 'cover' => 1])->first(),
                'camp_id' => $camps[$i]['camps_id'],
                'adress' => $camps[$i]['adress'],
                'description' => $camps[$i]['description'],
                'short-description' => mb_substr(strip_tags($camps[$i]['description']), 0, 450).'... <a href="/camp/'.$camps[$i]['slug'].'" style="color:#2955c8">Читать далее</a>',
                'count_reviews' => $camps[$i]['count_reviews'],
                //'count_reviews' => count($this->ReviewsModel->where('camps_id', $camps[$i]['camps_id'])->findAll()),
                'avg_rating' => $camps[$i]['avg_rating'],
                'types' => $this->Camps->getTypes($camps[$i]['camps_id'])->getResultArray(), // Выборка типов для каждого лагеря
                //'min_price' => $camps[$i]['min_price'],
                'min_price' => $query->getResultArray(),
                'min_age' => $camps[$i]['min_age'],
                'max_age' => $camps[$i]['max_age'],
            ];

        }

        $type_name = (!empty($types['tag_title'])) ? $types['tag_title'] . ' ' : '';

        $title = null;
        if (!empty($seasons['title'])) {
            $title .= $seasons['title_in'] . ' ';
        } 
        
        if (!empty($types['title'])) {
            $title .= $types['tag_title'] . ' ';
        } 

        if (empty($types) || empty($seasons)) {
            $title .= 'Детские лагеря ';
        }

        if (!empty($region['title'])) {
            $title .= $region['title_in'];
        }

       
        $data['title'] = $title;
        $data['pager_links'] = $pager_links;
        $data['total'] = $total;

        return view('layouts/header-short', $data) 
        .view('site/filter_page')
        .view('layouts/footer');

    }
}