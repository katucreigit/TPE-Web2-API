<?php

require_once 'config.php';


class Model {
    protected $db;

    public function __construct() {
            $this->db = new PDO(
                "mysql:host=" . MYSQL_HOST . ";charset=utf8",
                MYSQL_USER,
                MYSQL_PASS
            );
            $this->db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
}
            