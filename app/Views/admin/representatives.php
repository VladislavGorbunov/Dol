<!-- содержимое -->
<div class="col py-3">

<div class="row">
  <div class="col-lg-8">
    <input type="text" class="form-control inn" placeholder="Введите ИНН">
    <span class="msg d-block mt-2 mb-2"></span>
  </div>

  <div class="col-auto">
    <button type="submit" class="btn btn-primary mb-3 search">Найти</button>
  </div>
</div>



<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Организация</th>
      <th scope="col">ИНН</th>
      <th scope="col">Представитель</th>
      <th scope="col">Должность</th>
      <th scope="col">Телефон</th>
      <th scope="col">Активен</th>
      <th scope="col">Действия</th>
    </tr>
  </thead>
  <tbody>

        <?php
            foreach ($representatives as $represent) : ?>
                <tr>
                <th scope="row"><?= $represent['user_id'] ?></th>
                <td><a href="/admin/representative/edit/<?= $represent['user_id'] ?>"><?= $represent['organization'] ?></a></td>
                <td><?= $represent['inn'] ?></td>
                <td><?= $represent['firstname_manager'] .' '. $represent['lastname_manager'] ?></td>
                <td><?= $represent['post'] ?></td>
                <td><?= $represent['phone_manager'] ?></td>
                <td><?= $represent['activated'] == 1 ? 'Да' : 'Нет' ?></td>
                <td><a href="/admin/representative/delete/<?= $represent['user_id'] ?>">Удалить</a></td>
              </tr>
            <?php endforeach ?>
      

</tbody>
</table>

<?= $pager->links() ?>

</div>


<script>
const inn = document.querySelector('.inn')
const btnSearch = document.querySelector('.search')
const msg = document.querySelector('.msg')
const data = new FormData()

btnSearch.addEventListener('click', () => {
  data.append('inn', inn.value)

  fetch('/admin/search-representative', {
      method: 'POST',
      body: data
  })
  .then(res => res.json())
  .then(data => {
    if (data.success == true) {
      window.location.href = `/admin/representative/edit/${data.representative.user_id}`;
    } else {
      msg.innerHTML = 'Организация с данным ИНН не найдена.'
    }
  })


})
</script>