<!doctype html>
<html lang="ru">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
    <title>Слайдер | Carousel Template for Bootstrap · Версия v5.3.0-alpha1</title>
    <!-- Bootstrap core CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
      crossorigin="anonymous">
      
    <!-- Favicons -->
    <link rel="apple-touch-icon"
      href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png"
      sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png"
      sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon"
      href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg"
      color="#7952b3">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">
  


    <style>

      @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@300;400&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Raleway&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@700&display=swap');
      @import url('https://fonts.googleapis.com/css2?family=Rubik:wght@600&display=swap');

      body {
        font-family: 'Raleway', sans-serif;
      }

      h1, 
      h2,
      h3 {
        font-family: 'Rubik', sans-serif;

      }

      .navbar-brand {
          margin-right: 30px;
      }

      .city-link {
          display: block;
          margin-top: 8px;
          margin-right: 10px;
      }

      .btn-auth {
        color: #405189;
        padding: 10px 20px;
      }

      .btn-reg {
          color: #fff;
          background: #2955c8;
          border: none;
          border-radius: 5px;
          padding: 10px 25px;
      }

      .btn-reg:hover {
          color: #fff;
          background-color:  #405189;
          
      }

      .badge {
          position: relative;
          top: -2px;
          background-color: #0ab39c;
          font-weight: 100;
          font-size: 12px;
      }

      .header-image {
          width: 100%;
          min-height: 580px;
          background: #222 url(/../public/theme/img/header-dark.jpg) center;
          padding: 20px 0;
          margin-bottom: 30px;
      }

      .header-h1 {
          text-align: center;
          color: #fff;
      }

      .filter-block {
          background: rgba(0, 0, 0, 0.3);
          max-width: 1200px;
          min-height: 50px;
          backdrop-filter: blur(4px);
          border-radius: 20px;
          padding: 15px 35px 15px 35px;
      }

      .filter-block .form-select {
          font-size: 16px;
          padding: 12px 25px 12px 25px;
          margin-top: 15px;
          margin-bottom: 15px;
          border: none;
          background-color: rgba(255,255,255,0.9);
          color: rgba(0,0,0,0.6);
          border-radius: 5px;
      }

      .filter-block .btn {
          background: #0ab39c;
          border: none;
          padding: 12px 30px 12px 30px;
          font-size: 16px;
          margin-top: 15px;
          font-weight: 400;
          border-radius: 5px;
      }

    </style>
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  <body>

    <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <div class="container py-1">
          <a class="navbar-brand" href="#">KidCamp</a>
          
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarCollapse" aria-controls="navbarCollapse"
            aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarCollapse">
           
            <ul class="navbar-nav me-auto mb-2 mb-md-0">
              <li class="">
                <a class="city-link" href="#">Санкт-Петербург</a>
              </li>

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
                <a class="nav-link">Топ-50 лагерей России <span class="badge">New</span></a>
              </li>
 
            </ul>

            <div class="d-flex" role="search">
              <!-- <a class="btn btn-auth m-1" href="/login">Войти</a> -->
              <a class="btn btn-reg m-1" href="/registration">+ Добавить лагерь</a>
            </div>
        </div>
      </nav>
    </header>


    <div class="header-image d-flex align-items-center justify-content-center">
      <div class="container">
        <div class="row">
          <h1 class="header-h1">Поиск детских оздоровительных лагерей России</h1>
          <p class="text-center text-light">Наш сервис поможет вам подобрать нужный детский оздоровительный лагерь в вашем регионе</p>
        </div>

        <div class="filter-block col-lg-12 d-block mx-auto mt-3">
          <form action="" method="get">
          <div class="row">
            <div class="col-lg">
            <select class="form-select form-select-lg" name="region">
              <option selected>Любой регион</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div>

          <div class="col-lg">
            <select class="form-select form-select-lg" aria-label="Default select example">
              <option selected>Любой сезон</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div>

          <div class="col-lg">
            <select class="form-select form-select-lg" aria-label="Default select example">
              <option selected>Любой тип лагеря</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div>

          <div class="col-lg">
            <select class="form-select form-select-lg" aria-label="Default select example">
              <option selected>Любой возраст</option>
              <option value="1">One</option>
              <option value="2">Two</option>
              <option value="3">Three</option>
            </select>
          </div>

          <div class="col-lg-auto">
            <button type="submit" class="btn btn-primary btn-lg col-lg-12 d-block mx-auto"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
              <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
            </svg> Найти лагерь</button>
          </div>
          </div></form>

        </div></div>

      </div>
    </div>
