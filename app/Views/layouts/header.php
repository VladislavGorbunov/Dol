<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
    <meta name="theme-color" content="#fff">
    <title><?php echo (!empty($title)) ? $title : 'Тег title отсутствует' ?></title>
    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Line Awesome icons -->
    <link rel="stylesheet" href="/public/line-awesome/1.3.0/css/line-awesome.min.css">


    <!-- Favicons -->
    <!-- <link rel="apple-touch-icon" href="/public/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3"> -->
    <link rel="icon" href="/public/favicon.ico">

    <!-- Custom styles for this template -->
    <link href="/public/css/main.css" rel="stylesheet">
</head>

<body>

    <header>

        <div class="top-nav d-lg-block d-none">
            <div class="container">

                <div class="d-flex">
                    <div class="p-1 flex-grow-1 d-flex flex-wrap">
                        <a href="" class="nav-link mx-2">О сервисе</a>
                        <a href="" class="nav-link mx-2">Информация для родителей</a>
                        <a href="" class="nav-link mx-2">Партнёрам</a>
                        <a href="" class="nav-link mx-2">Вакансии</a>
                        <a href="" class="nav-link mx-2">Помощь</a>
                    </div>

                    <div class="p-1">bycamps@yandex.ru</div>
                    <div class="p-1">
                        <img src="/public/theme/img/vk_logo.png" width="18px" height="18px" class="mx-2" style="position:relative;top:0px;">

                    </div>
                </div>


            </div>
        </div>

        <nav class="navbar navbar-expand-lg py-3">

            <div class="container">

                <a class="navbar-brand" href="/">
                    <img src="/public/theme/img/logo.png" width="200px">
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarCollapse">

                    <ul class="navbar-nav me-auto mb-2 mb-md-0">

                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">О проекте</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="#">Наши контакты</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link">Сотрудничество</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link">Отзывы</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link">Оплата</a>
                        </li>

                    </ul>


                    <div class="d-flex justify-content-center">
                        <a href="/login" class="btn btn-auth m-1" target="_blank"><i class="las la-user"></i> Войти</a>
                        <a class="btn btn-reg m-1" href="/registration">
                            <div class="marker"></div>Добавить лагерь
                        </a>
                    </div>


                </div>
            </div>
        </nav>


    </header>



    <div class="header-image d-flex align-items-center justify-content-center">
        <div class="container">

            <div class="row">
                <h1 class="header-h1"><?= $title ?></h1>
                <div class="col-lg-9 d-block mx-auto">
                    <p class="text-center text-light header-descript">Наш сервис создан для быстрого и удобного поиска
                        детских
                        оздоровительных лагерей по всей России!
                        Планируете отправить ребёнка на отдых? Мы поможем найти самый подходящий для вас вариант.
                    </p>
                </div>
            </div>

            <div class="filter-block col-lg-11 d-block mx-auto mt-2">

                <form method="post">
                    <div class="row">
                        <div class="col-lg g-1">

                            <select id="region" class="form-select form-select-lg mt-0" name="region">

                                <option selected disabled value="">Выберите регион</option>
                                <?php 

                                    foreach ($cities as $key => $value) {

                                        echo '<option value="'. $value['slug'] .'">' . $value['title'] . '</option>';
                                    }
                                ?>
                            </select>
                            <div id="region_msg"></div>
                        </div>

                        <div class="col-lg g-1">

                            <select id="type" class="form-select form-select-lg mt-0" name="type">
                                <option selected value="type-all">Любой тип лагеря</option>
                                <?php 
                                    foreach ($types as $key => $type) {
                                        echo '<option value="'. $type['slug'] .'">' . $type['title'] . '</option>';
                                    }
                                ?>
                            </select>
                        </div>

                        <div class="col-lg g-1">

                            <select id="season" class="form-select form-select-lg mt-0" name="season">
                                <option selected value="season-all">Любой сезон</option>
                                <?php 
                                    foreach ($seasons as $key => $season) {
                                        echo '<option value="'. $season['slug'] .'">' . $season['title'] . '</option>';
                                    }
                                ?>
                            </select>
                        </div>

                        <div class="col-lg g-1">

                            <select id="age" class="form-select form-select-lg mt-0" name="age">
                                <option selected disabled value="">Любой возраст</option>
                                <option value="3">3 года</option>
                                <option value="4">4 года</option>
                                <option value="5">5 лет</option>
                                <option value="6">6 лет</option>
                                <option value="7">7 лет</option>
                                <option value="8">8 лет</option>
                                <option value="9">9 лет</option>
                                <option value="10">10 лет</option>
                                <option value="11">11 лет</option>
                                <option value="12">12 лет</option>
                                <option value="13">13 лет</option>
                                <option value="14">14 лет</option>
                                <option value="15">15 лет</option>
                                <option value="16">16 лет</option>
                                <option value="17">17 лет</option>
                                <option value="18">18 лет</option>
                                <option value="19">19 лет</option>
                                <option value="20">20 лет</option>
                            </select>
                        </div>



                        <div class="col-lg-auto g-1">
                            <div id="search" class="btn btn-primary btn-lg col-lg-12 d-block mx-auto"><i class="las la-rocket"></i> Найти лагеря</div>
                        </div>

                    </div>
                </form>

            </div>
        </div>

    </div>

