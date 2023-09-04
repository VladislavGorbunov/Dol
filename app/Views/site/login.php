<!DOCTYPE html>
<html lang="ru">

<head>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <meta name="theme-color" content="#fff">
        <title>Вход в панель менеджера</title>
        <!-- Bootstrap core CSS -->
        <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Favicons -->
        <!-- <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3"> -->
        <link rel="icon" href="/public/favicon.ico">
        <!-- Bootstrap core CSS -->
        <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

        <style>
        .loginBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            min-height: 200px;
            background: #fff;
            border-radius: 10px;
            padding: 40px;
            box-sizing: border-box;
            box-shadow: 0 2px 20px -15px #111;
        }

        .user {
            margin: 0 auto;
            display: block;
            margin-bottom: 20px
        }

        h3 {
            margin: 0;
            padding: 0 0 10px;
            color: #222;
            text-align: center
        }

        .loginBox input {
            width: 100%;
            margin-bottom: 25px
        }

        .loginBox input[type="text"],
        .loginBox input[type="password"] {
            border: none;
            border-bottom: 1px solid #ccc;
            outline: none;
            height: 55px;
            color: #222;
            background: transparent;
            font-size: 16px;
            padding-left: 10px;
            box-sizing: border-box
        }


        .inputBox {
            position: relative
        }

        .inputBox span {
            position: absolute;
            top: 10px;
            color: #262626
        }

        .loginBox input[type="submit"] {
            display: block;
            border: none;
            outline: none;
            height: 60px;
            font-size: 16px;
            background: #2955c8;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            width: 300px;
            margin: 0 auto;
            margin-bottom: 20px;
        }

        .loginBox a {
            color: #2955c8;
            font-size: 16px;
            margin-top: 5px;
            text-decoration: none;
            text-align: center;
            display: block;
        }


        a:hover {
            color: #59238F
        }

        p {
            color: #59238F
        }

        .h-captcha {
            display: block;
            width: 305px;
        }
        </style>



    </head>

<body>


    <div class="col-lg-4 col-12 loginBox">
    <?php if(session()->getFlashdata('msg')):?>
    <div class="alert alert-warning">
        <?= session()->getFlashdata('msg') ?>
    </div>
    <?php endif;?>

        <img src="/public/theme/img/login-form-logo.png" width="200px" class="d-block mx-auto">
        <h3 class="text-center mt-2">ByCamps Office</h3>
        <form action="" method="post">
            <div class="inputBox mt-1 col-lg-10 d-block mx-auto">
                <input id="uname" type="text" name="email" placeholder="Email" required>
                <input id="pass" type="password" name="password" placeholder="Пароль" required>
            </div>
            <div class="h-captcha d-block mx-auto" data-sitekey="289e72bc-4dda-4aa1-b8da-6366427840ca"></div>
            <input type="submit" name="" value="Войти" class="mt-3">
        </form>

        <div class="col-lg-12">
            <div class="row">
                <div class="col-lg-6"><a href="">Зарегистрироваться</a></div>
                <div class="col-lg-6"><a href="#">Восстановить пароль</a></div>
            </div>

            <a href="/" class="mt-3">Вернуться на главную</a>
        </div>

    </div>

</body>
<script src="https://js.hcaptcha.com/1/api.js?hl=ru" async defer></script>

</html>