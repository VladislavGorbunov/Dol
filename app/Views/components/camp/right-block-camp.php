<!-- right-block -->

<div class="border p-3 rounded bg-white">
                    
    <div id="map" style="width: auto; height: 350px"></div>

        <div class="col-lg-12 mt-4">

            <div class="d-flex flex-row justify-content-around">
                <div>
                    <p><i class="las la-star" style="color:gold"></i> Рейтинг:
                    <b><?= round($reviews['rating'], 1) ?> из 5</b></p>
                </div>

                <div>
                    <p><i class="las la-comment"></i> Отзывов: <b><?= $reviews_count ?></b></p>
                 </div>
            </div>
            
            <div class="row">
                <div class="col-lg-6">
                  <a href="" class="btn-view-review text-center d-block mx-auto mb-2"><i class="las la-eye"></i> Читать отзывы</a>
                </div>

                <div class="col-lg-6">
                  <a href="#reviews-add" class="btn-add-review text-center d-block mx-auto mb-2">Написать отзыв</a>
                </div>
            </div>

            <?php
            // var_dump($organization);
            // die;
            ?>
        
            <div class="mt-4">
                <p><b>Организатор: </b><?= $organization['organization'] ?></p>
                <p><b>ИНН: </b><?= $organization['inn'] ?></p>
                <p><b>Работает с: </b><?= $camp['year'] ?> года</p>
                <p><b>База лагеря: </b><?= $camp_base = (!empty($camp['camp_base'])) ? $camp['camp_base'] : 'Не указана' ?></p>
                <p><b>Охраняемая территория:</b> <?= $securirty= ($camp['security'] == 1) ? 'Да' : 'Нет' ?></p>
                <p><b>Сайт лагеря:</b> <?= $site = (!empty($camp['site_link'])) ? '<a href="'.$camp['site_link'].'" style="color:#2955c8">' . $camp['site_link'] . '</a>' : 'Нет' ?></p>
                <p><b>ВКонтакте:</b> <?= $vk = (!empty($camp['vk_link'])) ? '<a href="'.$camp['vk_link'].'" style="color:#2955c8">' . $camp['vk_link'] . '</a>' : 'Нет' ?></p>
                <p><b>Телефон: </b></p>
                <p><b>Регион:</b> <?= $region['title'] ?></p>
                <p><b>Адрес:</b> <?= $camp['adress'] ?></p>
                <p><b>Возраст:</b> <?= 'от ' . $camp['min_age'] . ' до ' . $camp['max_age'] . ' лет'?>
                </p>
                
            </div>

                <p class="mt-3"><b>Направления лагеря:</b></p>
                    <div class="d-flex flex-wrap justify-content-start flex-row">
                    <?php
                        foreach ($types_camp as $type) {
                            echo '<a href="/camps/'.$region['slug'].'/'.$type['slug'].'/season-all"><div class="type m-1">' . $type['title'] . '</div></a>';
                        }
                    ?>
                    </div>

        </div>

</div>


                    
<div class="border mt-4 p-3 rounded bg-white">
    <h3>Бронирование</h3>


        <form action="/booking" method="post">
            
            <?php
                if (!empty($shift_arr)) {
                    echo '<label class="form-label mt-3">Выберите смену:</label>';
                    echo '<select id="shift_select" class="form-select shift-select mt-2 mb-3" name="shift_id">';
                        foreach ($shift_arr as $shift) {
                            echo '<option value="'.$shift['id'].'">'.$shift['title'].' | Дней: '.$shift['days'].' | '. $shift['price'] .' руб. | '. $shift['start_date'] .' - ' . $shift['end_date'] . '</option>';
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
                                    days_shift.innerHTML = '<p>' + textArr[1] +
                                    '</p>'; // Количество дней
                                    price_shift.innerHTML =
                                        '<p>Стоимость путёвки: <span style="font-size: 18px;font-weight: bold;">' +
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
                    echo '<label class="form-label" for="typeNumber" >Количество путёвок</label>
                          <input min="1" max="5" type="number" id="typeNumber" class="form-control mb-3" value="1" name="number_of_tickets" required/>
                          <input type="text" class="form-control mt-2 mb-3" placeholder="Ф.И.О" name="fio" >
                          <input type="tel" class="form-control mt-2 mb-3" placeholder="+7 (___) ___-__-__" name="telephone" data-phone-pattern = "+7 (___) ___-__-__" required>
                          <input type="email" class="form-control mt-2 mb-3" placeholder="Email" name="email" required>
                          <input type="hidden" name="camps_id_booking" value="'.$camp['camps_id'].'">
                    ';

                    echo '<p><i class="las la-check-circle" style="color: #21a663"></i> Бесплатное бронирование без комиссии</p>
                          <p><i class="las la-check-circle" style="color: #21a663"></i> Бесплатная отмена</p>
                          <p><i class="las la-check-circle" style="color: #21a663"></i> Договор напрямую с лагерем без посредников</p>
                          <p class="text-center mt-4" style="font-size:13px;">После отправки формы в течении дня с вами свяжется менеджер лагеря.</p>
                    ';

                    echo '<button type="submit" class="btn btn-booking mt-2 col-lg-12 d-block mx-auto">Забронировать путёвку</button>';
                } else {
                    echo '<p class="mt-3">На данный момент нет доступных смен или владелец лагеря не разместил информацию о них</p>';
                }

                ?>
                        </form>
                </div>



                
                <script type="text/javascript" src="https://vk.com/js/api/openapi.js?168"></script>

<!-- Put this div tag to the place, where the Group block will be -->
<?php 

preg_match_all('/\d+/', $camp['vk_link'], $matches);

if (!empty($matches[0][0])) {
    $vk_group_id = $matches[0][0];
} else {
    $vk_group_id = 5543764;
}


?>
<div class="col-lg-12 mt-4 p-3 rounded bg-white">
<div id="vk_groups" class="d-block mx-auto"></div></div>
<script type="text/javascript">
  VK.Widgets.Group("vk_groups", {mode: 4, wide: 1, width: "auto", height: 400, color1: "FFFFFF", color2: "000000", color3: "5181B8"}, <?= $vk_group_id ?>);
</script>