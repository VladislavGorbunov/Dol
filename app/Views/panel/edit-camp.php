<style>
    .ck-editor__editable {
        min-height: 300px;
    }

    .form-label {
        font-weight: 500;
    }

    .example-1 .form-group {
        margin-top: 10px;
        margin-bottom: 10px;
    }

    .example-1 input[type=file] {
        outline: 0;
        opacity: 0;
        pointer-events: none;
        user-select: none
    }

    .example-1 .label {

        border: 2px dashed grey;
        border-radius: 5px;
        display: block;
        padding: 1.2em;
        transition: border 300ms ease;
        cursor: pointer;
        text-align: center
    }

    .example-1 .title {
        display: block;
        text-align: center;
    }

    .example-1 .label i {
        display: block;
        font-size: 42px;
        padding-bottom: 16px
    }

    .example-1 .label i,
    .example-1 .label .title {
        color: grey;
        transition: 200ms color
    }

    .example-1 .label:hover {
        border: 2px solid #000
    }

    .example-1 .label:hover i,
    .example-1 .label:hover .title {
        color: #000
    }
</style>



<div class="col p-4">
    <h1 class="mt-2 text-center">Изменение данных о лагере</h1>

    <?php if (session()->getFlashdata('msg-error')) : ?>
        <div class="alert alert-danger">
            <?= session()->getFlashdata('msg-error') ?>
        </div>
    <?php endif; ?>

    
    <?= validation_list_errors() ?>

    <div class="row">

        <div class="col-lg-6 mt-2">
            <form action="" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label class="form-label">Название: (Изменить нельзя. Если есть такая необходимость, напишите в службу поддержки)</label>
                    <input type="text" class="form-control" name="title" placeholder="Например: Восход" value="<?= $camp['title'] ?>" readonly required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Название базы лагеря:</label>
                    <input type="text" class="form-control" name="camp_base" placeholder="Например: ДОЛ «Морская волна»" value="<?= $camp['camp_base'] ?>" required>
                </div>

                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Год основания:</label>
                    <select class="form-select" name="year">
                        <?php
                            for ($i = 1990; $i <= date('Y'); $i++) {
                                if ($i == $camp['year']) {
                                    echo '<option selected value="' . $i . '">' . $i . '</option>';
                                } else {
                                    echo '<option value="' . $i . '">' . $i . '</option>';
                                }
                            }
                        ?>
                    </select>
                </div>

                <div class="mb-3">
                    <div class="row">
                        <label class="form-label">Возраст детей:</label>
                        <div class="col-lg-6 mb-3">
                            <select class="form-select" name="min_age">
                            <?php
                                for ($i = 0; $i <= 10; $i++) {
                                    if ($i == $camp['min_age']) {
                                        echo '<option selected value="' . $i . '">от ' . $i . '</option>';
                                    } else {
                                        echo '<option value="' . $i . '">от ' . $i . '</option>';
                                    }
                                }
                            ?>
                            </select>
                        </div>


                        <div class="col-lg-6">
                            <select class="form-select" name="max_age">
                            <?php
                                for ($i = 0; $i <= 20; $i++) {
                                    if ($i == $camp['max_age']) {
                                        echo '<option selected value="' . $i . '">до ' . $i . '</option>';
                                    } else {
                                        echo '<option value="' . $i . '">до ' . $i . '</option>';
                                    }
                                }
                            ?>
                            </select>
                        </div>
                        <div class="col-lg-12">
                            <label class="form-label mt-3">Охраняемая территория:</label>

                            <select class="form-select" name="security">
                                <?php 

                                if ($camp['security'] == 1) {
                                    echo '<option selected value="1">Да</option><option value="0">Нет</option>';
                                } else {
                                    echo '<option selected value="0">Нет</option><option value="1">Да</option>';
                                }
                                
                                ?>
                            </select>

                            <label class="form-label mt-3">Трансфер включён в стоимость:</label>
                            <select class="form-select" name="free_transfer">
                                <?php 

                                if ($camp['free_transfer'] == 1) {
                                    echo '<option selected value="1">Да</option><option value="0">Нет</option>';
                                } else {
                                    echo '<option selected value="0">Нет</option><option value="1">Да</option>';
                                }
                               ?>
                            </select>

                        </div>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label">Ссылка на группу Вконтакте:</label>
                    <input type="text" class="form-control" placeholder="https://vk.com/public" name="vk_link" value="<?= $camp['vk_link'] ?>">
                </div>

                <div class="mb-3">
                    <label class="form-label">Сайт лагеря:</label>
                    <input type="text" class="form-control" placeholder="https://site.ru" name="site_link" value="<?= $camp['site_link'] ?>">
                </div>


        </div>



        <div class="col-lg-6 mt-2">
            <div class="mb-3">
                
                <label for="exampleInputEmail1" class="form-label">Регион:</label>
                <select id="city" class="form-select" name="cities_id">
                    <?php
                    foreach ($cities as $city) {
                        if ($city['title'] == $camp['city']['title']) {
                            echo '<option selected value="' . $city['cities_id'] . '">' . $city['title'] . '</option>';
                        } else {
                            echo '<option value="' . $city['cities_id'] . '">' . $city['title'] . '</option>';
                        }
                    }
                    ?>
                </select>
            </div>


            <div class="mb-3">
                <label class="form-label">Адрес:</label>
                <input id="adress" type="text" class="form-control" placeholder="Выберите точку на карте" name="adress" value="<?= $camp['adress'] ?>" readonly>
            </div>

            <div class="mb-3">
                <label class="form-label">Координаты:</label>
                <input id="coords" type="text" class="form-control" placeholder="Будет заполнено автоматически" name="coords" readonly>
            </div>


            <div id="map" style="width: auto; height: 330px"></div>


        </div>

                <?php
                // var_dump($cover);
                ?>

        <div class="col-lg-12">
            <h3 class="text-center mt-4">Загрузите фотографии</h3>
            <div class="row">

                <div class="col-lg-6">
                    <div class="example-1">
                        <div class="form-group">
                            <label class="label">

                                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="#2955c8" class="bi bi-card-image mt-3 mb-3" viewBox="0 0 16 16">
                                    <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z" />
                                    <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z" />
                                </svg>

                                <span class="title">Добавить главную обложку</span>
                                <input type="file" id="cover_img" name="cover" accept="image/png, image/jpeg" required>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="example-1">
                        <div class="form-group">
                            <label class="label">

                                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="#2955c8" class="bi bi-images mt-3 mb-3" viewBox="0 0 16 16">
                                    <path d="M4.502 9a1.5 1.5 0 1 0 0-3 1.5 1.5 0 0 0 0 3z" />
                                    <path d="M14.002 13a2 2 0 0 1-2 2h-10a2 2 0 0 1-2-2V5A2 2 0 0 1 2 3a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v8a2 2 0 0 1-1.998 2zM14 2H4a1 1 0 0 0-1 1h9.002a2 2 0 0 1 2 2v7A1 1 0 0 0 15 11V3a1 1 0 0 0-1-1zM2.002 4a1 1 0 0 0-1 1v8l2.646-2.354a.5.5 0 0 1 .63-.062l2.66 1.773 3.71-3.71a.5.5 0 0 1 .577-.094l1.777 1.947V5a1 1 0 0 0-1-1h-10z" />
                                </svg>

                                <span class="title">Дополнительные изображения (до 15 фото в формате JPG или PNG)</span>
                                <input type="file" name="images[]" accept="image/png, image/jpeg" multiple required>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <h3 class="text-center mt-3 mb-3">Изменить ссылку на видео</h3>
        <div class="row">
            <div class="col-lg-6">
                <img src="/public/theme/img/youtube-copy-link.jpg" class="img-fluid">
            </div>
            <div class="col-lg-6">
                <ul>
                    <li class="mt-2">1. Загрузите видео на YOUTUBE</li>
                    <li class="mt-2">2. Откройте загруженное видео и нажмите правую кнопку мыши на плеере</li>
                    <li class="mt-2">3. В появившемся окне нажмите "Копировать URL видео"</li>
                    <li class="mt-2">4. Вставте полученную ссылку в поле ниже</li>
                </ul>

                <p style="color:red">Не вставляйте в поле ниже ссылку из адресной строки браузера, такое видео не будет работать.</p>
                <input class="form-control" type="text" name="youtube_link" placeholder="https://youtu.be/szofMAvUanw" value="<?= $camp['video_link'] ?>">
            </div>
        </div>

        <?php 
            
        ?>

        <div class="col-lg-6 d-block mx-auto">
            <h3 class="text-center mt-4">Сезон работы</h3>
            <p class="text-center">Если вы работаете круглый год выбирете все сезоны.</p>
            <div class="row mt-3 mb-3">

                <?php
                // Создаём новый массив с id сезонов этого лагеря
                foreach ($campsSeasons as $campSeason) {
                    $season_arr[] = $campSeason['seasons_id'];
                }

                // В цикле выводим сезоны и проверяем, есть ли текущий id сезона в массиве season_arr
                // Если есть ставим checked
                foreach ($seasons as $season) {
                    echo '
                    <div class="form-check col-lg-3 mb-2">
                    <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" value="' . $season['seasons_id'] . '" name="seasons[]" '. $checked = (in_array($season['seasons_id'], $season_arr) ? 'checked' : '') .'>
                    ' . $season['title'] . '</label>
                    </div>';
                }

                ?>
            </div>

        </div>


        <div class="col-lg-12">
            <h3 class="text-center mt-4">Типы лагеря</h3>
            <p class="text-center">Выберите <span class="text-danger">не более шести</span> типов к которым относится ваш лагерь.</p>
            <div class="row">

                <?php

                // Создаём новый массив с id типов этого лагеря
                foreach ($campsTypes as $campTypes) {
                    $types_arr[] = $campTypes['types_id'];
                }

                foreach ($types as $type) {
                    echo '
                    <div class="form-check col-lg-3 mb-2">
                    <label class="form-check-label">
                    <input class="form-check-input check-types" type="checkbox" value="' . $type['types_id'] . '" name="types[]" '.$checked = (in_array($type['types_id'], $types_arr) ? 'checked' : '').'>
                    ' . $type['title'] . '</label>
                    </div>';
                }

                ?>
            </div>


            <script>
                let checkboxs = document.querySelectorAll('.check-types')
                let checkedCount = document.querySelectorAll('.check-types:checked').length // количество уже выбранных чекбоксов
                let checked = document.querySelectorAll('.check-types:checked')
                let checkArray = []

                checked.forEach(ch => {
                    checkArray.push(ch.value)
                })


                checkboxs.forEach(checkbox => {
                    checkbox.addEventListener('click', () => {
                        
                        if (checkArray.length < 6) {
                            if (!checkArray.includes(checkbox.value)) {
                                checkbox.checked = true
                                checkArray.push(checkbox.value)
                                
                            } else {
                                checkArray.splice(checkArray.indexOf(checkbox.value), 1)
                            }

                        } else {
                            
                            checkbox.checked = false
                            
                            if (checkArray.includes(checkbox.value)) {
                                checkbox.checked = false
                                checkArray.splice(checkArray.indexOf(checkbox.value), 1)
                                
                        }
                        }
                       
                    })
                })
            </script>

        </div>


        <h3 class="text-center mt-4">Описания</h3>
        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Описание лагеря:</label>
            <textarea class="form-control textarea" id="editor" name="description"><?= $camp['description'] ?></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Размещение:</label>
            <textarea class="form-control textarea" id="editor2" name="placement" placeholder="Например: Лагерь находится в уникальной природной зоне Ленинградской области на берегу озера в окружении сосновых лесов. Удивительная природа и целебный лесной воздух обеспечивают идеальные условия для отдыха.
            Новые современные коттеджи. В коттеджах по 3 комнаты, в комнатах проживает по 3 ребенка!
            Также в домике – общий холл и своя кухня, где дети будут собираться и пить вкусный горячий чай со своими вожатыми и преподавателями. Душевая кабина, туалет и умывальник находится прямо в домике (все новое, чистое, приятное)."><?= $camp['placement'] ?></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Преимущества лагеря (Перечислите основные
                преимущества вашего лагеря перед остальными, его особенности.)</label>
            <textarea class="form-control textarea" id="editor3" name="advantages"><?= $camp['advantages'] ?></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Распорядок дня:</label>

            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Как правильно заполнить блок?
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            fghfghf
                        </div>
                    </div>
                </div>
            </div>

            <textarea class="form-control textarea" id="editor4" name="daily_schedule"><?= $camp['daily_schedule'] ?></textarea>
        </div>


        <div class="col-lg-5">
            <button type="submit" class="btn btn-primary">Отправить на проверку</button>
        </div>
        </form>



    </div>
