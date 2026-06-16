<?php

require_once 'config.php';

// hay que acomodarlos 

class Model {
    protected $db;

    public function __construct() {
        try {
            $this->db = new PDO(
                "mysql:host=" . MYSQL_HOST . ";charset=utf8",
                MYSQL_USER,
                MYSQL_PASS
            );
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $this->db->query("CREATE DATABASE IF NOT EXISTS " . MYSQL_DB . " CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;");
            
            $this->db->query("USE " . MYSQL_DB);


            $this->_deploy();

        } catch (PDOException $e) {
            die("Error de conexión o base de datos: " . $e->getMessage());
        }
    }

    private function _deploy() {
        $query = $this->db->query('SHOW TABLES');
        $tables = $query->fetchAll();
        
        if(count($tables) == 0) {
            

            $sql = <<<END

            CREATE TABLE IF NOT EXISTS seleccion (
                id_seleccion int(11) AUTO_INCREMENT PRIMARY KEY,
                cant_mundiales_ganados int(11) NOT NULL,
                pais varchar(40) NOT NULL,
                participaciones_totales int(11) NOT NULL,
                dt_seleccion varchar(30) NOT NULL,
                foto_seleccion TEXT NOT NULL
            ) ENGINE=InnoDB;

            CREATE TABLE IF NOT EXISTS jugador (
                `id_jugador` int(11)AUTO_INCREMENT PRIMARY KEY,
                `nombre` varchar(60) NOT NULL,
                `posicion` varchar(20) NOT NULL,
                `numero` int(11) NOT NULL,
                `peso` double NOT NULL,
                `altura` double NOT NULL,
                `fecha_nacimiento` date NOT NULL,
                `id_seleccion` int(11) NOT NULL,
                `foto_jugador` text NOT NULL,
                FOREIGN KEY (id_seleccion) REFERENCES seleccion(id_seleccion) ON DELETE CASCADE
            ) ENGINE=InnoDB;

    
            INSERT INTO seleccion (id_seleccion, pais, dt_seleccion, cant_mundiales_ganados, participaciones_totales, foto_seleccion) 
            VALUES (1, 'Argentina', 'Lionel Scaloni', 3, 18, 'argentina.jpg');


            INSERT INTO jugador (nombre, posicion, numero, peso, altura, fecha_nacimiento, id_seleccion, foto_jugador) 
            VALUES ('Lionel Messi', 'Delantero', 10, 72, 1.70, '1987-06-24', 1, 'messi.jpg');
END;

            $this->db->query($sql);
        }
    }
}