<h2>Ваши клиенты и бронирования</h2>
<table class="table mt-3">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Ф.И.О клиента</th>
      <th scope="col">Телефон</th>
      <th scope="col">Email</th>

      <th scope="col">Номер бронирования</th>
      <th scope="col">Статус</th>
      
    </tr>
  </thead>
  <tbody>

  <?php

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
          <td>'; 
          echo ($booking['confirmed'] == 1) ? 'Подтверждена' : 'Не подтверждена';
          echo '</td>
          <td><a href="/panel/booking/'.$booking['id'].'">Посмотреть</a></td>
          <td><button id="delete-btn" class="btn btn-md btn-danger" data-id="'.$booking['id'].'">Удалить</button></td>
          </tr>
        
        ';
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
