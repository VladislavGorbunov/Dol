<?php

namespace App\Models;

use CodeIgniter\Model;

class Cities extends Model
{
    public $db;

    protected function initialize()
    {
        
    }
    
    // Получить все города из БД
    public function getAllCity()
    {
        $db = \Config\Database::connect();
        $builder = $db->table('cities');
        $builder->select('*');
        return $builder->get()->getResultArray();
    }
    
}