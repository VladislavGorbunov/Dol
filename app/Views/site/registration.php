<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Регистрация представителя лагеря</title>
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">

    <style>
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


    <section class="h-100 h-custom" style="background-color: #fefefe;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-8 col-xl-6">
                    <div class="card rounded-3">
                        <img src="/public/theme/img/header.jpg" height="300" class="h-80" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="">
                        <div class="card-body p-4 p-md-5">

                        
                        <?php
                        if (!empty($_SESSION['error'])) {
                            echo '<div class="alert alert-danger" role="alert">' .
                            $_SESSION['error'] .
                            '</div>';

                            unset($_SESSION['error']);
                        }
                        ?>
                        
                            <h3 class="mb-2 pb-2 pb-md-0 text-center">Регистрация представителя лагеря</h3>
                            <p class="text-center">Заполните анкету, после проверки мы активируем ваш личный кабинет и вы сможете добавить лагерь</p>
                            
                            <form class="px-md-2" action="" method="post">
                            <h4 class="text-center mt-4">Юридическая информация</h4>
                            
                                <label for="exampleDatepicker1" class="form-label">Город</label>
                                <select class="form-select" name="cities_id">
                                    <?php
                                        foreach ($cities as $city) {
                                            echo '<option value="'.$city['cities_id'].'">' . $city['title'] . '</option>';
                                        }
                                    ?>
                                </select>
                                    
                                <label for="exampleDatepicker1" class="form-label mt-3">Наименование организации. Например: ООО "Северная лагуна" или ИП Иванов Иван Иванович</label>
                                <input type="text" class="form-control" name="organization" required/>
                                        
                                <label for="exampleDatepicker1" class="form-label mt-3">ИНН</label>
                                <input type="text" class="form-control" name="inn" required/>

                                <label for="exampleDatepicker1" class="form-label mt-3">Ф.И.О. генерального директора, директора или ИП</label>
                                <input type="text" class="form-control" name="director" required/>

                                <label for="exampleDatepicker1" class="form-label mt-3">Номер телефона генерального директора, директора или ИП</label>
                                <input type="text" class="form-control" name="director_phone" required/>
                             

                            <h4 class="text-center mt-4">Сотрудник ответственный за работу с нами</h4>
                                <div class="row mt-4">
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline datepicker">
                                            <label for="exampleDatepicker1" class="form-label">Имя</label>
                                            <input type="text" class="form-control" name="firstname_manager" required/>
                                        </div>
                                    </div>

                                    <div class="col-md-6 mb-4">
                                        <label for="exampleDatepicker1" class="form-label">Фамилия</label>
                                        <input type="text" class="form-control" name="lastname_manager" required/>
                                    </div>
                                </div>

                               
                                    <div class="col-md-6 mb-4">
                                        <div class="form-outline datepicker">
                                            <label for="exampleDatepicker1" class="form-label">Должность</label>
                                            <input type="text" class="form-control" name="post" required/>
                                        </div>
                                    </div>
                                    
                                

                                <div class="mb-4">
                                    <label for="exampleDatepicker1" class="form-label">Номер мобильного телефона сотрудника для связи и решения вопросов. (Не публикуется на сайте)
                                    </label>
                                    <input type="tel" class="form-control" name="phone_manager" required/>
                               
                                    <label for="exampleDatepicker1" class="form-label mt-4">Email для связи, обмена документами и авторизации (Не публикуется на сайте)</label>
                                    <input type="tel" class="form-control" name="email_manager" required/>
                         
                                    <label for="exampleDatepicker1" class="form-label mt-4">Пароль</label>
                                    <input type="password" class="form-control" name="password" required/>

                                    <label for="exampleDatepicker1" class="form-label mt-4">Повторите пароль</label>
                                    <input type="password" class="form-control" name="repeat_password" required/>
                                </div>

                        

                                <button type="submit" class="btn btn-success btn-md mb-1">Зарегистрироваться</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>