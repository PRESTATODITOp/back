-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2023 a las 12:47:23
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectoprestamo`
--
CREATE DATABASE IF NOT EXISTS `proyectoprestamo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyectoprestamo`;

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `spConsultarUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarUsuario` (IN `_ID_USUARIO` INT, IN `_CONTRASENA` VARCHAR(100))   BEGIN
    SELECT ID_USUARIO,CONTRASENA,ID_ROL
    FROM usuario
    WHERE ID_USUARIO = _ID_USUARIO
        && CONTRASENA = _CONTRASENA;
END$$

DROP PROCEDURE IF EXISTS `spDeleteAmbientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteAmbientes` (IN `_ID` INT)   BEGIN
    DELETE FROM ambientes
    WHERE ID_AMBIENTES = _ID;
END$$

DROP PROCEDURE IF EXISTS `spDeleteComputador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteComputador` (IN `_ID_COMPUTADOR` INT)   BEGIN
    DELETE FROM computador
    WHERE ID_COMPUTADOR = _ID_COMPUTADOR;
END$$

DROP PROCEDURE IF EXISTS `spDeleteElementos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteElementos` (IN `_ID_ELEMENTO` INT)   BEGIN
    DELETE FROM elementos
    WHERE ID_ELEMENTOS = _ID_ELEMENTO;
END$$

DROP PROCEDURE IF EXISTS `spDeleteHerramienta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteHerramienta` (IN `_ID_HERRAMIENTA` INT)   BEGIN
    DELETE FROM herramienta
    WHERE ID_HERRAMIENTA = _ID_HERRAMIENTA;
END$$

DROP PROCEDURE IF EXISTS `spDeleteInventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteInventario` (IN `_ID_INVENTARIO` INT)   BEGIN
    DELETE FROM inventario
    WHERE ID_INVENTARIO = _ID_INVENTARIO;
END$$

DROP PROCEDURE IF EXISTS `spDeleteMaterial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteMaterial` (IN `_ID_MATERIAL` INT)   BEGIN
    DELETE FROM material
    WHERE ID_MATERIAL = _ID_MATERIAL;
END$$

DROP PROCEDURE IF EXISTS `spDeleteNotificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteNotificacion` (IN `_ID_NOTI` INT(100))   BEGIN
    DELETE FROM notificacion
    WHERE ID_NOTI = _ID_NOTI ;
END$$

DROP PROCEDURE IF EXISTS `spDeletePrestamos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeletePrestamos` (IN `_ID_PRESTAMOS` INT)   BEGIN
    DELETE FROM prestamos
    WHERE ID_PRESTAMOS = _ID_PRESTAMOS;
END$$

DROP PROCEDURE IF EXISTS `spDeleteResElem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteResElem` (IN `_ID_RES_ELEM` INT)   BEGIN
    DELETE FROM res_elem
    WHERE ID_RES_ELEM = _ID_RES_ELEM;
END$$

DROP PROCEDURE IF EXISTS `spDeleteReserva`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteReserva` (IN `_ID_RESERVA` INT)   BEGIN
    DELETE FROM reserva
    WHERE ID_RESERVA = _ID_RESERVA;
END$$

DROP PROCEDURE IF EXISTS `spDeleteRol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteRol` (IN `_ID_ROL` INT)   BEGIN
    DELETE FROM rol
    WHERE ID_ROL = _ID_ROL;
END$$

DROP PROCEDURE IF EXISTS `spDeleteUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDeleteUsuario` (IN `_ID_USUARIO` INT)   BEGIN
    DELETE FROM usuario
    WHERE ID_USUARIO = _ID_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spFindAllAmbientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllAmbientes` ()   BEGIN
    SELECT ID_AMBIENTES, CANT_SILLAS, CANT_MESAS, NUM_APRENDICES, NUM_EQUIPOS
    FROM ambientes;
END$$

DROP PROCEDURE IF EXISTS `spFindAllComputador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllComputador` ()   BEGIN
    SELECT ID_COMPUTADOR, MARCA, CARGADOR, MOUSE
    FROM computador;
END$$

DROP PROCEDURE IF EXISTS `spFindAllElementos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllElementos` ()   BEGIN
    SELECT ID_ELEMENTOS, ID_PRESTAMOS, ID_INVENTARIO
    FROM elementos;
END$$

DROP PROCEDURE IF EXISTS `spFindAllHerramienta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllHerramienta` ()   BEGIN
    SELECT ID_HERRAMIENTA, TIPO, COLOR
    FROM herramienta;
END$$

DROP PROCEDURE IF EXISTS `spFindAllInventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllInventario` ()   BEGIN
    SELECT ID_INVENTARIO, CANTIDAD, FECHA_REGISTRO, ESTADO, ID_COMPUTADOR, ID_HERRAMIENTA, ID_AMBIENTES, ID_MATERIAL
    FROM inventario;
END$$

DROP PROCEDURE IF EXISTS `spFindAllMaterial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllMaterial` ()   BEGIN
    SELECT ID_MATERIAL,NOMBRE, TIPO, COLOR, MEDIDAS
    FROM material;
END$$

DROP PROCEDURE IF EXISTS `spFindAllNotificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllNotificacion` ()   BEGIN
    SELECT ID_NOTI, DESCRIPCION, ESTADO, ID_USUARIO
    FROM notificacion;
END$$

DROP PROCEDURE IF EXISTS `spFindAllPrestamos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllPrestamos` ()   BEGIN
    SELECT ID_PRESTAMOS, FECHA_PRESTAMO, FINAL_PRESTAMO, OBSERVACIONES, ID_USUARIO
    FROM prestamos;
END$$

DROP PROCEDURE IF EXISTS `spFindAllResElem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllResElem` ()   BEGIN
    SELECT ID_RES_ELEM, ID_RESERVA, ID_INVENTARIO
    FROM res_elem;
END$$

DROP PROCEDURE IF EXISTS `spFindAllReserva`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllReserva` ()   BEGIN
    SELECT ID_RESERVA, NOMBRE_INSUMO, TIPO_INSUMO, CARACTERISTICAS, CANTIDAD, JORNADA, FECHA_RES, HORA_RES, TIEMPO_REQUERIDO,ESTADO_APROBACION, ID_USUARIO
    FROM reserva;
