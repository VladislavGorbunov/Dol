<div class="col py-3">

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Название</th>
      
      <th scope="col">Статус</th>
      <th scope="col">Действия</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>

  <?php
    foreach ($camps as $camp) : ?>
                <tr>
                <th scope="row"><?= $camp['camps_id'] ?></th>
                <td><a href="/admin/camp/edit/<?= $camp['camps_id'] ?>"><?= $camp['title'] ?></a></td>
                
                <td><?= ($camp['status'] == 1) ? 'Активный' : 'Ожидает проверки' ?></td>
                <td>
                  <a href="/admin/camp/delete/<?= $camp['camps_id'] ?>">Удалить</a>
                </td>
                <td>
                  <?php
                      if ($camp['status'] != 1) {
                        echo '<a href="/admin/camp/activate/' . $camp['camps_id']  .'">Активировать</a>';
                      } else {
                        echo '<a href="/admin/camp/deactivate/' . $camp['camps_id']  .'">Деактивировать</a>';
                      }
                  ?>
                </td>
              </tr>
            <?php endforeach ?>
      

</tbody>
</table>



<?php echo $pager->links() ?>
    </div>

