<div class="container">
    <?= '<h2 class="text-center">'.$camp['title'].'</h2>'?>

    <?php
    echo  $camp['coords'];

    $coord = explode(',', $camp['coords']);

    var_dump($coord);
    ?>

    <div id="map" style="width: 600px; height: 400px"></div>

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
</div>