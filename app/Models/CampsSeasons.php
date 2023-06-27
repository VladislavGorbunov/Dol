<?php

namespace App\Models;

use CodeIgniter\Model;

class CampsSeasons extends Model
{
    protected $table = 'camps_seasons';
    protected $primaryKey = 'id';

    protected $allowedFields = [
        'camps_id',
        'seasons_id',
    ];

    protected function initialize()
    {
        
    }
    

    
}