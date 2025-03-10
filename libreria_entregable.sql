-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-03-2025 a las 18:52:18
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria_entregable`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre_cliente` varchar(50) NOT NULL,
  `correo_cliente` varchar(50) NOT NULL,
  `telefono_cliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nombre_cliente`, `correo_cliente`, `telefono_cliente`) VALUES
(1, 'Juan Perez', 'juan.perez@techcaribe.com', '1234567890'),
(2, 'Maria Lopez', 'maria.lopez@techcaribe.com', '9087654321'),
(3, 'Carlos Sanchez', 'carlos.sanchez@techcaribe.com', '1230987564');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `año_publicacion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `autor`, `genero`, `año_publicacion`) VALUES
(1, 'Cien años de soledad', 'Gabriel Garcia Marquez', 'Realismo Magico', '0000-00-00'),
(2, '1984', 'George Orwell', 'Distopia', '0000-00-00'),
(3, 'El principito', 'Antonie de Saint-Exupery', 'Fabula', '0000-00-00'),
(4, 'Don quijote de la mancha', 'Miguel de Cervantes', 'Novela', '0000-00-00'),
(5, 'Harry Potter y la piedra Filosofal', 'J.K. Rowling', 'Fantasia', '0000-00-00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `id_prestamo` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_libro` int(11) NOT NULL,
  `fecha_prestamo` date NOT NULL,
  `fecha_devolucion` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`id_prestamo`, `id_cliente`, `id_libro`, `fecha_prestamo`, `fecha_devolucion`) VALUES
(1, 1, 2, '2025-03-01', '2025-03-15'),
(2, 2, 4, '2025-03-02', '2025-03-16'),
(3, 3, 1, '2025-03-03', '2025-03-17'),
(4, 1, 3, '2025-03-05', '2025-03-19'),
(5, 2, 5, '2025-03-06', '2025-03-20'),
(6, 3, 2, '2025-03-07', '2025-03-21'),
(7, 1, 3, '2025-03-05', '2025-03-19'),
(8, 2, 1, '2025-03-06', '2025-03-20'),
(9, 3, 2, '2025-03-07', '2025-03-21'),
(10, 1, 5, '2025-03-08', '2025-03-22'),
(11, 2, 4, '2025-03-09', '2025-03-23'),
(12, 3, 5, '2025-03-10', '2025-03-24'),
(13, 1, 2, '2025-03-11', '2025-03-25'),
(14, 2, 3, '2025-03-12', '2025-03-26'),
(15, 3, 1, '2025-03-13', '2025-03-27'),
(16, 1, 4, '2025-03-14', '2025-03-28'),
(17, 2, 5, '2025-03-15', '2025-03-29'),
(18, 3, 4, '2025-03-16', '2025-03-30'),
(19, 1, 1, '2025-03-17', '2025-03-31'),
(20, 2, 2, '2025-03-18', '2025-04-01'),
(21, 3, 3, '2025-03-19', '2025-04-02');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`id_prestamo`),
  ADD KEY `id_libro` (`id_libro`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `id_prestamo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id_libro`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