</div>


<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>



<script>
    ClassicEditor
        .create(document.querySelector('#editor'), {
            removePlugins: ['Link', 'CKFinder'],
            toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList',
                'blockQuote'
            ],
            heading: {
                options: [{
                        model: 'paragraph',
                        title: 'Заголовки',
                        class: 'ck-heading_paragraph'
                    },
                    {
                        model: 'heading2',
                        view: 'h2',
                        title: 'Заголовок 2',
                        class: 'ck-heading_heading2'
                    },
                    {
                        model: 'heading3',
                        view: 'h3',
                        title: 'Заголовок 3',
                        class: 'ck-heading_heading3'
                    }
                ]
            }
        })
        .catch(error => {
            console.log(error);
        });


    ClassicEditor
        .create(document.querySelector('#editor2'), {
            removePlugins: ['Link', 'CKFinder'],
            toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList',
                'blockQuote'
            ],
            heading: {
                options: [{
                        model: 'paragraph',
                        title: 'Заголовки',
                        class: 'ck-heading_paragraph'
                    },
                    {
                        model: 'heading2',
                        view: 'h2',
                        title: 'Заголовок 2',
                        class: 'ck-heading_heading2'
                    },
                    {
                        model: 'heading3',
                        view: 'h3',
                        title: 'Заголовок 3',
                        class: 'ck-heading_heading3'
                    }
                ]
            }
        })
        .catch(error => {
            console.log(error);
        });


    ClassicEditor
        .create(document.querySelector('#editor3'), {
            removePlugins: ['Link', 'CKFinder'],
            toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList',
                'blockQuote'
            ],
            heading: {
                options: [{
                        model: 'paragraph',
                        title: 'Заголовки',
                        class: 'ck-heading_paragraph'
                    },
                    {
                        model: 'heading2',
                        view: 'h2',
                        title: 'Заголовок 2',
                        class: 'ck-heading_heading2'
                    },
                    {
                        model: 'heading3',
                        view: 'h3',
                        title: 'Заголовок 3',
                        class: 'ck-heading_heading3'
                    }
                ]
            }
        })
        .catch(error => {
            console.log(error);
        });

    ClassicEditor
        .create(document.querySelector('#editor4'), {
            removePlugins: ['Link', 'CKFinder'],
            toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList',
                'blockQuote'
            ],
            heading: {
                options: [{
                        model: 'paragraph',
                        title: 'Заголовки',
                        class: 'ck-heading_paragraph'
                    },
                    {
                        model: 'heading2',
                        view: 'h2',
                        title: 'Заголовок 2',
                        class: 'ck-heading_heading2'
                    },
                    {
                        model: 'heading3',
                        view: 'h3',
                        title: 'Заголовок 3',
                        class: 'ck-heading_heading3'
                    }
                ]
            }
        })
        .catch(error => {
            console.log(error);
        });
