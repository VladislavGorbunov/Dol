<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <title>Авторизация</title>
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
                <div class="col-lg-8 col-xl-5">
                    <div class="card rounded-3">
                        <img src="/public/theme/img/header.jpg" height="300" class="h-80" style="border-top-left-radius: .3rem; border-top-right-radius: .3rem;" alt="">
                        <div class="card-body p-4 p-md-5">
                        
                            <form class="px-md-2" action="" method="post">
                                <label for="exampleDatepicker1" class="form-label mt-1">Логин</label>
                                <input type="text" class="form-control" name="login" required/>
                                <label for="exampleDatepicker1" class="form-label mt-3">Пароль</label>
                                <input type="password" class="form-control" name="password" required/>
                                <button type="submit" class="btn btn-success btn-md mb-1 mt-3">Войти</button>

                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>

</html>