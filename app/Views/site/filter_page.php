<div class="container">
    <div class="row">
        <div class="col-lg-12">
            
            <p class="mb-3">Подобрано лагерей: <?= $total ?></p>
                <?php 
                    if (!empty($camps)) {
                        foreach ($camps as $camp) {
                            $rating = round($camp['avg_rating'], 1);
            
                            echo '<div class="col-lg-12 mb-4">';

                                // Если рейтинг больше 4 выделяем рамкой
                                if ($rating > 4) {
                                    echo '<div class="card best p-4">';
                                } else {
                                    echo '<div class="card p-4">';
                                }

                            echo   '<div class="row"> <!-- Общий row для 3х блоков -->
                                        <div class="col-lg-3 col-12 mb-3">
                                            <img src="/public/images/camps/'.$camp['slug'].'/cover/'.$camp['cover']['name_img'].'" class="img-fluid">
                                        </div>

                                        <div class="col-lg-9">
                                            <div class="row">

                                                <div class="col-lg-9">
                                                    <h5><a href="/camp/'.$camp['slug'].'" target="_blank">'. $camp['camp'] .'</a></h5>
                                                        <p class="adress mt-3"><i class="las la-map-marker-alt"></i> '.$camp['adress'].'</p> 
                                                            <p>'.$camp['description'].'</p>
                
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

                            <div class="rating-block">
                                <img src="/public/theme/img/star.svg" width="24px" style="margin-right: 5px;"><b>Рейтинг: </b> <span class="rating">'.$rating.' из 5</span> 
                            </div>
                        
                            <p class="mt-3"><i class="las la-comment"></i> <a href="" class="reviews-link">Отзывов: '.$camp['count_reviews'].'</a></p>
                            <p>Возраст: <b>от '.$camp['min_age'].' до '.$camp['max_age'].' лет</b></p>
                            <p class="price"><b>от '. $camp['min_price'] .' руб.</b></p>
                        
                            <a class="btn btn-detailed mt-1 mb-3 col-lg-12 mx-auto" href="/camp/'.$camp['slug'].'" target="_blank">Подробнее</a>
                        </div>
                        <!-- Конец правого блока -->

             </div>
             </div>
         </div>
    </div> 
</div>'; 
  }
} else {
    echo '<div class="col-lg-12 mb-3"> Ничего не нашли =( </div>';
}
?>

            <?= $pager_links ?>


        </div> <!-- col-lg-12 -->
    </div> <!-- row -->
</div> <!-- container -->