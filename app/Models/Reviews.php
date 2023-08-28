<?php

namespace App\Models;

use CodeIgniter\Model;

class Reviews extends Model
{
    protected $table = 'reviews';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'camps_id',
        'name',
        'advantages',
        'disadvantages',
        'rating',
    ];

    protected function initialize()
    {
        
    }
    
}