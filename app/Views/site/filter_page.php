<div class="container">
<div class="row">

<style>

  .rating {
      display: inline-block;
      background: #21a663;
      padding: 5px;
      border-radius: 5px;
      color: #fff;
      font-weight: 400;
      width: 40px;
      text-align: center;
      margin-left: 10px;
  }

  .bi-star-fill {
      color: gold;
      margin: 1px;
  }

  .boost {
      border: 2px solid gold;
  }


  </style>

<div class="col-lg-3 border">sfsdfsdf</div>

 <div class="col-lg-9"><div class="row">

 <?php 

foreach ($camps as $camp) {
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
                 
                 <p>Возраст от 4 до 14 лет</p>
              </div>

             <div class="col-lg-4">
              <b>Рейтинг лагеря:</b> <span class="rating">4.5</span>
              <p class="mt-3"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
              <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
              </svg></p>
              <p class="mt-3">Гос. компенсация: да</p>
              <p>Сертификат СПб: да</p>
              <p class="price"><b>от 50000 руб.</b></p>
              <a class="btn btn-reg m-1" href="/registration">Подробнее</a>
             </div>

             </div>
             <div class="type-block">
             ';

             $types = explode(',',$camp['name_type']);
             
             foreach ($types as $type) {
                 echo '<div class="type" role="alert">'.$type.'</div>';
             }

            echo '</div></div>
         </div>

         
        

     </div>
</div>';
  }
?>



</div>
</div>
</div>
</div>