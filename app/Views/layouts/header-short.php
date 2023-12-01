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
    <!-- <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
         <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
         <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
         <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
         <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">-->
    <link rel="icon" href="/public/favicon.ico">
    <!-- Custom styles for this template -->
    <link href="/public/css/main.css" rel="stylesheet">
</head>

<body>
    <header>
        <?= $this->include('layouts/top-menu') ?>
        <nav class="navbar navbar-expand-lg py-3">
            <div class="container">
                <a class="navbar-brand" href="/">
                    <img src="/public/theme/img/logo.png" width="200" alt="ПоЛагерям">
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <ul class="navbar-nav me-auto mb-2 mb-md-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/about">О проекте</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Наши контакты</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/partners">Детским лагерям</a>
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
                            + Добавить лагерь
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <div class="header-image-short d-flex align-items-center justify-content-center">
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

            <div class="box-shadow col-lg-12 d-block mx-auto mt-2">
                <div class="filter-block col-lg-12">
                    <form method="post">
                        <div class="row">
                            <div class="col-lg g-1">
                                <?php 
                           $uri = explode('/', $_SERVER['REQUEST_URI']); 
                           $region_select = $uri[2];
                           $type_select = $uri[3];
                           $season_select = (!empty($uri[4])) ? $uri[4] : null;
                           $age_select = (!empty($uri[5])) ? preg_replace('/\D+/' ,'' , $uri[5]) : null;
                           $maxPrice_select = (!empty($uri[6])) ? preg_replace('/\D+/', '', $uri[6]) : null;
                           ?>
                           <label class="form-label"><small>Регион поиска:</small></label>
                                <select id="region" class="form-select form-select-lg mt-0" name="region">
                                    <option disabled value="">Выберите регион</option>
                                    <?php 
                                        foreach ($cities as $key => $value) {
                                            if ($region_select == $value['slug']) {
                                                echo '<option selected value="'. $value['slug'] .'">' . $value['title'] . '</option>';
                                            } else {
                                                echo '<option value="'. $value['slug'] .'">' . $value['title'] . '</option>';
                                            }
                                        }
                                    ?>
                                </select>
                                <div id="region_msg"></div>
                            </div>
                            <div class="col-lg g-1">
                            <label class="form-label"><small>Тематика лагеря:</small></label>
                                <select id="type" class="form-select form-select-lg mt-0" name="type">
                                    <option value="type-all">Любой тип лагеря</option>
                                    <?php 
                                        foreach ($types as $key => $type) {
                                            if ($type_select == $type['slug']) {
                                                echo '<option selected value="'. $type['slug'] .'">' . $type['title'] . '</option>';
                                            } else {
                                                echo '<option value="'. $type['slug'] .'">' . $type['title'] . '</option>';
                                            }
                                        }
                                    ?>
                                </select>
                            </div>
                            <div class="col-lg g-1">
                            <label class="form-label"><small>Сезон смен:</small></label>
                                <select id="season" class="form-select form-select-lg mt-0" name="season">
                                    <option selected value="season-all">Любой сезон</option>
                                    <?php 
                                        foreach ($seasons as $key => $season) {
                                            if ($season_select == $season['slug']) {
                                                echo '<option selected value="'. $season['slug'] .'">' . $season['title'] . '</option>';
                                            } else {
                                                echo '<option value="'. $season['slug'] .'">' . $season['title'] . '</option>';
                                            }
                                        }
                                    ?>
                                </select>
                            </div>
                            <div class="col-lg g-1">
                            <label class="form-label"><small>Возраст ребёнка:</small></label>
                                <select id="age" class="form-select form-select-lg mt-0" name="age">
                                    <option selected value="age-all">Любой возраст</option>

                              <?php 
                              for ($age = 3; $age < 20; $age++) {
                                  if ($age == $age_select) {
                                      echo '<option selected value="'. $age .'">' . $age . ' лет</option>';
                                  } else {
                                      echo '<option value="'. $age .'">' . $age . ' лет</option>';
                                  }
                              }
                              ?>


                                </select>
                            </div>

                            <div class="col-lg g-1">
                            <label class="form-label"><small>Максимальная стоимость:</small></label>
                                <select id="max_price" class="form-select form-select-lg mt-0" name="max-price">
                                    <option selected value="">Любая цена</option>

                              <?php 
                              for ($maxPrice = 30000; $maxPrice <= 100000; $maxPrice = $maxPrice + 10000) {
                                  if ($maxPrice == $maxPrice_select) {
                                      echo '<option selected value="'. $maxPrice .'">до ' . $maxPrice . ' руб.</option>';
                                  } else {
                                      echo '<option value="'. $maxPrice .'">до ' . $maxPrice . ' руб.</option>';
                                  }
                              }
                              ?>

                                </select>
                            </div>


                            <div class="col-lg-auto g-1">
                                <div id="search" class="btn btn-primary btn-lg col-lg-12 d-block mx-auto"><i
                                        class="las la-rocket"></i> Найти лагеря</div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>


    <script src="/public/js/navBarTopShort.js"></script>