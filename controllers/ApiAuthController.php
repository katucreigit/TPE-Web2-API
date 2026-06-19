<?php
require_once './app/models/user.model.php';
require_once './libs/jwt/jwt.php';

class AuthApiController {
    private $userModel;

    public function __construct() {
        $this->userModel = new UserModel();
    }

    public function login($req, $res) {

        $authorization = $req->authorization;

        $auth = explode(' ', $authorization);

        if (count($auth) != 2 || $auth[0] != 'Basic') {
            header("WWW-Authenticate: Basic realm='Get a token'");
            return $res->json("Autenticación no válida", 401);
        }

        $auth = base64_decode($auth[1]);

        $user_pass = explode(':', $auth);

        if (count($user_pass) != 2) {
            return $res->json("Autenticación no válida", 401);
        }

        $username = $user_pass[0];
        $password = $user_pass[1];

        $userFromDB = $this->loginModel->getUser($username);

        if (!$userFromDB || !password_verify($password, $userFromDB->password)) {
            return $res->json("Usuario o contraseña incorrecta", 401);
        }

        $payload = [
            'sub' => $userFromDB->id_usuario,
            'username' => $userFromDB->username,
            'exp' => time() + 3600
        ];

        return $res->json(createJWT($payload));
    }
}