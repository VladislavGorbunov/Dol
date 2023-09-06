<div id="reviews" class="mt-4 p-3 bg-white rounded position-relative">
<h2 class="text-center mt-3">Последние отзывы о лагере</h2>

<div class="col-lg-8 d-block mx-auto">

<?php
    for ($i = 0; ($i < count($reviews_data) && $i < 4); $i++) {
        echo '<div class="col-lg-12 mt-3"><img src="https://img.icons8.com/color/452/user-group-man-woman.png" width="70px">';
        echo '<b class="mx-2" style="font-size: 16px;">'.$reviews_data[$i]['name'].'</b> 12.07.2023</div>';
            $star_render = null;
            $max_stars = 5;

            $stars = $max_stars - $reviews_data[$i]['rating'];

            for ($star = 0; $star < $reviews_data[$i]['rating']; $star++) {
                $star_render .= '<i class="las la-star" style="color:gold; font-size: 18px"></i>';
            }

            for ($star = 0; $star < $stars; $star++) {
                $star_render .= '<i class="lar la-star" style="color:gold; font-size: 18px"></i>'; 
            }
                
            echo '<div class="col-lg-12 mt-3"><b style="color:#3ac47d">Преимущества:</b> '.$reviews_data[$i]['advantages'].'</div>
                  <div class="col-lg-12 mt-3"><b>Недостатки:</b> '.$reviews_data[$i]['disadvantages'].'</div>
                  <div class="col-lg-12 mt-3 mb-4"><b>Оценка:</b> ' . $star_render . '</div>';
    }
?>
</div>
<p class="text-center mt-3 mb-3"><a href="" style="color:#2955c8 !important;border-bottom:1px solid #2955c8">Читать все отзывы</a></p>
</div>




