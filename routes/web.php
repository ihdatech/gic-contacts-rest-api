<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/contact/{id}', 'ContactController@firstContact');
$router->get('/contact', 'ContactController@getContact');
$router->post('/contact', 'ContactController@insertContact');
$router->put('/contact/{id}', 'ContactController@updateContact');
$router->delete('/contact/{id}', 'ContactController@deleteContact');
