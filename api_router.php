<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
require_once './libs/router/router.php';

require_once './controllers/ApiSeleccionController.php';
require_once './controllers/ApiJugadorController.php';
require_once './controllers/ApiPartidoController.php';

require_once './controllers/ApiAuthController.php';
require_once './libs/jwt/JWTMiddleware.php';

$router = new Router();
$router->addMiddleware(new JWTMiddleware());

#               URL              VERBO   CONTROLADOR              METODO
//selecciones
$router->addRoute('selecciones', 'GET', 'ApiSeleccionController', 'getAll');

$router->addRoute('selecciones/:id', 'GET', 'ApiSeleccionController', 'getById');

$router->addRoute('selecciones', 'POST', 'ApiSeleccionController', 'create');

$router->addRoute('selecciones/:id', 'PUT', 'ApiSeleccionController', 'update');

$router->addRoute('selecciones/:id', 'DELETE', 'ApiSeleccionController', 'delete');

 //jugadores
$router->addRoute('jugadores/seleccion/:id','GET','ApiJugadorController','getJugadoresPorSeleccion');

//partidos
$router->addRoute('partidos','GET','ApiPartidoController','getAll');

$router->addRoute('partidos/:id','GET','ApiPartidoController','getById');

$router->addRoute('partidos','POST','ApiPartidoController','create');

//auth
$router->addRoute('auth/token', 'GET','AuthApiController','login');


# ejecuta router
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);