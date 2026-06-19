<?php

require_once './models/Model.php';
    class PartidoModel extends Model{

        public function __construct() {
        parent::__construct();
        }

        public function getAll() {
            $query = $this->db->prepare("SELECT * FROM partido");
            $query->execute();
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

        public function getByFase($fase) {
            $query = $this->db->prepare("SELECT * FROM partido WHERE fase = ?");
            $query->execute([$fase]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

        public function getById($id_partido) {
            $query = $this->db->prepare("SELECT * FROM partido WHERE id_partido= ?");
            $query->execute([$id_partido]);
            return $query->fetch(PDO::FETCH_OBJ);
        }

        public function addPartido($fecha, $estadio, $fase, $goles_local, $goles_visitante, $seleccion_local, $seleccion_visitante){
            $query = $this->db->prepare("INSERT INTO partido (fecha, estadio, fase, goles_local, goles_visitante, seleccion_local, seleccion_visitante) VALUES (?, ?, ?, ?, ?, ?, ?)");
            $query->execute([$fecha, $estadio, $fase, $goles_local, $goles_visitante, $seleccion_local, $seleccion_visitante]);
            return $this->db->lastInsertId();
        }
    }