END$$

DROP PROCEDURE IF EXISTS `spFindAllRol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllRol` ()   BEGIN
    SELECT ID_ROL, NOMBRE_ROL, ESTADO
    FROM rol;
END$$

DROP PROCEDURE IF EXISTS `spFindAllUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAllUsuario` ()   BEGIN
    SELECT ID_USUARIO, NOMBRE, APELLIDO, TIPO_DOCUMENTO, CORREO, TELEFONO, DIRECCION, JORNADA, PROGRAMA_FORMACION, NUM_FICHA, GENERO, CONTRASENA, ID_ROL
    FROM usuario;
END$$

DROP PROCEDURE IF EXISTS `spFindAmbientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindAmbientes` (IN `_ID` INT)   BEGIN
    SELECT ID_AMBIENTES, CANT_SILLAS, CANT_MESAS, NUM_APRENDICES, NUM_EQUIPOS
    FROM ambientes
    WHERE ID_AMBIENTES = _ID;
END$$

DROP PROCEDURE IF EXISTS `spFindComputador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindComputador` (IN `_ID_COMPUTADOR` INT)   BEGIN
    SELECT ID_COMPUTADOR, MARCA, CARGADOR, MOUSE
    FROM computador
    WHERE ID_COMPUTADOR = _ID_COMPUTADOR;
END$$

DROP PROCEDURE IF EXISTS `spFindElementos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindElementos` (IN `_ID_ELEMENTO` INT)   BEGIN
    SELECT ID_ELEMENTOS,ID_PRESTAMOS, ID_INVENTARIO
    FROM elementos
    WHERE ID_ELEMENTOS = _ID_ELEMENTO;
END$$

DROP PROCEDURE IF EXISTS `spFindHerramienta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindHerramienta` (IN `_ID_HERRAMIENTA` INT)   BEGIN
    SELECT ID_HERRAMIENTA, TIPO, COLOR
    FROM herramienta
    WHERE ID_HERRAMIENTA = _ID_HERRAMIENTA;
END$$

DROP PROCEDURE IF EXISTS `spFindInventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindInventario` (IN `_ID_INVENTARIO` INT)   BEGIN
    SELECT ID_INVENTARIO, CANTIDAD, FECHA_REGISTRO, ESTADO, ID_COMPUTADOR, ID_HERRAMIENTA, ID_AMBIENTES, ID_MATERIAL
    FROM inventario
    WHERE ID_INVENTARIO = _ID_INVENTARIO;
END$$

DROP PROCEDURE IF EXISTS `spFindMaterial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindMaterial` (IN `_ID_MATERIAL` INT)   BEGIN
    SELECT ID_MATERIAL, TIPO, COLOR, MEDIDAS
    FROM material
    WHERE ID_MATERIAL = _ID_MATERIAL;
END$$

DROP PROCEDURE IF EXISTS `spFindNotificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindNotificacion` (IN `_ID_NOTI` INT(100))   BEGIN
    SELECT ID_NOTI, DESCRIPCION, ESTADO, ID_USUARIO
    FROM notificacion
    WHERE ID_NOTI = _ID_NOTI ;
END$$

DROP PROCEDURE IF EXISTS `spFindPrestamos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindPrestamos` (IN `_ID_PRESTAMOS` INT)   BEGIN
    SELECT ID_PRESTAMOS, FECHA_PRESTAMO, FINAL_PRESTAMO, OBSERVACIONES, ID_USUARIO
    FROM prestamos
    WHERE ID_PRESTAMOS = _ID_PRESTAMOS;
END$$

DROP PROCEDURE IF EXISTS `spFindResElem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindResElem` (IN `_ID_RES_ELEM` INT)   BEGIN
    SELECT ID_RES_ELEM, ID_RESERVA, ID_INVENTARIO
    FROM res_elem
    WHERE ID_RES_ELEM = _ID_RES_ELEM;
END$$

