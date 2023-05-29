<!DOCTYPE html>
<html lang="ru">

<head>

<!-- Bootstrap core CSS -->
<link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

      <style>
        
            
            .loginBox {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%,-50%);
                width: 350px;
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
                padding: 0 0 20px;
                color: #222;
                text-align: center
            }
            
            .loginBox input{
                width: 100%;
                margin-bottom: 20px
            }
            
            .loginBox input[type="text"], .loginBox input[type="password"]{
                border: none;
                border-bottom: 2px solid #262626;
                outline: none;
                height: 45px;
                color: #222;
                background: transparent;
                font-size: 16px;
                padding-left: 20px;
                box-sizing: border-box
            }
            
            .loginBox input[type="text"]:hover, .loginBox input[type="password"]:hover{
                color: #222;
                
            }
            
            .loginBox input[type="text"]:focus, .loginBox input[type="password"]:focus{
                border-bottom: 2px solid #59238F
            }
            
            .inputBox{position: relative}.inputBox span{position: absolute;top: 10px;color: #262626}
            .loginBox input[type="submit"]{
                border: none;
                outline: none;
                height: 50px;
                font-size: 16px;
                background: #59238F;
                color: #fff;
                border-radius: 20px;
                cursor: pointer;
            }
            
            .loginBox a{
                color: #262626;
                font-size: 14px;
                font-weight: bold;
                text-decoration: none;
                text-align: center;
                display: block;
            }
                
                a:hover{color: #59238F}p{color: #59238F}
        </style>



</head>

<body>


<?php if(session()->getFlashdata('msg')):?>
                    <div class="alert alert-warning">
                       <?= session()->getFlashdata('msg') ?>
                    </div>
                    <?php endif;?>


<div class="loginBox"> 
        <h3>Личный кабинет</h3>
        <form action="" method="post">
            <div class="inputBox"> 
                <input id="uname" type="text" name="email" placeholder="Email" required> 
                <input id="pass" type="password" name="password" placeholder="Пароль" required> </div>
                <input type="submit" name="" value="Войти">
        </form> 
        <a href="#">Восстановить пароль<br> </a>
        <div class="text-center">
            <p style="color: #59238F;">Зарегистрироваться</p>
        </div>
        
    </div>

</body>

</html>