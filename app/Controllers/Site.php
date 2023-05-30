<?php

namespace App\Controllers;

use App\Models\Cities;

class Site extends BaseController
{
    public function index()
    {
        //return view('layouts/header');
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

    public function Search($region = null, $season = null, $type = null, $age = null)
    {   
        //$filter = explode('/', $_SERVER['REQUEST_URI']);
        //var_dump($filter);
        // echo $region = $filter[2];
        // echo $season = $filter[3];
        // echo $type = $filter[4];
        // echo $age = $filter[5];

        $filter = [];

        $filter['region'] = $region;
        $filter['season'] = $season;
        $filter['type'] = $type;
        $filter['age'] = $age;
        

        echo '<pre>';
        var_dump($filter);
        echo '</pre>';
    }
}
