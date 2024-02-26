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
    <h1 class="mt-2 text-center">Анкета лагеря</h1>
    <p class="text-center">Заполните поля ниже. Все данные проходят проверку. В случае указания недейтвительной
        информации, добавление
        лагеря будет отклонено.</p>

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
                    <label class="form-label">Название:</label>
                    <input type="text" class="form-control" name="title" placeholder="Например: Восход" required>
                </div>

                <div class="mb-3">
                    <label class="form-label">Название базы лагеря:</label>
                    <input type="text" class="form-control" name="camp_base" placeholder="Например: ДОЛ «Морская волна»" required>
                </div>

                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Год основания:</label>
                    <select class="form-select" name="year">
                        <?php
                        for ($i = 1940; $i <= date('Y'); $i++) {
                            echo '<option value="' . $i . '">' . $i . '</option>';
                        }
                        ?>
                    </select>
                </div>
                

                <div class="mb-2">
                    <div class="row">
                        <label class="form-label">Возраст детей:</label>
                        <div class="col-lg-6 mb-3">
                            <select class="form-select" name="min_age">
                                <option value="0">от 0</option>
                                <option value="1">от 1</option>
                                <option value="2">от 2</option>
                                <option value="3">от 3</option>
                                <option value="4">от 4</option>
                                <option value="5">от 5</option>
                                <option value="6">от 6</option>
                                <option value="7">от 7</option>
                                <option value="8">от 8</option>
                                <option value="9">от 9</option>
                                <option value="10">от 10</option>
                            </select>



                        </div>


                        <div class="col-lg-6">
                            <select class="form-select" name="max_age">
                                <option value="1">до 1</option>
                                <option value="2">до 2</option>
                                <option value="3">до 3</option>
                                <option value="4">до 4</option>
                                <option value="5">до 5</option>
                                <option value="6">до 6</option>
                                <option value="7">до 7</option>
                                <option value="8">до 8</option>
                                <option value="9">до 9</option>
                                <option value="10" selected>до 10</option>
                                <option value="11">до 11</option>
                                <option value="12">до 12</option>
                                <option value="13">до 13</option>
                                <option value="14">до 14</option>
                                <option value="15">до 15</option>
                                <option value="16">до 16</option>
                                <option value="17">до 17</option>
                                <option value="18">до 18</option>
                                <option value="19">до 19</option>
                                <option value="20">до 20</option>
                            </select>
                        </div>

                        
                    </div>
                </div>

                <div class="mb-3">
                    <div class="row">
                    <div class="col-6">
                    <label class="form-label">Охраняемая территория:</label>
                    <select class="form-select" name="security">
                        <option value="1">Да</option>
                        <option value="0">Нет</option>
                    </select></div>

                    <div class="col-6">
                    <label class="form-label">Трансфер включён в стоимость:</label>
                    <select class="form-select" name="free_transfer">
                        <option value="1">Да</option>
                        <option value="0">Нет</option>
                    </select></div>
                </div></div>

                <div class="mb-3">
                    <label class="form-label">Ссылка на группу Вконтакте:</label>
                    <input type="text" class="form-control" placeholder="https://vk.com/public" name="vk_link">
                </div>

                <div class="mb-3">
                    <label class="form-label">Сайт лагеря:</label>
                    <input type="text" class="form-control" placeholder="https://site.ru" name="site_link">
                </div>


        </div>

        <div class="col-lg-6 mt-2">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Регион:</label>
                <select id="city" class="form-select" name="cities_id" required>
                    <option value="" selected disabled>Выберите регион</option>
                    <?php
                        foreach ($cities as $city) {
                            echo '<option value="' . $city['cities_id'] . '">' . $city['title'] . '</option>';
                    }
                    ?>
                </select>
            </div>


            <div class="mb-3">
                <label class="form-label">Адрес:</label>
                <input id="adress" type="text" class="form-control" placeholder="Введите адрес или выберите точку на карте" name="adress" required>
            </div>

            <div class="mb-3">
                <label class="form-label">Координаты:</label>
                <input id="coords" type="text" class="form-control" placeholder="Будет заполнено автоматически" name="coords" readonly>
            </div>

            

            <style>

                .form-control:read-only {
                    background: #cdcdcd;
                }

                #map .map-deactive {
                    display: block;
                    position: absolute;
                    width: 100%;
                    height: 100%;
                    background: rgba(255,255,255,0.8);
                    backdrop-filter: blur(3px);
                    margin-top: 0;
                    z-index: 999;
                }

                .map-deactive p {
                    display: block;
                    margin-top: 150px;
                    text-align: center;
                    font-weight: bold;
                    color: red;
                }

                #map {
                    display: block;
                    position: relative;
                }
            </style>

            
            <div id="map" style="width: auto; height: 330px"><div class="map-deactive">
                <p>Выберите регион</p>
            </div>
            </div>
        </div>

        <script>
                const regionInput = document.getElementById('city')
                const mapDeactive = document.querySelector('.map-deactive')
                const adress = document.getElementById('adress')
                adress.setAttribute('readonly', true)

                regionInput.addEventListener('change', () => {
                    mapDeactive.style.display = 'none'
                    adress.removeAttribute('readonly')
                })
            </script>


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
                                <input type="file" id="cover_img" class="cover_img" name="cover" accept="image/png, image/jpeg" required>
                            </label>
                        </div>
                    </div>
                </div>

                <script>
                    const cover_input = document.querySelector('.cover_img')

                    cover_input.addEventListener('change', (e) => {
                        
                    })
                    
                </script>

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


        <h3 class="text-center mt-3 mb-3">Как добавить видео</h3>
        <div class="row">
            <div class="col-lg-6">
                <img src="/public/theme/img/youtube-copy-link.jpg" class="img-fluid">
            </div>
            <div class="col-lg-6">
                <ul>
                    <li class="mt-2">1. Загрузите видео на YOUTUBE</li>
                    <li class="mt-2">2. Откройте загруженное видео и нажмите правую кнопку мыши на плеере</li>
                    <li class="mt-2">3. В появившемся окне нажмите "Копировать URL видео"</li>
                    <li class="mt-2">4. Вставьте полученную ссылку в поле ниже</li>
                </ul>

                <p style="color:red">Не вставляйте в поле ниже ссылку из адресной строки браузера, такое видео не будет работать.</p>
                <input class="form-control" type="text" name="youtube_link" placeholder="https://youtu.be/szofMAvUanw">
            </div>
        </div>


        <div class="col-lg-6 d-block mx-auto">
            <h3 class="text-center mt-4">Сезон работы</h3>
            <p class="text-center">Если вы работаете круглый год выберите все сезоны.</p>
            <div class="row mt-3 mb-3">

                <?php

                foreach ($seasons as $season) {
                    echo '
                    <div class="form-check col-lg-3 mb-2">
                    <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" value="' . $season['seasons_id'] . '" name="seasons[]">
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

                foreach ($types as $type) {
                    echo '
                    <div class="form-check col-lg-3 mb-2">
                    <label class="form-check-label">
                    <input class="form-check-input check-types" type="checkbox" value="' . $type['types_id'] . '" name="types[]">
                    ' . $type['title'] . '</label>
                    </div>';
                }

                ?>
            </div>


            <script>
                let checkboxs = document.querySelectorAll('.check-types')

                let checkArray = []

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
            <textarea class="form-control textarea" id="summernote" name="description"></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Размещение:</label>
            <textarea class="form-control textarea" id="summernote2" name="placement" placeholder="Например: Лагерь находится в уникальной природной зоне Ленинградской области на берегу озера в окружении сосновых лесов. Удивительная природа и целебный лесной воздух обеспечивают идеальные условия для отдыха.
            Новые современные коттеджи. В коттеджах по 3 комнаты, в комнатах проживает по 3 ребенка!
            Также в домике – общий холл и своя кухня, где дети будут собираться и пить вкусный горячий чай со своими вожатыми и преподавателями. Душевая кабина, туалет и умывальник находится прямо в домике (все новое, чистое, приятное)."></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Преимущества лагеря (Перечислите основные
                преимущества вашего лагеря перед остальными, его особенности.)</label>
            <textarea class="form-control textarea" id="summernote3" name="advantages"></textarea>
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

            <textarea class="form-control textarea" id="summernote4" name="daily_schedule"></textarea>
        </div>


        <div class="col-lg-5">
            <button type="submit" class="btn btn-primary">Отправить на проверку</button>
        </div>
        </form>



    </div>
