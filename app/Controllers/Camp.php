<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\Images;

class Camp extends BaseController
{
    public $Camps;
    public $Cities;
    public $Types;
    public $Seasons;
    public $Images;
    

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
        // Preload any models, libraries, etc, here.
    }

    public function GetCamp($camp)
    {
        // $data['cities'] = $this->Cities->findAll();
        // $data['seasons'] = $this->Seasons->findAll();
        $data['camp'] = $this->Camps->where('slug', $camp)->first();
        $data['types'] = $this->Camps->getTypes($data['camp']['camps_id'])->getResultArray();
        $data['cover'] = $this->Images->where(['camps_id'=> $data['camp']['camps_id'], 'cover' => 1])->findAll();
        $data['cover'] = $this->Images->url_folder . $camp. '/cover/' .$data['cover'][0]['name_img'];

        $data['images'] = $this->Images->where(['camps_id'=> $data['camp']['camps_id'], 'cover' => 0])->findAll();
        // echo '<pre>';
        // var_dump($data['images']);
        // echo '</pre>';
        // die;
        foreach ($data['images'] as $key => $image) {
            $data['images'][$key] = $this->Images->url_folder . $camp. '/photo/' .$image['name_img'];
        }
        //$data['images'] = $this->Images->url_folder . $camp. '/photo/' .$data['images'][0]['name_img'];
        // if (!$data['camp']) {
        //     $this->error404();
        // }
        //$data['title'] = 'Детский лагерь - ' . $data['camp']['title'];
        return view('layouts/header-short', $data) 
        .view('site/camp')
        .view('layouts/footer');
    }

    

   
}