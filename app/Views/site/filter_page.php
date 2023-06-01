<div class="container">
<div class="row">

<div class="col-lg-3 border">sfsdfsdf</div>

 <div class="col-lg-9">   <div class="row">
<?php 

foreach ($camps as $camp) {
    echo '
    <div class="col-lg-12">
    <div class="card">
    <img src="..." class="card-img-top" alt="...">
    <div class="card-body">
    <h5 class="card-title">'. $camp['camp'] .'</h5>
    <p class="card-text">Небольшой пример текста, который должен основываться на названии карты и составлять основную часть содержимого карты.</p>
  </div>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">Элемент</li>
    <li class="list-group-item">Второй элемент</li>
    <li class="list-group-item">Возраст от '. $camp['min_age'] . ' до ' .$camp['max_age']. ' лет</li>
  </ul>
  <div class="card-body">
    <a href="#" class="card-link">Ссылка карточки</a>
    <a href="#" class="card-link">Другая ссылка</a>
  </div>
</div></div>';
}




?>
</div>
</div>
</div>
</div>