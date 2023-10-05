<?php

namespace App\Controllers;

use Config\Services;
use App\Models\CampsModel;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\Images;
use App\Models\Shifts;

class Site extends BaseController
{
    public $CampsModel;
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

        $this->CampsModel = new CampsModel();
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

        $camps = $this->CampsModel->getBestCamps()->getResultArray();

        // Создание массива лагерей
        for ($i = 0; $i < count($camps); $i++) {
            $data['camps'][$i] = [
                'camp' => $camps[$i]['camp'],
                'slug' => $camps[$i]['slug'],
                'cover' => $this->Images->where(['camps_id' => $camps[$i]['camps_id'], 'cover' => 1])->first(),
                'camp_id' => $camps[$i]['camps_id'],
                'adress' => $camps[$i]['adress'],
                'types' => $this->CampsModel->getTypes($camps[$i]['camps_id'])->getResultArray(), // Выборка типов для каждого лагеря
                'rating' => $camps[$i]['avg_rating'],
                'reviews' => $camps[$i]['count_reviews'],
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
        return view('site/login');
    }

    public function FilterCamp($region_slug = null, $type = null, $season = null, $age = null, $max_price = null)
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

        if (!$region = $this->Cities->where('slug', $filter['region'])->first()) $this->error404();
        
        
        // Проверка существует ли такой тип в БД
        if ($filter['type'] != 'type-all') {
            if (!$types = $this->Types->where('slug', $filter['type'])->first()) {
                $this->error404();
            } else {
                $type = $types['types_id'];
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
            }
           
        } else {
            $season = null;
        }   

        $region_id = $region['cities_id'];
        
        $page = (int) ($this->request->getGet('page') ?? 1);

        if ($this->request->getGet('page') == 0) $page = 1;

        $kol = 10;  //количество записей для вывода на страницу
        $art = ($page * $kol) - $kol; // определяем, с какой записи нам выводить
        if ($age == 'age-all') $age = null;
        $camps_data = $this->CampsModel->getCamps($region_id, $type, $season, $age, $art, $kol, $max_price);
        $data['prices'][] = $this->ShiftsModel->getMinPrice($region_id);
        $data['prices'][] = $this->ShiftsModel->getMaxPrice($region_id);
        
        $camps = $camps_data['builder']->getResultArray(); // Получаем лагеря
        
        $total = $camps_data['count_row']; // Получаем кол-во записей
        $data['count_camp'] = $total;
        $pager_links = $pager->makeLinks($page, $kol, $total, 'default_full');

        for ($i = 0; $i < count($camps); $i++) {

            $data['camps'][$i] = [
                'camp' => $camps[$i]['camp'],
                'slug' => $camps[$i]['slug'],
                'cover' => $this->Images->where(['camps_id' => $camps[$i]['camps_id'], 'cover' => 1])->first(),
                'camp_id' => $camps[$i]['camps_id'],
                'adress' => $camps[$i]['adress'],
                'year' => $camps[$i]['year'],
                'description' => $camps[$i]['description'],
                'short-description' => mb_substr(strip_tags($camps[$i]['description']), 0, 450).'... <a href="/camp/'.$camps[$i]['slug'].'" style="color:#2955c8">Читать далее</a>',
                'count_reviews' => $camps[$i]['count_reviews'],
                'avg_rating' => $camps[$i]['avg_rating'],
                'types' => $this->CampsModel->getTypes($camps[$i]['camps_id'])->getResultArray(), // Выборка типов для каждого лагеря
                'min_price' => $camps[$i]['shift_min_price'],
                'min_age' => $camps[$i]['min_age'],
                'max_age' => $camps[$i]['max_age'],
                'free_transfer' => $camps[$i]['free_transfer'],
                'video_link' => $camps[$i]['video_link'],
            ];
        }
        
        $title = null;

        // Генерируем title
        if (!empty($region) && empty($types) && empty($season)) { // Только регион
            $title .= 'Путёвки в детские лагеря ' . $region['title_in'];
        } elseif (!empty($region) && !empty($types) && empty($season)) { // Регион и тип лагеря
            $title .= 'Путёвки в ' . $types['title'] .' '. $region['title_in'];
        } elseif (!empty($region) && !empty($season) && empty($types)) { // Регион и сезон
            $title .= 'Путёвки в ' . $seasons['title_in'] . ' лагеря ' . $region['title_in'];
        } elseif (!empty($region) && !empty($types) && !empty($season)) { // Регион, тип и сезон
            $title .= 'Регион тип и сезон';
        }
       
        $data['title'] = $title;
        $data['pager_links'] = $pager_links;
        $data['total'] = $total;

        return view('layouts/header-short', $data) 
        .view('site/filter_page')
        .view('layouts/footer');
    }


    public function CreateMetaTag(...$data)
    {
    
    }
}