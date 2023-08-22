<!-- right-block -->

<div class="border p-3 rounded bg-white">
                    
    <div id="map" style="width: auto; height: 300px"></div>

        <div class="col-lg-12 mt-4">

            <div class="d-flex flex-row justify-content-around">
                <div>
                    <p><i class="las la-star" style="color:gold"></i> Рейтинг:
                    <b><?= round($reviews['rating'], 2) ?> из 5</b></p>
                </div>

                <div>
                    <p><i class="las la-comment"></i> Отзывов: <b>0</b></p>
                 </div>
            </div>

            <a href="" class="btn-add-review d-block mx-auto text-center col-lg-9 d-block mx-auto">Оставить отзыв</a>
        
            <div class="mt-4">
                <p><b>Регион:</b> <?= $region['title'] ?></p>
                <p><b>Адрес:</b> <?= $camp['adress'] ?></p>
                <p><b>Год начала деятельности:</b> <?= $camp['year'] . ' год' ?></p>
                <p><b>Возраст:</b> <?= 'от ' . $camp['min_age'] . ' до ' . $camp['max_age'] . ' лет'?>
                </p>
            </div>

                <p class="mt-4"><b>Таматики лагеря:</b></p>
                    <div class="d-flex flex-wrap justify-content-start flex-row">
                    <?php
                        foreach ($types_camp as $type) {
                            echo '<div class="type m-1">' . $type['title'] . '</div>';
                        }
                    ?>
                    </div>
        </div>

</div>


                    
<div class="border mt-3 p-3 rounded bg-white">
    <h3 style="color:#405189">Бронирование</h3>


        <form action="/booking" method="post">
            
            <?php
                if (!empty($shift_arr)) {
                    echo '<label class="form-label mt-3">Выберите смену:</label>';
                    echo '<select id="shift_select" class="form-select shift-select mt-2 mb-3" name="shift_id">';
                        foreach ($shift_arr as $shift) {
                            echo '<option value="'.$shift['id'].'">'.$shift['title'].' | '.$shift['days'].' | '. $shift['price'] .' руб. | '. $shift['start_date'] .' - ' . $shift['end_date'] . '</option>';
                        }
                    echo '<option>Не определились со сменой</option>';
                    echo '</select>';

            ?>

        <div id="name_shift"></div>
        <div id="days_shift"></div>
        <div id="price_shift"></div>
        <div id="date_shift"></div>


                            <script>
                            let name_shift = document.getElementById("name_shift");
                            let days_shift = document.getElementById("days_shift");
                            let price_shift = document.getElementById("price_shift");
                            let date_shift = document.getElementById("date_shift");
                            let shift_select = document.getElementById("shift_select");

                            //name_shift.innerHTML = shift_select.options[shift_select.selectedIndex].text;

                            shiftData();

                            function shiftData() {

                                let text = shift_select.options[shift_select.selectedIndex].text;

                                let textArr = text.split('|');

                                if (textArr.length > 1) {

                                    name_shift.innerHTML = '<p>Название: ' + textArr[0] + '</p>'; // Название смены
                                    days_shift.innerHTML = '<p>Продолжительность: ' + textArr[1] +
                                    '</p>'; // Количество дней
                                    price_shift.innerHTML =
                                        '<p>Стоимость путёвки: <span style="font-size: 19px; font-weight: bold">' +
                                        textArr[2] + '</span></p>'; // Цена путёвки
                                    date_shift.innerHTML = '<p>Даты: ' + textArr[3] + '</p>'; // Дата
                                } else {
                                    name_shift.innerHTML = null; // Название смены
                                    days_shift.innerHTML = null; // Количество дней
                                    price_shift.innerHTML = null; // Цена путёвки
                                    date_shift.innerHTML = null; // Дата
                                }
                            }



                            shift_select.addEventListener('change', (e) => {
                                shiftData();
                            });
                            </script>
                            <hr>
                            <?php
                    echo '<label class="form-label" for="typeNumber">Количество путёвок</label>
                          <input min="1" max="5" type="number" id="typeNumber" class="form-control mb-3" value="1" required/>
                          <input type="text" class="form-control mt-2 mb-3" placeholder="Ф.И.О" name="fio" >
                          <input type="text" class="form-control mt-2 mb-3" placeholder="Телефон" name="telephone" required>
                          <input type="email" class="form-control mt-2 mb-3" placeholder="Email" name="email" required>
                          <input type="hidden" name="camps_id_booking" value="'.$camp['camps_id'].'">
                    ';

                    echo '<p><i class="las la-check-circle" style="color: #21a663"></i> Бесплатное бронирование без комиссии</p>
                          <p><i class="las la-check-circle" style="color: #21a663"></i> Бесплатная отмена</p>
                          <p><i class="las la-check-circle" style="color: #21a663"></i> Договор напрямую с лагерем без посредников</p>
                          <p class="text-center mt-4" style="font-size:13px;">После отправки формы в течении дня с вами свяжется менеджер лагеря.</p>
                    ';

                    echo '<button type="submit" class="btn btn-booking mt-2 col-lg-9 d-block mx-auto">Забронировать путёвку</button>';
                } else {
                    echo '<p class="mt-3">На данный момент нет доступных смен.</p>';
                }

                ?>
                        </form>
                </div>


