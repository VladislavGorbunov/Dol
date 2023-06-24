<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
    <meta name="theme-color" content="#2955c8">
    <title>Слайдер | Carousel Template for Bootstrap · Версия v5.3.0-alpha1</title>
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

                        <button type="button" class="btn btn-auth m-1" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop">Войти</button>



                        <a class="btn btn-reg m-1" href="/registration">Добавить лагерь</a>
                    </div>

                    <!-- Модальное окно -->
                    <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false"
                        tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <div class="modal-header">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                        aria-label="Закрыть"></button>
                                </div>
                                <img src="/public/theme/img/login-form-img.svg" width="64px" class="d-block mx-auto">
                                <h5 class="text-center mt-3">Авторизация представителя лагеря</h5>
                                <div class="modal-body col-lg-10 col-md-12 col-sm-12 col-12 d-block mx-auto">

                                    <form action="/login" method="post" id="login-form">
                                        
                                        <label for="exampleDatepicker1" class="form-label mt-3">Email</label>
                                        <input type="text" class="form-control auth-input" name="email"
                                            placeholder="Введите свой Email" required />

                                        <label for="exampleDatepicker1" class="form-label mt-3">Пароль</label>
                                        <input type="password" class="form-control auth-input" name="password"
                                            placeholder="Введите пароль" required />
                                            <div class="h-captcha" data-sitekey="289e72bc-4dda-4aa1-b8da-6366427840ca"></div>

                                           

                                </div>
                                <div class="col-lg-8 d-block mx-auto mb-3">
                                    <button type="submit" class="btn btn-auth-modal d-block mx-auto mt-3">Войти в личный
                                        кабинет</button>
                                    <a href="" class="d-block mx-auto text-center mb-3">Восстановить пароль</a>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </nav>
</header>

    <div class="header-image d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="row">
                <h1 class="header-h1">Поиск детских оздоровительных лагерей России</h1>
                <div class="col-lg-9 d-block mx-auto">
                    <p class="text-center text-light header-descript">Наш сервис создан для быстрого и удобного поиска
                        детских
                        оздоровительных лагерей по всей России!
                        Планируете отправить ребёнка на отдых? Мы поможем найти самый подходящий для вас вариант.
                    </p>
                </div>
            </div>
<?php
// echo '<pre>';
// var_dump($types);
// echo '</pre>';
// die;
?>

            <div class="filter-block col-lg-11 d-block mx-auto mt-2">
                <form action="" method="post">
                    <div class="row">
                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите регион поиска</label>
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
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите тип лагеря</label>
                            <select id="type" class="form-select form-select-lg mt-0" name="type">
                                <option selected disabled value="">Любой тип лагеря</option>
                                <?php 
                                    foreach ($types as $key => $type) {
                                        echo '<option value="'. $type['slug'] .'">' . $type['title'] . '</option>';
                                    }
                                ?>
                            </select>
                        </div>

                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите сезон</label>
                            <select id="season" class="form-select form-select-lg mt-0" name="season">
                                <option selected disabled value="">Любой сезон</option>
                                <?php 
                                    foreach ($seasons as $key => $season) {
                                        echo '<option value="'. $season['slug'] .'">' . $season['title'] . '</option>';
                                    }
                                ?>
                            </select>
                        </div>

                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите возраст ребёнка</label>
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

                            <div id="search" class="btn btn-primary btn-lg col-lg-12 d-block mx-auto"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-search" viewBox="0 0 16 16">
                                    <path
                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                </svg> Найти лагеря</div>
                        </div>


                        <!-- <div class="form-check mt-2">
                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                            <label class="form-check-label" for="flexCheckDefault">
                                Показывать лагеря только с рейтингом выше 4.5
                            </label>
                        </div> -->

                    </div>
                </form>

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

        if (season.value) {
            url += '/' + season.value;
        } else {
            url += '/season-all';
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