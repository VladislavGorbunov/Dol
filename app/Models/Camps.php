<?php

namespace App\Models;

use CodeIgniter\Model;

class Camps extends Model
{

    // public function getCamps($region, $type, $age) 
    // {
    //     $db = \Config\Database::connect();
    //     $builder = $db->table('camps');
    //     $builder->select('camps.camps_id, camps.title camp, camps_types.types_id Type, camps.min_age, camps.max_age, types.title name_type, cities.title type_title');
       
    //     $builder->join('camps_types', 'camps_types.camps_id = camps.camps_id', 'left');
    //     $builder->join('types', 'types.types_id = camps_types.types_id', 'left');
    //     $builder->join('cities', 'cities.cities_id = camps.cities_id', 'left');
    //     if ($type) $builder->where('camps_types.types_id', $type); // id выбранного типа лагеря
        
    //     $builder->where('cities.cities_id ', $region); // id региона
    //     if ($age) {
    //         $builder->where('camps.min_age <=', $age); // минимальный возраст
    //         $builder->where('camps.max_age >=', $age); // максимальный возраст
    //     }

    //     $builder->groupBy('camps.camps_id'); // Групировка чтобы не было дублей

    //     return $builder->get(); 
    // }


    public function getCamps($region, $type, $age) 
    {
        $db = \Config\Database::connect();
        $builder = $db->table('camps');
        $builder->select('camps.camps_id, camps.title camp, camps.min_age, camps.max_age, GROUP_CONCAT(types.title) name_type, cities.title city_title');
       
        $builder->join('camps_types', 'camps_types.camps_id = camps.camps_id', 'left');
        $builder->join('types', 'types.types_id = camps_types.types_id', 'left');
        $builder->join('cities', 'cities.cities_id = camps.cities_id', 'left');
        if ($type) $builder->where('camps_types.types_id', $type); // id выбранного типа лагеря
        
        $builder->where('cities.cities_id ', $region); // id региона
        if ($age) {
            $builder->where('camps.min_age <=', $age); // минимальный возраст
            $builder->where('camps.max_age >=', $age); // максимальный возраст
        }

        $builder->groupBy('camps.camps_id'); // Групировка чтобы не было дублей

        return $builder->get(); 
    }
    
}


