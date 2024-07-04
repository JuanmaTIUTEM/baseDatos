-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-07-2024 a las 14:11:26
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdasignaturas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarCapacidadDerivada` (IN `materia_id` INT, IN `capacidad` TEXT, IN `criterios_desempeno` TEXT)   BEGIN
    INSERT INTO CapacidadesDerivadas (materia_id, capacidad, criterios_desempeno)
    VALUES (materia_id, capacidad, criterios_desempeno);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarFuenteBibliografica` (IN `materia_id` INT, IN `autor` VARCHAR(255), IN `año` INT, IN `titulo_documento` VARCHAR(255), IN `ciudad` VARCHAR(255), IN `pais` VARCHAR(255), IN `editorial` VARCHAR(255))   BEGIN
    INSERT INTO FuentesBibliograficas (materia_id, autor, año, titulo_documento, ciudad, pais, editorial)
    VALUES (materia_id, autor, año, titulo_documento, ciudad, pais, editorial);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarMateria` (IN `nombre` VARCHAR(255), IN `competencias` TEXT, IN `cuatrimestre` VARCHAR(255), IN `horas_teoricas` INT, IN `horas_practicas` INT, IN `horas_totales` INT, IN `horas_semanales` INT, IN `objetivo_aprendizaje` TEXT)   BEGIN
    INSERT INTO Materias (nombre, competencias, cuatrimestre, horas_teoricas, horas_practicas, horas_totales, horas_semanales, objetivo_aprendizaje)
    VALUES (nombre, competencias, cuatrimestre, horas_teoricas, horas_practicas, horas_totales, horas_semanales, objetivo_aprendizaje);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarMetodoEnseñanza` (IN `materia_id` INT, IN `metodos_tecnicas` TEXT, IN `medios_materiales` TEXT)   BEGIN
    INSERT INTO MetodosEnseñanza (materia_id, metodos_tecnicas, medios_materiales)
    VALUES (materia_id, metodos_tecnicas, medios_materiales);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarProcesoEvaluacion` (IN `materia_id` INT, IN `resultado_aprendizaje` TEXT, IN `secuencia_aprendizaje` TEXT, IN `instrumentos_reactivos` TEXT)   BEGIN
    INSERT INTO ProcesoEvaluacion (materia_id, resultado_aprendizaje, secuencia_aprendizaje, instrumentos_reactivos)
    VALUES (materia_id, resultado_aprendizaje, secuencia_aprendizaje, instrumentos_reactivos);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarTema` (IN `unidad_id` INT, IN `tema` VARCHAR(255), IN `saber` TEXT, IN `saber_hacer` TEXT, IN `ser` TEXT)   BEGIN
    INSERT INTO Temas (unidad_id, tema, saber, saber_hacer, ser)
    VALUES (unidad_id, tema, saber, saber_hacer, ser);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `AgregarUnidadAprendizaje` (IN `materia_id` INT, IN `nombre` VARCHAR(255), IN `horas_teoricas` INT, IN `horas_practicas` INT, IN `horas_totales` INT, IN `objetivo_unidad` TEXT)   BEGIN
    INSERT INTO UnidadesAprendizaje (materia_id, nombre, horas_teoricas, horas_practicas, horas_totales, objetivo_unidad)
    VALUES (materia_id, nombre, horas_teoricas, horas_practicas, horas_totales, objetivo_unidad);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `capacidadesderivadas`
--

