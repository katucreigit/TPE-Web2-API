<?php
require_once 'Model.php';
    class JugadorModel extends Model{

        public function __construct() {
        parent::__construct();
        }

        public function getById($id_jugador) {
            $query = $this->db->prepare(' SELECT j.*, s.pais AS Seleccion
                                            FROM jugador j
                                            JOIN seleccion s ON j.id_seleccion = s.id_seleccion
                                            WHERE j.id_jugador = ?');
            $query->execute([$id_jugador]);

            return $query->fetch(PDO::FETCH_OBJ);
        }

        public function getJugadoresPorSeleccion($id_seleccion) {
            $query = $this->db->prepare("SELECT * FROM jugador WHERE id_seleccion = ?");
            $query->execute([$id_seleccion]);
            return $query->fetchAll(PDO::FETCH_OBJ);
        }
    }

?>