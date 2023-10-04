<?php

namespace App\Controllers;

use Config\Services;
use App\Models\Cities;
use App\Models\RepresentativesModel;
use App\Models\CampsModel;
use App\Models\Shifts;

class ShiftController extends BaseController
{

    public $RepresentativesModel;
    public $CampsModel;
    public $ShiftsModel;
    protected $session;

    public function initController(\CodeIgniter\HTTP\RequestInterface $request, \CodeIgniter\HTTP\ResponseInterface $response, \Psr\Log\LoggerInterface $logger)
    {
        parent::initController($request, $response, $logger);
        global $config;
        $session = \Config\Services::session($config);

        $this->RepresentativesModel = new RepresentativesModel();
        $this->CampsModel = new CampsModel();
        $this->ShiftsModel = new Shifts();
        $this->session =  session();
        // Preload any models, libraries, etc, here.
    }


    
    // Страница формы добавления смены 
    public function AddShift()
    {
        return view('layouts/panel_header')
        .view('panel/add-shift')
        .view('layouts/panel_footer');
    }


    // Метод добавления смены в базу
    public function InsertShift($camp_id)
    {
        $data['title'] = $this->request->getVar('title-shift');
        $data['start_date'] = $this->request->getVar('start-date');
        $data['end_date'] = $this->request->getVar('end-date');
        $data['price'] = $this->request->getVar('price-shift');
        $data['camps_id'] = $camp_id;

        if ($data_camp = $this->CampsModel->where('camps_id', $data['camps_id'])->first()) {

            $data['region_id'] = $data_camp['cities_id'];

            if ($data_camp['representatives_id'] == $this->session->get('id')) {
                if ($this->ShiftsModel->insert($data)) {
                    $this->session->setFlashdata('msg-success', 'Смена для лагеря ' . $data_camp['title'] . ' добавлена.');
                } else {
                    $this->session->setFlashdata('msg-error', 'Произошла ошибка добавления смены.');
                }
            } 
        } else {
            $this->session->setFlashdata('msg-error', 'Ошибка: вы не можете добавить смены для лагеря с ID '.$data['camps_id'].'.');
        }
       
        return redirect()->to('/panel');
    }


    public function AllShifts($camp_id)
    {
        if ($data_camp = $this->CampsModel->where('camps_id', $camp_id)->first()) {
            
            if ($data_camp['representatives_id'] == $this->session->get('id')) {
                $data['shifts'] = $this->ShiftsModel->where('camps_id', $camp_id)->findAll();
            } else {
                $this->session->setFlashdata('msg-error', 'Ошибка: вы не можете смотреть смены для этого лагеря.');
                return redirect()->to('/panel');
            }
        } else {
            $this->session->setFlashdata('msg-error', 'Ошибка: вы не можете смотреть смены для этого лагеря.');
            return redirect()->to('/panel');
        }

        return view('layouts/panel_header', $data)
        .view('panel/all-shift')
        .view('layouts/panel_footer');
    }
}