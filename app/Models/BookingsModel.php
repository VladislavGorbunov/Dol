<?php

namespace App\Models;

use CodeIgniter\Model;

class BookingsModel extends Model
{
    protected $table = 'bookings';

    protected $allowedFields = [
        'number_of_tickets',
        'fio',
        'telephone',
        'email',
        'camp_id',
        'representative_id',
        'shift_id',
        'booking_number',
    ];

    
}


