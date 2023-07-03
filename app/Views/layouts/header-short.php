<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="theme-color" content="#2955c8">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
    <title><?php echo (!empty($title)) ? $title : 'Тег title отсутствует' ?></title>
    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://api-maps.yandex.ru/2.1/?apikey=60ad5e6e-89aa-490d-a9b3-4c7f3e35165a&lang=ru_RU"
        type="text/javascript"></script>
    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">

    <!-- Custom styles for this template -->
    <link href="/public/css/main.css" rel="stylesheet">
</head>

<body>

    <header>
        <nav class="navbar navbar-expand-lg py-3">

            <div class="container py-2">
                <a class="navbar-brand" href="/">
                    <img src="/public/theme/img/logo.png" width="80%">
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
                            <a class="nav-link" href="#">Контакты</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link">Сотрудничество</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link">Топ-50 лагерей России <span class="badge">NEW</span></a>
                        </li>

                    </ul>

                    

                    <div class="d-flex justify-content-center">
                    <img src="/public/theme/img/vk_logo.png" width="32px" height="32px" class="mx-3" style="position:relative;top:10px;">

                    <a href="/login" class="btn btn-auth m-1"><svg xmlns="http://www.w3.org/2000/svg" width="18"
                                height="18" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 18 18">
                                <path fill-rule="evenodd"
                                    d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
                                <path fill-rule="evenodd"
                                    d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                            </svg> Войти</a>



                        <a class="btn btn-reg m-1" href="/registration">Добавить лагерь</a>
                    </div>

                </div>
        </nav>
    </header>

<div class="header-short-bg">
<div class="container mt-2">
    <div class="header-image-short d-flex align-items-center justify-content-center">
        
            <div class="row">
                <?php
                if (!empty($title)) {
                    echo '<h1 class="header-short-h1">'.$title.'</h1>';
                } else {
                    echo '<h1 class="header-h1">Поиск детских оздоровительных лагерей России</h1>';
                }

                ?>
                
            </div>



    </div>
    </div>
            </div>

    <script>
    // редирект
    //window.location.href = "/";

    const region_msg = document.getElementById("region_msg");
    let region = document.getElementById("region");
    let season = document.getElementById("season");
    let type = document.getElementById("type");
    let age = document.getElementById("age");

    const search_btn = document.getElementById("search");

    let filter_url;


    addEventListener("change", () => {
        url = '/camps';

        if (region.value) {
            url += '/' + region.value;
            region_msg.innerHTML = '';
            region.style.border = 'none';
        } else {
            url += '/russia';
        }

        if (type.value) {
            url += '/' + type.value;
            document.title += type.selectedOptions[0].text;
        } else {
            url += '/type-all';
        }

        if (age.value) {
            url += '/' + age.value;
            document.title += age.selectedOptions[0].text;
        } else {
            url += '';
        }

        console.log(url);

    });



    search_btn.addEventListener('click', () => {
        if (!region.value) {
            //alert('Выберите регион');
            region_msg.innerHTML = 'Выберите регион поиска';
            region.style.border = '1px solid #ff4444';
        } else {
            window.location.href = url;
        }

    });
    </script>