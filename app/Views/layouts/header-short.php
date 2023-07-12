<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
    <meta name="theme-color" content="#fff">
    <title><?php echo (!empty($title)) ? $title : 'Тег title отсутствует' ?></title>
    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Line Awesome icons -->
    <link rel="stylesheet" href="/public/line-awesome/1.3.0/css/line-awesome.min.css">
    
    
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
                            <a class="nav-link">Топ-50 лагерей России</a>
                        </li>

                    </ul>



                    <!-- <div class="d-flex justify-content-center">
                        <img src="/public/theme/img/vk_logo.png" width="32px" height="32px" class="mx-3" style="position:relative;top:0px;">
                        <img src="/public/theme/img/mail-logo.png" width="32px" height="32px" class="mx-3" style="position:relative;top:0px;">
                    </div> -->
                    <div class="d-flex justify-content-center">
                        <a href="/login" class="btn btn-auth m-1"><i class="las la-user"></i> Войти</a>
                        <a class="btn btn-reg m-1" href="/registration"><i class="las la-plus-circle"></i> Добавить лагерь</a>
                    </div> 


                </div>
            </div>
        </nav>
    </header>

    <div class="header-image d-flex align-items-center justify-content-center">

    <style>



.cloud img {
    width: 100%;
    height: 100%;
    right: 0%;
    top: 0px;
    position: absolute;
    -webkit-user-select: none; 
    -moz-user-select: none;   
    -ms-user-select: none;
    user-select: none;    
    pointer-events: none;
    opacity: 0.1;
    z-index: 1;
    
    
}


@keyframes animCloud {
    from {
        -webkit-transform: translateX(100%);
        -moz-transform: translateX(100%);
        -ms-transform: translateX(100%);
        -o-transform: translateX(100%);
        transform: translateX(100%)
    }
    to {
        -webkit-transform: translateX(-100%);
        -moz-transform: translateX(-100%);
        -ms-transform: translateX(-100%);
        -o-transform: translateX(-100%);
        transform: translateX(-100%)
    }
}
.cloud1 {
    -webkit-animation: animCloud 20s infinite linear;
    -moz-animation: animCloud 20s infinite linear;
    animation: animCloud 20s infinite linear
}
.cloud2 {
    -webkit-animation: animCloud 30s infinite linear;
    -moz-animation: animCloud 30s infinite linear;
    animation: animCloud 30s infinite linear
}
.cloud3 {
    -webkit-animation: animCloud 40s infinite linear;
    -moz-animation: animCloud 40s infinite linear;
    animation: animCloud 40s infinite linear
}

    </style>

    <div class="cloud">
    <img src="/public/theme/img/cloud-animation/cloud-01.png" alt="" class="cloud1">
    <img src="/public/theme/img/cloud-animation/cloud-02.png" alt="" class="cloud2">
    <img src="/public/theme/img/cloud-animation/cloud-03.png" alt="" class="cloud3">
   
    </div>

        <div class="container">
            <div class="row">
                <h1 class="header-h1"><?= $camp['title'] ?></h1>
                <div class="col-lg-9 d-block mx-auto">
                    <p class="text-center text-light header-descript">Наш сервис создан для быстрого и удобного поиска
                        детских
                        оздоровительных лагерей по всей России!
                        Планируете отправить ребёнка на отдых? Мы поможем найти самый подходящий для вас вариант.
                    </p>
                </div>
            </div>
           
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

                            <div id="search" class="btn btn-primary btn-lg col-lg-12 d-block mx-auto"><i class="las la-rocket"></i> Найти лагеря</div>
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