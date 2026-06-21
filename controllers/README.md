# API REST - Álbum Mundial

## Descripción

API REST en PHP para gestionar selecciones, jugadores y partidos de un álbum del Mundial.

## Autenticación

### Obtener token

GET /api/auth/token

Header:
Authorization: Basic base64(username:password)

### Uso del token

Para POST, PUT y DELETE:

Authorization: Bearer <token>


## Selecciones

### GET todas

GET /api/selecciones

Opcional:
- filter y value
- sort y order
- page y limit

Ejemplos:
GET /api/selecciones?filter=pais&value=Argentina
GET /api/selecciones?sort=pais&order=asc
GET /api/selecciones?page=1&limit=5


### GET por ID

GET /api/selecciones/:id


### POST

POST /api/selecciones

Body:
{
  "pais": "Argentina",
  "dt_seleccion": "Scaloni",
  "cant_mundiales_ganados": 3,
  "participaciones_totales": 19,
  "foto_seleccion": "url"
}


### PUT

PUT /api/selecciones/:id

Body igual al POST.


### DELETE

DELETE /api/selecciones/:id


## Partidos

### GET todos

GET /api/partidos

Opcional:
?fase=Grupos


### GET por ID

GET /api/partidos/:id

### POST

POST /api/partidos

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

### GET por selección

GET /api/jugadores/seleccion/:id

## Códigos de respuesta

200, 201, 400, 401, 404, 500