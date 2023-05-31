<?php

namespace App\Models;

use CodeIgniter\Model;

class Camps extends Model
{

    public function getCamps($region, $type) 
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('camps');
        $builder->select('camps.title camp, camps_types.types_id Type, types.title name_type, cities.title type_title');
       
        $builder->join('camps_types', 'camps_types.camps_id = camps.camps_id', 'left');
        $builder->join('types', 'types.types_id = camps_types.types_id', 'left');
        $builder->join('cities', 'cities.cities_id = camps.cities_id', 'left');
        if ($type) $builder->where('camps_types.types_id', $type); // id выбранного типа лагеря
        
        $builder->where('cities.cities_id ', $region); // id региона
        return $builder->get(); 
    }
    
}


