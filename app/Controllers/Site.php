<?php

namespace App\Controllers;

use App\Models\Cities;

class Site extends BaseController
{
    public function index()
    {
        return view('layouts/header') 
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

    public function FilterCamp($region_slug = null, $season = null, $type = null, $age = null)
    {   

        $filter = [];

        $filter['region'] = $region_slug;
        $filter['season'] = $season;
        $filter['type'] = $type;
        $filter['age'] = $age;
        
        // 1) проверяем, существует ли в бд регион с полученным region_slug;
        // 2) проверяем, существует ли в бд сезон с полученным season;
        // 3) проверяем, существует ли в бд тип с полученным type;
        // 4) проверяем, существует ли в бд age с полученным age;

        // делаем выборку всех лагерей где id_cities = region_id и season_id = 

        echo '<pre>';
        var_dump($filter);
        echo '</pre>';
    }
}
