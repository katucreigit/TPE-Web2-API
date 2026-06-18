<?php

    class SeleccionModel extends Model{

        public function __construct() {
        parent::__construct();
        }


        public function getAll() {
            $query = $this->db->prepare('SELECT * FROM seleccion');
            $query->execute();
            return $query->fetchAll(PDO::FETCH_OBJ);
        }
        
        public function getAllSorted($sort, $order) {
            if ($sort != 'pais' && $sort != 'cant_mundiales_ganados' &&
                $sort != 'participaciones_totales' && $sort != 'dt_seleccion') {
                    
                    $sort = 'pais';
            }

            if ($order != 'asc' && $order != 'desc') {
                $order = 'asc';
            }

            $query = $this->db->prepare("SELECT * FROM seleccion ORDER BY $sort $order");
            $query->execute();
            return $query->fetchAll(PDO::FETCH_OBJ);
        }

        public function getById($id_seleccion) {
            $query = $this->db->prepare("SELECT * FROM seleccion WHERE id_seleccion= ?");
            $query->execute([$id_seleccion]);
            return $query->fetch(PDO::FETCH_OBJ);
        }

        public function addSeleccion($pais, $dt_seleccion, $cant_mundiales_ganados, $participaciones_totales, $foto_seleccion){
            $query = $this->db->prepare("INSERT INTO seleccion (pais, dt_seleccion, cant_mundiales_ganados, participaciones_totales, foto_seleccion) VALUES (?, ?, ?, ?, ?)");
            $query->execute([$pais, $dt_seleccion, $cant_mundiales_ganados, $participaciones_totales, $foto_seleccion]);
            return $this->db->lastInsertId();
        }

        public function editSeleccion($id_seleccion,$pais, $dt_seleccion, $cant_mundiales_ganados, $participaciones_totales, $foto_seleccion ){
            $query = $this->db->prepare("UPDATE seleccion SET pais= ?, dt_seleccion= ?, cant_mundiales_ganados= ?, participaciones_totales=?, foto_seleccion = ? WHERE id_seleccion = ?");
            $query->execute ([$pais, $dt_seleccion, $cant_mundiales_ganados, $participaciones_totales, $foto_seleccion,$id_seleccion]);
            
        }

        public function deleteSeleccion($id_seleccion){
            $query= $this->db->prepare ("DELETE FROM seleccion WHERE id_seleccion = ?");
            $query->execute([$id_seleccion]);
        }

    public function getFiltered($campo, $valor) {

        $camposPermitidos = [
            'pais', 'cant_mundiales_ganados','participaciones_totales','dt_seleccion'];
    
        if (!in_array($campo, $camposPermitidos)) {
            return [];
        }
    
        $query = $this->db->prepare("SELECT * FROM seleccion WHERE $campo = ?");
        $query->execute([$valor]);
    
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    public function getAllPaginated($page, $limit) {

        if (!is_numeric($page) || !is_numeric($limit) || $page < 1 || $limit < 1) {
            return [];
        }
    
        $offset = ($page - 1) * $limit;
    
        $query = $this->db->prepare("SELECT * FROM seleccion LIMIT $limit OFFSET $offset" );
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }
}
?>