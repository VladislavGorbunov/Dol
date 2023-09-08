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
        'token',
        'created_at',
        'activated',
    ];

    // Выборка всех представителей лагерей
    public function AllRepresentatives()
    {
        $this->builder()->get();
        return $this;
    }

    // Выборка активированных представителей лагерей
    public function ActivatedRepresentatives()
    {
        $this->builder()->where('activated', 1);
        return $this;
    }

    // Выборка неактивированных представителей лагерей
    public function NotActivatedRepresentatives()
    {
        $this->builder()->where('activated', 0);
        return $this;
    }

    // Выборка представителя лагеря по ID
    public function GetRepresentative($id)
    {
        return $this->builder()->where('user_id', $id)->get()->getResultArray();
    }
}