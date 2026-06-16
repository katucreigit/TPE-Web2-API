<?php
require_once __DIR__ . '/../models/SeleccionModel.php';

class ApiSeleccionController {

    private $model;

    public function __construct() {

        $this->model = new SeleccionModel();
    }

    public function getAll($req, $res){
        $sort = $req->query->sort ?? null;

        $order = $req->query->order ?? 'asc';

        if ($sort) {
            $selecciones = $this->model->getAllSorted($sort, $order);
        } else {
            $selecciones = $this->model->getAll();
        }

        return $res->json($selecciones, 200);
    }

}