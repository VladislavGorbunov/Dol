<?php

namespace App\Models;

use CodeIgniter\Model;

class Bookings extends Model
{
    protected $table = 'bookings';

    protected $allowedFields = [
        'fio',
        'telephone',
        'email',
        'camp_id',
        'representative_id',
        'shift_id',
        'booking_number',
    ];

    
}


