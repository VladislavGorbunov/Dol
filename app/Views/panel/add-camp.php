<style>
.ck-editor__editable {
    min-height: 300px;
}

.form-label {
    font-weight: 500;
}
</style>

<div class="col p-4">
    <h2>Анкета лагеря</h2>
    <p>Заполните поля ниже. Все данные проходят проверку. В случае указания недейтвительной информации, добавление
        лагеря будет отклонено.</p>

    <div class="row">

        <div class="col-lg-6">
            <form>
                <div class="mb-3">
                    <label class="form-label">Название лагеря:</label>
                    <input type="text" class="form-control" placeholder="Например: ДОЛ «Морская волна»">
                </div>
                
                <div class="mb-3">
                <label for="exampleInputPassword1" class="form-label">Год основания:</label>
                <select class="form-select" aria-label="Default select example">
                    <?php
          for ($i = 1990; $i <= date('Y'); $i++) {
              echo '<option value="">'.$i.'</option>';
          }
      ?>
                </select>
            </div>

                <div class="mb-3">
                    <div class="row">
                        <label class="form-label">Возраст детей:</label>
                        <div class="col-lg-6">
                            <select class="form-select" aria-label="Default select example">
                                <option value="">от 0</option>
                                <option value="">от 1</option>
                                <option value="">от 2</option>
                                <option value="">от 3</option>
                                <option value="">от 4</option>
                                <option value="">от 5</option>
                                <option value="">от 6</option>
                                <option value="">от 7</option>
                                <option value="">от 8</option>
                                <option value="">от 9</option>
                                <option value="">от 10</option>
                            </select>

                            <label class="form-label mt-3">Охраняемая территория:</label>

                            <select class="form-select" aria-label="Default select example">
                                <option value="">Да</option>
                                <option value="">Нет</option>
                            </select>

                        </div>


                        <div class="col-lg-6">
                            <select class="form-select" aria-label="Default select example">
                                <option value="">до 1</option>
                                <option value="">до 2</option>
                                <option value="">до 3</option>
                                <option value="">до 4</option>
                                <option value="">до 5</option>
                                <option value="">до 6</option>
                                <option value="">до 7</option>
                                <option value="">до 8</option>
                                <option value="">до 9</option>
                                <option value="">до 10</option>
                                <option value="">до 11</option>
                                <option value="">до 12</option>
                                <option value="">до 13</option>
                                <option value="">до 14</option>
                                <option value="">до 15</option>
                                <option value="">до 16</option>
                                <option value="">до 17</option>
                                <option value="">до 18</option>
                                <option value="">до 19</option>
                                <option value="">до 20</option>
                            </select>

                            <label class="form-label mt-3">Трансфер включён в стоимость:</label>
                            <select class="form-select" aria-label="Default select example">
                                <option value="">Да</option>
                                <option value="">Нет</option>
                            </select>

                        </div>
                    </div>
                </div>

                <div class="mb-3">
                <label class="form-label">Ссылка на группу Вконтакте:</label>
                <input type="text" class="form-control" placeholder="https://vk.com/public">
            </div>

            <div class="mb-3">
                    <label class="form-label">Сайт лагеря:</label>
                    <input type="text" class="form-control" placeholder="https://site.ru">
                </div>


        </div>

        <div class="col-lg-6">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Регион:</label>
                <select class="form-select" aria-label="Default select example">
                    <?php 
            foreach($cities as $city) {
                echo '<option value="'.$city['cities_id'].'">'.$city['title'].'</option>';
            }
        ?>
                </select>
            </div>


            <div class="mb-3">
                <label class="form-label">Адрес:</label>
                <input id="adress" type="text" class="form-control" placeholder="Например: гп. Рощино, ул. Песочная, 1">
            </div>

            <div class="mb-3">
                <label class="form-label">Координаты:</label>
                <input id="coords" type="text" class="form-control">
            </div>
            

            <div id="map" style="width: 600px; height: 400px"></div>

           
        </div>

        


        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Описание лагеря:</label>
            <textarea class="form-control textarea" id="editor" name="description"></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Размещение:</label>
            <textarea class="form-control textarea" id="editor2" name=""
                placeholder="Например: Лагерь находится в уникальной природной зоне Ленинградской области на берегу озера в окружении сосновых лесов. Удивительная природа и целебный лесной воздух обеспечивают идеальные условия для отдыха.
            Новые современные коттеджи. В коттеджах по 3 комнаты, в комнатах проживает по 3 ребенка!
            Также в домике – общий холл и своя кухня, где дети будут собираться и пить вкусный горячий чай со своими вожатыми и преподавателями. Душевая кабина, туалет и умывальник находится прямо в домике (все новое, чистое, приятное)."></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Преимущества лагеря (Перечислите основные
                преимущества вашего лагеря перед остальными, его особенности.)</label>
            <textarea class="form-control textarea" id="editor3"></textarea>
        </div>

        <div class="mb-3 mt-2">
            <label for="exampleFormControlTextarea1" class="form-label">Распорядок дня:</label>

            <div class="accordion accordion-flush" id="accordionFlushExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="flush-headingOne">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                            data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                            Как правильно заполнить блок?
                        </button>
                    </h2>
                    <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne"
                        data-bs-parent="#accordionFlushExample">
                        <div class="accordion-body">
                            fghfghf
                        </div>
                    </div>
                </div>
            </div>

            <textarea class="form-control textarea" id="editor4"></textarea>
        </div>


        <div class="col-lg-5">
            <button type="submit" class="btn btn-primary">Отправить на проверку:</button>
        </div>
        </form>



    </div>
