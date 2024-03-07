<div class="container">

<div class="info-block-index mt-3">
    
    <div class="row">
        
        <div class="col-lg-3">
            <img src="/public/theme/img/free.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2">Бесплатное бронирование</h6>
            <p class="text-center">Мы не берём комиссию за бронирование путёвки, цены указаны напрямую от лагерей.</p>
        </div>

        <div class="col-lg-3">
            <img src="/public/theme/img/handshake.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2">Договор напрямую с лагерем</h6>
            <p class="text-center">Вы заключаете договор и оплачиваете путёвку напрямую лагерю без посредников.</p>
        </div>

        <div class="col-lg-3">
            <img src="/public/theme/img/reviews-icon.png" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2">Честные отзывы</h6>
            <p class="text-center">Мы за правду и справледливость, дети должны отдыхать безопасно и хорошо поэтому не удаляем негативные отзывы.</p>
        </div>

        <div class="col-lg-3">
            <img src="/public/theme/img/best-rating.svg" width="64px" class="d-block mx-auto">
            <h6 class="text-center mt-2">Лагеря с высоким рейтингом</h6>
            <p class="text-center">Наш сервис помогаем найти лагерь с хорошими отзывами и высоким рейтингом.</p>
        </div>
    </div>
</div>

<div class="bg-white rounded p-3">
    <h2 class="text-center mt-2 mb-3"><span style="color:#38b976">Места отдыха</span> для детей и подростков ищут у нас</h2>
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

<div class="region-block bg-white rounded mt-4">
  <h2 class="text-center mb-4">Поиск <span style="color:#38b976">в любом регионе</span> России</h2>

    <div class="row mt-2 mb-2">
        <?php foreach ($cities as $city) : ?>
        <div class="col-lg-3 text-center p-2">
          <a href="/camps/<?= $city['slug'] ?>/type-all/season-all" class="city-block-link"><?= $city['title'] ?></a>
        </div>
        <?php endforeach ?>
    </div>
</div>

<h2 class="text-center mt-4"><span style="color:#38b976">Топ 15 лучших</span> детских лагерей России</h2>
<p class="text-center">На основании голосов и отзывов наших пользователей</p>

<div class="row g-4">
<?php

if (!empty($camps)):

foreach ($camps as $camp):?>
<div class="col-lg-4">
    <div class="card">
    <?php if (!empty($camp['cover']['name_img'])):?>
        <img src="/public/images/camps/<?= $camp['slug'] ?>/cover/<?= $camp['cover']['name_img'] ?>" class="mt-2 d-block mx-auto img-fluid">
    <?php else:?>
        <img src="/public/theme/img/nofoto.jpg">
    <?php endif ?>

        <div class="card-body">
            <h6><a href="/camp/<?= $camp['slug'] ?>" target="_blank"><?= $camp['camp'] ?></a></h6>

            <div class="row mt-3">
                <div class="col">Рейтинг: <b><?= round($camp['rating'], 1) ?></b> <i class="las la-star" style="color:gold"></i></div>
                <div class="col">Отзывов: <b><?= $camp['reviews'] ?></b></div>
            </div>
                
            <p class="mt-3" style="min-height: 35px;"><i class="las la-map-marker-alt"></i> <?= $camp['adress'] ?></p>
                    
            <div class="d-flex justify-content-between align-items-center">
                <a href="/camp/<?= $camp['slug'] ?>" target="_blank" class="btn btn-detailed"><i class="las la-chevron-right"></i> Подробнее</a> 
            </div>
        </div>
    </div>
</div>
    <?php endforeach ?>
    <?php else : ?>
        Упс.. Ни чего нет
    <?php endif ?>

    
</div>
    
    <!-- <h2 class="text-center mt-5"><span style="color:#38b976">Последние</span> добавленные смены</h2>
    <p class="text-center">Подобрали для Вас самые популярные смены в России</p> -->
</div>
