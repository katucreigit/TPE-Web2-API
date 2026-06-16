<?php

require_once './libs/router/router.php';

require_once './api/controllers/ApiSeleccionController.php';

$router = new Router();

#               URL              VERBO   CONTROLADOR              METODO
$router->addRoute('selecciones', 'GET', 'ApiSeleccionController', 'getAll');

$router->addRoute('selecciones/:id', 'GET', 'ApiSeleccionController', 'getById');

$router->addRoute('selecciones', 'POST', 'ApiSeleccionController', 'create');

$router->addRoute('selecciones/:id', 'PUT', 'ApiSeleccionController', 'update');

$router->addRoute('selecciones/:id', 'DELETE', 'ApiSeleccionController', 'delete');


# ejecuta router
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);