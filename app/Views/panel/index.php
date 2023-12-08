<div class="col py-3">

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

        <div class="col-lg-6">
            <div class="alert alert-light" role="alert">
                Здравствуйте <b><?= $user['firstname_manager'] . ' ' . $user['lastname_manager'] ?></b><hr>
                Ваш ID в системе: <?= $user['user_id'] ?><hr>
                <div class="row">
                    <div class="col">Статус премиум: <?= $premium = ($user['premium'] == 1) ? 'Активен' : 'Неактивен' ?></div>
                    <div class="col"><?= $premium = ($user['premium'] == 1) ? '' : '<a href="">Подключить премиум</a>' ?></div>
                </div>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="alert alert-light" role="alert">
                Организация: <b><?= $user['organization'] ?></b><hr>
                Дата регистрации: <?= $user['created_at'] ?></b><hr>
                <a href="/panel/user-edit" >Изменить данные организатора</a>
            </div>
        </div>

        <div class="col-lg-12">
            <h3 class="mb-3 mt-3">Мои лагеря</h3>
            <div class="row">
            <?php
            
                if (!empty($camps)) :
                    foreach ($camps as $camp) : ?> 
                        
                        <div class="col-lg-4 mb-4">
                        <div class="card">

                        <?php 
                            if ($camp['cover']['name_img']) {
                                echo '<img src="/public/images/camps/'. $camp['slug'] . '/cover/' .$camp['cover']['name_img'].'" class="rounded img-fluid">';
                            }
                        ?>
                        
                        <div class="card-body">
                            <h4><?= $camp['title'] ?></h4>
                            <p style="min-height: 50px"><?= $camp['adress'] ?></p>
                        <hr>
                        <a href="/camp/<?= $camp['slug'] ?>" class="m-1" target="_blank">Посмотреть страницу лагеря</a><hr>
                        <a href="/panel/camp/<?= $camp['camps_id'] ?>/add-shift" class="m-1">Добавить смену</a>
                        <a href="/panel/camp/<?= $camp['camps_id'] ?>/shifts" class="m-1">Посмотреть все смены</a>
                        <hr>
                        <a href="/panel/edit-camp/<?= $camp['camps_id'] ?>" class="m-1">Редактировать лагерь</a><hr>
                        <a href="/panel/camp/<?= $camp['camps_id'] ?>/delete" class="m-1">Удалить лагерь</a>
                      
                        </div>
                        </div>
                        </div>
                    <?php endforeach ?>
                <?php else :
                    echo 'Добавьте первый лагерь';
                endif ?>
            </div>
        </div>

    </div>

</div>