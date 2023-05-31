<?php

namespace App\Models;

use CodeIgniter\Model;

class Types extends Model
{
    protected $table = 'types';
    protected $primaryKey = 'types_id';

    protected $allowedFields = [
        'types_id',
        'title',
        'slug',
    ];

    protected function initialize()
    {
        
    }
    

    
}