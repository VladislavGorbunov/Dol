<div class="container">
    <div class="row">
        
       
            <div class="col-lg-4 mb-2">
                <div class="card p-3 shadows">
                    <img src="/public/theme/img/search-count.png" width="48" class="d-block mx-auto mb-2">
                    <span class="text-center"><?= 'Подобрано лагерей для вас: <br><b>' . $count_camp; ?></b></span>
                </div>
            </div>
        
            <div class="col-lg-4 mb-2">
                <div class="card p-3 shadows">
                    <img src="/public/theme/img/down-price.png" width="48" class="d-block mx-auto mb-2">
                    <span class="text-center"><?= 'Минимальная стоимость путёвки в регионе: <br><b>' . $min = ($prices[0]['min']) ? number_format($prices[0]['min'], '0', ',', ' ') . ' руб.' : 'Нет данных'; ?></b></span>
                </div>
            </div>

            <div class="col-lg-4 mb-2">
                <div class="card p-3 shadows">
                    <img src="/public/theme/img/up-price.png" width="48" class="d-block mx-auto mb-2">
                    <span class="text-center"><?= 'Максимальная стоимость путёвки в регионе: <br><b>' . $max = ($prices[1]['max']) ? number_format($prices[1]['max'], '0', ',', ' ') . ' руб.' : 'Нет данных'; ?></b></span>
                </div>
            </div>     
        

            

        <?php
            
            if (!empty($camps)) {
                foreach ($camps as $camp) {
                    $rating = round($camp['avg_rating'], 1);

                    if ($camp['free_transfer']) {
                        $free_transfer = 'Трансфер включён в стоимость';
                    } else {
                        $free_transfer = null;
                    }
        ?>
                    <div class="col-lg-12 mb-4 mt-4">
                   
                      <div class="card p-4 shadows camp-card">
                     
                        <div class="row"> <!-- Общий row для 3х блоков -->
                          <div class="col-lg-3 col-12 mb-3">
                            <img src="/public/images/camps/<?= $camp['slug'].'/cover/'.$camp['cover']['name_img'] ?>" class="img-fluid">
                          </div>

                          <div class="col-lg-9">
                            <div class="row">
                              <div class="col-lg-9">
                                <h5><a href="/camp/<?= $camp['slug'] ?>" target="_blank"> <?= $camp['camp'] ?></a></h5>
                                Организатор: <?= $camp['organization'] ?>
                                <?= $camp['premium'] ? '<b class="premium">ПРОВЕРЕННЫЙ ЛАГЕРЬ</b>' : '' ?>
                                <p class="adress mt-3"><i class="las la-map-marker-alt"></i> <?= $camp['adress'] ?></p> 
                                <p> <?= $camp['short-description'] ?></p>
                
                          <div class="type-block mb-2 d-none d-lg-flex d-md-flex">
            
                    <?php
                        foreach ($camp['types'] as $type) {
                            $link = explode('/', $_SERVER['REQUEST_URI']);
                            $link[3] = $type['slug'];
                            $link =  implode('/', $link);
                            echo '<a href="'.$link.'"><div class="type m-1">' . $type['title']. '</div></a>';
                        }

                    ?>
                    
                    </div></div>

                        <!-- Правый блок -->
                        <div class="col-lg-3">

                            <div class="rating-block mb-3">
                                 <span class="rating"><i class="las la-star"></i> <?= $rating ?> из 5</span> 
                                 <a href="" class="reviews-link mx-2">(отзывов: <?= $camp['count_reviews'] ?>)</a>
                            </div>
                            
                            <p class="mt-3">Работает с <?= $camp['year'] ?> года</p>
                            <p>Возраст: от <?= $camp['min_age'] ?> до <?= $camp['max_age'] ?> лет</p>
                            

                        <?php
                            if (!empty($camp['video_link'])) {
                                $video_link = '<p><a href="/camp/'.$camp['slug'].'/#modal-video" target="_blank"><span style="color:#385bd7"><i class="lab la-youtube"></i> Смотреть видео о лагере</span></a></p>';
                                
                            } else {
                                $video_link = null;
                            }

                            if (!empty($camp['min_price'])) {
                               
                                $price  = number_format($camp['min_price'], '0', ',', ' ');
                                echo '<p class="price">от '. $price .' р. <span style="font-size: 13px;margin-left:5px">за путёвку</span></p>
                        
                                '.$video_link.'
                                <a class="btn btn-detailed mt-1 mb-3 col-lg-12 mx-auto" href="/camp/'.$camp['slug'].'" target="_blank"><i class="las la-chevron-right"></i> Посмотреть смены</a>
                                ';
                            } else {
                                echo '<p><b>Смены не найдены...</b></p><a class="btn btn-detailed mt-1 mb-3 col-lg-12 mx-auto" href="/camp/'.$camp['slug'].'" target="_blank"><i class="las la-chevron-right"></i> Подробнее</a>';
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