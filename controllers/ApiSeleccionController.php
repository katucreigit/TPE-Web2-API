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

    public function getById($req, $res) {

        $id = $req->params->id;
    
        $seleccion = $this->model->getById($id);
    
        if (!$seleccion) {
            return $res->json(['error' => 'No existe la selección'],404);
        }
    
        return $res->json($seleccion, 200);
    }

    public function update($req, $res) {
        $id_seleccion = $req->params->id;
        $seleccion = $this->model->getById($id_seleccion);

        if (!$seleccion) {
            return $res->json("La selección con el id=$id_seleccion no existe", 404);
        }

        $pais = $req->body->pais ?? null;
        $cant_mundiales_ganados = $req->body->cant_mundiales_ganados ?? null;
        $participaciones_totales = $req->body->participaciones_totales ?? null;
        $dt_seleccion = $req->body->dt_seleccion ?? null;
        $foto_seleccion = $req->body->foto_seleccion ?? null;

        if (empty($pais) ||  $cant_mundiales_ganados === null || $participaciones_totales === null ||
            empty($dt_seleccion) || empty($foto_seleccion)) {

            return $res->json('Falta completar datos', 400);
        }

        $this->model->editSeleccion($id_seleccion,$pais, $dt_seleccion, $cant_mundiales_ganados, $participaciones_totales, $foto_seleccion);
        
        $seleccion = $this->model->getById($id_seleccion);
        return $res->json($seleccion, 200);
    }
}