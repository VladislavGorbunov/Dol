<!-- Footer -->
<footer class="text-center text-lg-start mt-5 pt-3">

  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Родителям
          </h6>
          <p>
            <a href="#!" class="text-reset">Поиск лагеря</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Частые вопросы</a>
          </p>
          
        </div>


        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Информация
          </h6>
          <p>
            <a href="#!" class="text-reset">О сервисе</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Контакты</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Полезная информация</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Пользовательское соглашение</a>
          </p>
          <p>
            <a href="/sitemap.xml" target="_blank" class="text-reset">Карта сайта</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Партнёрам
          </h6>
          
          <p>
            <a href="#!" class="text-reset">Добавить лагерь</a>
          </p>
          <p>
            <a href="#" class="text-reset" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Личный кабинет</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Условия сотрудничества</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Помощь</a>
          </p>
          
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Контакты</h6>
          <p>Россия, г. Санкт-Петербург</p>
          <p>info@bycamp.ru</p>
          <img src="/public/theme/img/vk-text-logo-white.png" width="170">
          
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
  </section>
  <!-- Section: Links  -->

  <style>
    .cookie-block {
      position: fixed;
      display: none;
      background: rgba(255,255,255,0.85);
      background-size: cover;
      backdrop-filter: blur(10px);
      color: #333;
      right: 30px;
      margin-left: 30px;
      bottom: 30px;
      z-index: 99;
      padding: 15px 60px 15px 20px;
      font-size: 13px;
      border-radius: 10px;
      box-shadow: 0 2px 20px -5px rgba(0,0,0,0.2);
    }

    .cookie-block button {
      position: absolute;
      top: 10px;
      right: 10px;
      text-align: center;
      border-radius: 5px;
      
    }
  </style>

  <div class="cookie-block col-lg-3">
    <div class="row">
      <div class="col-2"><img src="/public/theme/img/cookie.png" class="img-fluid mt-2"></div>
      <div class="col-10">Наш сайт использует файлы куки. Продолжая использовать наш сайт, вы 
     соглашаетесь с использованием файлов куки.
     <button class="btn btn-success btn-sm cookie-btn">Ок</button></div>
   </div>
  </div>

 
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
    © <?= date('Y') ?> Copyright: BYCAMPS.RU
  </div>

</footer>
<!-- Footer -->
              

<script src="/public/bootstrap-5.3.0-alpha3/dist/js/bootstrap.bundle.js"></script>
<script src="/public/js/phone-mask.js"></script>
<script src="/public/js/filter.js"></script>
<script src="/public/js/cookie-msg.js"></script>

<style>
    body {
      margin: 0;
    }

    .preloader {
      /*фиксированное позиционирование*/
      position: fixed;
      /* координаты положения */
      left: 0;
      top: 0;
      right: 0;
      bottom: 0;
      /* фоновый цвет элемента */
      background: rgba(255,255,255,0.5);
      backdrop-filter: blur(5px);
      /* размещаем блок над всеми элементами на странице (это значение должно быть больше, чем у любого другого позиционированного элемента на странице) */
      z-index: 999;
    }

    .preloader__row {
      position: relative;
      top: 50%;
      left: 50%;
      width: 70px;
      height: 70px;
      margin-top: -35px;
      margin-left: -35px;
      text-align: center;
      animation: preloader-rotate 2s infinite linear;
    }

    .preloader__item {
      position: absolute;
      display: inline-block;
      top: 0;
      background-color: #337ab7;
      border-radius: 100%;
      width: 35px;
      height: 35px;
      animation: preloader-bounce 2s infinite ease-in-out;
    }

    .preloader__item:last-child {
      top: auto;
      bottom: 0;
      animation-delay: -1s;
    }

    @keyframes preloader-rotate {
      100% {
        transform: rotate(360deg);
      }
    }

    @keyframes preloader-bounce {

      0%,
      100% {
        transform: scale(0);
      }

      50% {
        transform: scale(1);
      }
    }

    .loaded_hiding .preloader {
      transition: 0.3s opacity;
      opacity: 0;
    }

    .loaded .preloader {
      display: none;
    }
  </style>


<!-- Прелоадер -->
<div class="preloader">
    <div class="preloader__row">
      <div class="preloader__item"></div>
      <div class="preloader__item"></div>
    </div>
  </div>



<script>
    window.onload = function () { 
      document.body.classList.add('loaded_hiding');
      window.setTimeout(function () {
        document.body.classList.add('loaded');
        document.body.classList.remove('loaded_hiding');
      }, 500);  
    }
</script>



</body>
</html>