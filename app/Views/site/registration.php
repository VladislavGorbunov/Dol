<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Регистрация представителя лагеря</title>
    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">

    <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap');
    
    body {
        font-family: 'Roboto', sans-serif;
        font-size: 15px;
        background-color: #223
    }

    .card-registration .select-input.form-control[readonly]:not([disabled]) {
        font-size: 1rem;
        line-height: 2.15;
        padding-left: .75em;
        padding-right: .75em;
    }

    .card-registration .select-arrow {
        top: 13px;
    }
    </style>

</head>

<body>

    <div class="container py-5 h-100">
        <div class="col-lg-12 col-xl-12">
            <div class="card rounded-3">
                <div class="card-body p-4 p-md-5">
                    
                    <?php
                        if (!empty($_SESSION['error'])) {
                            echo '<div class="alert alert-danger" role="alert">' .$_SESSION['error'] .'</div>';
                            unset($_SESSION['error']);
                        }
                    ?>
                    <a href="/"><img src="/public/theme/img/logo.png" class="d-block mx-auto mb-4"></a>
                    <h3 class="mb-2 pb-2 pb-md-0 text-center">Регистрация представителя лагеря</h3>
                    <p class="text-center">Заполните анкету, после проверки мы активируем ваш личный кабинет и вы сможете добавить лагерь.</p>
                            
                        <form class="px-md-2" action="" method="post">
                            <div class="row">

                                <div class="col-lg-6">
                                    <h4 class="text-center mt-4">Юридическая информация</h4>
                                    <label for="exampleDatepicker1" class="form-label">Город</label>
                                    <select class="form-select" name="cities_id">
                                    <?php
                                        foreach ($cities as $city) {
                                            echo '<option value="'.$city['cities_id'].'">' . $city['title'] . '</option>';
                                        }
                                    ?>
                                    </select>
                                    
                                    <label for="exampleDatepicker1" class="form-label mt-3">Организации. Например: ООО "Северная лагуна" или ИП Иванов Иван Иванович</label>
                                    <input type="text" class="form-control" name="organization" required/>
                                        
                                    <label for="exampleDatepicker1" class="form-label mt-3">ИНН</label>
                                    <input type="text" class="form-control" name="inn" required/>

                                    <label for="exampleDatepicker1" class="form-label mt-3">Ф.И.О. генерального директора, директора или ИП</label>
                                    <input type="text" class="form-control" name="director" required/>

                                    <label for="exampleDatepicker1" class="form-label mt-3">Номер телефона генерального директора, директора или ИП</label>
                                    <input type="text" class="form-control" name="director_phone" required/>

                                    <?php if ($plan) : ?>
                                        <input type="text" class="form-control" name="plan" value="<?= $plan ?>" hidden>
                                    <? endif ?>
                                </div>

                                <div class="col-lg-6">
                                    <h4 class="text-center mt-4">Сотрудник ответственный за работу с нами</h4>

                                    <div class="col-12 mb-4">
                                        <div class="form-outline datepicker">
                                            <label for="exampleDatepicker1" class="form-label">Имя</label>
                                            <input type="text" class="form-control" name="firstname_manager" required/>
                                        </div>
                                    </div>

                                    <div class="col-12 mb-4">
                                        <label for="exampleDatepicker1" class="form-label">Фамилия</label>
                                        <input type="text" class="form-control" name="lastname_manager" required/>
                                    </div>
                                
                                    <div class="col-12 mb-4">
                                        <label for="exampleDatepicker1" class="form-label">Должность</label>
                                        <input type="text" class="form-control" name="post" required/>
                                    </div>
                                    
                                
                                <div class="mb-4">
                                    <label for="exampleDatepicker1" class="form-label">Номер мобильного телефона сотрудника. (Не публикуется)</label>
                                    <input type="tel" class="form-control" name="phone_manager" required/>
                               
                                    <label for="exampleDatepicker1" class="form-label mt-4">Email для связи, обмена документами и авторизации (Не публикуется)</label>
                                    <input type="tel" class="form-control" name="email_manager" required/>
                         
                                    <label class="form-label mt-4">Пароль</label>
                                    <input id="password"  type="password" class="form-control" name="password" required/>

                                    <label class="form-label mt-4">Повторите пароль</label>
                                    <input id="password-repeat" type="password" class="form-control" name="repeat_password" required/>
                                    <div class="mt-2"><span id="msg-password" style="color:red"></span></div>
                                </div>

                            </div> <!-- row -->
                    </div>

                                <button type="submit" id="btn-reg" class="btn btn-success btn-lg mb-1 d-block mx-auto disabled">Зарегистрироваться</button>

                            </form>

            </div>
    </div>


<script>

    let password = document.getElementById('password');
    let password_repeat = document.getElementById('password-repeat');
    let button_reg = document.getElementById('btn-reg');
    let msg = document.getElementById('msg-password');

    password_repeat.addEventListener('blur', () => {
        if (password.value == password_repeat.value) {
            button_reg.classList.remove('disabled');
            msg.innerHTML = '';
        } else {
            button_reg.classList.add('disabled');
            msg.innerHTML = 'Пароли не совпадают!';
        }
    });

        password.addEventListener('blur', () => {
            if (password_repeat.value) { 
                if (password.value == password_repeat.value) {
                    button_reg.classList.remove('disabled');
                    msg.innerHTML = '';
                } else {
                    button_reg.classList.add('disabled');
                    msg.innerHTML = 'Пароли не совпадают!';
                }
            }
    });


    console.log(password);
</script>


</body>
</html>