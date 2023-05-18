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
        $cities = new Cities();
        $data['cities'] = $cities->getAllCity();
        return view('site/login', $data);
    }
}
