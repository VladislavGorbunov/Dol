<h2 class="mb-3">Ваши клиенты и бронирования</h2>

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/panel">Главная страница</a></li>
    <li class="breadcrumb-item active" aria-current="page">Клиенты и бронирования</li>
  </ol>
</nav>

  <?php

    if ($data_bookings) {

        echo '
        <table class="table mt-2">
          <thead>
            <tr>
              <th scope="col">ID</th>
              <th scope="col">Ф.И.О клиента</th>
              <th scope="col">Телефон</th>
              <th scope="col">Email</th>
              <th scope="col">Номер бронирования</th>
              <th scope="col">Дата</th>
              <th scope="col">Статус</th>
              <th scope="col"></th>
              <th scope="col"></th>
            </tr>
          </thead>
        <tbody>
        ';

        foreach ($data_bookings as $key => $booking) {
            if ($booking['confirmed'] == 1) {
                echo '<tr class="table-success">';
            } else {
               echo '<tr>';
            }

        echo '
          <th scope="row">'.$booking['id'].'</th>
          <td>'.$booking['fio'].'</td>
          <td>'.$booking['telephone'].'</td>
          <td>'.$booking['email'].'</td>
          <td>'.$booking['booking_number'].'</td>
          <td>'.$booking['date_booking'].'</td>
          <td>'; 
          echo ($booking['confirmed'] == 1) ? 'Подтверждена' : 'Не подтверждена';
          echo '</td>
          <td><a href="/panel/booking/'.$booking['id'].'">Посмотреть</a></td>
          <td><button id="delete-btn" class="btn btn-md btn-danger" data-id="'.$booking['id'].'">Удалить</button></td>
          </tr>
        
        ';
        }
    } else {
        echo 'На данный момент нет бронирований'; 
    }
    ?>
    
  </tbody>
</table>
    

<script>

   const btnDelete = document.querySelectorAll('#delete-btn');
   
   // Вешаем событие на все кнопки удаления
   btnDelete.forEach(item => {
       item.addEventListener('click', (e) => {
          deleteBooking(item.dataset.id, item);
       })
  });

  // Удаление бронирования
  function deleteBooking(id, item) {
    fetch('/panel/booking/delete/' + id)
    .then((response) => {
      return response.json();
    })
    .then((data) => {
      if (data.success == 'ok') {
          // Удаление строки из таблицы
          let parentTD = item.parentNode;
          parentTD.parentNode.remove();
          alert('Удалено');
      } else {
        alert('При удалении произошла ошибка');
      }
    })
  }

</script>
