<?php

require_once './libs/router/router.php';

require_once './api/controllers/ApiSeleccionController.php';
require_once './api/controllers/ApiJugadorController.php';
require_once './api/controllers/ApiPartidoController.php';

require_once './app/controllers/auth.api.controller.php';
require_once './app/middlewares/jwt.middleware.php';

$router = new Router();

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