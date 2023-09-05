<div class="container">
    <div class="row">
        <div class="col-lg-12">

            <p class="mb-3">Подобрано лагерей: <?= $total ?></p>
            
            <?php
            
                if (!empty($camps)) {
                    foreach ($camps as $camp) {
                        $rating = round($camp['avg_rating'], 1);

                        if ($rating >= 3.5 && $camp['count_reviews'] >= 6) {
                            $badge = '<span class="badge-card mb-1">РЕКОМЕНДУЕМ</span>';
                            $best = 'best';
                        } else {
                            $badge = null;
                            $best = null;
                        }

                         if ($camp['free_transfer']) {
                            $free_transfer = 'Трансфер включён в стоимость';
                         } else {
                            $free_transfer = null;
                         }


                        echo '<div class="col-lg-12 mb-4">
                              <div class="card p-4 shadows">
                              <div class="row"> <!-- Общий row для 3х блоков -->
                                    <div class="col-lg-3 col-12 mb-3">';
                                        echo $badge;
                                        echo '<img src="/public/images/camps/'.$camp['slug'].'/cover/'.$camp['cover']['name_img'].'" class="img-fluid '. $best .'">
                                    </div>

                                    <div class="col-lg-9">
                                        <div class="row">
                                            <div class="col-lg-9">
                                                <h5><a href="/camp/'.$camp['slug'].'" target="_blank">'. $camp['camp'] .'</a></h5>
                                                    <p class="adress mt-3"><i class="las la-map-marker-alt"></i> '.$camp['adress'].'</p> 
                                                        <p>'.$camp['short-description'].'</p>
                
                                                    <div class="type-block mb-2 d-none d-lg-flex d-md-flex">
                            ';

                            foreach ($camp['types'] as $type) {
                                $link = explode('/', $_SERVER['REQUEST_URI']);
                                $link[3] = $type['slug'];
                                $link =  implode('/', $link);
                                echo '<a href="'.$link.'"><div class="type m-1">' . $type['title']. '</div></a>';
                            }

                        echo '</div></div>

                        <!-- Правый блок -->
                        <div class="col-lg-3">

                            <div class="rating-block mb-3">
                                 <span class="rating"><i class="las la-star"></i> ' .$rating. ' из 5</span> 
                                 <a href="" class="reviews-link mx-2">(отзывов: '.$camp['count_reviews'].')</a>
                            </div>
                            <p>Работает с '.$camp['year'].' года</p>
                            <p>Возраст: от '.$camp['min_age'].' до '.$camp['max_age'].' лет</p>
                            
                            ';
                            if ($camp['min_price'][0]['price']) {
                                echo '<p class="price"><b>от '. $camp['min_price'][0]['price'] .' р. <span style="font-size: 13px;">за путёвку</span></b></p>
                                <p style="font-size: 13px;"><span style="color:#3ac47d">'. $free_transfer .'</span></p>
                                <p><a href="/camp/'.$camp['slug'].'/#modal-video"><span style="color:#3ac47d"><i class="lab la-youtube"></i> Смотреть видео о лагере</span></a></p>
                                <a class="btn btn-detailed mt-1 mb-3 col-lg-12 mx-auto" href="/camp/'.$camp['slug'].'" target="_blank">Посмотреть смены</a>
                                ';
                            } else {
                                echo '<p><b>Доступных смен нет.</b></p><a class="btn btn-detailed mt-1 mb-3 col-lg-12 mx-auto" href="/camp/'.$camp['slug'].'" target="_blank">Подробнее</a>';
                            }
                        
                            echo '
                        </div>
                        <!-- Конец правого блока -->

             </div>
             </div>
         </div>
    </div> 
</div>'; 
  }
} else {
    echo '<div class="col-lg-6 d-block mx-auto mb-3">
    <img src="http://bycamps.ru/public/theme/img/login-form-logo.png" class="d-block mx-auto" width="256px">
    <h2 class="text-center mt-3">Упс.. Нам не удалось найти подходящих лагерей..</h2>
    <p class="text-center">Попробуйте изменить условия поиска.</p>
    </div>';
}
?>

<?= $pager_links ?>


        </div> <!-- col-lg-12 -->
    </div> <!-- row -->
</div> <!-- container -->