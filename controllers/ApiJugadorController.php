<?php
require_once __DIR__ . '/../models/JugadorModel.php';

class ApiJugadorController {

    private $model;

    public function __construct() {
        $this->model = new JugadorModel();
    }

    public function getById($req, $res) {

        $id_jugador = $req->params->id;
        $jugador = $this->model->getById($id_jugador);
    
        if (!$jugador) {
            return $res->json(['error' => 'No existe el jugador'],404);
        }
        return $res->json($jugador, 200);
    }

    public function getJugadoresPorSeleccion($req, $res) {

        $id_seleccion = $req->params->id;
        $jugadores = $this->model->getJugadoresPorSeleccion($id_seleccion);
        return $res->json($jugadores, 200);
    }
}
