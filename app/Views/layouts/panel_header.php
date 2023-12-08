<?php $session = session(); ?>
<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ByCamps Office - панель управления </title>
    <!-- Bootstrap core CSS -->
    
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/public/line-awesome/1.3.0/css/line-awesome.min.css">
    <style>

    body {
      font-size: 15px;
    }

    .nav-link {
        color: white;
    }

    .nav-link:hover {
        color: cyan;
    }

    a {
        text-decoration: none;
        color: #243d51;
    }

    .card {
      border: 1px solid #eee;
    }

    .btn-add {
        color: #fff;
        background: #2955c8;
        border: none;
        border-radius: 5px;
        padding: 10px 25px;
    }

    .btn-add:hover {
        color: #fff;
        background: #2955c8;
        border: none;
        border-radius: 5px;
        padding: 10px 25px;
    }

    .btn-logout {
        color: #fff;
        border: 1px solid #fff;
        border-radius: 5px;
        padding: 10px 25px;
    }

    .btn-logout:hover {
      color: #fff;
        border: 1px solid #fff;
        border-radius: 5px;
        padding: 10px 25px;
    }


    .dark {
        background-color: #111;
    }

    footer {
      height: 100px;
      background: #222;
    }
    </style>

    <script src="https://api-maps.yandex.ru/2.1/?apikey=60ad5e6e-89aa-490d-a9b3-4c7f3e35165a&lang=ru_RU"
        type="text/javascript"></script>

</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
  <div class="container">
    <a class="navbar-brand" href="/panel">ByCamp Office</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="/panel">Главная</a>
        </li>
        
        
        <li class="nav-item">
          <a class="nav-link active position-relative" aria-current="page" href="/panel/booking">Клиенты и бронирования 
          <span class="badge bg-danger"><?= $session->get('booking_count') ?></span>

</a>
        </li>
      </ul>
      
      <form class="d-flex">
      
      
      <a class="btn btn-add m-1" href="/panel/add-camp"><i class="las la-plus"></i> Добавить лагерь</a>
      
    
      <a class="btn btn-logout m-1" href="/panel/logout">Выйти</a>
      </form>
    </div>
  </div>
</nav>


<div class="container mt-4">
<div class="row">
            