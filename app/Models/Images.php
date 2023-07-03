<?php

namespace App\Models;

use CodeIgniter\Model;

class Images extends Model
{
    protected $table = 'camps_images';
    protected $primaryKey = 'id';
    public $url_folder = '/public/images/camps/';


    protected $allowedFields = [
        'id',
        'camps_id',
        'name_img',
        'cover',
    ];

    protected function initialize()
    {
        
    }
    
   

   
    
}