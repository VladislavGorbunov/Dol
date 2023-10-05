<?php

namespace App\Controllers;

use App\Models\CampsModel;
use App\Models\RepresentativesModel;
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
        $this->session = session();
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
            $data['representative_id'] = $data_camp['representatives_id'];

            if ($data_camp['representatives_id'] == $this->session->get('id')) {
                if ($this->ShiftsModel->insert($data)) {
                    $this->session->setFlashdata('msg-success', 'Смена для лагеря ' . $data_camp['title'] . ' добавлена.');
                } else {
                    $this->session->setFlashdata('msg-error', 'Произошла ошибка добавления смены.');
                }
            }
        } else {
            $this->session->setFlashdata('msg-error', 'Ошибка: вы не можете добавить смены для лагеря с ID ' . $data['camps_id'] . '.');
        }

        return redirect()->to('/panel');
    }

    public function AllShifts($camp_id)
    {
        $data['shifts'] = null;
        if ($data_camp = $this->CampsModel->where('camps_id', $camp_id)->first()) {

            if ($data_camp['representatives_id'] == $this->session->get('id')) {
                $shifts = $this->ShiftsModel->where('camps_id', $camp_id)->findAll();

                foreach ($shifts as $shift) {
                    $start_date = explode('-', $shift['start_date']);
                    $end_date = explode('-', $shift['end_date']);

                    $data['shifts'][] = [
                        'id' => $shift['id'],
                        'title' => $shift['title'],
                        'camp' => $this->CampsModel->select('title')->where('camps_id', $shift['camps_id'])->first(),
                        'price' => $shift['price'],
                        'start_date' => $start_date[2] . '.' . $start_date[1] . '.' . $start_date[0],
                        'end_date' => $end_date[2] . '.' . $end_date[1] . '.' . $end_date[0],
                    ];
                }
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

    public function deleteShift($shift_id)
    {

        if ($data = $this->ShiftsModel->where('id', $shift_id)->first()) {

            if ($data['representative_id'] == $this->session->get('id')) {
                if ($this->ShiftsModel->where('id', $shift_id)->delete()) {
                    $this->session->setFlashdata('msg-success', 'Смена удалена.');
                } else {
                    $this->session->setFlashdata('msg-error', 'Ошибка удаления.');
                }
            }
        }

        return redirect()->back()->withInput();
    }
}
