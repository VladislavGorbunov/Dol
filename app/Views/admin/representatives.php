<!-- содержимое -->
<div class="col py-3">


<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Организация</th>
      <th scope="col">ИНН</th>
      <th scope="col">Представитель</th>
      <th scope="col">Должность</th>
      <th scope="col">Телефон</th>
      <th scope="col">Лагеря</th>
    </tr>
  </thead>
  <tbody>

        <?php
            foreach ($representatives as $represent) {
                echo '<tr>
                <th scope="row">'. $represent['user_id'] .'</th>
                <td><a href="/admin/representative/edit/'. $represent['user_id'] .'">'. $represent['organization'] .'</a></td>
                <td>'. $represent['inn'] .'</td>
                <td>'. $represent['firstname_manager'] .' '. $represent['lastname_manager'] .'</td>
                <td>'. $represent['post'] .'</td>
                <td>'. $represent['phone_manager'] .'</td>
                <td><a href="/admin/representative/view/'. $represent['user_id'] .'">Смотреть</a></td>
              </tr>';
            }
        ?>

</tbody>
</table>

<?= $pager->links() ?>

</div>