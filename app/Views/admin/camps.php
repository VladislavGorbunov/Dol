<div class="col py-3">

<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Название</th>
      
      <th scope="col">Статус</th>
      <th scope="col">Действия</th>
    </tr>
  </thead>
  <tbody>

  <?php
    foreach ($camps as $camp) : ?>
                <tr>
                <th scope="row"><?= $camp['camps_id'] ?></th>
                <td><a href="/admin/camp/edit/<?= $camp['camps_id'] ?>"><?= $camp['title'] ?></a></td>
                
                <td><?= ($camp['status'] == 'active') ? 'Активный' : 'Ожидает проверки' ?></td>
                <td><a href="/admin/camp/delete/<?= $camp['camps_id'] ?>">Удалить</a></td>
              </tr>
            <?php endforeach ?>
      

</tbody>
</table>



<?php echo $pager->links() ?>
    </div>

