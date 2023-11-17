
<div class="mt-3">

    <div class="border p-3 mt-4 bg-white rounded">
        <h2 class="text-center">О лагере: <span style="color:#38b976"><?= $camp['title'] ?></span></h3>

        <div class="d-flex flex-wrap justify-content-start flex-row mt-2 mb-2">
                    <?php
                        foreach ($types_camp as $type) {
                            echo '<a href="/camps/'.$region['slug'].'/'.$type['slug'].'/season-all"><div class="type m-1">' . $type['title'] . '</div></a>';
                        }
                    ?>
                    </div>

        <?= $camp['description'] ?>
    </div>

    <div class="border mt-4 p-3 bg-white rounded">
        <h2 class="text-center">Преимущества</h3>
        <?= $camp['advantages'] ?>
    </div>

    <div class="border mt-4 p-3 bg-white rounded">
        <h2 class="text-center">Размещение</h3>
        <?= $camp['placement'] ?>
    </div>

    <div class="border mt-4 p-3 bg-white rounded">
        <h2 class="text-center">Распорядок дня</h3>
        <?= $camp['daily_schedule'] ?>
    </div>
    
</div>


