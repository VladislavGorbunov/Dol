<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Bookings;
use App\Models\RepresentativesModel;
use App\Models\Camps;
use App\Models\Shifts;


class ReviewsController extends BaseController
{

    public $RepresentativesModel;
    public $CitiesModel;
    public $BookingModel;
    public $CampsModel;
    public $ShiftModel;
    public $Bookings;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);
        
        $this->RepresentativesModel = new RepresentativesModel();
        $this->BookingModel = new Bookings();
        $this->CampsModel = new Camps();
        $this->ShiftModel = new Shifts();
        // Preload any models, libraries, etc, here.
    }

    
    public function ReviewInsert()
    {
        $session = session();
        $rules = [
            'name' => 'required|min_length[5]',
            'booking_number' => 'required',
            'rating' => 'required',
            'advantages' => 'required',
            'disadvantages' => 'required',
            'id' => 'required',
        ];
        
        if (!$this->validate($rules)) {
            var_dump($this->validator->getErrors());
            //return redirect()->to(previous_url());
        }

        // Проверяем есть ли в таблице запись с booking_number и id лагеря
        // Если есть добавляем отзыв в базу
        echo $data['name'] = $this->request->getVar('name');
        echo previous_url();

        
        // $this->BookingModel->insert($data);
        // $session->setFlashdata('msg-success', 'Путёвка забронирована. Номер вашего бронирования - '.$data['booking_number'].' , запишите его. Ожидайте звонка менеджера лагеря.');
    
        // $redirect = $_SERVER['HTTP_REFERER'];
        // return redirect()->to($redirect);
    }



}