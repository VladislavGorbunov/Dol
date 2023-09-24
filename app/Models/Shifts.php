<?php

namespace App\Models;

use CodeIgniter\Model;

class Shifts extends Model
{
    protected $table = 'shifts';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'camps_id',
        'region_id',
        'title',
        'price',
        'start_date',
        'end_date',
    ];

    protected function initialize()
    {
        
    }

    public function getMinPrice($id_region)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('shifts');
        $builder->select('MIN(shifts.price) min');
        $builder->where('region_id', $id_region);
        return $builder->get()->getRowArray();
    }

    public function getMaxPrice($id_region)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('shifts');
        $builder->select('MAX(shifts.price) max');
        $builder->where('region_id', $id_region);
        return $builder->get()->getRowArray();
    }
    
    
}