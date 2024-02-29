<div class="col mt-4 mb-5">
<?php

// var_dump($camp);
// echo '<br>';
// var_dump($representative);
?>

<form>
<div class="row">
  <div class="col-lg-6 mb-3">
    <label for="exampleInputEmail1" class="form-label">Название</label>
    <input type="text" class="form-control" value="<?= $camp['title'] ?>">
  </div>

  <div class="col-lg-6 mb-3">
    <label for="exampleInputPassword1" class="form-label">База лагеря</label>
    <input type="text" class="form-control" value="<?= $camp['camp_base'] ?>">
  </div>

  <div class="col-lg-6 mb-3">
    <label for="exampleInputPassword1" class="form-label">Slug</label>
    <input type="text" class="form-control" value="<?= $camp['slug'] ?>">
  </div>

  <div class="col-lg-6 mb-3">
    <label for="exampleInputPassword1" class="form-label">Адрес</label>
    <input type="text" class="form-control" value="<?= $camp['adress'] ?>">
  </div>

  <div class="col-lg-12 mb-3">
    <label for="exampleInputPassword1" class="form-label">Описание</label>
    <textarea class="form-control" rows="5"><?= $camp['description'] ?></textarea>
  </div>

  <div class="col-lg-12 mb-3">
    <label for="exampleInputPassword1" class="form-label">Размещение</label>
    <textarea class="form-control" rows="5"><?= $camp['placement'] ?></textarea>
  </div>

  <div class="col-lg-12 mb-3">
    <label for="exampleInputPassword1" class="form-label">Распорядок дня</label>
    <textarea class="form-control" rows="5"><?= $camp['daily_schedule'] ?></textarea>
  </div>

  <div>
    <div class="row">
      <div class="col-lg-6 mb-3">
        <label for="exampleInputPassword1" class="form-label">Юр. лицо</label>
        <input type="text" class="form-control" value="<?= $representative['organization'] ?>">
        <div class="form-text"><a href="">Смотреть данные юр. лица</a></div>
      </div>

      <div class="col-lg-6 mb-3">
        <label for="exampleInputPassword1" class="form-label">ИНН</label>
        <input type="text" class="form-control" value="<?= $representative['inn'] ?>">
      </div>
    </div>
  </div>

  
</div>
  <button type="submit" class="btn btn-primary">Сохранить</button>
</form>

<div>