DROP PROCEDURE IF EXISTS `spFindReserva`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindReserva` (IN `_ID_RESERVA` INT)   BEGIN
    SELECT ID_RESERVA, NOMBRE_INSUMO, TIPO_INSUMO, CARACTERISTICAS, CANTIDAD, JORNADA, FECHA_RES, HORA_RES, TIEMPO_REQUERIDO,ESTADO_APROBACION, ID_USUARIO
    FROM reserva
    WHERE ID_RESERVA = _ID_RESERVA;
END$$

DROP PROCEDURE IF EXISTS `spFindRol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindRol` (IN `_ID_ROL` INT)   BEGIN
    SELECT ID_ROL, NOMBRE_ROL, ESTADO
    FROM rol
    WHERE ID_ROL = _ID_ROL;
END$$

DROP PROCEDURE IF EXISTS `spFindUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spFindUsuario` (IN `_ID_USUARIO` INT)   BEGIN
    SELECT ID_USUARIO, NOMBRE, APELLIDO, TIPO_DOCUMENTO,CORREO, TELEFONO, DIRECCION, JORNADA, PROGRAMA_FORMACION, NUM_FICHA, GENERO, CONTRASENA, ID_ROL
    FROM usuario
    WHERE ID_USUARIO = _ID_USUARIO;
END$$

DROP PROCEDURE IF EXISTS `spInsertAmbientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertAmbientes` (IN `_ID_AMBIENTES` INT, IN `_CANT_SILLAS` INT, IN `_CANT_MESAS` INT, IN `_NUM_APRENDICES` INT, IN `_NUM_EQUIPOS` INT)   BEGIN
    INSERT INTO ambientes (ID_AMBIENTES, CANT_SILLAS, CANT_MESAS, NUM_APRENDICES, NUM_EQUIPOS)
    VALUES (_ID_AMBIENTES, _CANT_SILLAS, _CANT_MESAS, _NUM_APRENDICES, _NUM_EQUIPOS);
END$$

DROP PROCEDURE IF EXISTS `spInsertComputador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertComputador` (IN `_ID_COMPUTADOR` INT, IN `_MARCA` VARCHAR(100), IN `_CARGADOR` VARCHAR(10), IN `_MOUSE` VARCHAR(10))   BEGIN
    INSERT INTO computador (ID_COMPUTADOR, MARCA, CARGADOR, MOUSE)
    VALUES (_ID_COMPUTADOR, _MARCA, _CARGADOR, _MOUSE);
END$$

DROP PROCEDURE IF EXISTS `spInsertElementos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertElementos` (IN `_ID_PRESTAMOS` INT, IN `_ID_INVENTARIO` INT)   BEGIN
    INSERT INTO elementos (ID_PRESTAMOS, ID_INVENTARIO)
    VALUES (_ID_PRESTAMOS, _ID_INVENTARIO);
END$$

DROP PROCEDURE IF EXISTS `spInsertHerramienta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertHerramienta` (IN `_TIPO` VARCHAR(100), IN `_COLOR` VARCHAR(10))   BEGIN
    INSERT INTO herramienta ( TIPO, COLOR)
    VALUES ( _TIPO, _COLOR);
END$$

DROP PROCEDURE IF EXISTS `spInsertInventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertInventario` (IN `_CANTIDAD` INT, IN `_FECHA_REGISTRO` DATE, IN `_ESTADO` TINYINT, IN `_ID_COMPUTADOR` INT, IN `_ID_HERRAMIENTA` INT, IN `_ID_AMBIENTES` INT, IN `_ID_MATERIAL` INT)   BEGIN
    INSERT INTO inventario (CANTIDAD, FECHA_REGISTRO, ESTADO, ID_COMPUTADOR, ID_HERRAMIENTA, ID_AMBIENTES, ID_MATERIAL)
    VALUES ( _CANTIDAD, _FECHA_REGISTRO, _ESTADO, _ID_COMPUTADOR, _ID_HERRAMIENTA, _ID_AMBIENTES, _ID_MATERIAL);
END$$

DROP PROCEDURE IF EXISTS `spInsertMaterial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertMaterial` (IN `_NOMBRE` VARCHAR(100), IN `_TIPO` VARCHAR(100), IN `_COLOR` VARCHAR(10), IN `_MEDIDAS` VARCHAR(10))   BEGIN
    INSERT INTO material (NOMBRE,TIPO, COLOR, MEDIDAS)
    VALUES (_NOMBRE,_TIPO, _COLOR, _MEDIDAS);
END$$

DROP PROCEDURE IF EXISTS `spInsertNotificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertNotificacion` (IN `_DESCRIPCION` VARCHAR(300), IN `_ESTADO` VARCHAR(100), IN `_ID_USUARIO` INT(100))   BEGIN 
INSERT INTO notificacion (DESCRIPCION, ESTADO, ID_USUARIO)
VALUES (_DESCRIPCION,_ESTADO,_ID_USUARIO);
END$$

DROP PROCEDURE IF EXISTS `spInsertPrestamos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertPrestamos` (IN `_FECHA_PRESTAMO` DATE, IN `_FINAL_PRESTAMO` DATE, IN `_OBSERVACIONES` VARCHAR(100), IN `_ID_USUARIO` INT)   BEGIN
    INSERT INTO prestamos (FECHA_PRESTAMO, FINAL_PRESTAMO, OBSERVACIONES, ID_USUARIO)
    VALUES (_FECHA_PRESTAMO, _FINAL_PRESTAMO, _OBSERVACIONES, _ID_USUARIO);
END$$

DROP PROCEDURE IF EXISTS `spInsertResElem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertResElem` (IN `_ID_RESERVA` INT(100), IN `_ID_INVENTARIO` INT(100))   BEGIN
    INSERT INTO res_elem (ID_RESERVA, ID_INVENTARIO)
    VALUES ( _ID_RESERVA, _ID_INVENTARIO);
END$$

DROP PROCEDURE IF EXISTS `spInsertReserva`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertReserva` (IN `_NOMBRE_INSUMO` VARCHAR(30), IN `_TIPO_INSUMO` VARCHAR(100), IN `_CARACTERISTICAS` VARCHAR(100), IN `_CANTIDAD` INT(100), IN `_JORNADA` VARCHAR(20), IN `_FECHA_RES` DATE, IN `_HORA_RES` TIME, IN `_TIEMPO_REQUERIDO` TIME, IN `_ESTADO_APROBACION` BOOLEAN, IN `_ID_USUARIO` INT)   BEGIN
    INSERT INTO reserva (NOMBRE_INSUMO, TIPO_INSUMO, CARACTERISTICAS, CANTIDAD, JORNADA, FECHA_RES, HORA_RES, TIEMPO_REQUERIDO,ESTADO_APROBACION, ID_USUARIO)
    VALUES (_NOMBRE_INSUMO, _TIPO_INSUMO, _CARACTERISTICAS, _CANTIDAD, _JORNADA, _FECHA_RES, _HORA_RES, _TIEMPO_REQUERIDO,_ESTADO_APROBACION, _ID_USUARIO);
END$$

DROP PROCEDURE IF EXISTS `spInsertRol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertRol` (IN `_ID_ROL` INT, IN `_NOMBRE_ROL` VARCHAR(100), IN `_ESTADO` TINYINT)   BEGIN
    INSERT INTO rol (ID_ROL,NOMBRE_ROL, ESTADO)
    VALUES (_ID_ROL,_NOMBRE_ROL, _ESTADO);
