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

    <h2 class="text-center">Топ 15 лучших детских лагерей России</h2>
    <p class="text-center">На основании голосов и отзывов наших пользователей</p>

    <div class="row g-4">

        <?php

    if (!empty($camps)) {
        foreach ($camps as $camp) {
            echo '
            <div class="col-lg-4">
            <a href="/camp/'.$camp['slug'].'"><div class="card">';

            if (!empty($camp['cover']['name_img'])) {
                echo '<img src="/public/images/camps/'.$camp['slug'].'/cover/'.$camp['cover']['name_img'].'" class="mt-2 d-block mx-auto">';
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