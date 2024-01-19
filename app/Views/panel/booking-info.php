<div class="container">

<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="/panel/booking">Бронирования</a></li>
    <li class="breadcrumb-item active" aria-current="page">Информация по заявке</li>
  </ol>
</nav>

    <?php 
        $start_date = explode('-', $bookings['shift']['start_date']);
        $end_date = explode('-', $bookings['shift']['end_date']);
    ?>
    

    <table class="table table-hover mt-2">
	<tbody>
		<tr>
			<td><b>Лагерь:</b> <?= $bookings['camp']['title'] ?></td>
			<td><b>Количество бронируемых путёвок:</b> <?= $bookings['number_of_tickets'] ?></td>
			<td><b>Ф.И.О клиента:</b> <?= $bookings['fio'] ?></td>
		</tr>
		<tr>
			<td><b>Телефон клиента:</b> <?= $bookings['telephone'] ?></td>
			<td><b>Email клиента:</b> <?= $bookings['email'] ?></td>
			<td><b>Номер бронирования:</b> <?= $bookings['booking_number'] ?></td>
		</tr>
		<tr>
			<td><b>Дата бронирования:</b> <?= $bookings['date_booking'] ?></td>
			<td><b>Смена:</b> <?= $bookings['shift']['title'] ?></td>
			<td><b>Стоимость одной путёвки:</b> <?= $bookings['shift']['price'] ?> рублей</td>
		</tr>
		<tr>
			<td><b>Начало смены:</b> <?= $start_date[2] .'.'. $start_date[1] .'.'. $start_date[0] ?></td>
			<td><b>Конец смены:</b> <?= $end_date[2] .'.'. $end_date[1] .'.'. $end_date[0] ?></td>
			<td>
            <div class="row">
            <div class="col-auto"><p><b>Статус заявки:</b></p></div>
            <div class="col">
            <form action="" method="post" class="update-status">
            <select class="form-select status" name="status">

        <?php if ($bookings['confirmed']) : ?>
            <option selected value="1">Обработана</option>
            <option value="0">Необработана</option>
        <?php else : ?>
            <option selected value="0">Необработана</option>
            <option value="1">Обработана</option>
        <?php endif ?>
        
            </select>
            </form>
            </div>
        </div>
            </td>
		</tr>
	</tbody>
</table>


</div>

<script>
    let status_select = document.querySelector('.status')
    const updateStatusForm = document.querySelector('.update-status')
    const id_booking = "<?= $bookings['id'] ?>"
    const status_value = status_select.value
    let updateStatus
    
    status_select.addEventListener('change', () => {
        updateStatus = new FormData(updateStatusForm)
        updateStatus.append('id_booking', id_booking)
        updateBookingStatus()
    })

    async function updateBookingStatus()
    {
        let response = await fetch('/panel/update-status-booking', {method: 'POST', body: updateStatus})
        let data = await response.json()
        console.log(data)
    }
</script>

<?php

//dd($bookings);

?>