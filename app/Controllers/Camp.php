<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Camps;
use App\Models\Cities;
use App\Models\Types;
use App\Models\Seasons;
use App\Models\Images;
use App\Models\Shifts;
use App\Models\Reviews;
use App\Models\Bookings;

class Camp extends BaseController
{
    public $Camps;
    public $Cities;
    public $Types;
    public $Seasons;
    public $Images;
    public $ShiftsModel;
    public $Reviews;
    public $bookings;
    

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
        $this->Reviews = new Reviews();
        $this->Bookings = new Bookings();
        // Preload any models, libraries, etc, here.
    }

    public function GetCamp($camp)
    {
        $data['cities'] = $this->Cities->findAll();
        $data['seasons'] = $this->Seasons->findAll();
        $data['types'] = $this->Types->findAll();

        $data['camp'] = $this->Camps->where('slug', $camp)->first();
        $data['types_camp'] = $this->Camps->getTypes($data['camp']['camps_id'])->getResultArray();
        $data['cover'] = $this->Images->where(['camps_id'=> $data['camp']['camps_id'], 'cover' => 1])->findAll();
        $data['cover'] = $this->Images->url_folder . $camp. '/cover/' .$data['cover'][0]['name_img'];
        $data['region'] = $this->Cities->where(['cities_id' => $data['camp']['cities_id']])->first();
        $data['images'] = $this->Images->where(['camps_id'=> $data['camp']['camps_id'], 'cover' => 0])->findAll();
        $data['reviews'] = $this->Reviews->selectAvg('rating')->where(['camps_id'=> $data['camp']['camps_id']])->first();
        foreach ($data['images'] as $key => $image) {
            $data['images'][$key] = $this->Images->url_folder . $camp. '/photo/' .$image['name_img'];
        }

        $data['shifts'] = $this->ShiftsModel->where(['camps_id' => $data['camp']['camps_id']])->findAll();

        foreach ($data['shifts'] as $key => $shift) {

            $start = date_create($shift['start_date']);
            $end = date_create($shift['end_date']);
            $diff = date_diff($start, $end);

            $start_data = explode('-', $shift['start_date']);
            $start_data = $start_data[2] . '.' . $start_data[1] .'.'. $start_data[0];

            $end_data = explode('-', $shift['end_date']);
            $end_data = $end_data[2] . '.' . $end_data[1] .'.'. $end_data[0];

            $data['shift_arr'][] = 
            [
                'id' => $shift['id'],
                'camps_id' => $shift['camps_id'],
                'title' => $shift['title'],
                'price' => $shift['price'],
                'days' => $diff->format('%a дней'),
                'start_date' => $start_data,
                'end_date' => $end_data,
            ]; 
        }
        

        $data['title'] = 'Детский лагерь - «' . $data['camp']['title'] .'»';

        return view('layouts/header-camp', $data) 
        .view('site/camp')
        .view('layouts/footer');
    }


    public function Booking()
    {
        $session = session();
        $validation = \Config\Services::validation();
        
        $validation->setRules([
            'fio' => ['label' => 'Ф.И.О', 'rules' => 'required|strip_tags'],
        ]);

        $data['camps_id_booking'] =  $this->request->getVar('camps_id_booking');
        $data['fio'] =  $this->request->getVar('fio');
        $data['telephone'] =  $this->request->getVar('telephone');
        $data['email'] =  $this->request->getVar('email');
        $data['camp_id'] = $this->request->getVar('camps_id_booking');
        $data['shift_id'] = $this->request->getVar('shift_id');
        $data['booking_number'] = $this->CreateRandomBookingNumber();

        $this->Bookings->insert($data);
        $session->setFlashdata('msg-success', 'Путёвка забронирована. Номер вашего бронирования - '.$data['booking_number'].' , запишите его. Ожидайте звонка менеджера лагеря.');
    
        $redirect = $_SERVER['HTTP_REFERER'];
        return redirect()->to($redirect);
    }


    public function CreateRandomBookingNumber()
    {
        $arr = [
            1 => 'A', 
            2 => 'Б',
            3 => 'В',
            4 => 'Г',
            5 => 'Д',
            6 => 'Е',
            7 => 'Ж',
            8 => 'З',
            9 => 'И',
            10 => 'К',
        ];

        $number = date("d");
        $month = date("m");
        $year = date("y");
        $minutes = date("i");
        $seconds = date("s");

        return $arr[rand(1, 10)] .'-'. $number . $month . $year . $minutes . $seconds . '-' . rand(10, 1000);
    }
   
}