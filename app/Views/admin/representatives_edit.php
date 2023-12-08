<!-- содержимое -->
<div class="col p-5">


    <form action="" method="post"> 

    <div class="row">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">ID</label>
            <input type="text" class="form-control" name="user_id" value="<?= $info[0]['user_id'] ?>" readonly>
        </div>

        <div class="col-lg-4">
            <div class="mb-3">
                <label for="exampleInputEmail1" class="form-label">Город</label>
                <input type="text" class="form-control" value="<?= $city[0]['title'] ?>" readonly>
            </div>
        
        <div class="mb-3">       
            <input type="text" class="form-control" name="cities_id" value="<?= $city[0]['cities_id'] ?>" readonly hidden>
        </div>

        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Директор</label>
            <input type="text" class="form-control" name="director" value="<?= $info[0]['director'] ?>">
        </div>
                
     </div>

<div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Организация</label>
                    <input type="text" class="form-control" name="organization" value="<?= $info[0]['organization'] ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Телефон директора</label>
                    <input type="text" class="form-control" name="director_phone" value="<?= $info[0]['director_phone'] ?>">
                </div>
            
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">ИНН</label>
                    <input type="text" class="form-control" name="inn" value="<?= $info[0]['inn'] ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Имя представителя</label>
                    <input type="text" class="form-control" name="firstname_manager" value="<?= $info[0]['firstname_manager'] ?>">
                </div>
                
            </div>


            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Фамилия представителя</label>
                    <input type="text" class="form-control" name="lastname_manager" value="<?= $info[0]['lastname_manager'] ?>">
                    
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Телефон представителя</label>
                    <input type="phone" class="form-control" name="phone_manager" value="<?= $info[0]['phone_manager'] ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Активация</label>
                    <select class="form-select form-select-md mb-3" name="activated">
                        <?php
                            if ($info[0]['activated'] == 0) {
                                echo '<option selected value="' . $info[0]['activated'] . '">Неактивный</option>';
                                echo '<option value="1">Активный</option>';
                            } else {
                                echo '<option value="' . $info[0]['activated'] . '">Активный</option>';
                                echo '<option value="0">Неактивный</option>';
                            }
                        ?>
                    </select>
                </div>
                
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Должность представителя</label>
                    <input type="text" class="form-control" name="post" value="<?= $info[0]['post'] ?>">
                </div>

                <?= date('Y-m-d') ?>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Премиум статус</label>
                    <select class="form-select form-select-md mb-3" name="premium">
                        <?php
                            if ($info[0]['premium'] == 0) {
                                echo '<option selected value="' . $info[0]['premium'] . '">Неактивный</option>';
                                echo '<option value="1">Активный</option>';
                            } else {
                                echo '<option value="' . $info[0]['premium'] . '">Активный</option>';
                                echo '<option value="0">Неактивный</option>';
                            }
                        ?>
                    </select>
                </div>
                
                
            </div>

            <div class="col-lg-4">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">Email представителя</label>
                    <input type="email" class="form-control" name="email_manager" value="<?= $info[0]['email_manager'] ?>">
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Дата регистрации (г.м.ч время)</label>
                    <input type="text" class="form-control" value="<?= $info[0]['created_at'] ?>" readonly>
                </div>
                
            </div>


        </div>
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>





</div>