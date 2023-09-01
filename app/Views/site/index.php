<div class="container">

<div class="info-block-index mt-3">
    <div class="row">
        
        <div class="col-lg-3">
            <img src="/public/theme/img/free.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2"><b>Бесплатное бронирование</b></h6>
            <p class="text-center">Не берём комиссию за бронирование, цены напрямую от лагерей.</p>
        </div>

        <div class="col-lg-3">
            <img src="/public/theme/img/handshake.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2"><b>Договор на прямую с лагерем</b></h6>
            <p class="text-center">Вы заключаете договор и оплачиваете путёвку напрямую лагерю.</p>
        </div>

        <div class="col-lg-3">
            <img src="/public/theme/img/deposit.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2"><b>Самые выгодные цены</b></h6>
            <p class="text-center">Скидки и выгодные предложения на путёвки от наших партнёров.</p>
        </div>

        <div class="col-lg-3">
            <img src="/public/theme/img/best-rating.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2"><b>Лагеря с высоким рейтингом</b></h6>
            <p class="text-center">Помогаем найти лагерь с хорошими отзывами и высоким рейтингом.</p>
        </div>
    </div>
</div>

<div class="bg-white rounded p-3">
<h2 class="text-center mt-2 mb-3"><span style="color:#3ac47d">Места отдыха</span> для детей и подростков ищут у нас</h2>
<p class="text-center">
Самое полезное занятие на каникулах, это отдых в детском лагере. Поэтому основная цель нашего сервиса: предоставить нашим посетителям
удобный, надежный и в то же время бесплатный сервис по поиску и бронированию путёвок. Мы следим за качеством 
и гарантируем прозрачную систему отзывов и рекомендаций. У нас Вы сможете найти лагерь в любом регионе России, на любое время года и нужного направления. 
Читайте отзывы, сравнивайте условия и цены и выбирайте лучшее место отдыха для своего ребёнка!</p>
<p class="text-center">Наш сервис работает очень просто, он отбирает по вашим пожеланиям лагеря, при этом фильтруя их по рейтингу и отзывам,
в выдаче отдаётся предпочтение лагерям с высоким рейтингом. При этом накрутка отзывов исключена, ведь отзыв могут оставить только
люди, которые раннее бронировали путёвку у нас.
</p>
</div>

<div class="bg-white rounded p-3 mt-4">
<h2 class="text-center mt-2 mb-3">Поиск в <span style="color:#3ac47d">любом регионе России</span></h2>

<div class="row mt-2 mb-2">
<?php

foreach ($cities as $city) {
    echo '<div class="col-lg-3 text-center p-2"><a href="/camps/'. $city['slug'] .'/type-all/season-all" class="city-block-link">'. $city['title'] .'</a></div>';
}

?>
</div></div>

    <h2 class="text-center mt-4"><span style="color:#3ac47d">Топ 15 лучших</span> детских лагерей России</h2>
    <p class="text-center">На основании голосов и отзывов наших пользователей</p>

    <div class="row g-4">

        <?php

    if (!empty($camps)) {
        foreach ($camps as $camp) {
            echo '
            <div class="col-lg-4">
            <a href="/camp/'.$camp['slug'].'"><div class="card">';

            if (!empty($camp['cover']['name_img'])) {
                echo '<img src="/public/images/camps/'.$camp['slug'].'/cover/'.$camp['cover']['name_img'].'" class="mt-2 d-block mx-auto img-fluid">';
            } else {
                echo '<img src="/public/theme/img/nofoto.jpg">';
            }

            echo '<div class="card-body">
                <h5>'.$camp['camp'].'</h5>
                <p class="mt-3" style="min-height: 45px;"><i class="las la-map-marker-alt"></i> '.$camp['adress'].'</p>
                    <p class="card-text">This is a wider card with supporting text below as a natural lead-in to
                        additional content. This content is a little bit longer.</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="btn-group">
                            <button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                            <button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                        </div>
                        <small class="text-muted">9 mins</small>
                    </div>
                </div>
            </div>
            </div></a>';
        }
    } else {
        echo 'Упс.. Ни чего нет.';
    }

    ?>

    </div>
</div>