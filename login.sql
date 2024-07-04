-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 04-07-2024 a las 14:11:56
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
-- Base de datos: `login`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertUser` (IN `personName` VARCHAR(50), IN `personLName` VARCHAR(80), IN `personEmail` VARCHAR(150), IN `personPhone` VARCHAR(20), IN `userTypeId` INT, IN `cveUser` VARCHAR(20), IN `departament` VARCHAR(50), IN `groupStdnt` VARCHAR(20), IN `career` VARCHAR(100), IN `dependence` VARCHAR(200))   BEGIN
    DECLARE personId INT;

    -- Insertar en la tabla catpersons
    INSERT INTO catpersons (personName, personLName, personEmail, personPhone, dtCreatedAt)
    VALUES (personName, personLName, personEmail, personPhone, NOW());

    -- Obtener el ID generado para catpersons
    SET personId = LAST_INSERT_ID();

    -- Insertar en la tabla catusers
    INSERT INTO catusers (fk_personId, fk_UserTypeId, cveUser, userPass, departament, groupStdnt, career, dependence, dtCreatedAt)
    VALUES (personId, userTypeId, cveUser, MD5(cveUser), departament, groupStdnt, career, dependence, NOW());

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catpersons`
--

CREATE TABLE `catpersons` (
  `personId` int NOT NULL,
  `personName` varchar(50) NOT NULL,
  `personLName` varchar(80) DEFAULT NULL,
  `personEmail` varchar(150) NOT NULL,
  `personPhone` varchar(20) NOT NULL,
  `dtCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catpersons`
--

INSERT INTO `catpersons` (`personId`, `personName`, `personLName`, `personEmail`, `personPhone`, `dtCreatedAt`, `bActive`) VALUES
(1, 'Super Admin', 'Sistema', 'laboratorios_ti@utem.edu.mx', '3140000001', '2023-05-24 13:55:39', b'1'),
(2, 'Secretario', 'Académico', 'secretaria-academica@utem.edu.mx', '3140000002', '2023-05-24 13:55:39', b'1'),
(3, 'Director', 'Académico', 'direccion-academica@utem.edu.mx', '3140000003', '2023-05-24 13:55:39', b'1'),
(4, 'Director', 'Carrera', 'direccion-carrera@utem.edu.mx', '3140000004', '2023-05-24 13:55:39', b'1'),
(5, '\nProfesor ', 'Tiempo Completo', 'ptc@utem.edu.mx', '3140000005', '2023-05-24 13:55:39', b'1'),
(6, 'Profesor', 'Asignatura', 'pa@utem.edu.mx', '3140000006', '2023-05-24 13:55:39', b'1'),
(7, 'Revisor', 'Pedagogía', 'revisor-pedagogia@utem.edu.mx', '3122100436', '2023-09-28 13:02:04', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusers`
--

CREATE TABLE `catusers` (
  `userId` int NOT NULL,
  `fk_personId` int DEFAULT NULL,
  `fk_UserTypeId` int DEFAULT NULL,
  `cveUser` varchar(20) NOT NULL,
  `userPass` varchar(50) NOT NULL,
  `departament` varchar(50) DEFAULT NULL,
  `groupStdnt` varchar(20) DEFAULT NULL,
  `career` varchar(100) DEFAULT NULL,
  `dependence` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT CURRENT_TIMESTAMP,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catusers`
--

INSERT INTO `catusers` (`userId`, `fk_personId`, `fk_UserTypeId`, `cveUser`, `userPass`, `departament`, `groupStdnt`, `career`, `dependence`, `dtCreatedAt`, `bActive`) VALUES
(1, 1, 1, 'ADMIN001', '4eef1e1ea34879a2ae60c60815927ed9', 'Sistemas', ' ', '', 'UTeM', '2023-05-24 14:00:39', b'1'),
(2, 2, 2, 'SECA001', '27af6fc9595e560cf3f0768ea638c757', 'Dirección Académica', '', '', 'UTeM', '2023-05-24 14:00:39', b'1'),
(3, 3, 3, 'DRAC001', '5ab717966853ea4a7c7587999ac2fd51', 'Dirección Académica', '', '', 'UTeM', '2023-05-24 14:00:39', b'1'),
(4, 4, 4, 'DRCA001', 'a3527b4895a27ca40c11363ea4f24482', 'Dirección Académica', '', '', 'UTeM', '2023-05-24 14:00:39', b'1'),
(5, 5, 5, 'PTC001', 'f6bc5d3a6f56f30c5f4081bd37573bca', 'Dirección Académica', '', '', 'UTeM', '2023-05-24 14:00:39', b'1'),
(6, 6, 6, 'PA001', '6627dae9e5559cc8d023d69d28f15c54', 'Dirección Académica', '', '', 'UTeM', '2023-05-24 14:00:39', b'1'),
(7, 7, 7, 'RPED001', 'dc46b2611fd2bc6eb66b23abca1389d9', 'Dirección Académica', '', '', 'UTeM', '2024-06-29 16:10:18', b'1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `catusertypes`
--

CREATE TABLE `catusertypes` (
  `userTypeId` int NOT NULL,
  `userType` varchar(50) NOT NULL,
  `typeDesc` varchar(200) DEFAULT NULL,
  `dtCreatedAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `catusertypes`
--

INSERT INTO `catusertypes` (`userTypeId`, `userType`, `typeDesc`, `dtCreatedAt`) VALUES
(1, 'Super Administrador', NULL, '2023-05-24 13:34:40'),
(2, 'Secretaría Acadénmica', NULL, '2023-05-24 13:39:38'),
(3, 'Director Académico', NULL, '2023-05-24 13:39:37'),
(4, 'Director de Carrera', NULL, '2023-05-24 13:39:36'),
(5, 'Profesor de Tiempo Completo', NULL, '2023-05-24 13:39:36'),
(6, 'Profesor por Asignatura', NULL, '2023-05-24 13:39:35'),
(7, 'Revisor Pedagogía', NULL, '2024-06-29 15:50:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `sessionId` int NOT NULL,
  `fk_userId` int NOT NULL,
  `cveSession` int NOT NULL,
  `dtLogIn` datetime DEFAULT NULL,
  `dtLogOut` datetime DEFAULT NULL,
  `bActive` bit(1) DEFAULT b'1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `usersactive`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `usersactive` (
`Pass` varchar(50)
,`uId` int
,`userCode` varchar(20)
,`UserType` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwadministrativos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwadministrativos` (
`Apellidos_Admin` varchar(80)
,`Departamento_Area` varchar(50)
,`Email_Admin` varchar(150)
,`Nombre_Admin` varchar(50)
,`Nombre_Completo_Admin` varchar(131)
,`NumTrab` varchar(20)
,`Telefono_Admin` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwadmins`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwadmins` (
`departament` varchar(50)
,`email` varchar(150)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`phone` varchar(20)
,`typeDesc` varchar(200)
,`user_code` varchar(20)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwallusersdata`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwallusersdata` (
`career` varchar(100)
,`departament` varchar(50)
,`dependence` varchar(200)
,`email` varchar(150)
,`first_name` varchar(50)
,`last_name` varchar(80)
,`phone` varchar(20)
,`std_group` varchar(20)
,`typeDesc` varchar(200)
,`user_code` varchar(20)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwalumnos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwalumnos` (
`Apellidos_Alumno` varchar(80)
,`Carrera` varchar(100)
,`Email_Alumno` varchar(150)
,`Grupo` varchar(20)
,`Nombre_Alumno` varchar(50)
,`Nombre_Completo_Alumno` varchar(131)
,`NumCtrl` varchar(20)
,`Telefono_Alumno` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwdocente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwdocente` (
`Apellidos_Docente` varchar(80)
,`Carrera` varchar(100)
,`Departamento_Area` varchar(50)
,`Email_Docente` varchar(150)
,`Nombre_Completo_Docente` varchar(131)
,`Nombre_Docente` varchar(50)
,`NumTrab` varchar(20)
,`Telefono_Docente` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwexternos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwexternos` (
`Apellidos_Externo` varchar(80)
,`cveExterno` varchar(20)
,`Dependencia` varchar(200)
,`Email_Externo` varchar(150)
,`Nombre_Completo_Externo` varchar(131)
,`Nombre_Externo` varchar(50)
,`Telefono_Externo` varchar(20)
,`typeDesc` varchar(200)
,`user_id` int
,`userActive` bit(1)
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vwsessionsusers`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vwsessionsusers` (
`cveSession` int
,`cveUser` varchar(20)
,`dtLogIn` datetime
,`dtLogOut` datetime
,`personId` int
,`personLName` varchar(80)
,`personName` varchar(50)
,`sessionId` int
,`userId` int
,`userType` varchar(50)
,`userTypeId` int
);

-- --------------------------------------------------------

--
-- Estructura para la vista `usersactive`
--
DROP TABLE IF EXISTS `usersactive`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `usersactive`  AS SELECT `catusers`.`userId` AS `uId`, `catusers`.`cveUser` AS `userCode`, `catusers`.`userPass` AS `Pass`, `catusers`.`fk_UserTypeId` AS `UserType` FROM `catusers` WHERE (`catusers`.`bActive` = 1) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwadministrativos`
--
DROP TABLE IF EXISTS `vwadministrativos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadministrativos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Admin`, `p`.`personLName` AS `Apellidos_Admin`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Admin`, `p`.`personEmail` AS `Email_Admin`, `p`.`personPhone` AS `Telefono_Admin`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 3) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwadmins`
--
DROP TABLE IF EXISTS `vwadmins`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwadmins`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` between 1 and 2) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwallusersdata`
--
DROP TABLE IF EXISTS `vwallusersdata`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwallusersdata`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `user_code`, `u`.`departament` AS `departament`, `u`.`groupStdnt` AS `std_group`, `u`.`career` AS `career`, `u`.`dependence` AS `dependence`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `first_name`, `p`.`personLName` AS `last_name`, `p`.`personEmail` AS `email`, `p`.`personPhone` AS `phone`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwalumnos`
--
DROP TABLE IF EXISTS `vwalumnos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwalumnos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumCtrl`, `u`.`groupStdnt` AS `Grupo`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Alumno`, `p`.`personLName` AS `Apellidos_Alumno`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Alumno`, `p`.`personEmail` AS `Email_Alumno`, `p`.`personPhone` AS `Telefono_Alumno`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 5) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwdocente`
--
DROP TABLE IF EXISTS `vwdocente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwdocente`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `NumTrab`, `u`.`departament` AS `Departamento_Area`, `u`.`career` AS `Carrera`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Docente`, `p`.`personLName` AS `Apellidos_Docente`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Docente`, `p`.`personEmail` AS `Email_Docente`, `p`.`personPhone` AS `Telefono_Docente`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 4) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwexternos`
--
DROP TABLE IF EXISTS `vwexternos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwexternos`  AS SELECT `u`.`userId` AS `user_id`, `u`.`cveUser` AS `cveExterno`, `u`.`dependence` AS `Dependencia`, `u`.`bActive` AS `userActive`, `p`.`personName` AS `Nombre_Externo`, `p`.`personLName` AS `Apellidos_Externo`, concat(`p`.`personName`,' ',`p`.`personLName`) AS `Nombre_Completo_Externo`, `p`.`personEmail` AS `Email_Externo`, `p`.`personPhone` AS `Telefono_Externo`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `t`.`typeDesc` AS `typeDesc` FROM ((`catusers` `u` left join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) left join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) WHERE (`t`.`userTypeId` = 6) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vwsessionsusers`
--
DROP TABLE IF EXISTS `vwsessionsusers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vwsessionsusers`  AS SELECT `u`.`userId` AS `userId`, `u`.`cveUser` AS `cveUser`, `t`.`userTypeId` AS `userTypeId`, `t`.`userType` AS `userType`, `p`.`personId` AS `personId`, `p`.`personName` AS `personName`, `p`.`personLName` AS `personLName`, `s`.`sessionId` AS `sessionId`, `s`.`cveSession` AS `cveSession`, `s`.`dtLogIn` AS `dtLogIn`, `s`.`dtLogOut` AS `dtLogOut` FROM (((`catusers` `u` join `catusertypes` `t` on((`u`.`fk_UserTypeId` = `t`.`userTypeId`))) join `catpersons` `p` on((`u`.`fk_personId` = `p`.`personId`))) join `sessions` `s` on((`s`.`fk_userId` = `u`.`userId`))) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `catpersons`
--
ALTER TABLE `catpersons`
  ADD PRIMARY KEY (`personId`);

--
-- Indices de la tabla `catusers`
--
ALTER TABLE `catusers`
  ADD PRIMARY KEY (`userId`),
  ADD KEY `fk_personId` (`fk_personId`),
  ADD KEY `fk_UserTypeId` (`fk_UserTypeId`);

--
-- Indices de la tabla `catusertypes`
--
ALTER TABLE `catusertypes`
  ADD PRIMARY KEY (`userTypeId`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`sessionId`),
  ADD KEY `fk_userId` (`fk_userId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `catpersons`
--
ALTER TABLE `catpersons`
  MODIFY `personId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `catusers`
--
ALTER TABLE `catusers`
  MODIFY `userId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `catusertypes`
--
ALTER TABLE `catusertypes`
  MODIFY `userTypeId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `sessions`
--
ALTER TABLE `sessions`
  MODIFY `sessionId` int NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
