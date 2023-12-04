<div class="container">

    <?php if(session()->getFlashdata('msg-error')):?>
    <div class="alert alert-warning text-center">
        <?= session()->getFlashdata('msg-error') ?>
    </div>
    <?php endif;?>

    <?php if(session()->getFlashdata('msg-success')):?>
    <div class="alert alert-success text-center">
        <?= session()->getFlashdata('msg-success') ?>
    </div>
    <?php endif;?>


    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
        <ol class="breadcrumb">
           <li class="breadcrumb-item"><a href="/">Главная</a></li>
           <li class="breadcrumb-item" aria-current="page"><a href="/camps/<?= $region['slug'] ?>/type-all/season-all">Лагеря <?= $region['title_in']?></a></li>
           <li class="breadcrumb-item active" aria-current="page"><b><?= $camp['title'] ?></b></li>
        </ol>
    </nav>
    
    <div class="row">
        <!-- left block -->
        <div class="col-lg-8">
            <?= $this->include('components/camp/slider') ?>
            <?= $this->include('components/camp/content-camp') ?>
        </div>

        <!-- right-block -->
        <div class="col-lg-4">
            <?= $this->include('components/camp/right-block-camp') ?>
        </div>

        <!-- reviews-block -->
        <div class="col-lg-12">
            <?php if (!empty($reviews_data)) echo $this->include('components/camp/reviews') ?>
        </div>

        <!-- reviews-form-block -->
        <div class="col-lg-12">
            <?= $this->include('components/camp/reviews-form') ?>
        </div>


    </div> <!-- end row -->
            
</div>

<script rel="preload" src="https://api-maps.yandex.ru/2.1/?apikey=60ad5e6e-89aa-490d-a9b3-4c7f3e35165a&lang=ru_RU"
    type="text/javascript"></script>

<?php $coord = explode(',', $camp['coords']); ?>

<script type="text/javascript">
ymaps.ready(init);

function init() {
    var myMap = new ymaps.Map("map", {
            center: [<?= $coord[0] ?>, <?= $coord[1] ?>],
            zoom: 12,
            behaviors: ["drag", "dblClickZoom", "rightMouseButtonMagnifier", "multiTouch"]
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