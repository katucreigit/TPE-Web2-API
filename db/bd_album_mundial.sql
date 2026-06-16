-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-05-2026 a las 06:57:01
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
(2, 'Lionel Messi', 'Delantero', 10, 73, 1, '1986-06-24', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSHne4Fl9eUPoUwuRJaJN8KyLBgWKCssNRyw&s'),
(24, 'Julián Álvarez', 'Delantero', 9, 71, 1.7, '2000-01-31', 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS59trfisRSlqm46ivmAbAA31RSFuAx8dwBfA&s'),
(25, 'Emiliano Martínez', 'Arquero', 23, 88, 1.95, '1992-09-02', 1, 'https://www.paparazzi.com.ar/wp-content/uploads/2025/03/Dibu-Martinez.jpg.webp'),
(26, 'Vinicius Jr', 'Delantero', 7, 73, 1.76, '2000-07-12', 2, 'https://st1.uvnimg.com/61/0a/b92ce6ca445ab626ad33e57e02b1/3d13f19cfd8a4de18864640c7d8d6687'),
(27, 'Rodrygo', 'Delantero', 11, 64, 1.74, '2001-01-09', 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSd6u0g4L5a7rZkGhMoNcAUfzzC255X-GhlQ&s'),
(28, 'Alisson Becker', 'Arquero', 1, 91, 1.93, '1992-10-02', 2, 'https://larepublica.cronosmedia.glr.pe/migration/images/JRRXHZTYQRET7DRKRPNOVACF7Q.jpg'),
(29, 'Jamal Musiala', 'Mediocampo', 10, 72, 1.84, '2003-02-26', 5, 'https://mibundesliga.com/wp-content/uploads/2024/09/01j773wwbkek36fp67ap-scaled.jpg'),
(30, 'Kai Havertz', 'Delantero', 7, 82, 1.93, '1999-06-11', 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGcRup-kQx2GT_X4kc8U6IulpcPb3pNLdQng&s'),
(31, 'Kylian Mbappé', 'Delantero', 10, 75, 1.78, '1998-12-20', 6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS_lW9MuXJPKMPYDaAn5Q5bcyYQ8dfJVBMAiQ&s'),
(32, 'Antoine Griezmann', 'Delantero', 7, 73, 1.76, '1991-03-21', 6, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSAfE94_fYdKyiMnshBJjDAztopTZf-wP31tg&s'),
(33, 'Pedri', 'Mediocampo', 8, 60, 1.74, '2002-11-25', 7, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF-xdf_goUMBt3oRZsDajqOkXaD9DUU4Jd7g&s'),
(34, 'Lamine Yamal', 'Delantero', 19, 65, 1.8, '2007-07-13', 7, 'https://paranadeportes.com.ar/wp-content/uploads/2025/11/Yamal-seleccion-Espana.jpg'),
(35, 'Federico Valverde', 'Mediocampo', 15, 78, 1.82, '1998-07-22', 8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTFVo39XtRvLKp4PLit31tdL-hVpRKHbsZpXQ&s'),
(36, 'Darwin Núñez', 'Delantero', 9, 80, 1.87, '1999-06-24', 8, 'https://www.vermouth-deportivo.com.ar/wp-content/uploads/2026/02/Darwin-Nunez.jpg'),
(37, 'Cristiano Ronaldo', 'Delantero', 7, 83, 1.87, '1985-02-05', 9, 'https://imagenes.elpais.com/resizer/v2/7Q3X6BNLGBF7PEDPXT3Y7BKOAQ.jpg?auth=c40bdef5efccfb473d3b330b714fd00969c43548604d46e580839a102ed831c1&width=980&height=980&smart=true'),
(38, 'Bruno Fernandes', 'Mediocampo', 8, 69, 1.79, '1994-09-08', 9, 'https://livesport-ott-images.ssl.cdn.cra.cz/r900xfq60/e50cad76-0d4d-4f09-aad4-deb6f7b506c7.jpeg'),
(39, 'Harry Kane', 'Delantero', 9, 86, 1.88, '1993-07-28', 10, 'https://phantom.estaticos-marca.com/4a68906a41b3e47a4ae17dab942c328e/f/jpg/assets/multimedia/imagenes/2021/07/04/16254188288144.jpg'),
(40, 'Jude Bellingham', 'Mediocampo', 10, 75, 1.86, '2003-06-29', 10, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-eT_djpM4kXPfoLAUuTHNqY5TcbS3iFPa4Q&s'),
(41, 'Luka Modric', 'Mediocampo', 10, 66, 1.72, '1985-09-09', 11, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTE1I0geNqxcoisqxAcLPSZYMW4eVxfHVChtg&s');

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
-- Indices de la tabla `seleccion`
--
ALTER TABLE `seleccion`
  ADD PRIMARY KEY (`id_seleccion`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id_jugador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT de la tabla `seleccion`
--
ALTER TABLE `seleccion`
  MODIFY `id_seleccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_ibfk_1` FOREIGN KEY (`id_seleccion`) REFERENCES `seleccion` (`id_seleccion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;