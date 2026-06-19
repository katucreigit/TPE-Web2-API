<?php
require_once __DIR__ . '/../models/PartidoModel.php';

class ApiPartidoController {

    private $model;

    public function __construct() {

        $this->model = new PartidoModel();
    }

    public function getAll($req, $res) {

        $fase = $req->query->fase ?? null;
    
        if ($fase) {
            $partidos = $this->model->getByFase($fase);
        }
        else {
            $partidos = $this->model->getAll();
        }
    
        return $res->json($partidos, 200);
    }

    public function getById($req, $res) {

        $id_partido = $req->params->id;
        $partido = $this->model->getById($id_partido);
    
        if (!$partido) {
            return $res->json(['error' => 'No existe el partido'],404);
        }
    
        return $res->json($partido, 200);
    }

    public function create($req, $res) {

        $fecha = $req->body->fecha ?? null;
        $estadio = $req->body->estadio ?? null;
        $fase = $req->body->fase ?? null;
        $goles_local = $req->body->goles_local ?? null;
        $goles_visitante = $req->body->goles_visitante ?? null;
        $seleccion_local = $req->body->seleccion_local ?? null;
        $seleccion_visitante = $req->body->seleccion_visitante ?? null;
    
        if (
            empty($fecha) ||
            empty($estadio) ||
            $goles_local === null ||
            $goles_visitante === null ||
            empty($seleccion_local) ||
            empty($seleccion_visitante)
        ) {
            return $res->json('Falta completar datos', 400);
        }
    
        $id_partido = $this->model->addPartido($fecha, $estadio, $fase, $goles_local, $goles_visitante, $seleccion_local, $seleccion_visitante);
    
        if (!$id_partido) {
            return $res->json('Error al insertar partido', 500);
        }
    
        $partido = $this->model->getById($id_partido);
    
        return $res->json($partido, 201);
    }
}