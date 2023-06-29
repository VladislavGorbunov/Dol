<div class="container">


    <div class="row">

        <div class="col-lg-8">
            <div class="row">
                <div class="col-lg-8 border">dfgdfgdf</div>
                <div class="col-lg-4 border">dfgdfg</div>
            </div>

        </div>

        <div class="col-lg-4">
            <div id="map" style="width: auto; height: 400px"></div>
        </div>

    </div>

    <?php
    

    //$coord = explode(',', $camp['coords']);
    echo '<pre>';
    var_dump($types);
    echo '</pre>';
    
    ?>




</div>














<script type="text/javascript">
ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map("map", {
            center: [ , ],
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


        .add(new ymaps.Placemark([ , ], {
            balloonContent: 'цвет <strong>воды пляжа бонди</strong>'
        }, {
            preset: 'islands#icon',
            iconColor: '#0095b6'
        }))







}
</script>