</script>


<script>
    let coverImage = document.getElementById('cover_img');

    coverImage.addEventListener('change', (event) => {
        console.log(coverImage.value.split(/(\\|\/)/g).pop());
    })
</script>



<script type="text/javascript">
let adressInput = document.getElementById('adress');
let coordInput = document.getElementById('coords');
let cityInput = document.getElementById('city');
let cityName = cityInput.options[cityInput.selectedIndex].text;


ymaps.ready(init);

function init() {
    var myPlacemark,
        myMap = new ymaps.Map('map', {
            center: [55.753994, 37.622093],
            zoom: 11
        }, {
            searchControlProvider: 'yandex#search'
        });

    getAddressCity(cityName)

    // Создание метки.
    function createPlacemark(coords) {
        return new ymaps.Placemark(coords, {
            iconCaption: 'поиск...'
        }, {
            preset: 'islands#violetDotIconWithCaption',
            draggable: true
        });
    }


    // Определяем адрес по координатам (обратное геокодирование).
    function getAddress(coords) {

        coordInput.value = coords;
        myPlacemark.properties.set('iconCaption', 'поиск...');
        ymaps.geocode(coords).then(function(res) {
            var firstGeoObject = res.geoObjects.get(0);

            myPlacemark.properties
                .set({
                    // Формируем строку с данными об объекте.
                    iconCaption: [
                        // Название населенного пункта или вышестоящее административно-территориальное образование.
                        firstGeoObject.getLocalities().length ? firstGeoObject.getLocalities() :
                        firstGeoObject.getAdministrativeAreas(),
                        // Получаем путь до топонима, если метод вернул null, запрашиваем наименование здания.
                        firstGeoObject.getThoroughfare() || firstGeoObject.getPremise()
                    ].filter(Boolean).join(', '),
                    // В качестве контента балуна задаем строку с адресом объекта.
                    balloonContent: firstGeoObject.getAddressLine()
                });
            adressInput.value = firstGeoObject.getAddressLine();
        });
    }

    // Определяем координаты по адресу
    function getAddressCity(cityName) {
        // Поиск координат.

        ymaps.geocode(adressInput.value, {
            results: 1
        }).then(function(res) {
            // Выбираем первый результат геокодирования.
            var firstGeoObject = res.geoObjects.get(0),
                // Координаты геообъекта.
                coords = firstGeoObject.geometry.getCoordinates(),

                // Область видимости геообъекта.
                bounds = firstGeoObject.properties.get('boundedBy');

            firstGeoObject.options.set('preset', 'islands#darkBlueDotIconWithCaption');
            // Получаем строку с адресом и выводим в иконке геообъекта.
            firstGeoObject.properties.set('iconCaption', firstGeoObject.getAddressLine());

            // Добавляем первый найденный геообъект на карту.
            var metka = myMap.geoObjects.add(firstGeoObject);

            // Слушаем клик на карте.
            myMap.events.add('click', function(e) {
                var coords = e.get('coords');

                // Если метка уже создана – просто передвигаем ее.
                if (myPlacemark) {
                    myPlacemark.geometry.setCoordinates(coords);

                }
                // Если нет – создаем.
                else {
                    myPlacemark = createPlacemark(coords);
                    myMap.geoObjects.add(myPlacemark);
                    myMap.geoObjects.remove(firstGeoObject); // Удаляем старую метку
                    // Слушаем событие окончания перетаскивания на метке.
                    myPlacemark.events.add('dragend', function() {
                        getAddress(myPlacemark.geometry.getCoordinates());
                    });
                }

                getAddress(coords);
            });

            // Добавляем первый найденный геообъект на карту.
            myMap.geoObjects.add(firstGeoObject);
            coordInput.value = coords;
            // Масштабируем карту на область видимости геообъекта.
            myMap.setBounds(bounds, {
                // Проверяем наличие тайлов на данном масштабе.
                checkZoomRange: true

            });
        });
    }

    cityInput.addEventListener('change', () => {
        cityName = cityInput.options[cityInput.selectedIndex].text;
        //console.log(cityName);
        getAddressCity(cityName);
    })



}
</script>