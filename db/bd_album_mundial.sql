-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2026 a las 00:00:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_album_mundial`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id_jugador` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `posicion` varchar(20) NOT NULL,
  `numero` int(11) NOT NULL,
  `peso` double NOT NULL,
  `altura` double NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_seleccion` int(11) NOT NULL,
  `foto_jugador` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`id_jugador`, `nombre`, `posicion`, `numero`, `peso`, `altura`, `fecha_nacimiento`, `id_seleccion`, `foto_jugador`) VALUES
(2, 'Lionel Messi', 'Delantero', 10, 73, 1, '1986-06-24', 1, 'https://img.a.transfermarkt.technology/portrait/big/28003-1710080339.jpg'),
(24, 'Julián Álvarez', 'Delantero', 9, 71, 1.7, '2000-01-31', 1, 'https://img.a.transfermarkt.technology/portrait/big/576024-1702419781.jpg'),
(25, 'Emiliano Martínez', 'Arquero', 23, 88, 1.95, '1992-09-02', 1, 'https://img.a.transfermarkt.technology/portrait/big/111873-1682580429.jpg'),
(26, 'Vinicius Jr', 'Delantero', 7, 73, 1.76, '2000-07-12', 2, 'https://img.a.transfermarkt.technology/portrait/big/371998-1664869583.jpg'),
(27, 'Rodrygo', 'Delantero', 11, 64, 1.74, '2001-01-09', 2, 'https://img.a.transfermarkt.technology/portrait/big/412363-1702419590.jpg'),
(28, 'Alisson Becker', 'Arquero', 1, 91, 1.93, '1992-10-02', 2, 'https://img.a.transfermarkt.technology/portrait/big/105470-1682580629.jpg'),
(29, 'Jamal Musiala', 'Mediocampo', 10, 72, 1.84, '2003-02-26', 5, 'https://img.a.transfermarkt.technology/portrait/big/580195-1702419902.jpg'),
(30, 'Kai Havertz', 'Delantero', 7, 82, 1.93, '1999-06-11', 5, 'https://img.a.transfermarkt.technology/portrait/big/309400-1702419960.jpg'),
(31, 'Kylian Mbappé', 'Delantero', 10, 75, 1.78, '1998-12-20', 6, 'https://img.a.transfermarkt.technology/portrait/big/342229-1682683695.jpg'),
(32, 'Antoine Griezmann', 'Delantero', 7, 73, 1.76, '1991-03-21', 6, 'https://img.a.transfermarkt.technology/portrait/big/125781-1702420112.jpg'),
(33, 'Pedri', 'Mediocampo', 8, 60, 1.74, '2002-11-25', 7, 'https://img.a.transfermarkt.technology/portrait/big/683840-1702419834.jpg'),
(34, 'Lamine Yamal', 'Delantero', 19, 65, 1.8, '2007-07-13', 7, 'https://img.a.transfermarkt.technology/portrait/big/937958-1702419867.jpg'),
(35, 'Federico Valverde', 'Mediocampo', 15, 78, 1.82, '1998-07-22', 8, 'https://img.a.transfermarkt.technology/portrait/big/369081-1702419705.jpg'),
(36, 'Darwin Núñez', 'Delantero', 9, 80, 1.87, '1999-06-24', 8, 'https://img.a.transfermarkt.technology/portrait/big/546543-1702419740.jpg'),
(37, 'Cristiano Ronaldo', 'Delantero', 7, 83, 1.87, '1985-02-05', 9, 'https://img.a.transfermarkt.technology/portrait/big/8198-1694609670.jpg'),
(38, 'Bruno Fernandes', 'Mediocampo', 8, 69, 1.79, '1994-09-08', 9, 'https://img.a.transfermarkt.technology/portrait/big/240306-1702419659.jpg'),
(39, 'Harry Kane', 'Delantero', 9, 86, 1.88, '1993-07-28', 10, 'https://img.a.transfermarkt.technology/portrait/big/132098-1702420173.jpg'),
(40, 'Jude Bellingham', 'Mediocampo', 10, 75, 1.86, '2003-06-29', 10, 'https://img.a.transfermarkt.technology/portrait/big/581678-1702419928.jpg'),
(41, 'Luka Modric', 'Mediocampo', 10, 66, 1.72, '1985-09-09', 11, 'https://img.a.transfermarkt.technology/portrait/big/27992-1702420224.jpg'),
(42, 'Virgil van Dijk', 'Defensor', 4, 92, 1.95, '1991-07-08', 12, 'https://img.a.transfermarkt.technology/portrait/big/139208-1702420278.jpg'),
(43, 'Memphis Depay', 'Delantero', 10, 78, 1.76, '1994-02-13', 12, 'https://img.a.transfermarkt.technology/portrait/big/167850-1702420309.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partido`
--

