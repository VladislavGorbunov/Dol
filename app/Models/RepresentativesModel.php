<?php

namespace App\Models;

use CodeIgniter\Model;

class RepresentativesModel extends Model
{
    protected $table = 'representatives';
    protected $primaryKey = 'user_id';

    protected $allowedFields = [
        'user_id',
        'cities_id',
        'organization',
        'inn',
        'director',
        'director_phone',
        'firstname_manager',
        'lastname_manager',
        'post',
        'email_manager',
        'phone_manager',
        'password',
        'created_at'
    ];
}