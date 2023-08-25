<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Bookings;
use App\Models\RepresentativesModel;
use App\Models\Camps;
use App\Models\Shifts;

class BookingController extends BaseController
{

    public $RepresentativesModel;
    public $CitiesModel;
    public $BookingModel;
    public $CampsModel;
    public $ShiftModel;

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

    // Страница вывода всех бронирований   
    public function Index()
    {
        $session = session();
        
        $bookings = $this->BookingModel->where('representative_id', $session->get('id'))->findAll();

        foreach($bookings as $key => $booking) {
            $data['data_bookings'][] = [
                'id' => $booking['id'],
                'fio' => $booking['fio'],
                'telephone' => $booking['telephone'],
                'email' => $booking['email'],
                'camp' => $this->CampsModel->where('camps_id', $booking['camp_id'])->findColumn('title'),
                'shift' => $this->ShiftModel->where('id', $booking['shift_id'])->findColumn('title'),
                'booking_number' => $booking['booking_number'],
                'confirmed' => $booking['confirmed'],
            ];
        }

        return view('layouts/panel_header', $data)
        .view('panel/booking')
        .view('layouts/panel_footer');
    }






    
    
}