-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2023 a las 01:27:41
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
-- Base de datos: `fitnesscracker`
--
CREATE DATABASE IF NOT EXISTS `fitnesscracker` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `fitnesscracker`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicios`
--

CREATE TABLE `ejercicios` (
  `ID_Ejer` int(255) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Area` varchar(255) NOT NULL,
  `Musculo` varchar(255) NOT NULL,
  `Repeticiones` varchar(255) NOT NULL,
  `Descripcion` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rutinas`
--

CREATE TABLE `rutinas` (
  `ID_Rutinas` int(255) NOT NULL,
  `ID_Usuario_Rutina` int(255) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Descripcion` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rut_ejer`
--

CREATE TABLE `rut_ejer` (
  `ID_Rut_Ejer` int(255) NOT NULL,
  `ID_Rut` int(255) NOT NULL,
  `ID_Ejer` int(255) NOT NULL,
  `Estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_Usuario` int(255) NOT NULL,
  `Nombre` varchar(255) NOT NULL,
  `Apellido` varchar(255) NOT NULL,
  `Correo` varchar(255) NOT NULL,
  `Contraseña` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  ADD PRIMARY KEY (`ID_Ejer`);

--
-- Indices de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD PRIMARY KEY (`ID_Rutinas`),
  ADD KEY `ID_Usuario_Rutina` (`ID_Usuario_Rutina`);

--
-- Indices de la tabla `rut_ejer`
--
ALTER TABLE `rut_ejer`
  ADD PRIMARY KEY (`ID_Rut_Ejer`),
  ADD KEY `ID_Rut` (`ID_Rut`),
  ADD KEY `ID_Rut_2` (`ID_Rut`),
  ADD KEY `ID_Ejer` (`ID_Ejer`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_Usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ejercicios`
--
ALTER TABLE `ejercicios`
  MODIFY `ID_Ejer` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rutinas`
--
ALTER TABLE `rutinas`
  MODIFY `ID_Rutinas` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rut_ejer`
--
ALTER TABLE `rut_ejer`
  MODIFY `ID_Rut_Ejer` int(255) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_Usuario` int(255) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `rutinas`
--
ALTER TABLE `rutinas`
  ADD CONSTRAINT `rutinas_ibfk_1` FOREIGN KEY (`ID_Usuario_Rutina`) REFERENCES `usuarios` (`ID_Usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `rut_ejer`
--
ALTER TABLE `rut_ejer`
  ADD CONSTRAINT `rut_ejer_ibfk_1` FOREIGN KEY (`ID_Rut`) REFERENCES `rutinas` (`ID_Rutinas`) ON UPDATE CASCADE,
  ADD CONSTRAINT `rut_ejer_ibfk_2` FOREIGN KEY (`ID_Ejer`) REFERENCES `ejercicios` (`ID_Ejer`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
