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

      body {
          font-family: 'Roboto', sans-serif;
      }

      .navbar-brand {
          margin-right: 30px;
      }

      .city-link {
          display: block;
          margin-top: 8px;
          margin-right: 10px;
      }

      .btn-reg {
          color: #405189;
          border: 1px solid #405189;
      }

      .btn-reg:hover {
          color: #fff;
          background-color:  #405189;
          border: 1px solid #405189;
      }

      .badge {
          position: relative;
          top: -2px;
          background-color: #0ab39c;
          font-weight: 100;
      }

      .header-image {
          width: 100%;
          min-height: 600px;
          background: #222 url(/public/theme/img/header.jpg) center;
          padding: 20px 0;
          margin-bottom: 30px;
      }

      .header-h1 {
          text-align: center;
          color: #fff;
      }

      .filter-block {
          background: rgba(0, 0, 0, 0.3);
          min-height: 50px;
          backdrop-filter: blur(10px);
          border-radius: 20px;
          padding: 15px 35px 15px 35px;
      }

      .filter-block .form-select {
          font-size: 16px;
          padding: 15px 25px 15px 25px;
          margin-top: 15px;
          margin-bottom: 15px;
          border: none;
          background-color: rgba(255,255,255,0.9);
          color: rgba(0,0,0,0.6);
      }

      .filter-block .btn {
          background: #36b351;
          border: none;
          padding: 15px 30px 15px 30px;
          font-size: 16px;
          margin-top: 15px;
          font-weight: 400;
      }

    </style>
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  <body>

    <header>
      <nav class="navbar navbar-expand-lg navbar-light bg-light">

        <div class="container py-3">
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
                <a class="nav-link active" aria-current="page" href="#">О нас</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="#">Контакты</a>
              </li>

              <li class="nav-item">
                <a class="nav-link">Партнёрам</a>
              </li>

              <li class="nav-item">
                <a class="nav-link">Топ-50 ДОЛ России <span class="badge">New</span></a>
              </li>

              <li class="nav-item">
                <a class="nav-link">Частые вопросы</a>
              </li>
            </ul>

            <div class="d-flex" role="search">
              
              <a class="btn btn-reg m-1" href=""><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-patch-plus" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M8 5.5a.5.5 0 0 1 .5.5v1.5H10a.5.5 0 0 1 0 1H8.5V10a.5.5 0 0 1-1 0V8.5H6a.5.5 0 0 1 0-1h1.5V6a.5.5 0 0 1 .5-.5z"/>
                <path d="m10.273 2.513-.921-.944.715-.698.622.637.89-.011a2.89 2.89 0 0 1 2.924 2.924l-.01.89.636.622a2.89 2.89 0 0 1 0 4.134l-.637.622.011.89a2.89 2.89 0 0 1-2.924 2.924l-.89-.01-.622.636a2.89 2.89 0 0 1-4.134 0l-.622-.637-.89.011a2.89 2.89 0 0 1-2.924-2.924l.01-.89-.636-.622a2.89 2.89 0 0 1 0-4.134l.637-.622-.011-.89a2.89 2.89 0 0 1 2.924-2.924l.89.01.622-.636a2.89 2.89 0 0 1 4.134 0l-.715.698a1.89 1.89 0 0 0-2.704 0l-.92.944-1.32-.016a1.89 1.89 0 0 0-1.911 1.912l.016 1.318-.944.921a1.89 1.89 0 0 0 0 2.704l.944.92-.016 1.32a1.89 1.89 0 0 0 1.912 1.911l1.318-.016.921.944a1.89 1.89 0 0 0 2.704 0l.92-.944 1.32.016a1.89 1.89 0 0 0 1.911-1.912l-.016-1.318.944-.921a1.89 1.89 0 0 0 0-2.704l-.944-.92.016-1.32a1.89 1.89 0 0 0-1.912-1.911l-1.318.016z"/>
              </svg> Добавить лагерь</a>
            </form>
          </div>

        </div>
        
      </nav>
      
    </header>

    
    <div class="header-image d-flex align-items-center justify-content-center">
      <div class="container">
        <div class="row">
          <h1 class="header-h1">Поиск лучших детских оздоровительных лагерей России</h1>
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

    <main>


      <div class="container marketing">

        <!-- Three columns of text below the carousel -->
        <div class="row">
          <div class="col-lg-4">
            <svg class="bd-placeholder-img rounded-circle" width="140"
              height="140" xmlns="http://www.w3.org/2000/svg" role="img"
              aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid
              slice" focusable="false"><title>Placeholder</title><rect
                width="100%" height="100%" fill="#777"/><text x="50%" y="50%"
                  fill="#777" dy=".3em">140x140</text></svg>

              <h2 class="fw-normal">Heading</h2>
              <p>Some representative placeholder content for the three columns
                of text below the carousel. This is the first column.</p>
              <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
            </div><!-- /.col-lg-4 -->
            <div class="col-lg-4">
              <svg class="bd-placeholder-img rounded-circle" width="140"
                height="140" xmlns="http://www.w3.org/2000/svg" role="img"
                aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid
                slice" focusable="false"><title>Placeholder</title><rect
                  width="100%" height="100%" fill="#777"/><text x="50%" y="50%"
                    fill="#777" dy=".3em">140x140</text></svg>

                <h2 class="fw-normal">Heading</h2>
                <p>Another exciting bit of representative placeholder content.
                  This time, we've moved on to the second column.</p>
                <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
              </div><!-- /.col-lg-4 -->
              <div class="col-lg-4">
                <svg class="bd-placeholder-img rounded-circle" width="140"
                  height="140" xmlns="http://www.w3.org/2000/svg" role="img"
                  aria-label="Placeholder: 140x140"
                  preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect
                    width="100%" height="100%" fill="#777"/><text x="50%"
                      y="50%" fill="#777" dy=".3em">140x140</text></svg>

                  <h2 class="fw-normal">Heading</h2>
                  <p>And lastly this, the third column of representative
                    placeholder content.</p>
                  <p><a class="btn btn-secondary" href="#">View details &raquo;</a></p>
                </div><!-- /.col-lg-4 -->
              </div><!-- /.row -->



                  </div><!-- /.container -->


                  <!-- FOOTER -->
                  <footer class="container">
                    <p class="float-end"><a href="#">Back to top</a></p>
                    <p>&copy; 2017–2022 Company, Inc. &middot; <a href="#">Privacy</a>
                      &middot; <a href="#">Terms</a></p>
                  </footer>
                </main>


                <script
                  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
                  integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
                  crossorigin="anonymous"></script>

                <script
                  src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                  integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
                  crossorigin="anonymous"></script>
                <script
                  src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
                  integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
                  crossorigin="anonymous"></script>

              </body>
            </html>