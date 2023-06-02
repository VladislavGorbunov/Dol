<?php

namespace App\Models;

use CodeIgniter\Model;

class Seasons extends Model
{
    protected $table = 'seasons';
    protected $primaryKey = 'seasons_id';

    protected $allowedFields = [
        'seasons_id',
        'title',
        'slug',
    ];

    protected function initialize()
    {
        
    }
    
}