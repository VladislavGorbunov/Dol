<div class="container">
    <div class="row">




        <div class="col-lg-12 mt-2">

            <div class="row">
                <div class="col-lg-4 mt-2 g-2">
                  
                <?= '<img src="'.$cover.'" class="camp-photos" width="100%">' ?></div>

                <div class="col-lg-8">
                    <div class="row">


                <?php
                    for ($i = 0; $i < count($images); $i++) {
                        echo '<div class="col-lg-3 mt-2 g-2"><img src="'.$images[$i].'" class="img-fluid camp-photos"></div>';
                    }
                ?>
                    </div>
                </div>

            </div>

            <div class="row mt-3">
                <div class="col-lg-8 mt-3">

                    <div class="border p-3 rounded">
                        <h3><?= $camp['title'] ?></h3>
                        <?= $camp['description'] ?>
                    </div>

                    <div class="border mt-3 p-3 rounded">
                        <h3>Преимущества</h3>
                        <?= $camp['advantages'] ?>
                    </div>

                    <div class="border mt-3 p-3 rounded">
                        <h3>Размещение</h3>
                        <?= $camp['daily_schedule'] ?>
                    </div>


                </div>

                <div class="col-lg-4">
                    <div class="border mt-3 p-3 rounded">
                        <h3>Мы на карте</h3>
                        <div id="map" style="width: auto; height: 400px"></div>

                        <div class="col-lg-12 mt-4">
                            <div class="d-flex flex-row justify-content-around">
                                <div>
                                <p><i class="las la-star" style="color:gold"></i> Рейтинг: <b><?= round($reviews['rating'], 2) ?> из 5</b></p>
                                </div>

                                <div>
                                <p><i class="las la-comment"></i> Отзывов: <b>0</b></p>
                                </div>
                            </div>
                            <a href="" class="btn-add-review d-block mx-auto text-center col-10">Оставить отзыв</a>
                            <div class="mt-4">
                            <p><b>Регион:</b> <?= $region['title'] ?></p>
                            <p><b>Адрес:</b> <?= $camp['adress'] ?></p>
                            <p><b>Год начала деятельности:</b> <?= $camp['year'] . ' год' ?></p>
                            <p><b>Возраст:</b> <?= 'от ' . $camp['min_age'] . ' до ' . $camp['max_age'] . ' лет'?></p>
                            </div>

                            <p class="mt-4"><b>Таматики лагеря:</b></p>
                  <?php
                      foreach ($types_camp as $type) {
                          echo '<div class="type d-inline-flex flex-row">' . $type['title'] . '</div>';
                      }
                  ?>
                        </div>

                    </div>


                    <div class="border mt-3 p-3 rounded">
                        <h3>Забронировать</h3>
                        <?php

                if (!empty($shifts)) {
                    $count = count($shifts);
                    echo '<small>Доступно смен: '. $count  .'</small>';
                    echo '<select class="form-select mt-2 mb-3" aria-label="Default select example">';
                    foreach ($shifts as $shift) {
                        echo '<option>'.$shift['title'].' - '. $shift['price'] .' руб. </option>';
                    }
                    echo '<option>Не определились со сменой</option>';
                    echo '</select>';

                    echo '<input type="text" class="form-control mt-2 mb-3" placeholder="Ф.И.О" name="">
                          <input type="text" class="form-control mt-2 mb-3" placeholder="Телефон" name="">
                          <input type="text" class="form-control mt-2 mb-3" placeholder="Email" name="">

                    ';

                    echo '<p><i class="las la-check-circle" style="color: #21a663"></i> Бесплатное бронирование без комиссии</p>
                          <p><i class="las la-check-circle" style="color: #21a663"></i> Бесплатная отмена</p>
                          <p><i class="las la-check-circle" style="color: #21a663"></i> Договор напрямую с лагерем без посредников</p>
                          <p class="text-center mt-4" style="font-size:13px;">После отправки формы в течении дня с вами свяжется менеджер лагеря.</p>
                    ';

                    echo '<button type="submit" class="btn btn-booking mt-3 col-lg-12">Забронировать путёвку</button>';
                } else {
                    
                }

                ?>
                    </div>


                </div>
            </div>


        </div>

    </div>


    <section>
        <div class="container my-5 py-5">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12 col-lg-12">
                    <div class="card text-dark">
                        <div class="card-body p-4">
                            <h4 class="mb-0">Отзывы о лагере</h4>
                            <p class="fw-light mb-4 pb-2">Последние отзывы наших посетителей</p>

                            <div class="d-flex flex-start">
                                <img class="rounded-circle shadow-1-strong me-3"
                                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(23).webp" alt="avatar"
                                    width="60" height="60" />
                                <div>
                                    <h6 class="fw-bold mb-1">Maggie Marsh</h6>
                                    <div class="d-flex align-items-center mb-3">
                                        <p class="mb-0">
                                            March 07, 2021
                                            <span class="badge bg-primary">Pending</span>
                                        </p>
                                        <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a>
                                        <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
                                        <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
                                    </div>
                                    <p class="mb-0">
                                        Lorem Ipsum is simply dummy text of the printing and typesetting
                                        industry. Lorem Ipsum has been the industry's standard dummy text ever
                                        since the 1500s, when an unknown printer took a galley of type and
                                        scrambled it.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <hr class="my-0" />

                        <div class="card-body p-4">
                            <div class="d-flex flex-start">
                                <img class="rounded-circle shadow-1-strong me-3"
                                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(26).webp" alt="avatar"
                                    width="60" height="60" />
                                <div>
                                    <h6 class="fw-bold mb-1">Lara Stewart</h6>
                                    <div class="d-flex align-items-center mb-3">
                                        <p class="mb-0">
                                            March 15, 2021
                                            <span class="badge bg-success">Approved</span>
                                        </p>
                                        <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a>
                                        <a href="#!" class="text-success"><i class="fas fa-redo-alt ms-2"></i></a>
                                        <a href="#!" class="link-danger"><i class="fas fa-heart ms-2"></i></a>
                                    </div>
                                    <p class="mb-0">
                                        Contrary to popular belief, Lorem Ipsum is not simply random text. It
                                        has roots in a piece of classical Latin literature from 45 BC, making it
                                        over 2000 years old. Richard McClintock, a Latin professor at
                                        Hampden-Sydney College in Virginia, looked up one of the more obscure
                                        Latin words, consectetur, from a Lorem Ipsum passage, and going through
                                        the cites.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <hr class="my-0" style="height: 1px;" />

                        <div class="card-body p-4">
                            <div class="d-flex flex-start">
                                <img class="rounded-circle shadow-1-strong me-3"
                                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(33).webp" alt="avatar"
                                    width="60" height="60" />
                                <div>
                                    <h6 class="fw-bold mb-1">Alexa Bennett</h6>
                                    <div class="d-flex align-items-center mb-3">
                                        <p class="mb-0">
                                            March 24, 2021
                                            <span class="badge bg-danger">Rejected</span>
                                        </p>
                                        <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a>
                                        <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
                                        <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
                                    </div>
                                    <p class="mb-0">
                                        There are many variations of passages of Lorem Ipsum available, but the
                                        majority have suffered alteration in some form, by injected humour, or
                                        randomised words which don't look even slightly believable. If you are
                                        going to use a passage of Lorem Ipsum, you need to be sure.
                                    </p>
                                </div>
                            </div>
                        </div>

                        <hr class="my-0" />

                        <div class="card-body p-4">
                            <div class="d-flex flex-start">
                                <img class="rounded-circle shadow-1-strong me-3"
                                    src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(24).webp" alt="avatar"
                                    width="60" height="60" />
                                <div>
                                    <h6 class="fw-bold mb-1">Betty Walker</h6>
                                    <div class="d-flex align-items-center mb-3">
                                        <p class="mb-0">
                                            March 30, 2021
                                            <span class="badge bg-primary">Pending</span>
                                        </p>
                                        <a href="#!" class="link-muted"><i class="fas fa-pencil-alt ms-2"></i></a>
                                        <a href="#!" class="link-muted"><i class="fas fa-redo-alt ms-2"></i></a>
                                        <a href="#!" class="link-muted"><i class="fas fa-heart ms-2"></i></a>
                                    </div>
                                    <p class="mb-0">
                                        It uses a dictionary of over 200 Latin words, combined with a handful of
                                        model sentence structures, to generate Lorem Ipsum which looks
                                        reasonable. The generated Lorem Ipsum is therefore always free from
                                        repetition, injected humour, or non-characteristic words etc.
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>









</div>








<script src="https://api-maps.yandex.ru/2.1/?apikey=60ad5e6e-89aa-490d-a9b3-4c7f3e35165a&lang=ru_RU"
    type="text/javascript"></script>

<?php $coord = explode(',', $camp['coords']); ?>


<script type="text/javascript">
ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map("map", {
            center: [<?= $coord[0] ?>, <?= $coord[1] ?>],
            zoom: 12
        }, {
            searchControlProvider: 'yandex#search'
        }),

        // Создаем геообъект с типом геометрии "Точка".
        myGeoObject = new ymaps.GeoObject({
            // Описание геометрии.


        }, {
            // Опции.
            // Иконка метки будет растягиваться под размер ее содержимого.
            preset: 'islands#blackStretchyIcon',
            // Метку можно перемещать.
            draggable: false
        })


    myMap.geoObjects


        .add(new ymaps.Placemark([<?= $coord[0] ?>, <?= $coord[1] ?>], {
            balloonContent: 'цвет <strong>воды пляжа бонди</strong>'
        }, {
            preset: 'islands#icon',
            iconColor: '#0095b6'
        }))







}
</script>