<div class="container">

    <div class="row">

        <style>
        .rating-block {
            display: flex;
            align-items: center;
        }

        .rating {
            display: flex;
            align-items: center;
            justify-content: center;
            background: gold;
            padding: 5px;
            border-radius: 5px;
            color: #000;
            font-weight: 400;
            width: 85px;
            height: 42px;
            font-family: 'Rubik', sans-serif;
            font-size: 16px;
            margin-left: 10px;
        }

        .bi-star-fill {
            color: gold;
            margin: 1px;
        }

        .lider {
            background: gold;
            text-align: center;
            padding: 5px 3px;
            margin-bottom: 15px;
            color: #111;
            border-radius: 5px;
            font-size: 13px;
            font-weight: bold;
        }

        .form-label {
            color: #555;
        }

        .map-link {
            color: #2955c8;
            margin-left: 5px;       
        }

        .reviews-link {
            color: #2955c8;
        }

        .filter {
            position:
                border: none;
            border: 1px solid #eee;
            border-radius: 5px;
            color: #333;
            padding: 10px;
        }

        .card {
            border: none;
            border: 1px solid #eee;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
        }
        </style>

        <div class="col-lg-3">
            <div class="border p-3 rounded mb-3">
                <h5 class="mt-2 mb-3">Поиск по параметрам:</h5>

                <label class="form-label mt-2">Регион поиска:</label>
                <select class="form-select filter">
                    <option selected disabled>Любой регион</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>

                <label class="form-label mt-3">Тип лагеря:</label>
                <select class="form-select filter">
                    <option selected disabled>Любой тип лагеря</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>

                <label class="form-label mt-3">Сезон:</label>
                <select class="form-select filter">
                    <option selected disabled>Любой сезон</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>

                <label class="form-label mt-3">Возраст ребёнка:</label>
                <select class="form-select filter mb-3">
                    <option selected disabled>Любой возраст</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>

                <a class="btn btn-reg mt-1 mb-3 col-lg-12" href="/camp">Найти лагерь</a>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="row">

        


                <?php 
    if (!empty($camps)) {
        foreach ($camps as $camp) {
            $rating = round($camp['avg_rating'], 1);
            
            echo '
            <div class="col-lg-12 mb-3">
            
            <div class="card p-3">
            <div class="row">
             <div class="col-lg-4 col-12 mb-3">
             <img src="/public/images/camps/'.$camp['slug'].'/thumb/'.$camp['cover']['name_img'].'" class="img-fluid">
                 
              </div>

             <div class="col-lg-8">
             <div class="row">
             <div class="col-lg-8">
                 <h5><a href="/camp">'. $camp['camp_id'] . ' ' . $camp['camp'] .'</a></h5>
                 <p>'.$camp['adress'].' <br><a href="" class="map-link small">(Смотреть на карте)</a></p> 
                 <p>
                 На смене ребенок научится общаться и строить отношения с новыми людьми не только на русском, но и на английском языке; найдет друзей, раскроет свой потенциал и сможет хорошо отдохнуть. Ребенок прокачает soft skills и speaking English. Каждая смена тематическая, наполненная играми, квестами, мастер-классами и другими творческими мероприятиями.
                 </p>
                 <div class="row d-none d-lg-block d-md-block">
                     <div class="col-auto">
                         <p>Возраст: <b>от 4 до 14 лет</b></p>
                     </div>
                 </div>


                 <div class="type-block mb-2 d-none d-lg-flex d-md-flex">
             ';

             foreach ($camp['types'] as $type) {
                $link = explode('/', $_SERVER['REQUEST_URI']);
                $link[3] = $type['slug'];
                $link =  implode('/', $link);
                echo '<a href="'.$link.'"><div class="type">' . $type['title']. '</div></a>';
            }

            echo '</div></div>

             <div class="col-lg-4 ">

              <div class="rating-block">
              <img src="/public/theme/img/star.svg" width="24px" style="margin-right: 5px;"><b>Рейтинг: </b> <span class="rating">'.$rating.' из 5</span> 
              </div>
              
              <p class="mt-3"><a href="" class="reviews-link">Отзывов: '.$camp['count_reviews'].'</a></p>
              <p>Гос. компенсация: да</p>
              <p>Городской сертификат: да</p>
              <p class="price"><b>от 50000 руб.</b></p>
              <a class="btn btn-reg mt-1 mb-3 col-lg-12" href="/camp">Смотреть смены</a>
              <a class="btn btn-detailed mt-1 mb-3 col-lg-12" href="/camp">Подробнее</a>
             </div>

             </div>
             </div>
         </div>
     </div>
     
</div></a>';
  }
} else {
    echo '<div class="col-lg-12 mb-3"> Ничего не нашли =( </div>';
}
?>

                <?= $pager_links ?>


            </div>
        </div>
    </div>
</div>