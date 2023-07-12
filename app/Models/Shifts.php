<?php

namespace App\Models;

use CodeIgniter\Model;

class Shifts extends Model
{
    protected $table = 'shifts';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'camps_id',
        'title',
        'price',
        'start_date',
        'end_date',
    ];

    protected function initialize()
    {
        
    }
    
    
}