<!-- содержимое -->
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

                <?php
          echo 'Здравствуйте ' . $user['firstname_manager'] . ' ' . $user['lastname_manager'] . '<hr>';
          echo 'Ваш ID в системе: ' . $user['user_id'];
         
      ?>
            </div>
        </div>

        <div class="col-lg-6">
            <div class="alert alert-light" role="alert">

                <?php
          echo 'Организация: ' . $user['organization'] . '<hr>';
          echo 'Дата регистрации: ' . $user['created_at'];
          
      ?>
            </div>
        </div>



        <div class="col-lg-12">
            <h3 class="mb-3 mt-3">Мои лагеря</h3>
            <div class="row">
            <?php
                if (!empty($camps)) {
                    foreach ($camps as $camp) {
                        echo '
                        <div class="col-lg-4">
                        <div class="card">';

                        echo '<div class="card-body">
                        <h4>'.$camp['title'].'</h4>
                        <p>'.$camp['adress'].'</p>
                       
                        
                        <hr>
                        <a href="" class="m-1">Посмотреть страницу лагеря</a><hr>
                        <a href="/panel/camp/'.$camp['camps_id'].'/add-shift" class="m-1">Добавить смену</a>
                        <a href="/panel/camp/'.$camp['camps_id'].'/add-shift" class="m-1">Посмотреть все смены</a>
                        <hr>
                        <a href="" class="m-1">Редактировать лагерь</a><hr>
                        <a href="/panel/camp/'.$camp['camps_id'].'/delete" class="m-1">Удалить лагерь</a>
                      
                        </div>
                        </div>
                        </div>';
                    }
                } else {
                    echo 'Добавьте первый лагерь';
                }
            ?>
            </div>
        </div>

    </div>

</div>