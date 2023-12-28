<div class="container">
    <p>Лагерь: <?= $bookings['camp']['title'] ?></p>
    <p>Количество бронируемых путёвок: <?= $bookings['number_of_tickets'] ?></p>
    <p>Ф.И.О клиента: <?= $bookings['fio'] ?></p>
    <p>Телефон клиента: <?= $bookings['telephone'] ?></p>
    <p>Email клиента: <?= $bookings['email'] ?></p>
    <p>Номер бронирования: <?= $bookings['booking_number'] ?></p>
    <p>Дата бронирования: <?= $bookings['date_booking'] ?></p>
    <p>Смена: <?= $bookings['shift']['title'] ?></p>
    <p>Стоимость одной путёвки: <?= $bookings['shift']['price'] ?> рублей</p>
    <?php 
        $start_date = explode('-', $bookings['shift']['start_date']);
        $end_date = explode('-', $bookings['shift']['end_date']);
    ?>
    <p>Начало смены: <?= $start_date[2] .'.'. $start_date[1] .'.'. $start_date[0] ?></p>
    <p>Конец смены: <?= $end_date[2] .'.'. $end_date[1] .'.'. $end_date[0] ?></p>
    <div class="col-lg-3">
        <div class="row">
            <div class="col-auto"><p>Статус заявки:</p></div>
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
    </div>
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