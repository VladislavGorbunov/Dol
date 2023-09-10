<?php

namespace App\Controllers;

use Config\Services;
use App\Models\BookingsModel;
use App\Models\RepresentativesModel;
use App\Models\Reviews;



class ReviewsController extends BaseController
{

    public $RepresentativesModel;
    public $CitiesModel;
    public $BookingModel;
    public $CampsModel;
    public $ShiftModel;
    public $BookingsModel;
    public $ReviewsModel;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);
        
        $this->RepresentativesModel = new RepresentativesModel();
        $this->BookingModel = new BookingsModel();
        $this->ReviewsModel = new Reviews();
        
        // Preload any models, libraries, etc, here.
    }

    
    public function ReviewInsert()
    {
        $session = session();
        $rules = [
            'name' => 'required',
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
        $booking_number = $this->request->getVar('booking_number');
        $camp_id = $this->request->getVar('id');
        

        if (!$this->BookingModel->where('booking_number', $booking_number)->where('camp_id', $camp_id)->first()) {
            $session->setFlashdata('msg-error', 'Номер бронирования не совпадает, мы вынуждены отклонить добавление отзыва..');
            return redirect()->to(previous_url());
        } 

        $data['camps_id'] = $this->request->getVar('id');
        $data['name'] = $this->request->getVar('name');
        $data['advantages'] = $this->request->getVar('advantages');
        $data['disadvantages'] = $this->request->getVar('disadvantages');
        $data['rating'] = $this->request->getVar('rating');

        // echo '<pre>';
        // var_dump($data);
        // echo '</pre>';
        // die;

        if ($this->ReviewsModel->insert($data)) {
            $session->setFlashdata('msg-success', 'Отзыв отправлен! Спасибо что поделились своим мнением!');
        } else {
            $session->setFlashdata('msg-error', 'При добавлении отзыва произошла ошибка..');
        }

        return redirect()->to(previous_url());

        // echo $data['name'] = $this->request->getVar('name');
        // echo previous_url();

        
        // $this->BookingModel->insert($data);
        // $session->setFlashdata('msg-success', 'Путёвка забронирована. Номер вашего бронирования - '.$data['booking_number'].' , запишите его. Ожидайте звонка менеджера лагеря.');
    
        // $redirect = $_SERVER['HTTP_REFERER'];
        // return redirect()->to($redirect);
    }



}