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
                            + Добавить лагерь
                        </a>
                    </div>
                </div>
            </div>
        </nav>
    </header>
    <div class="header-no-filter d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="row">
                <h1 class="header-h1"><?= $title ?></h1>
                
            </div>

            
        </div>
    </div>



    <script src="/public/js/navBarTopShort.js"></script>