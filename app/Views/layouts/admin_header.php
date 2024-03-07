<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Административная панель</title>
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .nav-link {
            color: white;
        }

        .nav-link:hover {
            color: cyan;
        }

    </style>

</head>

<body>

    <div class="container-fluid">
        <div class="row flex-nowrap">
            <div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark">
                <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
                    <!-- Заголовок меню -->
                    <a href="/admin/panel"
                        class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                        <span class="fs-5 d-none d-sm-inline mt-2">KidsCampAdmin</span>
                    </a>
                    <!-- элементы меню -->
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                        

                       
                        <h5 class="mt-3">Представители</h5>
                        <li>
                            <a href="/admin/representatives" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Все представители лагерей</span> </a>
                        </li>

                        <li>
                            <a href="/admin/representatives/activated" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Активированные</span> </a>
                        </li>

                        <li>
                            <a href="/admin/representatives/notactivated" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Ожидающие активации</span> </a>
                        </li>
                        
                        <h5 class="mt-4">Лагеря</h5>
                        <li>
                            <a href="/admin/camps" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Все лагеря</span>
                            </a>
                        </li>

                        <li>
                            <a href="/admin/activated-camps" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Активные лагеря</span>
                            </a>
                        </li>

                        <li>
                            <a href="/admin/not-activated-camps" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Ожидают проверки</span>
                            </a>
                        </li>

                        <h5 class="mt-4">Тарифы</h5>
                        <li>
                            <a href="/admin/add-tariff" class="nav-link px-0 align-middle">
                              <span class="ms-1 d-none d-sm-inline">Добавить тариф</span>
                            </a>
                        </li> 

                        <li>
                            <a href="/admin/edit-tariffs" class="nav-link px-0 align-middle">
                              <span class="ms-1 d-none d-sm-inline">Редактировать тарифы</span>
                            </a>
                        </li>

                        <style>
                            .logout {
                                position: relative;
                                bottom: 0px;
                                color: #fff;
                            }

                            .bottom-block {
                                position: absolute;
                                bottom: 30px;
                            }
                        </style>
                        <div class="bottom-block">
                            <a href="/admin/panel/logout" class="logout">Выйти</a>
                        </div>

                       

                       

                    </ul>
                    <hr>
                    
                </div>
            </div>
    
    