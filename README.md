# API RESTful - Álbum virtual del mundial

## Descripción

API RESTful en PHP para gestionar selecciones, jugadores y partidos de un álbum virtual del mundial.

## Endpoints disponibles

### Autenticación
- GET /api/auth/token

### Selecciones
- GET /api/selecciones
- GET /api/selecciones/:id
- POST /api/selecciones
- PUT /api/selecciones/:id
- DELETE /api/selecciones/:id

### Partidos
- GET /api/partidos
- GET /api/partidos/:id
- POST /api/partidos

### Jugadores
- GET /api/jugadores/seleccion/:id

## Documentación de los endpoints

## Autenticación

La API utiliza JWT para proteger las operaciones de modificación.

### Obtener token

**GET** /api/auth/token

Se debe enviar autenticación Basic:

Header:
Authorization: Basic base64(username:password)

Usuario de prueba:
- Usuario: webadmin  
- Contraseña: admin

### Uso del token

El token obtenido debe enviarse en el header Authorization para las operaciones protegidas:
- POST
- PUT
- DELETE

Header:
Authorization: Bearer <token>

## Selecciones

### Obtener todas

**GET** /api/selecciones

Parámetros opcionales:
- filter y value: permiten filtrar por cualquier campo.
- sort y order: permiten ordenar por cualquier campo en forma ascendente o descendente.
- page y limit: permiten paginar los resultados.

Ejemplos:
- GET /api/selecciones?filter=pais&value=Argentina
- GET /api/selecciones?sort=pais&order=asc
- GET /api/selecciones?page=1&limit=5


### Obtener una seleccion por ID

**GET** /api/selecciones/:id


### Agregar una seleccion

**POST** /api/selecciones

Body:
{
  "pais": "Argentina",
  "dt_seleccion": "Scaloni",
  "cant_mundiales_ganados": 3,
  "participaciones_totales": 19,
  "foto_seleccion": "url"
}


### Editar una seleccion por Id

**PUT** /api/selecciones/:id

Body igual al POST.


### Eliminar una seleccion por Id

**DELETE** /api/selecciones/:id


## Partidos

### Obtener todos los partidos

**GET** /api/partidos

Opcional:
-Filtrar por fase

Ejemplo:
- GET /api/partidos?fase=Grupos


### Obtener un partido por ID

**GET** /api/partidos/:id

### Agregar un partido

**POST** /api/partidos

Body:
{
  "fecha": "2026-06-20",
  "estadio": "Estadio Azteca",
  "fase": "Grupos",
  "goles_local": 2,
  "goles_visitante": 1,
  "seleccion_local": 1,
  "seleccion_visitante": 2
}

## Jugadores

### Obtener jugadores por selección

**GET** /api/jugadores/seleccion/:id

## Códigos de respuesta
- 200 OK
- 201 Created
- 400 Bad Request
- 401 Unauthorized
- 404 Not Found
- 500 Internal Server Error
