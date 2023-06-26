<!-- содержимое -->
<div class="col py-3">

    <?php if(session()->getFlashdata('msg')):?>
    <div class="alert alert-warning">
        <?= session()->getFlashdata('msg') ?>
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
<?php
            foreach ($camps as $camp) {
            echo '
            <div class="col-lg-4">
            <div class="card shadow-sm">';

            echo '<div class="card-body">
                <h4>'.$camp['title'].'</h4>
                <p>'.$camp['adress'].'</p>
                    <div class="d-flex justify-content-between align-items-center">
                        
                        <div class="btn-group" role="group" aria-label="Basic outlined example">
                        
                      
                        </div>
                        <small class="text-muted">9 mins</small>
                    </div>
                </div>
            </div>
            </div>';
        }
?>
        </div>

    </div>

</div>