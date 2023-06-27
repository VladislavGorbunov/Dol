<?php

namespace App\Models;

use CodeIgniter\Model;

class CampsTypes extends Model
{
    protected $table = 'camps_types';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'types_id',
        'camps_id',
    ];

    protected function initialize()
    {
        
    }
    

    
}