END$$

DROP PROCEDURE IF EXISTS `spInsertUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertUsuario` (IN `_ID_USUARIO` INT(100), IN `_NOMBRE` VARCHAR(30), IN `_APELLIDO` VARCHAR(30), IN `_TIPO_DOCUMENTO` VARCHAR(3), IN `_CORREO` VARCHAR(30), IN `_TELEFONO` VARCHAR(12), IN `_DIRECCION` VARCHAR(30), IN `_JORNADA` VARCHAR(30), IN `_PROGRAMA_FORMACION` VARCHAR(100), IN `_NUM_FICHA` INT, IN `_GENERO` VARCHAR(10), IN `_CONTRASENA` VARCHAR(100), IN `_ID_ROL` INT)   BEGIN
    INSERT INTO usuario (ID_USUARIO, NOMBRE, APELLIDO, TIPO_DOCUMENTO,CORREO, TELEFONO, DIRECCION, JORNADA, PROGRAMA_FORMACION, NUM_FICHA, GENERO, CONTRASENA, ID_ROL)
    VALUES (_ID_USUARIO, _NOMBRE, _APELLIDO, _TIPO_DOCUMENTO, _CORREO, _TELEFONO, _DIRECCION, _JORNADA, _PROGRAMA_FORMACION, _NUM_FICHA, _GENERO, _CONTRASENA, _ID_ROL);
END$$

DROP PROCEDURE IF EXISTS `spInsumosReserva`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsumosReserva` (IN `_NOMBRE_INSUMO` VARCHAR(30), IN `_TIPO_INSUMO` VARCHAR(100), IN `_CARACTERISTICAS` VARCHAR(100), IN `_CANTIDAD` INT(100), IN `_JORNADA` VARCHAR(20), IN `_FECHA_RES` DATE, IN `_HORA_RES` TIME, IN `_TIEMPO_REQUERIDO` TIME, IN `_ID_USUARIO` INT)   BEGIN
INSERT INTO reserva (NOMBRE_INSUMO, TIPO_INSUMO, CARACTERISTICAS, CANTIDAD, JORNADA, FECHA_RES, HORA_RES,TIEMPO_REQUERIDO,ID_USUARIO)
VALUES(_NOMBRE_INSUMO, _TIPO_INSUMO, _CARACTERISTICAS,
       _CANTIDAD,_JORNADA,_FECHA_RES,_HORA_RES,
       _TIEMPO_REQUERIDO,_ID_USUARIO);
 END$$

DROP PROCEDURE IF EXISTS `spUpdateAmbientes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateAmbientes` (IN `_ID` INT, IN `_CANT_SILLAS` INT, IN `_CANT_MESAS` INT, IN `_NUM_APRENDICES` INT, IN `_NUM_EQUIPOS` INT)   BEGIN
    UPDATE ambientes
    SET CANT_SILLAS = _CANT_SILLAS, CANT_MESAS = _CANT_MESAS, NUM_APRENDICES = _NUM_APRENDICES, NUM_EQUIPOS = _NUM_EQUIPOS
    WHERE ID_AMBIENTES = _ID;
END$$

DROP PROCEDURE IF EXISTS `spUpdateComputador`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateComputador` (IN `_ID_COMPUTADOR` INT, IN `_MARCA` VARCHAR(100), IN `_CARGADOR` VARCHAR(10), IN `_MOUSE` VARCHAR(10))   BEGIN
    UPDATE computador
    SET MARCA = _MARCA, CARGADOR = _CARGADOR, MOUSE = _MOUSE
    WHERE ID_COMPUTADOR = _ID_COMPUTADOR;
END$$

DROP PROCEDURE IF EXISTS `spUpdateElementos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateElementos` (IN `_ID_ELEMENTO` INT, IN `_ID_PRESTAMOS` INT, IN `_ID_INVENTARIO` INT)   BEGIN
    UPDATE elementos
    SET ID_PRESTAMOS = _ID_PRESTAMOS, ID_INVENTARIO = _ID_INVENTARIO
    WHERE ID_ELEMENTOS = _ID_ELEMENTO;
END$$

DROP PROCEDURE IF EXISTS `spUpdateHerramienta`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateHerramienta` (IN `_ID_HERRAMIENTA` INT, IN `_TIPO` VARCHAR(100), IN `_COLOR` VARCHAR(10))   BEGIN
    UPDATE herramienta
    SET TIPO = _TIPO, COLOR = _COLOR
    WHERE ID_HERRAMIENTA = _ID_HERRAMIENTA;
END$$

DROP PROCEDURE IF EXISTS `spUpdateInventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateInventario` (IN `_ID_INVENTARIO` INT, IN `_CANTIDAD` INT, IN `_FECHA_REGISTRO` DATE, IN `_ESTADO` TINYINT, IN `_ID_COMPUTADOR` INT, IN `_ID_HERRAMIENTA` INT, IN `_ID_AMBIENTES` INT, IN `_ID_MATERIAL` INT)   BEGIN
    UPDATE inventario
    SET CANTIDAD = _CANTIDAD, FECHA_REGISTRO = _FECHA_REGISTRO, ESTADO = _ESTADO, ID_COMPUTADOR = _ID_COMPUTADOR, ID_HERRAMIENTA = _ID_HERRAMIENTA, ID_AMBIENTES = _ID_AMBIENTES, ID_MATERIAL = _ID_MATERIAL
    WHERE ID_INVENTARIO = _ID_INVENTARIO;
END$$

DROP PROCEDURE IF EXISTS `spUpdateMaterial`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateMaterial` (IN `_ID_MATERIAL` INT, IN `_NOMBRE` VARCHAR(100), IN `_TIPO` VARCHAR(100), IN `_COLOR` VARCHAR(10), IN `_MEDIDAS` VARCHAR(10))   BEGIN
    UPDATE material
    SET NOMBRE = _NOMBRE,TIPO = _TIPO, COLOR = _COLOR, MEDIDAS = _MEDIDAS
    WHERE ID_MATERIAL = _ID_MATERIAL;
