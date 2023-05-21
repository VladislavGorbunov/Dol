<?php

namespace App\Models;

use CodeIgniter\Model;

class Cities extends Model
{
    protected $table = 'cities';
    protected $primaryKey = 'cities_id';

    protected $allowedFields = [
        'cities_id',
        'title',
        'slug',
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