<?php

namespace Config;


// Create a new instance of our RouteCollection class.
$routes = Services::routes();

/*
 * --------------------------------------------------------------------
 * Router Setup
 * --------------------------------------------------------------------
 */
$routes->setDefaultNamespace('App\Controllers');
$routes->setDefaultController('Site');
$routes->setDefaultMethod('index');
$routes->setTranslateURIDashes(false);
$routes->set404Override();
// The Auto Routing (Legacy) is very dangerous. It is easy to create vulnerable apps
// where controller filters or CSRF protection are bypassed.
// If you don't want to define all routes, please use the Auto Routing (Improved).
// Set `$autoRoutesImproved` to true in `app/Config/Feature.php` and set the following to true.
// $routes->setAutoRoute(false);

/*
 * --------------------------------------------------------------------
 * Route Definitions
 * --------------------------------------------------------------------
 */

// We get a performance increase by specifying the default
// route since we don't have to scan directories.
$routes->get('/sitemap.xml', 'SiteMap::index');

$routes->get('/about', 'Site::about');

$routes->get('/', 'Site::index');
$routes->get('/login', 'Site::login');
$routes->post('/login', 'PanelController::Auth');
$routes->get('/panel', 'PanelController::Index', ['filter' => 'PanelAuth']);

$routes->get('/panel/add-camp', 'PanelController::addCampForm', ['filter' => 'PanelAuth']);
$routes->post('/panel/add-camp', 'PanelController::addCamp', ['filter' => 'PanelAuth']);

$routes->get('/panel/edit-camp/(:num)', 'PanelController::editCampForm/$1', ['filter' => 'PanelAuth']);
$routes->post('/panel/edit-camp/(:num)', 'PanelController::updateCamp/$1', ['filter' => 'PanelAuth']);

$routes->get('/panel/camp/(:num)/delete', 'PanelController::deleteCamp/$1', ['filter' => 'PanelAuth']);

// Работа со сменами лагеря
$routes->get('/panel/camp/(:num)/add-shift', 'ShiftController::AddShift/$1', ['filter' => 'PanelAuth']);
$routes->post('/panel/camp/(:num)/add-shift', 'ShiftController::InsertShift/$1', ['filter' => 'PanelAuth']);

$routes->get('/panel/camp/(:num)/shifts', 'ShiftController::AllShifts/$1', ['filter' => 'PanelAuth']);
$routes->get('/panel/shift/delete/(:num)', 'ShiftController::deleteShift/$1', ['filter' => 'PanelAuth']);

$routes->post('/panel/update-cover', 'PanelController::updateCover', ['filter' => 'PanelAuth']);

$routes->post('/panel/update-images', 'PanelController::updateImages', ['filter' => 'PanelAuth']);


$routes->get('/panel/logout', 'PanelController::Logout');
$routes->get('panel/booking', 'BookingController::index');
$routes->get('/registration', 'Registration::index');
$routes->post('/registration', 'Registration::save');

$routes->get('/camp/(:segment)', 'CampController::GetCamp/$1');



$routes->get('/camps/(:segment)/(:segment)/(:segment)', 'Site::FilterCamp/$1/$2/$3');
$routes->get('/camps/(:segment)/(:segment)/(:segment)/(:segment)', 'Site::FilterCamp/$1/$2/$3/$4'); // С возрастом
$routes->get('/camps/(:segment)/(:segment)/(:segment)/(:segment)/max-price-(:num)', 'Site::FilterCamp/$1/$2/$3/$4/$5'); // + цена
//$routes->get('/camps/(:any)/(:any)/(:any)/(:num)/max-price=(:num)', 'Site::FilterCamp/$1/$2/$3/$4/$5');

$routes->post('/review-insert', 'ReviewsController::ReviewInsert');

$routes->get('/admin', 'Admin::Index');
$routes->get('/admin/panel', 'Admin::Panel', ['filter' => 'Auth']);
$routes->get('/admin/panel/logout', 'Admin::Logout');
$routes->post('/admin', 'Admin::Auth');
$routes->get('/admin/representatives', 'Admin::AllRepresentatives', ['filter' => 'Auth']);
$routes->get('/admin/representatives/activated', 'Admin::ActivatedRepresentatives', ['filter' => 'Auth']);
$routes->get('/admin/representatives/notactivated', 'Admin::NotActivatedRepresentatives', ['filter' => 'Auth']);
$routes->get('/admin/representative/edit/(:num)', 'Admin::GetRepresentative/$1', ['filter' => 'Auth']);
$routes->post('/admin/representative/edit/(:num)', 'Admin::UpdateRepresentative', ['filter' => 'Auth']);
$routes->get('/admin/representative/delete/(:num)', 'Admin::deleteRepresentative/$1', ['filter' => 'Auth']);


// Бронирование путёвки
$routes->post('/booking', 'BookingController::Booking');

$routes->get('/panel/booking/delete/(:num)', 'BookingController::BookingDelete/$1');

/*
 * --------------------------------------------------------------------
 * Additional Routing
 * --------------------------------------------------------------------
 *
 * There will often be times that you need additional routing and you
 * need it to be able to override any defaults in this file. Environment
 * based routes is one such time. require() additional route files here
 * to make that happen.
 *
 * You will have access to the $routes object within that file without
 * needing to reload it.
 */
if (is_file(APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php')) {
    require APPPATH . 'Config/' . ENVIRONMENT . '/Routes.php';
}
