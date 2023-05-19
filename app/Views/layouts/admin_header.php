<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Left Sidebar</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">

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
                    <a href="/"
                        class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
                        <span class="fs-5 d-none d-sm-inline">KidsCamp</span>
                    </a>
                    <!-- элементы меню -->
                    <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
                        <li class="nav-item">
                            <a href="#" class="nav-link align-middle px-0">
                                <i class="fs-4 bi-house"></i>
                                <span class="ms-1 d-none d-sm-inline">Главная</span>
                            </a>
                        </li>

                        <li>
                            <a href="representatives" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">Представители лагерей</span> </a>
                        </li>

                        <li>
                            <a href="#" class="nav-link px-0 align-middle">
                            <span class="ms-1 d-none d-sm-inline">База лагерей</span>
                            </a>
                        </li>

                       

                       

                    </ul>
                    <hr>
                    <!-- нижнее дополнительное меню -->
                    <div class="dropdown pb-4 mt-auto">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
                            id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="https://github.com/mdo.png" alt="hugenerd" width="30" height="30" class="rounded-circle">
                            <span class="d-none d-sm-inline mx-1">Иван</span>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                            <li><a class="dropdown-item" href="#">Новый проект</a></li>
                            <li><a class="dropdown-item" href="#">Настройки</a></li>
                            <li><a class="dropdown-item" href="#">Профиль</a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="panel/logout">Выйти</a></li>
                        </ul>
                    </div>
                </div>
            </div>