</div>


<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- include summernote css/js-->
<link href="/public/js/summernote/summernote-lite.css" rel="stylesheet">
<script src="/public/js/summernote/summernote-lite.js"></script>


<script>

$('#summernote').summernote({
        placeholder: '',
        height: 300,                 
        minHeight: 300,
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['insert', ['link']],
          
        ]
});


$('#summernote2').summernote({
        placeholder: '',
        height: 300,                 
        minHeight: 300,
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link']],
         
        ]
});

$('#summernote3').summernote({
        placeholder: '',
        height: 300,                 
        minHeight: 300,
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link']],
          
        ]
});

$('#summernote4').summernote({
        placeholder: '',
        height: 300,                 
        minHeight: 300,
        tabsize: 2,
        height: 120,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link']],
         
        ]
});


</script>

<script>
    let coverImage = document.getElementById('cover_img');

    coverImage.addEventListener('change', (event) => {
        if(coverImage.files.length > 0) {
            console.log('ok')
        } else {
            console.log('no')
        }
    })
</script>



<script type="text/javascript">
    let adressInput = document.getElementById('adress');
    let coordInput = document.getElementById('coords');
    let cityInput = document.getElementById('city');
    let cityName;

    ymaps.ready(init);

    function init() {
        var myPlacemark,
            myMap = new ymaps.Map('map', {
                center: [55.753994, 37.622093],
                zoom: 11
            }, {
                searchControlProvider: 'yandex#search'
            });

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
                // Слушаем событие окончания перетаскивания на метке.
                myPlacemark.events.add('dragend', function() {
                    getAddress(myPlacemark.geometry.getCoordinates());
                });
            }

            getAddress(coords);
        });

        // Создание метки.
        function createPlacemark(coords) {
            return new ymaps.Placemark(coords, {
                iconCaption: 'Мой лагерь тут'
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
            ymaps.geocode(cityName, {
                /**
                 * Опции запроса
                 * @see https://api.yandex.ru/maps/doc/jsapi/2.1/ref/reference/geocode.xml
                 */
                // Сортировка результатов от центра окна карты.
                // boundedBy: myMap.getBounds(),
                // strictBounds: true,
                // Вместе с опцией boundedBy будет искать строго внутри области, указанной в boundedBy.
                // Если нужен только один результат, экономим трафик пользователей.
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
                // myMap.geoObjects.add(firstGeoObject);
                // Масштабируем карту на область видимости геообъекта.
                myMap.setBounds(bounds, {
                    // Проверяем наличие тайлов на данном масштабе.
                    checkZoomRange: true

                });

                // Если метка уже создана – просто передвигаем ее.
                if (myPlacemark) {
                    myPlacemark.geometry.setCoordinates(coords);
                    coordInput.value = coords;
                }
                // Если нет – создаем.
                else {
                    myPlacemark = createPlacemark(coords);
                    myMap.geoObjects.add(myPlacemark);
                    coordInput.value = coords;
                    // Слушаем событие окончания перетаскивания на метке.
                    myPlacemark.events.add('dragend', function() {
                    getAddress(myPlacemark.geometry.getCoordinates());
                    
                });


                }

                // myPlacemark = createPlacemark(coords);
                // coordInput.value = coords;
                // myMap.geoObjects.add(myPlacemark);

                /**
                 * Все данные в виде javascript-объекта.
                 */
                console.log('Все данные геообъекта: ', firstGeoObject.properties.getAll());
                /**
                 * Метаданные запроса и ответа геокодера.
                 * @see https://api.yandex.ru/maps/doc/geocoder/desc/reference/GeocoderResponseMetaData.xml
                 */
                console.log('Метаданные ответа геокодера: ', res.metaData);
                /**
                 * Метаданные геокодера, возвращаемые для найденного объекта.
                 * @see https://api.yandex.ru/maps/doc/geocoder/desc/reference/GeocoderMetaData.xml
                 */
                console.log('Метаданные геокодера: ', firstGeoObject.properties.get(
                    'metaDataProperty.GeocoderMetaData'));
                /**
                 * Точность ответа (precision) возвращается только для домов.
                 * @see https://api.yandex.ru/maps/doc/geocoder/desc/reference/precision.xml
                 */
                console.log('precision', firstGeoObject.properties.get(
                    'metaDataProperty.GeocoderMetaData.precision'));
                /**
                 * Тип найденного объекта (kind).
                 * @see https://api.yandex.ru/maps/doc/geocoder/desc/reference/kind.xml
                 */
                console.log('Тип геообъекта: %s', firstGeoObject.properties.get(
                    'metaDataProperty.GeocoderMetaData.kind'));
                console.log('Название объекта: %s', firstGeoObject.properties.get('name'));
                console.log('Описание объекта: %s', firstGeoObject.properties.get('description'));
                console.log('Полное описание объекта: %s', firstGeoObject.properties.get('text'));
                /**
                 * Прямые методы для работы с результатами геокодирования.
                 * @see https://tech.yandex.ru/maps/doc/jsapi/2.1/ref/reference/GeocodeResult-docpage/#getAddressLine
                 */
                console.log('\nГосударство: %s', firstGeoObject.getCountry());
                console.log('Населенный пункт: %s', firstGeoObject.getLocalities().join(', '));
                console.log('Адрес объекта: %s', firstGeoObject.getAddressLine());
                console.log('Наименование здания: %s', firstGeoObject.getPremise() || '-');
                console.log('Номер здания: %s', firstGeoObject.getPremiseNumber() || '-');

                /**
                 * Если нужно добавить по найденным геокодером координатам метку со своими стилями и контентом балуна, создаем новую метку по координатам найденной и добавляем ее на карту вместо найденной.
                 */
                /**
                 var myPlacemark = new ymaps.Placemark(coords, {
                 iconContent: 'моя метка',
                 balloonContent: 'Содержимое балуна <strong>моей метки</strong>'
                 }, {
                 preset: 'islands#violetStretchyIcon'
                 });

                 myMap.geoObjects.add(myPlacemark);
                 */


            });
        }

        cityInput.addEventListener('change', () => {
            cityName = cityInput.options[cityInput.selectedIndex].text;
            //console.log(cityName);
            getAddressCity(cityName);
        })

        adressInput.addEventListener('input', () => {
            getAddressCity(adressInput.value);
        })


    }
</script>