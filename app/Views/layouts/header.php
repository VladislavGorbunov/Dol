<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
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
        <nav class="navbar navbar-expand-lg navbar-light bg-light py-2">

            <div class="container py-2">
                <a class="navbar-brand" href="#">
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
                        <button type="button" class="btn btn-auth" data-bs-toggle="modal"
                            data-bs-target="#staticBackdrop"><svg xmlns="http://www.w3.org/2000/svg" width="18"
                                height="18" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 18 18">
                                <path fill-rule="evenodd"
                                    d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
                                <path fill-rule="evenodd"
                                    d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                            </svg> Войти</button>



                        <a class="btn btn-reg m-1" href="/registration">+ Добавить лагерь</a>
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
                                
                                    <form action="/login" method="post">
                                        <label for="exampleDatepicker1" class="form-label mt-3">Email</label>
                                        <input type="text" class="form-control auth-input" name="email"
                                            placeholder="Введите свой Email" required />

                                        <label for="exampleDatepicker1" class="form-label mt-3">Пароль</label>
                                        <input type="password" class="form-control auth-input" name="password"
                                            placeholder="Введите пароль" required />
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
                    <p class="text-center text-light header-descript">Наш сервис создан для быстрого и удобного поиска детских
                        оздоровительных лагерей по всей России!
                        Планируете отправить ребёнка на отдых? Мы поможем найти самый подходящий для вас вариант.
                    </p>
                </div>
            </div>

            <div class="filter-block col-lg-12 d-block mx-auto mt-2">
                <form action="" method="post">
                    <div class="row">
                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите регион поиска</label>
                            <select id="region" class="form-select form-select-lg mt-0" name="region">
                                <option selected disabled value="">Любой регион</option>
                                <option value="moscow">Москва</option>
                                <option value="spb">Санкт-Петербург</option>
                            </select>
                        </div>

                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите сезон</label>
                            <select id="season" class="form-select form-select-lg mt-0" name="season">
                                <option selected disabled value="">Любой сезон</option>
                                <option value="leto">Лето</option>
                                <option value="vasna">Весна</option>
                                <option value="3">Three</option>
                            </select>
                        </div>

                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите тип лагеря</label>
                            <select id="type" class="form-select form-select-lg mt-0" name="type">
                                <option selected disabled>Любой тип лагеря</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>

                        <div class="col-lg g-1">
                            <label for="exampleDatepicker1" class="form-label mt-3">Выберите возраст ребёнка</label>
                            <select id="age" class="form-select form-select-lg mt-0" name="age">
                                <option selected disabled>Любой возраст</option>
                                <option value="1">One</option>
                                <option value="2">Two</option>
                                <option value="3">Three</option>
                            </select>
                        </div>

                        <div class="col-lg-auto g-1">

                            <button type="submit" class="btn btn-primary btn-lg col-lg-12 d-block mx-auto"><svg
                                    xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-search" viewBox="0 0 16 16">
                                    <path
                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                </svg> Найти лагеря</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>

    </div>
    </div>

    <script>
        // редирект
        //window.location.href = "/";

        let region = document.getElementById("region");
        let season = document.getElementById("season");
        let type = document.getElementById("type");
        let age = document.getElementById("age");

        let filter_url; 

        var cities = new Map([
            ['Москва', 'в Москве'],
            ['Санкт-Петербург', 'в Санкт-Петербурге'],
            ['key3', 'value3']
        ]);  

        addEventListener("input", ()=> {
            url = '/camps';

            if (region.value) {
                url += '/' + region.value;
                document.title = 'Детские лагеря ' + cities.get(region.selectedOptions[0].text);
                console.log(region);
            } else {
                url += '/all';
            }
            
            if (season.value) {
                url += '/' + season.value;
                document.title += season.selectedOptions[0].text;
            } else {
                url += '/all';
            }
            
           
            // url += '/' + type.value;
            // url += '/' + age.value;

            console.log(url);

        });
    </script>