</div>


<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>



<script>
ClassicEditor
    .create(document.querySelector('#editor'), {
        removePlugins: ['Link', 'CKFinder'],
        toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList', 'blockQuote'],
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
        toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList', 'blockQuote'],
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
        toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList', 'blockQuote'],
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
        toolbar: ['heading', '|', 'bold', 'italic', 'link', 'list', 'bulletedList', 'numberedList', 'blockQuote'],
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


<script type="text/javascript">
  ymaps.ready(init);

function init() {

    var myMap = new ymaps.Map('map', {
        center: [55.753994, 37.622093],
        zoom: 9
    });

    let adressInput = document.getElementById('adress');
    let inputCoords = document.getElementById('coords');
    var adress;

    adressInput.addEventListener('blur', ()=> {
        adress = adressInput.value;
    

    
    // Поиск координат центра Нижнего Новгорода.
    ymaps.geocode(adress, {
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
    }).then(function (res) {
            // Выбираем первый результат геокодирования.
            var firstGeoObject = res.geoObjects.get(0),
                // Координаты геообъекта.
                coords = firstGeoObject.geometry.getCoordinates(),
                // Область видимости геообъекта.
                bounds = firstGeoObject.properties.get('boundedBy');

                inputCoords.value = coords;

            firstGeoObject.options.set('preset', 'islands#darkBlueDotIconWithCaption');
            // Получаем строку с адресом и выводим в иконке геообъекта.
            firstGeoObject.properties.set('iconCaption', firstGeoObject.getAddressLine());

            // Добавляем первый найденный геообъект на карту.
            myMap.geoObjects.add(firstGeoObject);
            // Масштабируем карту на область видимости геообъекта.
            myMap.setBounds(bounds, {
                // Проверяем наличие тайлов на данном масштабе.
                checkZoomRange: true
            });
            
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
            console.log('Метаданные геокодера: ', firstGeoObject.properties.get('metaDataProperty.GeocoderMetaData'));
            /**
             * Точность ответа (precision) возвращается только для домов.
             * @see https://api.yandex.ru/maps/doc/geocoder/desc/reference/precision.xml
             */
            console.log('precision', firstGeoObject.properties.get('metaDataProperty.GeocoderMetaData.precision'));
            /**
             * Тип найденного объекта (kind).
             * @see https://api.yandex.ru/maps/doc/geocoder/desc/reference/kind.xml
             */
            console.log('Тип геообъекта: %s', firstGeoObject.properties.get('metaDataProperty.GeocoderMetaData.kind'));
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
    });
    
}
</script>