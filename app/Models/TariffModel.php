<?php

namespace App\Models;

use CodeIgniter\Model;

class TariffModel extends Model
{
    protected $table = 'tariffs';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'id',
        'name',
        'price',
        'comment'
    ];

    protected function initialize()
    {
        
    }
    
}