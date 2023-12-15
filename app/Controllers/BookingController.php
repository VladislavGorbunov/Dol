<?php

namespace App\Controllers;

use App\Models\BookingsModel;
use App\Models\RepresentativesModel;
use App\Models\CampsModel;
use App\Models\Shifts;
use App\Controllers\EmailController;

class BookingController extends BaseController
{
    public $RepresentativesModel;
    public $CitiesModel;
    public $BookingsModel;
    public $CampsModel;
    public $ShiftModel;
    public $Bookings;
    public $EmailController;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->RepresentativesModel = new RepresentativesModel();
        $this->BookingsModel = new BookingsModel();
        $this->CampsModel = new CampsModel();
        $this->ShiftModel = new Shifts();
        $this->EmailController = new EmailController();
        // Preload any models, libraries, etc, here.
    }

    // Страница вывода всех бронирований   
    public function Index()
    {
        $session = session();
        
        $bookings = $this->BookingsModel->where('representative_id', $session->get('id'))->findAll();
        
        if ($bookings) {
        foreach($bookings as $key => $booking) {

            $date_booking = explode(' ', $booking['date_booking']);
            $time_booking = $date_booking[1];
            $date_booking = explode('-', $date_booking[0]);
            $date_booking = $date_booking[2] . '.' . $date_booking[1] . '.' . $date_booking[0] . ' ' . $time_booking;



            $data['data_bookings'][] = [
                'id' => $booking['id'],
                'fio' => $booking['fio'],
                'telephone' => $booking['telephone'],
                'email' => $booking['email'],
                'camp' => $this->CampsModel->where('camps_id', $booking['camp_id'])->findColumn('title'),
                'shift' => $this->ShiftModel->where('id', $booking['shift_id'])->findColumn('title'),
                'booking_number' => $booking['booking_number'],
                'date_booking' => $date_booking,
                'confirmed' => $booking['confirmed'],
            ];
        }
        } else {
            $data['data_bookings'] = null;
        }

        return view('layouts/panel_header', $data)
        .view('panel/booking')
        .view('layouts/panel_footer');
    }


    public function BookingDelete($id)
    {
        $this->response->setHeader('Location', '/')->setHeader('Content-Type', 'application/json');
     
        if ($this->BookingsModel->where('id', $id)->delete()) {
            $data = ['success' => 'ok'];
        } else {
            $data = ['success' => 'Delete error'];
        }

        $data = json_encode($data);

        return $data;
    }


    public function Booking()
    {
        $session = session();
        $validation = \Config\Services::validation();
        
        $validation->setRules([
            'fio' => ['label' => 'Ф.И.О', 'rules' => 'required|strip_tags'],
        ]);
        
        $camps_id_booking = $this->request->getVar('camps_id_booking');
        $data['number_of_tickets'] = $this->request->getVar('number_of_tickets');
        $data['camps_id_booking'] =  $camps_id_booking;
        $data['representative_id'] = $this->CampsModel->where('camps_id', $camps_id_booking)->findColumn('representatives_id');
        $data['fio'] =  $this->request->getVar('fio');
        $data['telephone'] =  $this->request->getVar('telephone');
        $data['email'] =  $this->request->getVar('email');
        $data['camp_id'] = $this->request->getVar('camps_id_booking');
        $data['shift_id'] = $this->request->getVar('shift_id');
        $data['booking_number'] = $this->CreateRandomBookingNumber();
        
        $this->BookingsModel->insert($data);

        $manager = $this->RepresentativesModel->where('user_id', $data['representative_id'])->first();
        $this->EmailController->sendEmailBooking($manager['email_manager']);
        
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
            11 => 'Л',
            12 => 'М',
        ];

        $number = date("d");
        $month = date("m");
        $year = date("y");
        $minutes = date("i");
        $seconds = date("s");

        return $arr[rand(1, 12)] .'-'. $number . $month . $year . $minutes . $seconds . '-' . rand(10, 1000);
    }

}