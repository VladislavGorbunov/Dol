<?php

namespace App\Models;

use CodeIgniter\Model;

class Images extends Model
{
    protected $table = 'camps_images';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'id',
        'camps_id',
        'name_img',
    ];

    protected function initialize()
    {
        
    }
    
    // Получить все города из БД
    public function getAllCity()
    {
        $data = $this->builder()->get();
        return $data->getResultArray();
    }

    // Получить город представителя
    public function GetCity($id)
    {
        $data = $this->builder()->getWhere('cities_id', $id);
        $data = $this->builder()->get();
        return $data->getResultArray();
    }
    
}