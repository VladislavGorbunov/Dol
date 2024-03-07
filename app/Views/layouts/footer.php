<style>

  footer {
    position: relative;
  }

  footer .pol {
    display: block;
    position: absolute;
    width: 30%;
    height: 300px;
    bottom: 50px;
    right: 10%;
    border: 1px solid #111;
    background: linear-gradient(90deg, rgba(51,44,171,1) 0%, rgba(0,230,255,1) 100%);
    z-index: 1;
    opacity: 0.3;
    filter: blur(80px);
  }
</style>

<!-- Footer -->
<footer class="text-center text-lg-start mt-5 pt-3">

  <!-- Section: Social media -->

  <!-- Section: Links  -->
  <section class="">
    <div class="container text-center text-md-start mt-5">
      <!-- Grid row -->
      <div class="row mt-3">
        <!-- Grid column -->
        <div class="col-lg-3 mx-auto mb-4">
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
        <div class="col-lg-3 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Информация
          </h6>
          <p>
            <a href="#!" class="text-reset">О сервисе «ПоЛагерям»</a>
          </p>
          <p>
            <a href="/contacts" class="text-reset">Наши контакты</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Полезная информация</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Пользовательское соглашение</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Политика конфиденциальности</a>
          </p>
          <p>
            <a href="/sitemap.xml" target="_blank" class="text-reset">Карта сайта</a>
          </p>
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-lg-3 mx-auto mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">
            Партнёрам
          </h6>
          
          <p>
            <a href="/partners" class="text-reset">Добавить лагерь</a>
          </p>
          <p>
            <a href="/login" class="text-reset" target="_blank">Личный кабинет</a>
          </p>
          <p>
            <a href="/partners" class="text-reset">Условия сотрудничества</a>
          </p>
          <p>
            <a href="#!" class="text-reset">Помощь</a>
          </p>
          
        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col-lg-3 mx-auto mb-md-0 mb-4">
          <!-- Links -->
          <h6 class="text-uppercase fw-bold mb-4">Контакты</h6>
          <p>Россия, г. Санкт-Петербург</p>
          <p>Email: info@bycamp.ru</p>
          <p>Тех. поддержка: tech@bycamp.ru</p>
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
      background: rgba(255,255,255,0.9);
      background-size: cover;
      backdrop-filter: blur(10px);
      color: #333;
      right: 30px;
      margin-left: 30px;
      bottom: 30px;
      z-index: 99;
      padding: 15px 60px 25px 20px;
      font-size: 13px;
      border-radius: 10px;
      box-shadow: 0 4px 20px -5px rgba(0,0,0,0.2);
    }

    .cookie-block button {
      position: absolute;
      top: 14px;
      right: 14px;
      text-align: center;
      border-radius: 0px;
      color: #111;
      background: none;
      border: 1px solid #111;
      padding: 3px 10px 3px 10px;
      height: auto;
    }

    .cookie-block .la-cookie-bite {
      position: relative;
      top: 4px;
      font-size: 32px;
      color: #111;
    }

 
  </style>

  <div class="cookie-block col-lg-3">
    <div class="row">
      <!-- <div class="col-2"><img src="/public/theme/img/cookie.png" class="img-fluid mt-2"></div> -->
      <div class="col-12">
      <h5>Используем файлы Cookie <i class="las la-cookie-bite"></i></h5>Наш сайт использует файлы куки (cookie). Продолжая использовать наш сайт, вы 
     соглашаетесь с использованием файлов куки.
     <button class="btn btn-success btn-sm cookie-btn">Х</button></div>
   </div>
  </div>

 
  <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.025);">
    © <?= date('Y') ?> BYCAMPS.RU <br>Информация на сайте не является публичной офертой.
  </div>
  <div class="pol"></div>
</footer>
<!-- Footer -->
              

<script src="/public/bootstrap-5.3.0-alpha3/dist/js/bootstrap.bundle.js"></script>
<script src="/public/js/navBarTop.js"></script>

<script src="/public/js/phone-mask.js"></script>
<script src="/public/js/filter.js"></script>
<script src="/public/js/cookie-msg.js"></script>


</body>
</html>