END$$

DROP PROCEDURE IF EXISTS `spUpdateNotificacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateNotificacion` (IN `_ID_NOTI` INT(100), IN `_DESCRIPCION` VARCHAR(300), IN `_ESTADO` VARCHAR(100), IN `_ID_USUARIO` INT(100))   BEGIN
    UPDATE notificacion
    SET DESCRIPCION = _DESCRIPCION, ESTADO = _ESTADO, ID_USUARIO = _ID_USUARIO
    WHERE ID_NOTI = _ID_NOTI;
END$$

DROP PROCEDURE IF EXISTS `spUpdatePrestamos`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdatePrestamos` (IN `_ID_PRESTAMOS` INT, IN `_FECHA_PRESTAMO` DATE, IN `_FINAL_PRESTAMO` DATE, IN `_OBSERVACIONES` VARCHAR(100), IN `_ID_USUARIO` INT)   BEGIN
    UPDATE prestamos
    SET FECHA_PRESTAMO = _FECHA_PRESTAMO, FINAL_PRESTAMO = _FINAL_PRESTAMO, OBSERVACIONES = _OBSERVACIONES, ID_USUARIO = _ID_USUARIO
    WHERE ID_PRESTAMOS = _ID_PRESTAMOS;
END$$

DROP PROCEDURE IF EXISTS `spUpdateResElem`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateResElem` (IN `_ID_RES_ELEM` INT, IN `_ID_RESERVA` INT, IN `_ID_INVENTARIO` INT)   BEGIN
    UPDATE res_elem
    SET ID_RESERVA = _ID_RESERVA, ID_INVENTARIO = _ID_INVENTARIO
    WHERE ID_RES_ELEM = _ID_RES_ELEM;
END$$

DROP PROCEDURE IF EXISTS `spUpdateReserva`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateReserva` (IN `_ID_RESERVA` INT, IN `_NOMBRE_INSUMO` VARCHAR(100), IN `_TIPO_INSUMO` VARCHAR(100), IN `_CARACTERISTICAS` VARCHAR(100), IN `_CANTIDAD` INT(100), IN `_JORNADA` INT, IN `_FECHA_RES` DATE, IN `_HORA_RES` TIME, IN `_TIEMPO_REQUERIDO` TIME, IN `_ESTADO_APROBACION` BOOLEAN, IN `_ID_USUARIO` INT)   BEGIN
    UPDATE reserva
    SET NOMBRE_INSUMO= _NOMBRE_INSUMO, TIPO_INSUMO = _TIPO_INSUMO ,CARACTERISTICAS = _CARACTERISTICAS, CANTIDAD = _CANTIDAD, JORNADA = _JORNADA, FECHA_RES = _FECHA_RES, HORA_RES = _HORA_RES, TIEMPO_REQUERIDO = _TIEMPO_REQUERIDO,ESTADO_APROBACION = _ESTADO_APROBACION, ID_USUARIO = _ID_USUARIO
    WHERE ID_RESERVA = _ID_RESERVA;
END$$

DROP PROCEDURE IF EXISTS `spUpdateRol`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateRol` (IN `_ID_ROL` INT, IN `_NOMBRE_ROL` VARCHAR(100), IN `_ESTADO` TINYINT)   BEGIN
    UPDATE rol
    SET NOMBRE_ROL = _NOMBRE_ROL, ESTADO = _ESTADO
    WHERE ID_ROL = _ID_ROL;
END$$

DROP PROCEDURE IF EXISTS `spUpdateUsuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdateUsuario` (IN `_ID_USUARIO` INT, IN `_NOMBRE` VARCHAR(30), IN `_APELLIDO` VARCHAR(30), IN `_TIPO_DOCUMENTO` VARCHAR(3), IN `_NUM_DOCUMENTO` INT, IN `_CORREO` VARCHAR(30), IN `_TELEFONO` VARCHAR(12), IN `_DIRECCION` VARCHAR(30), IN `_JORNADA` VARCHAR(30), IN `_PROGRAMA_FORMACION` VARCHAR(100), IN `_NUM_FICHA` INT, IN `_GENERO` VARCHAR(10), IN `_CONTRASENA` VARCHAR(100), IN `_ID_ROL` INT)   BEGIN
    UPDATE usuario
    SET NOMBRE = _NOMBRE, APELLIDO = _APELLIDO, TIPO_DOCUMENTO = _TIPO_DOCUMENTO, NUM_DOCUMENTO = _NUM_DOCUMENTO, CORREO = _CORREO, TELEFONO = _TELEFONO, DIRECCION = _DIRECCION, JORNADA = _JORNADA, PROGRAMA_FORMACION = _PROGRAMA_FORMACION, NUM_FICHA = _NUM_FICHA, GENERO = _GENERO, CONTRASENA = _CONTRASENA, ID_ROL = _ID_ROL
    WHERE ID_USUARIO = _ID_USUARIO;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

