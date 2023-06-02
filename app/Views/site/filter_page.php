<div class="container">
<div class="row">

<style>

    .rating-block {
        display: flex;
        align-items:center;
    }

  .rating {
      display: flex;
      align-items:center;
      justify-content:center;
      background: gold;
      padding: 5px;
      border-radius: 5px;
      color: #000;
      font-weight: 400;
      width: 44px;
      height: 44px;
      font-size: 18px;
      margin-left: 10px;
  }

  .bi-star-fill {
      color: gold;
      margin: 1px;
  }



  </style>

<div class="col-lg-3 border">sfsdfsdf</div>

 <div class="col-lg-9"><div class="row">

 <?php 

foreach ($camps as $camp) {
    $rating = round($camp['avg_rating'], 1);
echo '
 <div class="col-lg-12 mb-3">
  <div class="card p-3">
  <div class="row">
             <div class="col-lg-3">
                 <img src="https://imgholder.ru/250x250/8493a8/adb9ca&text=IMAGE+HOLDER&font=kelson" class="img-fluid">
                 
              </div>

             <div class="col-lg-9">
             <div class="row">
             <div class="col-lg-8">
                 <h5>'. $camp['camp'] .'</h5>
                 <p>Ленинградская обл., п. Петровское</p>
                 <p>
                 На смене ребенок научится общаться и строить отношения с новыми людьми не только на русском, но и на английском языке; найдет друзей, раскроет свой потенциал и сможет хорошо отдохнуть. Ребенок прокачает soft skills и speaking English. Каждая смена тематическая, наполненная играми, квестами, мастер-классами и другими творческими мероприятиями.
                 </p>
                 <div class="row">
                     <div class="col-auto">
                         <p>Возраст: <b>от 4 до 14 лет</b></p>
                         <p>Год основания: <b>2011</b></p>
                     </div>

                     <div class="col-auto">
                         <p>Охраняемая территория: <b>Да</b></p>
                         <p>Трансфер включён в стоимость: <b>Да</b></p>
                     </div>
                 </div>


                 <div class="type-block mb-2">
             ';

             $types = explode(',',$camp['name_type']);
             
             foreach ($types as $type) {
                 echo '<div class="type" role="alert">'.$type.'</div>';
             }

            echo '</div>


              </div>

             <div class="col-lg-4 ">

              <div class="rating-block">
              <img src="/public/theme/img/star.svg" width="24px" style="margin-right: 5px;"><b>Рейтинг лагеря: </b> <span class="rating">'.$rating.'</span> 
              </div>
              
              <p class="mt-3"><b>Отзывов: '.$camp['count_reviews'].'</b></p>
              <p>Гос. компенсация: да</p>
              <p>Городской сертификат: да</p>
              <p class="price"><b>от 50000 руб.</b></p>
              <a class="btn btn-reg m-1" href="/registration">Посмотреть смены</a>
             </div>

             </div>
             </div>
         </div>

         
        

     </div>
</div>';
  }
?>



</div>
</div>
</div>
</div>