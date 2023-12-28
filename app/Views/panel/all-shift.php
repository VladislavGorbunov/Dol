<?php if(session()->getFlashdata('msg-error')):?>
    <div class="alert alert-warning">
        <?= session()->getFlashdata('msg-error') ?>
    </div>
    <?php endif;?>

    <?php if(session()->getFlashdata('msg-success')):?>
    <div class="alert alert-success">
        <?= session()->getFlashdata('msg-success') ?>
    </div>
    <?php endif;?>

<div class="row">
<?php

if (!empty($shifts)) :
    foreach ($shifts as $shift) : ?>

    <div class="col-lg-4 p-3">
        <div class="border rounded p-3">
        <h5>Название: <?= $shift['title'] ?></h5><hr>
        <p class="mt-3">Лагерь: <?= $shift['camp']['title'] ?></p><hr>
        <p>Стоимость путёвки: <?= $shift['price'] ?> руб.</p><hr>
        <p>Дата начала смены: <?= $shift['start_date'] ?></p><hr>
        <p>Дата окончания смены: <?= $shift['end_date'] ?></p><hr>
        <a href="/panel/shift/delete/<?= $shift['id'] ?>" class="btn btn-danger">Удалить смену</a>
        </div>
    </div>

<?php endforeach ?>
<?php else : echo 'Смены не найдены.' ?>
<?php endif ?>