DROP TABLE IF EXISTS `ambientes`;
CREATE TABLE `ambientes` (
  `ID_AMBIENTES` int(100) NOT NULL,
  `CANT_SILLAS` int(100) DEFAULT NULL,
  `CANT_MESAS` int(100) DEFAULT NULL,
  `NUM_APRENDICES` int(100) DEFAULT NULL,
  `NUM_EQUIPOS` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `ambientes`
--

INSERT INTO `ambientes` (`ID_AMBIENTES`, `CANT_SILLAS`, `CANT_MESAS`, `NUM_APRENDICES`, `NUM_EQUIPOS`) VALUES
(101, 30, 15, 16, 20),
(105, 20, 10, 15, 20),
(108, 35, 17, 35, 25),
(115, 26, 10, 21, 25),
(116, 20, 9, 17, 20),
(120, 30, 13, 21, 24),
(123, 30, 10, 25, 20),
(127, 34, 12, 20, 25),
(130, 38, 20, 30, 30),
(224, 23, 15, 20, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `computador`
--

DROP TABLE IF EXISTS `computador`;
CREATE TABLE `computador` (
  `ID_COMPUTADOR` int(100) NOT NULL,
  `MARCA` varchar(100) DEFAULT NULL,
  `CARGADOR` varchar(10) DEFAULT NULL,
  `MOUSE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `computador`
--

INSERT INTO `computador` (`ID_COMPUTADOR`, `MARCA`, `CARGADOR`, `MOUSE`) VALUES
(1, 'hp', 'No', 'SI'),
(2, 'hp', 'No', 'NO'),
(4, 'asus', 'SI', 'NO'),
(5, 'hp', 'SI', 'NO'),
(6, 'asus', 'SI', 'NO'),
(7, 'asus', 'SI', 'NO'),
(8, 'asus', 'SI', 'NO'),
(9, 'asus', 'SI', 'NO'),
(10, 'asus', 'SI', 'NO'),
(11, 'hp', 'SI', 'NO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `elementos`
--

DROP TABLE IF EXISTS `elementos`;
CREATE TABLE `elementos` (
  `ID_ELEMENTOS` int(100) NOT NULL,
  `ID_PRESTAMOS` int(100) DEFAULT NULL,
  `ID_INVENTARIO` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `elementos`
--

INSERT INTO `elementos` (`ID_ELEMENTOS`, `ID_PRESTAMOS`, `ID_INVENTARIO`) VALUES
(1, 3, 1),
(2, 4, 2),
(3, 2, 3),
(4, 5, 4),
(5, 7, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `herramienta`
--

DROP TABLE IF EXISTS `herramienta`;
CREATE TABLE `herramienta` (
  `ID_HERRAMIENTA` int(100) NOT NULL,
  `TIPO` varchar(100) DEFAULT NULL,
  `COLOR` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `herramienta`
--

INSERT INTO `herramienta` (`ID_HERRAMIENTA`, `TIPO`, `COLOR`) VALUES
(1, 'plana', 'marron'),
(2, 'plana', 'rosa'),
(3, 'corte', 'gris'),
(5, 'electrica', 'gris'),
(6, 'corte', 'gris'),
(7, 'corte', 'marron'),
(8, 'corte', 'negra'),
(9, 'corte', 'gris'),
(10, 'soldar', 'amarilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

DROP TABLE IF EXISTS `inventario`;
CREATE TABLE `inventario` (
  `ID_INVENTARIO` int(100) NOT NULL,
  `CANTIDAD` int(100) NOT NULL,
  `FECHA_REGISTRO` date NOT NULL,
  `ESTADO` tinyint(1) NOT NULL,
  `ID_AMBIENTES` int(100) NOT NULL,
  `ID_COMPUTADOR` int(100) NOT NULL,
  `ID_HERRAMIENTA` int(100) NOT NULL,
  `ID_MATERIAL` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`ID_INVENTARIO`, `CANTIDAD`, `FECHA_REGISTRO`, `ESTADO`, `ID_AMBIENTES`, `ID_COMPUTADOR`, `ID_HERRAMIENTA`, `ID_MATERIAL`) VALUES
(1, 2, '2023-06-01', 1, 123, 1, 1, 4),
(2, 3, '2023-06-08', 1, 105, 1, 5, 9),
(3, 21, '2023-06-07', 1, 120, 4, 2, 3),
(4, 4, '2023-06-06', 0, 101, 7, 7, 1),
(5, 5, '2023-06-06', 0, 105, 2, 1, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `material`
--

DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `ID_MATERIAL` int(100) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `TIPO` varchar(100) DEFAULT NULL,
  `COLOR` varchar(10) DEFAULT NULL,
  `MEDIDAS` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `material`
--

INSERT INTO `material` (`ID_MATERIAL`, `NOMBRE`, `TIPO`, `COLOR`, `MEDIDAS`) VALUES
(1, 'tela', 'algodon', 'blanco', '60 cm'),
(2, 'tela', 'cuero', 'azul', '3 cm'),
(3, 'tela', 'sintetico', 'negro', '50 cm'),
(4, 'tela', 'trasparente', 'azul', '50 cm y 60 cm'),
(5, 'tela', 'algodon', 'blanco', '60 cm'),
(6, 'tela', 'sintetico', 'negro', '50 cm'),
(7, 'tela', 'sintentica', 'morado', '200 cm'),
(8, 'tela', 'algodon', 'blanco', '60 cm'),
(9, 'tela', 'algodon', 'blanco', '60 cm'),
(10, 'tela', 'cuero', 'marron', '40cm'),
(99, 'tela', 'sintentica', 'morado', 'm');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notificacion`
--

DROP TABLE IF EXISTS `notificacion`;
CREATE TABLE `notificacion` (
  `ID_NOTI` int(100) NOT NULL,
  `DESCRIPCION` varchar(300) NOT NULL,
  `ESTADO` varchar(100) NOT NULL,
  `ID_USUARIO` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `notificacion`
--

INSERT INTO `notificacion` (`ID_NOTI`, `DESCRIPCION`, `ESTADO`, `ID_USUARIO`) VALUES
(1, 'undefined', 'undefined', 0),
(2, 'el prestamo fue aprobado', 'recibida', 2),
(3, 'prestamo aprobado', 'aprobado', 2),
(4, 'prestamo aprobado', 'aprobado', 2),
(5, 'prestamo aprobado', 'aprobado_coordi', 0),
(6, 'prestamo aprobado', 'aprobado_coordi', 0),
(7, 'prestamo aprobado', 'aprobado_coordi', 1035972071),
(8, 'prestamo aprobado', 'aprobado_coordi', 1040571170),
(9, 'prestamo aprobado', 'aprobado_coordi', 0),
(10, 'prestamo aprobado', 'aprobado_coordi', 1035972906),
(11, 'prestamo aprobado', 'aprobado_coordi', 1025882179),
(12, 'prestamo aprobado', 'aprobado_coordi', 1035972906),
(13, 'prestamo Rechazado', 'Rechazado_coordi', 1035972906),
(14, 'prestamo Rechazado', 'Rechazado_coordi', 1035972906),
(15, 'prestamo Rechazado', 'Rechazado_coordi', 1035972906),
(16, 'prestamo Rechazado', 'Rechazado_coordi', 1035972906),
(17, 'prestamo aprobado', 'aprobado_coordi', 1035972906),
(18, 'prestamo Rechazado', 'Rechazado_coordi', 1035972906),
(19, 'prestamo Rechazado', 'Rechazado_coordi', 1035972906),
(20, 'prestamo Rechazado', 'Rechazado', 1035972906),
(21, 'prestamo aprobado', 'aprobado', 1035972906);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
CREATE TABLE `prestamos` (
  `ID_PRESTAMOS` int(100) NOT NULL,
  `FECHA_PRESTAMO` date NOT NULL,
  `FINAL_PRESTAMO` date NOT NULL,
  `OBSERVACIONES` varchar(100) NOT NULL,
  `ID_USUARIO` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`ID_PRESTAMOS`, `FECHA_PRESTAMO`, `FINAL_PRESTAMO`, `OBSERVACIONES`, `ID_USUARIO`) VALUES
(1, '2023-06-01', '2023-06-05', 'Préstamo de libros', 1025881880),
(2, '2023-06-02', '2023-06-04', 'Préstamo de equipo audiovisual', 1035972071),
(3, '2023-06-03', '2023-06-07', 'Préstamo de computadora portátil', 1025881880),
(4, '2023-06-04', '2023-06-06', 'Préstamo de proyector', 1035972071),
(5, '2023-06-05', '2023-06-08', 'Préstamo de herramientas', 1040571170),
(6, '2023-06-06', '2023-06-09', 'Préstamo de instrumentos musicales', 1025882179),
(7, '2023-06-07', '2023-06-10', 'Préstamo de material de laboratorio', 1035972906),
(8, '2023-06-08', '2023-06-11', 'Préstamo de bicicletas', 1035972906),
(9, '2023-06-09', '2023-06-12', 'Préstamo de cámaras fotográficas', 1035972071),
(10, '2023-06-10', '2023-06-13', 'Préstamo de juegos de mesa', 1035972906);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

DROP TABLE IF EXISTS `reserva`;
CREATE TABLE `reserva` (
  `ID_RESERVA` int(100) NOT NULL,
  `NOMBRE_INSUMO` varchar(100) NOT NULL,
  `TIPO_INSUMO` varchar(100) NOT NULL,
  `CARACTERISTICAS` varchar(100) NOT NULL,
  `CANTIDAD` int(100) NOT NULL,
  `JORNADA` varchar(20) NOT NULL,
  `FECHA_RES` date NOT NULL,
  `HORA_RES` time NOT NULL,
  `TIEMPO_REQUERIDO` time NOT NULL,
  `ESTADO_APROBACION` varchar(100) NOT NULL,
  `ID_USUARIO` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `reserva`
--

INSERT INTO `reserva` (`ID_RESERVA`, `NOMBRE_INSUMO`, `TIPO_INSUMO`, `CARACTERISTICAS`, `CANTIDAD`, `JORNADA`, `FECHA_RES`, `HORA_RES`, `TIEMPO_REQUERIDO`, `ESTADO_APROBACION`, `ID_USUARIO`) VALUES
(1, 'tela', 'material', 'algodon', 3, 'tarde', '2023-06-01', '11:57:34', '53:57:20', '', 1035972906),
(2, 'martillo', 'herramienta', 'electrico', 3, 'mañana', '2023-06-07', '33:04:13', '16:04:13', '', 1035972071),
(3, 'asus', 'computador', 'tiene cargador', 1, 'tarde', '2023-06-15', '30:04:50', '36:04:50', '', 1025882179),
(4, 'ambiente', 'ambiente', '30 sillas', 1, 'tarde', '2023-06-01', '13:06:28', '15:06:28', '', 1035972906);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `res_elem`
--

DROP TABLE IF EXISTS `res_elem`;
CREATE TABLE `res_elem` (
  `ID_RES_ELEM` int(100) NOT NULL,
  `ID_RESERVA` int(100) NOT NULL,
  `ID_INVENTARIO` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `res_elem`
--

INSERT INTO `res_elem` (`ID_RES_ELEM`, `ID_RESERVA`, `ID_INVENTARIO`) VALUES
(1, 4, 1),
(2, 3, 2),
(3, 2, 3),
(4, 1, 4),
(5, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `ID_ROL` int(100) NOT NULL,
  `NOMBRE_ROL` varchar(100) NOT NULL,
  `ESTADO` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`ID_ROL`, `NOMBRE_ROL`, `ESTADO`) VALUES
(1, 'Aprendiz', 0),
(2, 'Instructor', 0),
(3, 'Coordinador', 0),
(4, 'Administrador', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID_USUARIO` int(100) NOT NULL,
  `NOMBRE` varchar(30) DEFAULT NULL,
  `APELLIDO` varchar(30) DEFAULT NULL,
  `TIPO_DOCUMENTO` varchar(3) DEFAULT NULL,
  `CORREO` varchar(30) DEFAULT NULL,
  `TELEFONO` varchar(12) DEFAULT NULL,
  `DIRECCION` varchar(30) DEFAULT NULL,
  `JORNADA` varchar(30) DEFAULT NULL,
  `PROGRAMA_FORMACION` varchar(100) DEFAULT NULL,
  `NUM_FICHA` int(15) DEFAULT NULL,
  `GENERO` varchar(10) DEFAULT NULL,
  `CONTRASENA` varchar(100) NOT NULL,
  `ID_ROL` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `NOMBRE`, `APELLIDO`, `TIPO_DOCUMENTO`, `CORREO`, `TELEFONO`, `DIRECCION`, `JORNADA`, `PROGRAMA_FORMACION`, `NUM_FICHA`, `GENERO`, `CONTRASENA`, `ID_ROL`) VALUES
(1025881880, 'agata', 'penagos', 'cc', 'agatapenagos5@gmail.com', '3016217959', 'carrera61', 'diruna', 'ADSO', 2696118, 'masculino', '456', 4),
(1025882179, 'daniela', 'jaramillo', 'cc', 'danielajaraga@gmail.com', '3043963615', 'carrera69', 'diruna', 'ADSI', 2472762, 'femenino', 'danilinda', 1),
(1035972071, 'marithza ', 'castaño', 'cc', 'castaño77@gmail.com', '3206781967', 'carrera70', 'diruna', 'ADSO', 2696118, 'femenino', '8910', 2),
(1035972906, 'victoria', 'rendon', 'TI', 'vickyrendon@gmail.com', '3234377424', 'carrera50', 'diruna', 'ADSO', 2696118, 'femenino', '456', 2),
(1040571170, 'camila', 'grajales', 'cc', 'mcgrajalesv@gmail.com', '3128611996', 'cra 43-56-90', 'tarde', 'adsi', 2472762, 'femenino', '123', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`ID_AMBIENTES`);

--
-- Indices de la tabla `computador`
--
ALTER TABLE `computador`
  ADD PRIMARY KEY (`ID_COMPUTADOR`);

--
-- Indices de la tabla `elementos`
--
ALTER TABLE `elementos`
  ADD PRIMARY KEY (`ID_ELEMENTOS`),
  ADD KEY `ID_PRESTAMOS` (`ID_PRESTAMOS`),
  ADD KEY `ID_INVENTARIO` (`ID_INVENTARIO`);

--
-- Indices de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  ADD PRIMARY KEY (`ID_HERRAMIENTA`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`ID_INVENTARIO`),
  ADD KEY `ID_HERRAMIENTA` (`ID_HERRAMIENTA`),
  ADD KEY `ID_AMBIENTES` (`ID_AMBIENTES`),
  ADD KEY `ID_COMPUTADOR` (`ID_COMPUTADOR`),
  ADD KEY `ID_MATERIAL` (`ID_MATERIAL`);

--
-- Indices de la tabla `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`ID_MATERIAL`);

--
-- Indices de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  ADD PRIMARY KEY (`ID_NOTI`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`ID_PRESTAMOS`),
  ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`ID_RESERVA`),
  ADD KEY `fk__ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `res_elem`
--
ALTER TABLE `res_elem`
  ADD PRIMARY KEY (`ID_RES_ELEM`),
  ADD KEY `fk_ID_RESERVA` (`ID_RESERVA`),
  ADD KEY `fk_ID_INVENTARIO` (`ID_INVENTARIO`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`ID_ROL`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`),
  ADD KEY `ID_ROL` (`ID_ROL`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `computador`
--
ALTER TABLE `computador`
  MODIFY `ID_COMPUTADOR` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `elementos`
--
ALTER TABLE `elementos`
  MODIFY `ID_ELEMENTOS` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `herramienta`
--
ALTER TABLE `herramienta`
  MODIFY `ID_HERRAMIENTA` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `ID_INVENTARIO` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT de la tabla `material`
--
ALTER TABLE `material`
  MODIFY `ID_MATERIAL` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `notificacion`
--
ALTER TABLE `notificacion`
  MODIFY `ID_NOTI` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `ID_PRESTAMOS` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `ID_RESERVA` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT de la tabla `res_elem`
--
ALTER TABLE `res_elem`
  MODIFY `ID_RES_ELEM` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `ID_ROL` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `elementos`
--
ALTER TABLE `elementos`
  ADD CONSTRAINT `ID_INVENTARIO` FOREIGN KEY (`ID_INVENTARIO`) REFERENCES `inventario` (`ID_INVENTARIO`),
  ADD CONSTRAINT `ID_PRESTAMOS` FOREIGN KEY (`ID_PRESTAMOS`) REFERENCES `prestamos` (`ID_PRESTAMOS`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `ID_AMBIENTES` FOREIGN KEY (`ID_AMBIENTES`) REFERENCES `ambientes` (`ID_AMBIENTES`),
  ADD CONSTRAINT `ID_COMPUTADOR` FOREIGN KEY (`ID_COMPUTADOR`) REFERENCES `computador` (`ID_COMPUTADOR`),
  ADD CONSTRAINT `ID_HERRAMIENTA` FOREIGN KEY (`ID_HERRAMIENTA`) REFERENCES `herramienta` (`ID_HERRAMIENTA`),
  ADD CONSTRAINT `ID_MATERIAL` FOREIGN KEY (`ID_MATERIAL`) REFERENCES `material` (`ID_MATERIAL`);

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `fk_ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`),
  ADD CONSTRAINT `fk__ID_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`);

--
-- Filtros para la tabla `res_elem`
--
ALTER TABLE `res_elem`
  ADD CONSTRAINT `fk_ID_INVENTARIO` FOREIGN KEY (`ID_INVENTARIO`) REFERENCES `inventario` (`ID_INVENTARIO`),
  ADD CONSTRAINT `fk_ID_RESERVA` FOREIGN KEY (`ID_RESERVA`) REFERENCES `reserva` (`ID_RESERVA`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `ID_ROL` FOREIGN KEY (`ID_ROL`) REFERENCES `rol` (`ID_ROL`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
