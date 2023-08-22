<div class="bg-white rounded p-3">
<?= '<img src="'.$cover.'" class="camp-photos" width="100%" height="450px">' ?>

<div class="row mt-1 g-2">
    <?php
        for ($i = 0; $i < count($images); $i++) {
            echo '<div class="col-lg-2 mt-2 g-2"><img src="'.$images[$i].'" class="img-fluid camp-photos"></div>';
        }
    ?>
</div>
    </div>