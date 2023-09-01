<div id="reviews" class="mt-4 p-3 bg-white rounded position-relative">
<h2 class="text-center mt-3">Последние отзывы о лагере</h2>

<div class="col-lg-8 d-block mx-auto">

<?php

// var_dump($reviews_data);
    
    if (!empty($reviews_data)) {
        for ($i = 0; ($i < count($reviews_data) && $i < 4); $i++) {
            echo '<div class="col-lg-12 mt-3">
            <img src="https://img.icons8.com/color/452/user-group-man-woman.png" width="70px">
            ';
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
                
                //echo '<div class="d-flex justify-content-center"><div class="mb-3"> ' . $star_render . ' </div></div>';

                echo '<div class="col-lg-12 mt-3"><b style="color:#0ab39c">Преимущества:</b> '.$reviews_data[$i]['advantages'].'</div>
                <div class="col-lg-12 mt-3"><b>Недостатки:</b> '.$reviews_data[$i]['disadvantages'].'</div>
                <div class="col-lg-12 mt-3 mb-4"><b>Оценка:</b> ' . $star_render . '</div>
            ';
        }
    }
?>
</div>
<p class="text-center mt-3 mb-3"><a href="" style="color:#2955c8 !important;border-bottom:1px solid #2955c8">Читать все отзывы</a></p>
</div>



<div id="reviews-add" class="mt-4 p-3 bg-white rounded">

    <div class="col-lg-10 d-block mx-auto">
    <h2 class="text-center mt-3">Были в этом лагере? <span style="color:#0ab39c">Помогите другим с выбором</span>, напишите отзыв!</h2>
    <small class="text-center col-lg-6 d-block mx-auto">
    Для того чтобы Ваш отзыв был опубликован, необходимо указать номер бронирования который мы отправляли вам на почту. Таким образом мы боремся с накруткой отзывов.
    </small>
 
    <form action="/review-insert" method="post">
    <div class="row mt-4">
        <div class="col-lg-4 mt-2">
            <label for="customRange3" class="form-label">Ваше имя</label>
            <input type="text" class="form-control" placeholder="Ваше имя" name="name">
        </div>

        <div class="col-lg-4 mt-2">
            <label for="customRange3" class="form-label">Номер бронирования</label>
            <input type="text" class="form-control" placeholder="Введите номер бронирования" name="booking_number">
        </div>

        <div class="col-lg-4 mt-2">
        <label for="customRange3" class="form-label">Оценка</label>
          <div class="range-block">
            <input type="range" class="form-range" min="1" max="5" step="1" value="1" id="customRange3" name="rating">
            <div class="row">
                <div class="col"><b>1</b></div>
                <div class="col text-center"><span style="position:relative;left:-8px">2</span></div>
                <div class="col text-center"><b>3</b></div>
                <div class="col text-center"><span style="position:relative;left:8px">4</span></div>
                <div class="col text-end"><b>5</b></div>
            </div>
          </div>
        </div>
    </div>
    <label class="form-label mt-3"><span style="color:#0ab39c;font-weight:bold">+ Преимущества:</span></label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="advantages"></textarea>
    <label class="form-label mt-3"><span style="font-weight:bold">- Недостатки:</span></label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="disadvantages"></textarea>
    <input type="hidden" name="id" value="<?= $camp['camps_id'] ?>">
    <button type="submit" class="btn btn-add-review-form mt-4 col-lg-2 d-block mx-auto">Оставить отзыв</button>
    </div>
</form>
</div>

<style>
 .form-range {
    width: 100%;
    height: 0.5rem;
    padding: 0;
    background-color: transparent;
    appearance: none;
}


.form-range::-webkit-slider-runnable-track {
    width: 100%;
    height: 0.5rem;
    background-color: #111;
}

.form-range::-moz-range-track {
    width: 100%;
    height: 0.5rem;
    background-color: #111;
}

.form-range::-moz-range-thumb {
    
    background-color: #0ab39c;
}

.form-range::-webkit-slider-thumb {
    background-color: #0ab39c;
}


.form-range::-webkit-range-thumb {
    background-color: #0ab39c;
}
</style>