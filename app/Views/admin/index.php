<!-- содержимое -->
<div class="col py-3">
        <?php
            foreach ($representatives as $represent) {
                echo $represent['organization'] . '<hr>';
            }
        ?>
</div>
       