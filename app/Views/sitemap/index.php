<!doctype html>
<html lang="ru">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Пример на bootstrap 5: Слайдер -
      навигационная панель, карусель и новые компоненты · Версия v5.3.0-alpha1">
    <meta name="theme-color" content="#2955c8">
    <title>Слайдер | Carousel Template for Bootstrap · Версия v5.3.0-alpha1</title>
    <!-- Bootstrap core CSS -->
    <link href="/public/bootstrap-5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->
    <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
    <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
    <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
    <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
    <meta name="theme-color" content="#7952b3">

    <!-- Custom styles for this template -->
    <link href="/public/css/main.css" rel="stylesheet">
</head>

<body>
    <div class="container">
<div class="row">

<?php

foreach ($cities as $key => $city) {
    echo '<div class="col-lg-3 border">';
    echo '<h5>'.$city['title'].'</h5>';

    foreach ($types as $key => $type) {
        echo '<p><a href="/camps/' .$city['slug'] .'/ '. $type['slug'] .' ">' . $type['title'] . '</a></p>';
    }

    echo '</div>';

}

?>

</div>
</div>

</body>