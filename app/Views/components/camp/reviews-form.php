<div id="reviews-add" class="mt-4 p-3 bg-white rounded">

    <div class="col-lg-10 d-block mx-auto">
    <h2 class="text-center mt-3">Были в этом лагере? <span style="color:#38b976">Помогите другим с выбором</span>, напишите отзыв!</h2>
    <small class="text-center col-lg-7 d-block mx-auto">
    Для того чтобы Ваш отзыв был опубликован, необходимо указать номер бронирования который мы отправляли вам на почту. Таким образом мы боремся с накруткой отзывов.
    </small>
 
    <form action="/review-insert" method="post">
    <div class="row mt-4">
        <div class="col-lg-4 mt-2">
            <label class="form-label">Ваше имя</label>
            <input type="text" class="form-control" placeholder="Ваше имя" name="name">
        </div>

        <div class="col-lg-4 mt-2">
            <label class="form-label">Номер бронирования</label>
            <input type="text" class="form-control" placeholder="Введите номер бронирования" name="booking_number">
        </div>

        <div class="col-lg-4 mt-2">
        <label class="form-label">Оценка</label>
          <div class="range-block">
            <input type="range" class="form-range" min="1" max="5" step="1" value="5" id="customRange3" name="rating">
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
    <label class="form-label mt-3"><span style="color:#3ac47d;font-weight:bold">+ Преимущества:</span></label>
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
    height: 0.4rem;
    padding: 0;
    background-color: transparent;
    appearance: none;
}


.form-range::-webkit-slider-runnable-track {
    width: 100%;
    height: 0.4rem;
    background-color: #222;
}

.form-range::-moz-range-track {
    width: 100%;
    height: 0.4rem;
    background-color: #222;
}

.form-range::-moz-range-thumb {
    background-color: #3ac47d;
}

.form-range::-webkit-slider-thumb {
    background-color: #3ac47d;
}


.form-range::-webkit-range-thumb {
    background-color: #3ac47d;
}

.form-control {
    font-size: 14px;
    padding: 12px 7px;
}
</style>