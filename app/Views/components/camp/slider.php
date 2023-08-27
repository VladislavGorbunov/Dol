<div class="bg-white rounded p-3">

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">

    <div class="carousel-item active" data-bs-interval="2500">
      <?= '<img src="'.$cover.'" class="camp-photos d-block w-100" width="100%" height="450px">' ?>
    </div>
   
    
    <?php
        for ($i = 0; $i < count($images); $i++) {
            echo '<div class="carousel-item" data-bs-interval="2500"><img src="'.$images[$i].'" class="img-fluid camp-photos"></div>';
        }
    ?>

  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Предыдущий</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"  data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Следующий</span>
  </button>
</div>

</div>