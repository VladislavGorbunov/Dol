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
//   echo '<pre>';
//     print_r($data_bookings);
//     echo '</pre>';
    // die;
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
          </tr>
        
        ';
    }
    ?>
    
  </tbody>
</table>
    