CREATE TABLE `capacidadesderivadas` (
  `id` int NOT NULL,
  `materia_id` int DEFAULT NULL,
  `capacidad` text,
  `criterios_desempeno` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fuentesbibliograficas`
--

CREATE TABLE `fuentesbibliograficas` (
  `id` int NOT NULL,
  `materia_id` int DEFAULT NULL,
  `autor` varchar(255) DEFAULT NULL,
  `año` int DEFAULT NULL,
  `titulo_documento` varchar(255) DEFAULT NULL,
  `ciudad` varchar(255) DEFAULT NULL,
  `pais` varchar(255) DEFAULT NULL,
  `editorial` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `competencias` text,
  `cuatrimestre` varchar(255) DEFAULT NULL,
  `horas_teoricas` int DEFAULT NULL,
  `horas_practicas` int DEFAULT NULL,
  `horas_totales` int DEFAULT NULL,
  `horas_semanales` int DEFAULT NULL,
  `objetivo_aprendizaje` text,
  `bActivo` bit(1) NOT NULL DEFAULT b'1',
  `feCreated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feUpdated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`, `competencias`, `cuatrimestre`, `horas_teoricas`, `horas_practicas`, `horas_totales`, `horas_semanales`, `objetivo_aprendizaje`, `bActivo`, `feCreated`, `feUpdated`) VALUES
(1, 'Base de Datos para Aplicaciones', 'Implementar soluciones multiplataforma, en la nube y software embebido, en entornos seguros mediante la adquisición y administración de datos e ingeniería de software para contribuir a la automatización de los procesos en las organizaciones.', 'Tercero', 35, 70, 105, 7, 'El alumno creará bases de datos con base en esquemas de administración y seguridad para su integración en aplicaciones de software.El alumno administrará bases de datos relacionales y no relacionales mediante herramientas de gestión y estándares de calidad de los datos para garantizar la integridad de la información.', b'1', '2024-06-29 17:16:12', '2024-06-29 17:16:12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodosenseñanza`
--

CREATE TABLE `metodosenseñanza` (
  `id` int NOT NULL,
  `materia_id` int DEFAULT NULL,
  `metodos_tecnicas` text,
  `medios_materiales` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesoevaluacion`
--

CREATE TABLE `procesoevaluacion` (
  `id` int NOT NULL,
  `materia_id` int DEFAULT NULL,
  `resultado_aprendizaje` text,
  `secuencia_aprendizaje` text,
  `instrumentos_reactivos` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `id` int NOT NULL,
  `unidad_id` int DEFAULT NULL,
  `tema` varchar(255) DEFAULT NULL,
  `saber` text,
  `saber_hacer` text,
  `ser` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidadesaprendizaje`
--

CREATE TABLE `unidadesaprendizaje` (
  `id` int NOT NULL,
  `materia_id` int DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `horas_teoricas` int DEFAULT NULL,
  `horas_practicas` int DEFAULT NULL,
  `horas_totales` int DEFAULT NULL,
  `objetivo_unidad` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistacapacidadesderivadas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistacapacidadesderivadas` (
`capacidad` text
,`capacidad_id` int
,`criterios_desempeno` text
,`nombre_materia` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistadatosmateria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistadatosmateria` (
`autor` varchar(255)
,`año` int
,`ciudad` varchar(255)
,`competencias` text
,`cuatrimestre` varchar(255)
,`editorial` varchar(255)
,`horas_practicas` int
,`horas_semanales` int
,`horas_teoricas` int
,`horas_totales` int
,`id` int
,`nombre_materia` varchar(255)
,`objetivo_aprendizaje` text
,`pais` varchar(255)
,`titulo_documento` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistafuentesbibliograficas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistafuentesbibliograficas` (
`autor` varchar(255)
,`año` int
,`ciudad` varchar(255)
,`editorial` varchar(255)
,`fuente_id` int
,`nombre_materia` varchar(255)
,`pais` varchar(255)
,`titulo_documento` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistamateriasconunidades`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistamateriasconunidades` (
`competencias` text
,`cuatrimestre` varchar(255)
,`horas_practicas` int
,`horas_practicas_unidad` int
,`horas_semanales` int
,`horas_teoricas` int
,`horas_teoricas_unidad` int
,`horas_totales` int
,`horas_totales_unidad` int
,`materia_id` int
,`nombre_materia` varchar(255)
,`nombre_unidad` varchar(255)
,`objetivo_aprendizaje` text
,`objetivo_unidad` text
,`unidad_id` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistametodosenseñanza`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistametodosenseñanza` (
`medios_materiales` text
,`metodo_id` int
,`metodos_tecnicas` text
,`nombre_materia` varchar(255)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistaprocesoevaluacion`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistaprocesoevaluacion` (
`evaluacion_id` int
,`instrumentos_reactivos` text
,`nombre_materia` varchar(255)
,`resultado_aprendizaje` text
,`secuencia_aprendizaje` text
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vistaunidadescontemas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vistaunidadescontemas` (
`horas_practicas` int
,`horas_teoricas` int
,`horas_totales` int
,`nombre_unidad` varchar(255)
,`objetivo_unidad` text
,`saber` text
,`saber_hacer` text
,`ser` text
,`tema` varchar(255)
,`tema_id` int
,`unidad_id` int
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vistacapacidadesderivadas`
--
DROP TABLE IF EXISTS `vistacapacidadesderivadas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistacapacidadesderivadas`  AS SELECT `cd`.`id` AS `capacidad_id`, `m`.`nombre` AS `nombre_materia`, `cd`.`capacidad` AS `capacidad`, `cd`.`criterios_desempeno` AS `criterios_desempeno` FROM (`capacidadesderivadas` `cd` left join `materias` `m` on((`cd`.`materia_id` = `m`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistadatosmateria`
--
DROP TABLE IF EXISTS `vistadatosmateria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistadatosmateria`  AS SELECT `m`.`id` AS `id`, `m`.`nombre` AS `nombre_materia`, `m`.`competencias` AS `competencias`, `m`.`cuatrimestre` AS `cuatrimestre`, `m`.`horas_teoricas` AS `horas_teoricas`, `m`.`horas_practicas` AS `horas_practicas`, `m`.`horas_totales` AS `horas_totales`, `m`.`horas_semanales` AS `horas_semanales`, `m`.`objetivo_aprendizaje` AS `objetivo_aprendizaje`, `f`.`autor` AS `autor`, `f`.`año` AS `año`, `f`.`titulo_documento` AS `titulo_documento`, `f`.`ciudad` AS `ciudad`, `f`.`pais` AS `pais`, `f`.`editorial` AS `editorial` FROM (`materias` `m` left join `fuentesbibliograficas` `f` on((`m`.`id` = `f`.`materia_id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistafuentesbibliograficas`
--
DROP TABLE IF EXISTS `vistafuentesbibliograficas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistafuentesbibliograficas`  AS SELECT `fb`.`id` AS `fuente_id`, `m`.`nombre` AS `nombre_materia`, `fb`.`autor` AS `autor`, `fb`.`año` AS `año`, `fb`.`titulo_documento` AS `titulo_documento`, `fb`.`ciudad` AS `ciudad`, `fb`.`pais` AS `pais`, `fb`.`editorial` AS `editorial` FROM (`fuentesbibliograficas` `fb` left join `materias` `m` on((`fb`.`materia_id` = `m`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistamateriasconunidades`
--
DROP TABLE IF EXISTS `vistamateriasconunidades`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistamateriasconunidades`  AS SELECT `m`.`id` AS `materia_id`, `m`.`nombre` AS `nombre_materia`, `m`.`competencias` AS `competencias`, `m`.`cuatrimestre` AS `cuatrimestre`, `m`.`horas_teoricas` AS `horas_teoricas`, `m`.`horas_practicas` AS `horas_practicas`, `m`.`horas_totales` AS `horas_totales`, `m`.`horas_semanales` AS `horas_semanales`, `m`.`objetivo_aprendizaje` AS `objetivo_aprendizaje`, `u`.`id` AS `unidad_id`, `u`.`nombre` AS `nombre_unidad`, `u`.`horas_teoricas` AS `horas_teoricas_unidad`, `u`.`horas_practicas` AS `horas_practicas_unidad`, `u`.`horas_totales` AS `horas_totales_unidad`, `u`.`objetivo_unidad` AS `objetivo_unidad` FROM (`materias` `m` left join `unidadesaprendizaje` `u` on((`m`.`id` = `u`.`materia_id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistametodosenseñanza`
--
DROP TABLE IF EXISTS `vistametodosenseñanza`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistametodosenseñanza`  AS SELECT `me`.`id` AS `metodo_id`, `m`.`nombre` AS `nombre_materia`, `me`.`metodos_tecnicas` AS `metodos_tecnicas`, `me`.`medios_materiales` AS `medios_materiales` FROM (`metodosenseñanza` `me` left join `materias` `m` on((`me`.`materia_id` = `m`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistaprocesoevaluacion`
--
DROP TABLE IF EXISTS `vistaprocesoevaluacion`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistaprocesoevaluacion`  AS SELECT `p`.`id` AS `evaluacion_id`, `m`.`nombre` AS `nombre_materia`, `p`.`resultado_aprendizaje` AS `resultado_aprendizaje`, `p`.`secuencia_aprendizaje` AS `secuencia_aprendizaje`, `p`.`instrumentos_reactivos` AS `instrumentos_reactivos` FROM (`procesoevaluacion` `p` left join `materias` `m` on((`p`.`materia_id` = `m`.`id`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vistaunidadescontemas`
--
DROP TABLE IF EXISTS `vistaunidadescontemas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vistaunidadescontemas`  AS SELECT `u`.`id` AS `unidad_id`, `u`.`nombre` AS `nombre_unidad`, `u`.`horas_teoricas` AS `horas_teoricas`, `u`.`horas_practicas` AS `horas_practicas`, `u`.`horas_totales` AS `horas_totales`, `u`.`objetivo_unidad` AS `objetivo_unidad`, `t`.`id` AS `tema_id`, `t`.`tema` AS `tema`, `t`.`saber` AS `saber`, `t`.`saber_hacer` AS `saber_hacer`, `t`.`ser` AS `ser` FROM (`unidadesaprendizaje` `u` left join `temas` `t` on((`u`.`id` = `t`.`unidad_id`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `capacidadesderivadas`
--
ALTER TABLE `capacidadesderivadas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `fuentesbibliograficas`
--
ALTER TABLE `fuentesbibliograficas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metodosenseñanza`
--
ALTER TABLE `metodosenseñanza`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `procesoevaluacion`
--
ALTER TABLE `procesoevaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unidad_id` (`unidad_id`);

--
-- Indices de la tabla `unidadesaprendizaje`
--
ALTER TABLE `unidadesaprendizaje`
  ADD PRIMARY KEY (`id`),
  ADD KEY `materia_id` (`materia_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `capacidadesderivadas`
--
ALTER TABLE `capacidadesderivadas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fuentesbibliograficas`
--
ALTER TABLE `fuentesbibliograficas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `metodosenseñanza`
--
ALTER TABLE `metodosenseñanza`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `procesoevaluacion`
--
ALTER TABLE `procesoevaluacion`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `unidadesaprendizaje`
--
ALTER TABLE `unidadesaprendizaje`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `capacidadesderivadas`
--
ALTER TABLE `capacidadesderivadas`
  ADD CONSTRAINT `capacidadesderivadas_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `fuentesbibliograficas`
--
ALTER TABLE `fuentesbibliograficas`
  ADD CONSTRAINT `fuentesbibliograficas_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `metodosenseñanza`
--
ALTER TABLE `metodosenseñanza`
  ADD CONSTRAINT `metodosenseñanza_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `procesoevaluacion`
--
ALTER TABLE `procesoevaluacion`
  ADD CONSTRAINT `procesoevaluacion_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);

--
-- Filtros para la tabla `temas`
--
ALTER TABLE `temas`
  ADD CONSTRAINT `temas_ibfk_1` FOREIGN KEY (`unidad_id`) REFERENCES `unidadesaprendizaje` (`id`);

--
-- Filtros para la tabla `unidadesaprendizaje`
--
ALTER TABLE `unidadesaprendizaje`
  ADD CONSTRAINT `unidadesaprendizaje_ibfk_1` FOREIGN KEY (`materia_id`) REFERENCES `materias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
