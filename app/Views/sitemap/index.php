<?php

$out = '<?xml version="1.0" encoding="UTF-8"?>';

$out .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

foreach ($cities as $city_key => $city) {
    $out .= '
    <url>
    <loc>' . $city['slug'] . '/type-all/season-all/ </loc>
    </url>';

    foreach ($types as $type_key => $type) {
        $out .= '
        <url>
        <loc>' . $city['slug'] . '/' . $type['slug'] . '/season-all/ </loc>
        </url>';
        
        foreach ($seasons as $key => $season) {
            $out .= '
            <url>
            <loc>' . $city['slug'] . '/' . $type['slug'] . '/'. $season['slug'] . '</loc>
            </url>';
        }
    }

    
}

$out .= '</urlset>';

header('Content-Type: text/xml; charset=utf-8');
echo $out;
exit();

?>

