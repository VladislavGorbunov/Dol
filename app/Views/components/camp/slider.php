<div class="bg-white rounded p-3">

<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">

    <?php
        for ($i = 0; $i < count($images); $i++) {
          if ($i == 1) {
            echo '<div class="carousel-item active" data-bs-interval="2000"><img src="'.$images[$i].'" class="img-fluid camp-photos"></div>';
          } else {
            echo '<div class="carousel-item" data-bs-interval="2000"><img src="'.$images[$i].'" class="img-fluid camp-photos"></div>';
          }
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