<?php

namespace App\Models;

use CodeIgniter\Model;

class Camps extends Model
{

    public function getCamps($region, $type, $season, $age) 
    {
        $db = \Config\Database::connect();
        $builder = $db->table('camps');
        $builder->select('camps.camps_id, camps.title camp, camps.min_age, camps.max_age, reviews.camp_id, COUNT(reviews.firstname) count_reviews, AVG(reviews.rating) avg_rating, GROUP_CONCAT(types.title) name_type, cities.title city_title');

        $builder->join('camps_types', 'camps_types.camps_id = camps.camps_id', 'left');
        $builder->join('types', 'types.types_id = camps_types.types_id', 'left');
        $builder->join('camps_seasons', 'camps.camps_id = camps_seasons.camps_id', 'left');
        $builder->join('seasons', 'seasons.seasons_id = camps_seasons.seasons_id', 'left');
        $builder->join('cities', 'cities.cities_id = camps.cities_id', 'left');
        $builder->join('reviews', 'reviews.camp_id = camps.camps_id', 'left');
        
        if ($type) $builder->where('camps_types.types_id', $type); // id выбранного типа лагеря
        if ($season) $builder->where('camps_seasons.seasons_id', $season);
        $builder->where('cities.cities_id ', $region); // id региона
        if ($age) {
            $builder->where('camps.min_age <=', $age); // минимальный возраст
            $builder->where('camps.max_age >=', $age); // максимальный возраст
        }

        $builder->groupBy('camps.camps_id, reviews.camp_id'); // Групировка чтобы не было дублей

        return $builder->get(); 
    }
    
}


