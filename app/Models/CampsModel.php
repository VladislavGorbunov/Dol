<?php

namespace App\Models;

use CodeIgniter\Model;

class CampsModel extends Model
{
    protected $table = 'camps';
    public $count_rows;
    protected $primaryKey = 'camps_id';

    protected $allowedFields = [
        'camps_id',
        'cities_id',
        'representatives_id',
        'title',
        'camp_base',
        'description',
        'placement',
        'advantages',
        'daily_schedule',
        'adress',
        'coords',
        'year',
        'min_age',
        'max_age',
        'free_transfer',
        'security',
        'slug',
        'video_link',
        'vk_link',
        'site_link',
        'views',
        
    ];

    public function getCamps($region, $type, $season, $age, $art, $kol, $max_price) 
    {
        $db = \Config\Database::connect();
        $builder = $db->table('camps');
        $builder->select('camps.camps_id, camps.title camp, camps.camp_base, camps.description, camps.min_age, camps.year, camps.max_age, camps.adress, camps.slug, camps.free_transfer, camps.security, camps.video_link, AVG(reviews.rating) avg_rating, MIN(shifts.price) shift_min_price, COUNT(DISTINCT reviews.id) count_reviews');
    
        $builder->join('reviews', 'reviews.camps_id = camps.camps_id', 'left');
        $builder->join('shifts', 'shifts.camps_id = camps.camps_id', 'left');
        if ($type) $builder->join('camps_types', 'camps_types.camps_id = camps.camps_id', 'left');
        if ($type) $builder->join('types', 'camps_types.types_id = types.types_id', 'left');
        
        if ($season) $builder->join('camps_seasons', 'camps_seasons.camps_id = camps.camps_id', 'left');

        $builder->where('camps.cities_id', $region);

        if ($type) $builder->where('camps_types.types_id', $type); 
        
        if ($season) $builder->where('camps_seasons.seasons_id', $season);
        
        if ($age) {
            $builder->where('camps.min_age <=', $age); // минимальный возраст
            $builder->where('camps.max_age >=', $age); // максимальный возраст
        }

       if ($max_price) $builder->where('shifts.price <=', $max_price);

        $builder->groupBy(['camps.camps_id', 'reviews.camps_id']); 
        
       // $builder->orderBy('shift_min_price', 'ASC');
        $builder->orderBy('avg_rating', 'DESC');
        $builder->orderBy('count_reviews', 'DESC');
        
        
        $this->count_rows = $builder->countAllResults(false); 

        return $data = [
            'builder' => $builder->get($kol, $art),
            'count_row' => $this->count_rows,
        ];
    }

    public function getBestCamps() 
    {
        $db = \Config\Database::connect();
        $builder = $db->table('camps');
        $builder->select('camps.camps_id, camps.title camp, camps.min_age, camps.max_age, camps.adress, camps.slug, COUNT(reviews.camps_id) count_reviews, AVG(reviews.rating) avg_rating');
        
        $builder->join('reviews', 'reviews.camps_id = camps.camps_id', 'left');
        
        $builder->groupBy('camps.camps_id, reviews.camps_id'); // Групировка чтобы не было дублей
        $builder->orderBy('count_reviews DESC, avg_rating DESC');
        $builder->limit(15);
        return $builder->get();

    }


    public function getTypes($id) 
    {
        $db = \Config\Database::connect();
        $builder = $db->table('types');
        $builder->select('types.types_id, types.title, types.slug');
        $builder->join('camps_types', 'camps_types.types_id = types.types_id', 'left');
        $builder->where('camps_types.camps_id', $id);
        return $builder->get(); 
    }

    
}


