<?php
require_once 'Model.php';
    class UserModel extends Model{

        public function __construct() {
        parent::__construct();
        }

    public function getUser($username) {
        $query = $this->db->prepare('SELECT * FROM usuario WHERE username = ?');
        $query->execute([$username]);
        return $query->fetch(PDO::FETCH_OBJ);
    }
}