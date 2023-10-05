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

    <div class="col-lg-4">
        <h5>Название смены: <?= $shift['title'] ?></h5>
        <p class="mt-3">Лагерь: <?= $shift['camp']['title'] ?></p>
        <p>Стоимость путёвки: <?= $shift['price'] ?> руб.</p>
        <p>Дата начала смены: <?= $shift['start_date'] ?></p>
        <p>Дата окончания смены: <?= $shift['end_date'] ?></p>
        <a href="/panel/shift/delete/<?= $shift['id'] ?>">Удалить</a>
    </div>

<?php endforeach ?>
<?php else : echo 'Смены не найдены.' ?>
<?php endif ?>