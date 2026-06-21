# API RESTful - Álbum virtual del mundial

## Descripción

API RESTful en PHP para gestionar selecciones, jugadores y partidos de un álbum virtual del mundial.

## Autenticación

### Obtener token

GET /api/auth/token

Header:
Authorization: Basic base64(username:password)

### Uso del token

Para POST, PUT y DELETE:

Authorization: Bearer <token>


## Selecciones

### Obtener todas

GET /api/selecciones

Opcional:
- filter y value(podes elegir un campo y un valor para filtrar selecciones)
- sort y order(podes ordenar por un campo y orden las selecciones)
- page y limit(podes paginar las selecciones)

Ejemplos:
GET /api/selecciones?filter=pais&value=Argentina
GET /api/selecciones?sort=pais&order=asc
GET /api/selecciones?page=1&limit=5


### Obtener una seleccion por ID

GET /api/selecciones/:id


### Agregar una seleccion

POST /api/selecciones

Body:
{
  "pais": "Argentina",
  "dt_seleccion": "Scaloni",
  "cant_mundiales_ganados": 3,
  "participaciones_totales": 19,
  "foto_seleccion": "url"
}


### Editar una seleccion por Id

PUT /api/selecciones/:id

Body igual al POST.


### Eliminar una seleccion por Id

DELETE /api/selecciones/:id


## Partidos

### Obtener todos los partidos

GET /api/partidos

Opcional:
-Filtrar por fase

Ejemplo:
GET /api/partidos?fase=Grupos


### Obtener un partido por ID

GET /api/partidos/:id

### Agregar un partido

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

### Obtener jugadores por selección

GET /api/jugadores/seleccion/:id

## Códigos de respuesta

200, 201, 400, 401, 404, 500