CREATE TABLE `partido` (
  `id_partido` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estadio` varchar(100) NOT NULL,
  `fase` varchar(30) NOT NULL,
  `goles_local` int(11) NOT NULL,
  `goles_visitante` int(11) NOT NULL,
  `seleccion_local` int(11) NOT NULL,
  `seleccion_visitante` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partido`
--

INSERT INTO `partido` (`id_partido`, `fecha`, `estadio`, `fase`, `goles_local`, `goles_visitante`, `seleccion_local`, `seleccion_visitante`) VALUES
(1, '2026-06-15', 'Estadio Azteca', 'Grupos', 2, 1, 1, 2),
(2, '2026-06-18', 'MetLife Stadium', 'Grupos', 0, 0, 6, 5),
(3, '2026-06-21', 'SoFi Stadium', 'Grupos', 3, 2, 7, 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seleccion`
--

CREATE TABLE `seleccion` (
  `id_seleccion` int(11) NOT NULL,
  `cant_mundiales_ganados` int(11) NOT NULL,
  `pais` varchar(40) NOT NULL,
  `participaciones_totales` int(11) NOT NULL,
  `dt_seleccion` varchar(40) NOT NULL,
  `foto_seleccion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `seleccion`
--

INSERT INTO `seleccion` (`id_seleccion`, `cant_mundiales_ganados`, `pais`, `participaciones_totales`, `dt_seleccion`, `foto_seleccion`) VALUES
(1, 3, 'Argentina', 19, 'Scaloni', 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1a/Flag_of_Argentina.svg/250px-Flag_of_Argentina.svg.png'),
(2, 5, 'Brasil', 23, 'ancelloti', 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Flag_of_Brazil.svg/1280px-Flag_of_Brazil.svg.png'),
(5, 4, 'Alemania', 20, 'Julian Nagelsmann', 'https://upload.wikimedia.org/wikipedia/en/b/ba/Flag_of_Germany.svg'),
(6, 2, 'Francia', 16, 'Didier Deschamps', 'https://upload.wikimedia.org/wikipedia/en/c/c3/Flag_of_France.svg'),
(7, 1, 'España', 16, 'Luis de la Fuente', 'https://upload.wikimedia.org/wikipedia/en/9/9a/Flag_of_Spain.svg'),
(8, 2, 'Uruguay', 14, 'Marcelo Bielsa', 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Flag_of_Uruguay.svg'),
(9, 0, 'Portugal', 8, 'Roberto Martínez', 'https://upload.wikimedia.org/wikipedia/commons/5/5c/Flag_of_Portugal.svg'),
(10, 1, 'Inglaterra', 16, 'Gareth Southgate', 'https://upload.wikimedia.org/wikipedia/en/b/be/Flag_of_England.svg'),
(11, 0, 'Croacia', 6, 'Zlatko Dalić', 'https://upload.wikimedia.org/wikipedia/commons/1/1b/Flag_of_Croatia.svg'),
(12, 0, 'Países Bajos', 11, 'Ronald Koeman', 'https://upload.wikimedia.org/wikipedia/commons/2/20/Flag_of_the_Netherlands.svg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre_apellido` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `username`, `password`, `nombre_apellido`) VALUES
(1, 'webadmin', '$2y$10$krd3sXwLOGzYwLXwaeRVa.7iuniB8inoYAAV5Vx76mfDkd8hjgUQu', 'Katu Crei');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id_jugador`),
  ADD KEY `id_seleccion` (`id_seleccion`) USING BTREE;

--
-- Indices de la tabla `partido`
--
ALTER TABLE `partido`
  ADD PRIMARY KEY (`id_partido`),
  ADD KEY `seleccion_local` (`seleccion_local`),
  ADD KEY `seleccion_visitante` (`seleccion_visitante`);

--
-- Indices de la tabla `seleccion`
--
ALTER TABLE `seleccion`
  ADD PRIMARY KEY (`id_seleccion`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `partido`
--
ALTER TABLE `partido`
  MODIFY `id_partido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `seleccion`
--
ALTER TABLE `seleccion`
  MODIFY `id_seleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_seleccion`) REFERENCES `seleccion` (`id_seleccion`);

--
-- Filtros para la tabla `partido`
--
ALTER TABLE `partido`
  ADD CONSTRAINT `partido_ibfk_1` FOREIGN KEY (`seleccion_local`) REFERENCES `seleccion` (`id_seleccion`),
  ADD CONSTRAINT `partido_ibfk_2` FOREIGN KEY (`seleccion_visitante`) REFERENCES `seleccion` (`id_seleccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;