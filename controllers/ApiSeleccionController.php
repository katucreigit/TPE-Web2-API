<?php
require_once __DIR__ . '/../models/SeleccionModel.php';

class ApiSeleccionController {
    private $model;

    public function __construct() {

        $this->model = new SeleccionModel();
    }

    public function getAll($req, $res){

        $campo = $req->query->filter ?? null;
        $valor = $req->query->value ?? null;
    
        $sort = $req->query->sort ?? null;
        $order = $req->query->order ?? 'asc';
    
        $page = $req->query->page ?? null;
        $limit = $req->query->limit ?? null;
    
        if ($campo && $valor) {
            $selecciones = $this->model->getFiltered($campo, $valor);
    
        } else if ($sort) {
            $selecciones = $this->model->getAllSorted($sort, $order);
    
        } else if ($page && $limit) {
            $selecciones = $this->model->getAllPaginated($page, $limit);
    
        } else {
            $selecciones = $this->model->getAll();
        }
    
        return $res->json($selecciones, 200);
    }

    public function getById($req, $res) {

        $id_seleccion = $req->params->id;
    
        $seleccion = $this->model->getById($id_seleccion);
    
        if (!$seleccion) {
            return $res->json(['error' => 'No existe la selección'],404);
        }
    
        return $res->json($seleccion, 200);
    }

    public function update($req, $res) {
        if (!$req->user) {
            return $res->json("No autorizado", 401);
        }

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


    public function create($req, $res) {

        if (!$req->user) {
            return $res->json("No autorizado", 401);
        }

        $pais = $req->body->pais ?? null;
        $dt_seleccion = $req->body->dt_seleccion ?? null;
        $cant_mundiales_ganados = $req->body->cant_mundiales_ganados ?? null;
        $participaciones_totales = $req->body->participaciones_totales ?? null;
        $foto_seleccion = $req->body->foto_seleccion ?? null;
    
        if (
            empty($pais) ||
            empty($dt_seleccion) ||
            $cant_mundiales_ganados === null ||
            $participaciones_totales === null ||
            empty($foto_seleccion)
        ) {
            return $res->json('Falta completar datos', 400);
        }
    
        $id_seleccion = $this->model->addSeleccion(
            $pais,
            $dt_seleccion,
            $cant_mundiales_ganados,
            $participaciones_totales,
            $foto_seleccion
        );
    
        if (!$id_seleccion) {
            return $res->json('Error al insertar', 500);
        }
    
        $seleccion = $this->model->getById($id_seleccion);
    
        return $res->json($seleccion, 201);
    }

    public function delete($req, $res) {

        $id_seleccion = $req->params->id;
        $seleccion = $this->model->getById($id_seleccion);
    
        if (!$seleccion) {
            return $res->json( "La selección con el id=$id_seleccion no existe",404);
        }
    
        $this->model->deleteSeleccion($id_seleccion);
        return $res->json("La selección con el id=$id_seleccion fue eliminada",200);
    }

}