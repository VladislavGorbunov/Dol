<?php

$out = '<?xml version="1.0" encoding="UTF-8"?>';

$out .= '
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';

foreach ($cities as $key => $city) {
    
    foreach ($types as $key => $type) {
        
        $out .= '
	    <url>
		<loc>'. $_SERVER["HTTP_HOST"] .'/camps/' . $city['slug'] . '/' . $type['slug'] . '</loc>
	    </url>';
    }

   
}

$out .= '</urlset>';

header('Content-Type: text/xml; charset=utf-8');
echo $out;
exit();

?>

