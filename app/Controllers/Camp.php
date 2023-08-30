<?php

namespace App\Controllers;

use Config\Services;
use App\Models\CampsModel;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\Images;
use App\Models\Shifts;
use App\Models\Reviews;
use App\Models\RepresentativesModel;

class Camp extends BaseController
{
    public $CampsModel;
    public $Cities;
    public $Types;
    public $Seasons;
    public $Images;
    public $ShiftsModel;
    public $Reviews;
    public $Representatives;
    

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
        $this->Reviews = new Reviews();
        $this->Representatives = new RepresentativesModel();
        // Preload any models, libraries, etc, here.
    }

    public function GetCamp($camp)
    {
        $data['cities'] = $this->Cities->findAll();
        $data['seasons'] = $this->Seasons->findAll();
        $data['types'] = $this->Types->findAll();

        $data['camp'] = $this->CampsModel->where('slug', $camp)->first();
        $data['organization'] = $this->Representatives->select('organization, inn')->where('user_id', $data['camp']['representatives_id'])->first();
        $data['types_camp'] = $this->CampsModel->getTypes($data['camp']['camps_id'])->getResultArray();
        $data['cover'] = $this->Images->where(['camps_id'=> $data['camp']['camps_id'], 'cover' => 1])->findAll();
        $data['cover'] = $this->Images->url_folder . $camp. '/cover/' .$data['cover'][0]['name_img'];
        $data['region'] = $this->Cities->where(['cities_id' => $data['camp']['cities_id']])->first();
        $data['images'] = $this->Images->where(['camps_id'=> $data['camp']['camps_id'], 'cover' => 0])->findAll();
        $data['reviews'] = $this->Reviews->selectAvg('rating')->where(['camps_id'=> $data['camp']['camps_id']])->first();

        if ($result = $this->Reviews->where(['camps_id'=> $data['camp']['camps_id']])->findAll()) {
            $data['reviews_count'] = count($result);
            $data['reviews_data'] = $result;
        } else {
            $data['reviews_count'] = 0;
        }
        
        
        foreach ($data['images'] as $key => $image) {
            $data['images'][$key] = $this->Images->url_folder . $camp. '/photo/' .$image['name_img'];
        }

        $data['shifts'] = $this->ShiftsModel->where(['camps_id' => $data['camp']['camps_id']])->findAll();

        foreach ($data['shifts'] as $key => $shift) {

            $start = date_create($shift['start_date']);
            
            $end = date_create($shift['end_date']);
            $modify = date_modify($end, '+1 day');
            $diff = date_diff($start, $modify);

            $start_data = explode('-', $shift['start_date']);
            $start_data = $start_data[2] . '.' . $start_data[1] .'.'. $start_data[0];

            $end_data = explode('-', $shift['end_date']);
            $end_data = $end_data[2] . '.' . $end_data[1] .'.'. $end_data[0];

            $days = $diff->format('%a');

            $data['shift_arr'][] = 
            [
                'id' => $shift['id'],
                'camps_id' => $shift['camps_id'],
                'title' => $shift['title'],
                'price' => $shift['price'],
                'days' => $days,
                'start_date' => $start_data,
                'end_date' => $end_data,
            ]; 
        }
        

        $data['title'] = 'Детский лагерь - «' . $data['camp']['title'] .'»';

        return view('layouts/header-camp', $data) 
        .view('site/camp')
        .view('layouts/footer');
    }


    
   
}