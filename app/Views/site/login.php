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
        <!-- Line Awesome icons -->
        <link rel="stylesheet" href="/public/line-awesome/1.3.0/css/line-awesome.min.css">

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
        @font-face {
            font-family: "Roboto"; 
            src: url("/public/fonts/Roboto/Roboto-Regular.ttf");  
        }

        @font-face {
            font-family: "Rubik"; 
            src: url("/public/fonts/Rubik/Rubik-Bold.ttf"); 
        } 

        body {
            font-family: 'Roboto', sans-serif;
            background: url(/public/theme/img/authbg.jpg);
            background-size: cover;
        }

        .loginBox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            max-width: 600px;
            min-height: 200px;
            background: rgba(255,255,255,0.96);
            backdrop-filter: blur(7px);
            border-radius: 20px;
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
            padding: 0 0 0px;
            font-family: 'Rubik', sans-serif;
            color: #111;
            text-align: center
        }

        .loginBox input {
            width: 100%;
            margin-bottom: 20px;
        }

        .loginBox input[type="text"],
        .loginBox input[type="password"] {
            border: none;
            border-bottom: 1px solid #ccc;
            outline: none;
            height: 50px;
            color: #111;
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

        .loginBox .btn-login {
            display: block;
            border: none;
            outline: none;
            height: 50px;
            font-size: 16px;
            background: #2955c8;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
            width: 300px;
            margin: 0 auto;
            margin-bottom: 10px;
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
            color: #444;
        }

        .h-captcha {
            display: block;
            width: 305px;
        }

        .password {
            position: relative;
        }

        .la-eye, .la-eye-slash {
            position: absolute;
            right: 20px;
            top: 15px;
            font-size: 28px;
            color: #999;
        }
        </style>



    </head>

<body>


    <div class="col-lg-4 col-12 loginBox">
    <?php if(session()->getFlashdata('msg-error')):?>
    
        <div class="alert alert-warning text-center">
        <?php 
            $errors = session()->getFlashdata('msg-error');

            if (!empty($errors)) {
                foreach ($errors as $error) {
                    echo $error . '<br>';
                }
            }
            
            ?>
    </div>
    <?php endif;?>


    <?php if(session()->getFlashdata('msg')):?>
    
    <div class="alert alert-success text-center">
    <?php 
        $msg = session()->getFlashdata('msg');

        if (!empty($msg)) {
            echo $msg . '<br>';
        }
        
        ?>
</div>
<?php endif;?>

        <img src="/public/theme/img/login-form-logo.png" width="140px" class="d-block mx-auto">
        <h3 class="text-center mt-2">ByCamps</h3>
        <p class="text-center">Панель управления лагерями</p>
       
        <form action="" method="post">
            <div class="inputBox mt-1 col-lg-10 d-block mx-auto">
                <input id="uname" type="text" name="email" placeholder="Введите Email" required>
                <div class="password">
                    <input id="pass" type="password" name="password" placeholder="Введите пароль" required>
                    <div class="eye-icon"><i class="las la-eye"></i></div>
                </div>
            </div>
            <div class="h-captcha d-block mx-auto" data-sitekey="289e72bc-4dda-4aa1-b8da-6366427840ca"></div>
            <div id="hcaptcha-loading" class="text-center"></div>
            <button id="btn-login" type="submit" class="btn btn-login mt-3">Войти</button>
        </form>

        <div class="col-lg-12 mt-4">
            <div class="row">
                <div class="col-lg-6"><a href="">Зарегистрироваться</a></div>
                <div class="col-lg-6"><a href="#">Восстановить пароль</a></div>
            </div>
        </div>

    </div>

</body>


<script>

// view password

const viewIcon = document.querySelector('.las')
const passInput = document.getElementById('pass')
let flag = true
viewIcon.addEventListener('click', () => {

    if (flag == true) {
        passInput.setAttribute('type', 'text')
        viewIcon.classList.remove('la-eye')
        viewIcon.classList.add('la-eye-slash')
        flag = false
    } else {
        passInput.setAttribute('type', 'password')
        viewIcon.classList.add('la-eye')
        viewIcon.classList.remove('la-eye-slash')
        flag = true
    }
    
})


const btnLogin = document.getElementById('btn-login');
const hcaptchaLoading = document.getElementById('hcaptcha-loading');
btnLogin.classList.add('disabled');
hcaptchaLoading.innerHTML = 'Подождите, загружаем капчу'

let waitLoad = setTimeout(() => {
    hcaptchaLoading.innerHTML = 'Ошибка загрузки капчи, возможно у вас проблемы с интернетом. <a href="/login">Перезагрузите страницу</a>'
}, 5000);


function buttonActivated() {
    clearInterval(waitLoad)
    btnLogin.classList.remove('disabled');
    hcaptchaLoading.innerHTML = ''
}
</script>

<script src="https://js.hcaptcha.com/1/api.js?hl=ru&onload=buttonActivated" async defer></script>

</html>