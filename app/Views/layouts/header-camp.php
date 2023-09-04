<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <title><?= $title ?></title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="<?= $description ?>">
    <meta name="theme-color" content="#fff">
    
    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Line Awesome icons -->
    <link rel="stylesheet" href="/public/line-awesome/1.3.0/css/line-awesome.min.css">
    
    
    <!-- Favicons -->
    <!-- <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
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

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
                    aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
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
                        <a href="/login" class="btn btn-auth m-1"><i class="las la-user"></i> Войти</a>
                        <a class="btn btn-reg m-1" href="/registration"><i class="las la-plus-circle"></i> Добавить лагерь</a>
                    </div> 


                </div>
            </div>
        </nav>
       
        
    </header>

    
    <div class="header-image-camp d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="col-lg-8 d-block mx-auto">
                <h1 class="header-h1"><?= $title ?></h1>
            </div>
        </div>
    </div>

</div>


    