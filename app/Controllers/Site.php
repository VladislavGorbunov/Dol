<?php

namespace App\Controllers;

use App\Models\Cities;

class Site extends BaseController
{
    public function index()
    {
        return view('site/welcome_message');
    }

    public function Login()
    {
        $cities = new Cities();
        $data['cities'] = $cities->getAllCity();
        return view('site/login', $data);
    }
}
