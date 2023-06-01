<!-- содержимое -->
<div class="col py-3">

      <div class="row">
      

      <div class="col-lg-6">
      <div class="alert alert-light" role="alert">
  
      <?php
          echo 'Здравствуйте ' . $user['firstname_manager'] . ' ' . $user['lastname_manager'] . '<hr>';
          echo 'Ваш ID в системе: ' . $user['user_id'];
         
      ?>
      </div></div>

      <div class="col-lg-6">
      <div class="alert alert-light" role="alert">
  
      <?php
          echo 'Организация: ' . $user['organization'] . '<hr>';
          echo 'Дата регистрации: ' . $user['created_at'];
          
      ?>
      </div></div>

     

      <div class="col-lg-12">gdfgdg</div>

      </div>

</div>
       
