<div class="col py-3">

<div class="col-lg-6 border d-block mx-auto mt-3 p-4 rounded">
<h4 class="text-center mb-4">Добавление нового тарифа</h4>
<form action="" method="POST">
<div class="mb-3">
  <label class="form-label">Название тарифа</label>
  <input type="text" class="form-control" name="name" placeholder="Название тарифа" required>
</div>

<div class="mb-3">
  <label class="form-label">Стоимость</label>
  <input type="number" class="form-control" name="price" placeholder="Стоимость" required>
</div>

<div class="mb-3">
  <label class="form-label">Комментарий</label>
  <textarea class="form-control" name="comment" rows="3"></textarea>
</div>

<?php 
if (session()->getFlashdata("message")) : ?>
<div class="alert alert-success" role="alert">
    <?php
        echo session()->getFlashdata("message") 
    ?> 
</div>

<?php endif ?>

<div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3">Добавить</button>
</div>
</form>

</div>

</div>