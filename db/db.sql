-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 24-07-2021 a las 07:31:50
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `distri44_farmacia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `ubicacion` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `almacen`
--

INSERT INTO `almacen` (`id`, `nombre`, `ubicacion`, `telefono`) VALUES
(14, 'EL MINERITO', 'JUAN DE TOLOSA #820 B ', '492 688 18 85'),
(15, 'MOSTRADOR GPE', 'GPE', '5646');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `annuities`
--

CREATE TABLE `annuities` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `concepto` varchar(254) NOT NULL,
  `price` float NOT NULL,
  `date_ini` datetime NOT NULL DEFAULT current_timestamp(),
  `date_last` datetime NOT NULL DEFAULT current_timestamp(),
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL DEFAULT '',
  `telefono` varchar(254) NOT NULL,
  `descuento` int(11) NOT NULL,
  `rfc` varchar(254) NOT NULL DEFAULT '',
  `razon_social` varchar(254) NOT NULL DEFAULT '',
  `correo` varchar(254) NOT NULL,
  `prospecto` tinyint(1) NOT NULL DEFAULT 0,
  `interes` varchar(254) NOT NULL DEFAULT '',
  `c_entero_nosotros` varchar(254) NOT NULL DEFAULT '',
  `user` int(11) NOT NULL,
  `creado` date NOT NULL,
  `clasificacion` varchar(254) NOT NULL DEFAULT 'B'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `nombre`, `direccion`, `telefono`, `descuento`, `rfc`, `razon_social`, `correo`, `prospecto`, `interes`, `c_entero_nosotros`, `user`, `creado`, `clasificacion`) VALUES
(1, 'PUBLICO EN GENERAL', '', '', 0, '', '', '', 0, '', '', 1, '2021-07-22', 'B'),
(307, 'CAMION ROJO', 'CAMION DE TURISMO', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B'),
(308, 'SOY CLIENTE ARGENTOURS', '', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B'),
(309, 'SOY CLIENTE RECEPTURZ', '', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B'),
(310, 'SOY MINERITO', 'CODIGO FANPAGE', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B'),
(313, 'CENTAURO RESTAURANTE', '', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B'),
(314, 'MI VIEJO ZACATECAS', '', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B'),
(315, 'CITY TOURS', '', '9231200500', 10, '', '', '', 0, '', '', 1, '2021-07-08', 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credits`
--

CREATE TABLE `credits` (
  `id` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `f_registro` datetime NOT NULL DEFAULT current_timestamp(),
  `factura` varchar(254) NOT NULL,
  `adeudo` decimal(65,4) NOT NULL,
  `abono` decimal(65,4) NOT NULL,
  `dias_credit` int(11) NOT NULL,
  `pay` tinyint(1) NOT NULL DEFAULT 0,
  `sucursal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `credit_pay`
--

CREATE TABLE `credit_pay` (
  `id` int(11) NOT NULL,
  `credito` int(11) NOT NULL,
  `monto` decimal(65,4) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `view_index` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `nombre`, `descripcion`, `view_index`) VALUES
(33, 'PRODUCTO MDF', 'PRODUCTOS FABRICADOS EN MDF ', 1),
(47, 'BEBIDAS', 'SOUVENIR PARA BEBIDAS CALIENTES Y FRIAS ', 0),
(49, 'Ecologico', 'Productos de material ecológico', 0),
(50, 'DECARACION', 'SOUVENIR PARA DECORACION DE INTERIORES Y EXTERIORES', 0),
(51, 'ACCESORIOS', 'SOUVENIRS DE COMPPLEMENTO DE MODA', 0),
(52, 'CONFITERIA ', 'DEPARTAMENTO DE DULCES', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `nombre_corto` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `correo` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL,
  `mision` longtext NOT NULL,
  `vision` longtext NOT NULL,
  `contacto` longtext NOT NULL,
  `facebook` varchar(254) NOT NULL,
  `twitter` varchar(254) NOT NULL,
  `youtube` varchar(254) NOT NULL,
  `iva` int(11) NOT NULL,
  `footer` longtext NOT NULL,
  `cfdi_lugare_expedicion` varchar(254) NOT NULL,
  `cfdi_rfc` varchar(254) NOT NULL,
  `cfdi_regimen` varchar(254) NOT NULL,
  `cfdi_cer` varchar(254) NOT NULL,
  `cfdi_key` varchar(254) NOT NULL,
  `cfdi_pass` varchar(254) NOT NULL,
  `token` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`id`, `nombre`, `nombre_corto`, `direccion`, `correo`, `telefono`, `mision`, `vision`, `contacto`, `facebook`, `twitter`, `youtube`, `iva`, `footer`, `cfdi_lugare_expedicion`, `cfdi_rfc`, `cfdi_regimen`, `cfdi_cer`, `cfdi_key`, `cfdi_pass`, `token`) VALUES
(1, 'Farmacia Shaoyin', 'Shaoyin', 'Acapulco', '', '', '-Crear productos innovadores, llamativos, con buen gusto y de buena calidad que representen la belleza de la ciudad donde estamos operando.\r\n-Comercializar suvenir a través del excelente trato al cliente, teniendo en claro que debe ser cálido,  y alegre siempre con una sonrisa como bienvenida.', 'Convertir a El MineRito® en un referente de calidad, con productos innovadores y personal comprometido con el excelente trato al cliente, creando una experiencia de compra mágica.', 'Telefono\r\n<br>\r\n+52 55 4163 0891\r\n<br><br>\r\nVentas | Informacion \r\n<br>\r\nventas@cyberchoapas.com', '', '', '', 16, '<h5 style=\"background-color: #1a4f7d; text-align: center;\"><span style=\"background-color: #1a4f7d; color: #ffffff;\"><em><strong>|**| ::: GRUPO ALPARIED ::: | www.stikertuning.com |</strong></em></span><span style=\"background-color: #1a4f7d; color: #ffffff;\"><em><strong><br /></strong></em></span></h5>', '96980', 'AEDF9201245G3', '621', 'SDK2/certificados/CER.cer  ', 'SDK2/certificados/KEY.key', 'AEDF9201', 'g4UW4c0gIkyX2yH90bOHlCx8ivt0lD3/Eyh7AnLuSrmVeBiyFbjEmdlFBs0uaaeVOxQRjz5DPTmXzuZrWdVZs/bsVoQ8Tc4BWo/XDDG+EvA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `e_ventas`
--

CREATE TABLE `e_ventas` (
  `id` int(11) NOT NULL,
  `estrategia` varchar(300) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `e_ventas`
--

INSERT INTO `e_ventas` (`id`, `estrategia`, `active`) VALUES
(1, 'NORMAL', 1),
(2, 'OFERTA 10 %', 1),
(3, 'PAQUETE VENTA', 1),
(4, 'OTRO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `serie` varchar(254) NOT NULL,
  `folio` varchar(254) NOT NULL,
  `estatus` varchar(254) NOT NULL,
  `cliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `folio_venta`
--

CREATE TABLE `folio_venta` (
  `folio` varchar(254) NOT NULL,
  `vendedor` int(11) NOT NULL,
  `client` int(11) NOT NULL,
  `descuento` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `open` tinyint(1) NOT NULL,
  `cobrado` float DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `cut` tinyint(1) DEFAULT 0,
  `sucursal` int(11) NOT NULL,
  `cut_global` int(11) NOT NULL DEFAULT 0,
  `iva` int(11) NOT NULL DEFAULT 0,
  `t_pago` varchar(254) NOT NULL DEFAULT 'Ninguno',
  `pedido` tinyint(1) NOT NULL DEFAULT 0,
  `folio_venta_ini` varchar(254) DEFAULT NULL,
  `cotizacion` tinyint(1) NOT NULL DEFAULT 0,
  `concepto` varchar(254) DEFAULT NULL,
  `comision_pagada` tinyint(1) NOT NULL DEFAULT 0,
  `oxxo_pay` varchar(254) NOT NULL DEFAULT '0',
  `titulo` varchar(254) DEFAULT '',
  `f_entrega` date DEFAULT NULL,
  `estrategia` int(11) DEFAULT NULL,
  `facturar` tinyint(1) NOT NULL DEFAULT 0,
  `f_instalacion` datetime DEFAULT NULL,
  `schedule` tinyint(1) NOT NULL DEFAULT 0,
  `schedule_end` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `folio_venta`
--

INSERT INTO `folio_venta` (`folio`, `vendedor`, `client`, `descuento`, `fecha`, `open`, `cobrado`, `fecha_venta`, `cut`, `sucursal`, `cut_global`, `iva`, `t_pago`, `pedido`, `folio_venta_ini`, `cotizacion`, `concepto`, `comision_pagada`, `oxxo_pay`, `titulo`, `f_entrega`, `estrategia`, `facturar`, `f_instalacion`, `schedule`, `schedule_end`) VALUES
('120210722214223', 1, 1, 0, '2021-07-22 21:42:23', 0, 100, '2021-07-22 22:01:22', 0, 10, 0, 16, 'transferencia', 0, '120210722214223', 0, NULL, 0, '0', '', NULL, 3, 0, NULL, 0, 0),
('120210722215208', 1, 1, 0, '2021-07-22 21:52:08', 0, 430, '2021-07-22 21:53:29', 0, 10, 0, 16, 'transferencia', 0, '120210722215208', 0, NULL, 0, '0', '', NULL, 2, 0, NULL, 0, 0),
('120210723055927', 1, 1, 0, '2021-07-23 05:59:27', 1, 0, NULL, 0, 10, 0, 16, 'transferencia', 0, '120210723055927', 1, NULL, 0, '0', '', NULL, NULL, 0, NULL, 0, 0),
('120210723055933', 1, 1, 0, '2021-07-23 05:59:33', 1, NULL, NULL, 0, 10, 0, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', NULL, NULL, 0, NULL, 0, 0),
('4020210323140002', 40, 310, 10, '2021-03-23 14:00:02', 0, 323.1, '2021-03-23 14:04:35', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220201226190608', 42, 310, 10, '2020-12-26 19:06:08', 0, 538.2, '2020-12-26 19:07:32', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210103155928', 42, 310, 10, '2021-01-03 15:59:28', 0, 342, '2021-01-03 16:00:17', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210103185352', 42, 310, 10, '2021-01-03 18:53:52', 0, 540, '2021-01-03 18:54:45', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210103185532', 42, 310, 10, '2021-01-03 18:55:32', 0, 648, '2021-01-03 18:56:14', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210109164420', 42, 310, 10, '2021-01-09 16:44:20', 0, 457.2, '2021-01-09 19:14:39', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210117111054', 42, 310, 10, '2021-01-17 11:10:54', 0, 597.6, '2021-01-17 11:18:16', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210201163200', 42, 310, 10, '2021-02-01 16:32:00', 0, 576, '2021-02-01 16:33:21', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210206141722', 42, 310, 10, '2021-02-06 14:17:22', 0, 1258.2, '2021-02-06 14:18:32', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210221185038', 42, 310, 10, '2021-02-21 18:50:38', 0, 562.5, '2021-02-21 19:11:28', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210306184637', 42, 307, 10, '2021-03-06 18:46:37', 0, 1016.1, '2021-03-06 19:02:20', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210314163038', 42, 310, 10, '2021-03-14 16:30:38', 0, 409.5, '2021-03-14 16:35:10', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210329103623', 42, 310, 10, '2021-03-29 10:36:23', 0, 1528.2, '2021-03-29 10:42:58', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210401133718', 42, 310, 10, '2021-04-01 13:37:18', 0, 494.1, '2021-04-01 13:46:54', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210401134906', 42, 310, 10, '2021-04-01 13:49:06', 0, 351, '2021-04-01 13:50:23', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210403123405', 42, 307, 10, '2021-04-03 12:34:05', 0, 297, '2021-04-03 12:36:34', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210403144340', 42, 310, 10, '2021-04-03 14:43:40', 0, 697.5, '2021-04-03 14:46:23', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210530171735', 42, 310, 10, '2021-05-30 17:17:35', 0, 394.2, '2021-05-30 19:02:03', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210624125340', 42, 310, 10, '2021-06-24 12:53:40', 0, 409.5, '2021-06-24 12:57:47', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4220210628153726', 42, 310, 10, '2021-06-28 15:37:26', 0, 269.1, '2021-06-28 15:38:19', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210101153648', 43, 310, 10, '2021-01-01 15:36:48', 0, 494.1, '2021-01-01 15:37:21', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210102112957', 43, 310, 10, '2021-01-02 11:29:57', 0, 333, '2021-01-02 11:31:05', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210115101751', 43, 310, 10, '2021-01-15 10:17:51', 0, 817.2, '2021-01-15 13:50:00', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210207101713', 43, 310, 10, '2021-02-07 10:17:13', 0, 737.1, '2021-02-07 11:26:13', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210312112128', 43, 310, 10, '2021-03-12 11:21:28', 0, 530.1, '2021-03-12 11:42:54', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210328115750', 43, 310, 10, '2021-03-28 11:57:50', 0, 193.5, '2021-03-28 12:01:29', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210328121021', 43, 310, 10, '2021-03-28 12:10:21', 0, 787.5, '2021-03-28 12:13:10', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210401190625', 43, 310, 10, '2021-04-01 19:06:25', 0, 1006.2, '2021-04-01 19:08:53', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210403165309', 43, 310, 10, '2021-04-03 16:53:09', 0, 549, '2021-04-03 16:54:41', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4320210403190428', 43, 310, 10, '2021-04-03 19:04:28', 0, 751.5, '2021-04-03 19:18:30', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210112203843', 44, 310, 10, '2021-01-12 20:38:43', 0, 405, '2021-01-12 20:40:08', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210113195825', 44, 310, 10, '2021-01-13 19:58:25', 0, 543.6, '2021-01-13 20:09:29', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210217185004', 44, 310, 10, '2021-02-17 18:50:04', 0, 369, '2021-02-17 18:57:15', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210315191945', 44, 310, 10, '2021-03-15 19:19:45', 0, 1169.1, '2021-03-15 19:34:36', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210319185656', 44, 310, 10, '2021-03-19 18:56:56', 0, 969.3, '2021-03-19 19:11:00', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210326195205', 44, 310, 10, '2021-03-26 19:52:05', 0, 360, '2021-03-26 20:25:31', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210330100406', 44, 310, 10, '2021-03-30 10:04:06', 0, 612, '2021-03-30 11:13:20', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210402145132', 44, 310, 10, '2021-04-02 14:51:32', 0, 1185.3, '2021-04-02 14:59:28', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210402155329', 44, 310, 10, '2021-04-02 15:53:29', 0, 283.5, '2021-04-04 10:26:12', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210413195747', 44, 310, 10, '2021-04-13 19:57:47', 0, 414, '2021-04-14 17:31:59', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210414173304', 44, 310, 10, '2021-04-14 17:33:04', 0, 417.6, '2021-04-14 17:36:18', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210501204554', 44, 310, 10, '2021-05-01 20:45:54', 0, 417.6, '2021-05-01 20:53:18', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210508185908', 44, 310, 10, '2021-05-08 18:59:08', 0, 702, '2021-05-08 19:08:16', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210518110825', 44, 310, 10, '2021-05-18 11:08:25', 0, 404.1, '2021-05-18 11:10:55', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210620155721', 44, 307, 10, '2021-06-20 15:57:21', 0, 341.1, '2021-06-20 17:29:34', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4420210626155536', 44, 307, 10, '2021-06-26 15:55:36', 0, 535.5, '2021-06-26 16:37:56', 0, 10, 1, 16, 'tarjeta', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4520210515161232', 45, 307, 10, '2021-05-15 16:12:32', 0, 807.3, '2021-05-15 16:42:42', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4520210613212948', 45, 307, 10, '2021-06-13 21:29:48', 0, 490.5, '2021-06-13 21:45:55', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0),
('4520210628200857', 45, 310, 10, '2021-06-28 20:08:57', 0, 781.2, '2021-06-28 20:19:54', 0, 10, 1, 16, 'efectivo', 0, NULL, 0, NULL, 0, '0', '', '2021-04-28', 1, 0, '2021-04-28 22:29:47', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `no. De parte` varchar(254) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `descripcion` longtext NOT NULL,
  `almacen` int(11) NOT NULL,
  `departamento` int(11) NOT NULL,
  `loc_almacen` varchar(254) NOT NULL,
  `marca` varchar(254) NOT NULL,
  `proveedor` varchar(254) NOT NULL,
  `foto0` varchar(254) NOT NULL,
  `foto1` varchar(254) NOT NULL,
  `foto2` varchar(254) NOT NULL,
  `foto3` varchar(254) NOT NULL,
  `oferta` tinyint(1) NOT NULL DEFAULT 0,
  `precio_normal` float NOT NULL DEFAULT 0,
  `precio_oferta` float NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL,
  `tiempo de entrega` varchar(254) NOT NULL,
  `stock_min` int(11) NOT NULL,
  `stock_max` int(11) NOT NULL,
  `precio_costo` float NOT NULL DEFAULT 0,
  `cv` varchar(254) NOT NULL DEFAULT '01010101',
  `um` varchar(254) NOT NULL DEFAULT 'H87',
  `um_des` varchar(254) NOT NULL DEFAULT 'NA',
  `pedir_medidas` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `no. De parte`, `nombre`, `descripcion`, `almacen`, `departamento`, `loc_almacen`, `marca`, `proveedor`, `foto0`, `foto1`, `foto2`, `foto3`, `oferta`, `precio_normal`, `precio_oferta`, `stock`, `tiempo de entrega`, `stock_min`, `stock_max`, `precio_costo`, `cv`, `um`, `um_des`, `pedir_medidas`) VALUES
(63, 'EMIM-01', 'IMAN MDF BASICO EMIM-01', '', 14, 33, '', 'EL MINERITO SOUVENIR', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218193232.jpg', '', '', '', 0, 40, 10, 928, '0', 120, 1200, 3, '01010101', 'H87', 'NA', 0),
(64, 'EMIM-03', 'PROMO IMAN MDF BASICO EMIM-03', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218193304.jpg', '', '', '', 1, 100, 100, 228, '0', 40, 400, 9, '01010101', 'H87', 'NA', 0),
(65, 'EMIML-01', 'IMAN MDF LARGO EMIML-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210106014014.jpg', '', '', '', 0, 50, 1, 480, '', 216, 2160, 5, '01010101', 'H87', 'NA', 0),
(66, 'EMIML-03', 'PROMO IMAN MDF LARGO  EMIML-03', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210106014135.jpg', '', '', '', 1, 90, 100, 174, '', 108, 1080, 10, '01010101', 'H87', 'NA', 0),
(67, 'EMLLA-01', 'LLAVERO MDF BASICO EMLLA-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218192821.jpg', '', '', '', 0, 40, 1, 342, '', 432, 4320, 6, '01010101', 'H87', 'NA', 0),
(68, 'EMLLA-03', 'PROMO LLAVERO MDF BASICO EMLLA-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218192940.jpg', '', '', '', 1, 100, 100, 440, '', 144, 1440, 18, '01010101', 'H87', 'NA', 0),
(69, 'EMCAL-01', 'DECAL EMCAL-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218195603.jpg', '', '', '', 0, 40, 1, 219, '', 432, 4320, 3, '01010101', 'H87', 'NA', 0),
(70, 'EMCAL-03', 'PROMO DECAL EMCAL-03', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218195643.jpg', '', '', '', 1, 100, 100, 62, '', 144, 1440, 9, '01010101', 'H87', 'NA', 0),
(71, 'EMSPC-01', 'SOPORTE PARA CELULAR EMSPC-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', '', '', '', '', 0, 80, 1, 1, '', 24, 240, 15, '01010101', 'H87', 'NA', 0),
(72, 'EMTEQ-01', 'TEQUILERO GRABADO EMTEQ-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218170944.jpg', '', '', '', 0, 40, 1, 47, '', 100, 1000, 6, '01010101', 'H87', 'NA', 0),
(73, 'EMTEQ-03', 'PROMO TEQUILERO GRABADO EMTEQ-03', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201229164022.jpg', '', '', '', 1, 100, 100, 7, '', 10, 100, 18, '01010101', 'H87', 'NA', 0),
(74, 'EMBE-035', 'BOL ECO EMBE-035', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201228134556.jpg', '', '', '', 0, 30, 1, 0, '', 60, 600, 6, '01010101', 'H87', 'NA', 0),
(75, 'EM3BE-035', 'PROMO BOL ECO EM3BE-035', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201228134220.jpg', '', '', '', 1, 50, 50, -2, '', 20, 200, 18, '01010101', 'H87', 'NA', 0),
(76, 'EMBE-060', 'BOL ECO EMBE-060', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201219103341.jpg', '', '', '', 0, 30, 1, 0, '', 60, 600, 40, '01010101', 'H87', 'NA', 0),
(77, 'EM3BE-060', 'PROMO BOL ECO EM3BE-060', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201228133929.jpg', '', '', '', 1, 50, 50, 0, '', 20, 200, 21, '01010101', 'H87', 'NA', 0),
(78, 'EMLE-130', 'LIBRETA ECO EMLE-130', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218151631.jpg', '', '', '', 0, 60, 1, 3, '', 36, 360, 18, '01010101', 'H87', 'NA', 0),
(79, 'EM2LE-130', 'PROMO LIBRETA ECO EM2LE-130', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218175303.jpg', '', '', '', 1, 100, 100, -1, '', 18, 180, 36, '01010101', 'H87', 'NA', 0),
(80, 'EMBL-01', 'BOTELLA LAMPARA EMBL-01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218193807.jpg', '', '', '', 0, 160, 1, 3, '', 5, 50, 115, '01010101', 'H87', 'NA', 0),
(81, 'EMBLUM-1410', 'BOLIGRAFO LUM EMBLUM-1410', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201228135519.jpg', '', '', '', 0, 65, 1, 52, '', 50, 500, 14, '01010101', 'H87', 'NA', 0),
(82, 'EMLEG-01', 'LIBRETA ECO GRANDE EMLEG-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201228170541.jpg', '', '', '', 0, 120, 1, 16, '', 15, 150, 27, '01010101', 'H87', 'NA', 0),
(83, 'EMGC-01', 'GORRA DE CUERO EMGC-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210210135254.jpg', '', '', '', 0, 220, 1, 8, '', 25, 250, 60, '01010101', 'H87', 'NA', 0),
(84, 'EMGTOR-01', 'GORRA TORNASOL EMGTOR-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218151202.jpg', '', '', '', 0, 90, 1, 0, '', 25, 250, 31, '01010101', 'H87', 'NA', 0),
(85, 'EMBY-193', 'BOLSA YUTE EMBY-193', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218174923.jpg', '', '', '', 0, 219, 1, 30, '', 12, 120, 80, '01010101', 'H87', 'NA', 0),
(86, 'EMCN-006', 'CILINDRO NEGRO EMCN-006', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218150639.jpg', '', '', '', 0, 80, 1, 11, '', 12, 120, 21, '01010101', 'H87', 'NA', 0),
(88, 'EMIC-01', 'IMAN CAOBILLA EMIC-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', '', '', '', '', 0, 65, 1, 1, '', 100, 1000, 15, '01010101', 'H87', 'NA', 0),
(89, 'EM2IC-01', 'PROMO IMAN CAOBILLA EM2IC-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', '', '', '', '', 1, 100, 100, 1, '', 50, 500, 30, '01010101', 'H87', 'NA', 0),
(90, 'EMPLL-01', 'PORTA LLAVES EMPLL-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201230171840.jpg', '', '', '', 0, 120, 1, 2, '', 50, 500, 19, '01010101', 'H87', 'NA', 0),
(91, 'EMSETEQ-01', 'SET TEQUILERO EMSETEQ-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210113122740.jpg', '', '', '', 0, 100, 1, 0, '', 12, 120, 40, '01010101', 'H87', 'NA', 0),
(92, 'EMTMPS-58', 'TERMO EMTMPS-58', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218165032.jpg', '', '', '', 0, 399, 1, 3, '', 6, 60, 130, '01010101', 'H87', 'NA', 0),
(93, 'EMTMPS-140', 'TERMO EMTMPS-140', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218172901.jpg', '', '', '', 0, 380, 1, 0, '', 6, 60, 130, '01010101', 'H87', 'NA', 0),
(94, 'EMTA-2335', 'TERMO KADRY EMTA-2335', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218152528.jpg', '', '', '', 0, 320, 1, 0, '', 6, 60, 110, '01010101', 'H87', 'NA', 0),
(95, 'EMA-2198', 'TERMO EMA-2525', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218174740.jpg', '', '', '', 0, 349, 1, 0, '', 6, 60, 95, '01010101', 'H87', 'NA', 0),
(96, 'EMTAZ-047', 'TAZA EMTAZ-047', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218174556.jpg', '', '', '', 0, 849, 1, 1, '', 6, 60, 270, '01010101', 'H87', 'NA', 0),
(97, 'EMLIC-SFA8', 'LICORERA EMLIC-SFA8', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218170640.jpg', '', '', '', 0, 349, 1, -1, '', 6, 600, 120, '01010101', 'H87', 'NA', 0),
(99, 'EMALLEN-01', 'TERMO ALLEN EMALLEN-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218170456.jpg', '', '', '', 0, 649, 1, 1, '', 6, 60, 215, '01010101', 'H87', 'NA', 0),
(100, 'EMTAZN-A', 'TAZA NEON EMTAZN-A', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210417171532.jpg', '', '', '', 0, 150, 1, 40, '', 12, 120, 50, '01010101', 'H87', 'NA', 0),
(102, 'EMTAZ-2613', 'TAZA ACERO BLANCA EMTAZ-2613', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218170006.jpg', '', '', '', 0, 249, 1, 0, '', 12, 120, 85, '01010101', 'H87', 'NA', 0),
(103, 'EMLAM-050', 'LLAVERO LAMPARA EMLAM-050', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201229124259.jpg', '', '', '', 0, 120, 1, 3, '', 12, 120, 45, '01010101', 'H87', 'NA', 0),
(104, 'EMTMPS-49', 'TERMO EMTMPS-49', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218172753.jpg', '', '', '', 0, 699, 1, 0, '', 6, 60, 240, '01010101', 'H87', 'NA', 0),
(105, 'EMTMPS-77', 'TERMO EMTMPS-77', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218172541.jpg', '', '', '', 0, 549, 1, 0, '', 6, 60, 190, '01010101', 'H87', 'NA', 0),
(106, 'EMTMPS-42', 'TERMO EMTMPS-42', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218172417.jpg', '', '', '', 0, 299, 1, 2, '', 6, 60, 102, '01010101', 'H87', 'NA', 0),
(107, 'EMTMPS-123', 'TERMO EMTMPS-123', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218172241.jpg', '', '', '', 0, 280, 1, 1, '', 6, 60, 90, '01010101', 'H87', 'NA', 0),
(108, 'EMTMPS-64', 'TERMO EMTMPS-64', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218172105.jpg', '', '', '', 0, 299, 1, 1, '', 6, 60, 90, '01010101', 'H87', 'NA', 0),
(110, 'EMTMPS-98', 'TERMO EMTMPS-98', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218171923.jpg', '', '', '', 0, 349, 1, 1, '', 6, 60, 120, '01010101', 'H87', 'NA', 0),
(111, 'EMBECO-065', 'BOLIGRAFO ECOLOGICO EMBECO-065', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201228135028.jpg', '', '', '', 0, 65, 1, 0, '', 12, 120, 21, '01010101', 'H87', 'NA', 0),
(112, 'EMANTI-01', 'GEL ANTIBCTERIAL EMANTI-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218165540.jpg', '', '', '', 0, 40, 1, 8, '', 12, 120, 18, '01010101', 'H87', 'NA', 0),
(114, 'EMBE-147', 'BOLSA ECOLOGICA EMBE-147', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120201218152209.jpg', '', '', '', 0, 50, 45, 36, '', 12, 120, 14, '01010101', 'H87', 'NA', 0),
(115, 'EMDULCE-01', 'DULCERO EMDULCE-01', '', 14, 52, '', '', '', 'product/product_img120201224133145.jpg', '', '', '', 0, 15, 1, 0, '', 0, 0, 5, '01010101', 'H87', 'NA', 0),
(117, 'EMPOC-01', 'POCILLO ACERO EMPOC-01', '', 14, 47, '', '', '', 'product/product_img120201228135855.jpg', '', '', '', 0, 58, 1, 0, '', 12, 120, 18, '01010101', 'H87', 'NA', 0),
(118, 'EMPLA-01', 'MASETA DECORATIVA EMPLA-01', '', 14, 50, '', '', '', 'product/product_img120210101113722.jpg', '', '', '', 0, 120, 1, 2, '', 36, 360, 30, '01010101', 'H87', 'NA', 0),
(119, 'EMCA-01', 'DULCE DE CAJETA  EMCA-01', '', 14, 52, '', '', '', 'product/product_img120210106013731.jpg', '', '', '', 0, 65, 1, 0, '', 36, 360, 25, '01010101', 'H87', 'NA', 0),
(120, 'EMTEQGRA-01', 'TEQUILERO GRANDE EMTEQGRA-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210120131056.jpg', '', '', '', 0, 60, 1, 2, '1', 11, 111, 15, '01010101', 'H87', 'NA', 0),
(121, 'EMCOLG-01', 'COLGANTE DECORATIVO EMCOLG-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210203181906.jpg', '', '', '', 0, 80, 1, 1, '', 8, 80, 20, '01010101', 'H87', 'NA', 0),
(122, 'EMSET-01', 'SET DE PLUMA Y BOLIGRAFO EMSET-01', '', 14, 51, '', '', '', 'product/product_img120210203183156.jpg', '', '', '', 0, 120, 1, 0, '', 7, 70, 33, '01010101', 'H87', 'NA', 0),
(123, 'EMLLMADERA-01', 'LLAVERO DE MADERA GRABADO EMLLMADERA-01', '', 14, 51, '', '', '', 'product/product_img120210203183405.jpg', '', '', '', 0, 60, 1, 0, '', 10, 100, 23, '01010101', 'H87', 'NA', 0),
(124, 'EMLICOR-01', 'LIBRERA DE CORCHO EMLICOR-01', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED', 'product/product_img120210206160613.jpg', '', '', '', 0, 120, 1, 10, '', 20, 200, 38, '01010101', 'H87', 'NA', 0),
(126, 'EMTARRO-01', 'TARRO CERVECERO EMTARRO-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210210134623.jpg', '', '', '', 0, 120, 1, 8, '', 12, 120, 60, '01010101', 'H87', 'NA', 0),
(127, 'EMOSOP-01', 'OSO DE PELUCHE EMOSOP-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210210134903.jpg', '', '', '', 0, 290, 1, 3, '', 6, 60, 100, '01010101', 'H87', 'NA', 0),
(128, 'EMVALENTIN-01', 'PROMOCION DE SAN VALENTIN EMVALENTIN-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210213160856.jpg', '', '', '', 1, 499, 499, -1, '', 10, 100, 0, '01010101', 'H87', 'NA', 0),
(129, 'EMLE-01', 'LIBRETA ECO EMLE-01', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210217175337.jpg', '', '', '', 0, 70, 1, 0, '', 18, 180, 24, '01010101', 'H87', 'NA', 0),
(130, 'EM2LE-01', 'PROMO LIBRETA ECO EM2LE-01', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210217181959.jpg', '', '', '', 1, 120, 120, -2, '1', 4, 40, 40, '01010101', 'H87', 'NA', 0),
(131, 'PALETA-01', 'PALETA-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210318133435.jpg', '', '', '', 0, 10, 1, 9, '', 5, 50, 3, '01010101', 'H87', 'NA', 0),
(132, 'ELLECHENUEZ-01', 'ELLECHENUEZ-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210318133549.jpg', '', '', '', 0, 15, 1, 0, '', 5, 50, 5, '01010101', 'H87', 'NA', 0),
(133, 'ELMELCOCHA-01', 'ELMELCOCHA-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210318133645.jpg', '', '', '', 0, 15, 1, 1, '', 3, 30, 5, '01010101', 'H87', 'NA', 0),
(134, 'ELOBLEANAT-01', 'ELOBLEANAT-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210318133740.jpg', '', '', '', 0, 15, 1, 2, '', 3, 30, 3, '01010101', 'H87', 'NA', 0),
(135, 'ELCANASTAMEL-01', 'ELCANASTAMEL-01', '', 14, 52, '', '', '', 'product/product_img120210318133838.jpg', '', '', '', 0, 25, 1, 0, '', 2, 20, 10, '01010101', 'H87', 'NA', 0),
(136, 'ELOBLECAJE-01', 'ELOBLECAJE-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210318133939.jpg', '', '', '', 0, 20, 1, 7, '', 1, 10, 5, '01010101', 'H87', 'NA', 0),
(137, 'ELTARRCHAMOY-01', 'ELTARRCHAMOY-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210318134100.jpg', '', '', '', 0, 20, 1, 11, '', 5, 50, 10, '01010101', 'H87', 'NA', 0),
(138, 'EMTNIZA-01', 'TERMO NIZA EMNIZA-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210320171955.jpg', '', '', '', 0, 280, 1, 0, '', 2, 20, 86, '01010101', 'H87', 'NA', 0),
(139, 'PROMOEMCN-006', 'CILINDRO NEGRO PROMOEMCN-006', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210319145802.jpg', '', '', '', 1, 140, 140, 1, '1', 0, 0, 19, '01010101', 'H87', 'NA', 0),
(140, 'EMTAZ-033', 'TAZA  TERMO CORCHO EMTAZ-033', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210320171302.jpg', '', '', '', 0, 480, 1, 4, '', 1, 10, 141, '01010101', 'H87', 'NA', 0),
(141, 'EMDPO-024', 'DESTAPADOR EMDPO-024', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210320171609.jpg', '', '', '', 0, 40, 1, 5, '', 0, 0, 15, '01010101', 'H87', 'NA', 0),
(142, 'EMKTC.095', 'IMAN DESTAPADOR EMKTC.095', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210320171827.jpg', '', '', '', 0, 60, 1, 13, '', 10, 100, 20, '01010101', 'H87', 'NA', 0),
(143, 'EMTER-077', 'TERMO YUKSHI EMTER-077', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210320172253.jpg', '', '', '', 0, 549, 1, 1, '', 2, 20, 77, '01010101', 'H87', 'NA', 0),
(144, 'EMCOSME-01', 'COSMETIQUERA EMCOSME-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210329142218.jpg', '', '', '', 0, 60, 1, 32, '', 50, 500, 10, '01010101', 'H87', 'NA', 0),
(145, 'EMGLITTER-01', 'CILINDRO GLITTER EMGLITTER-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210329142350.jpg', '', '', '', 0, 299, 1, 15, '', 22, 220, 45, '01010101', 'H87', 'NA', 0),
(146, 'EMMIEL-01', 'DULCE MIEL EMMIEL-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210329155243.jpg', '', '', '', 0, 85, 1, 5, '', 0, 0, 35, '01010101', 'H87', 'NA', 0),
(148, 'EMTAZNEGRA-01', 'TAZA NEGRA EMTAZNEGRA-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210417171024.jpg', '', '', '', 0, 165, 1, 8, '', 21, 210, 45, '01010101', 'H87', 'NA', 0),
(149, 'EMMARIA-01', 'MUÑECA MARIA EMMARIA-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210417170613.jpg', '', '', '', 0, 190, 1, 4, '', 10, 100, 85, '01010101', 'H87', 'NA', 0),
(150, 'EM-', 'DULCE CHAMOY EM- CHAMOY 01', '', 14, 52, '', '', '', 'product/product_img120210608185207.jpg', '', '', '', 0, 35, 1, 11, '', 28, 280, 18, '01010101', 'H87', 'NA', 0),
(151, 'EM-', 'PROMO DULCE DE CHAMOY EM- CHAMOY 01', '', 14, 52, '', '', '', 'product/product_img120210608185419.jpg', '', '', '', 1, 60, 60, 3, '', 28, 280, 36, '01010101', 'H87', 'NA', 0),
(152, 'EMCAFE-01', 'CAFE XILITLA EMCAFE-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210608185646.jpg', '', '', '', 0, 75, 1, 3, '', 22, 220, 25, '01010101', 'H87', 'NA', 0),
(153, 'EMFOCO-01', 'VASO FOCO EMFOCO-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210609142214.jpg', '', '', '', 0, 160, 1, 26, '', 16, 160, 50, '01010101', 'H87', 'NA', 0),
(154, 'EMLIBGRA-01', 'LIBRETA GRANDE EMLIBGRA-01', '', 14, 49, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210615145817.jpg', '', '', '', 0, 150, 1, 24, '', 25, 250, 28, '01010101', 'H87', 'NA', 0),
(155, 'ELPADRE-01', 'PROMO DIA DEL PADRE ELPADRE-01', '', 14, 51, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210615145935.jpg', '', '', '', 0, 365, 1, -3, '', 0, 0, 250, '01010101', 'H87', 'NA', 0),
(156, 'ELCAFETAZA-01', 'CAFE Y TAZA NEON ELCAFETAZA-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210615150051.jpg', '', '', '', 0, 199, 1, 0, '', 10, 10, 100, '01010101', 'H87', 'NA', 0),
(157, 'EMPROMOMIX-01', 'PROMOCIÓN MIXTA EMPROMOMIX-01', '', 14, 33, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616165833.jpg', '', '', '', 1, 100, 100, 6, '', 32, 320, 60, '01010101', 'H87', 'NA', 0),
(160, 'EMARTCHI- 01', 'ARTESANIA CHICA  EMARTCHI- 01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616170453.jpg', '', '', '', 0, 350, 1, 6, '', 6, 60, 150, '01010101', 'H87', 'NA', 0),
(161, 'EMARTMED-01', 'ARTESANÍA MEDIANA EMARTMED-01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616170646.jpg', '', '', '', 0, 499, 1, 6, '', 6, 60, 200, '01010101', 'H87', 'NA', 0),
(162, 'EMARTGRA-01', 'ARTESANÍA GRANDE EMARTGRA-01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616170851.jpg', '', '', '', 0, 690, 1, 4, '', 5, 50, 300, '01010101', 'H87', 'NA', 0),
(163, 'EMBUSTOS-01', 'ARTESANÍA BUSTOS DE ANIMALES EMBUSTOS-01', '', 14, 50, '', '', '', 'product/product_img120210616171018.jpg', '', '', '', 0, 799, 1, 2, '', 3, 30, 350, '01010101', 'H87', 'NA', 0),
(164, 'EMARTGIG-01', 'ARTESANÍA GIGANTE EMARTGIG-01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616171216.jpg', '', '', '', 0, 3869, 1, 1, '', 1, 10, 1500, '01010101', 'H87', 'NA', 0),
(165, 'EMCAN-01', 'CANASTA DULCE COMPLETA EMCAN-01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616171851.jpg', '', '', '', 0, 99, 1, 27, '', 40, 400, 28, '01010101', 'H87', 'NA', 0),
(166, 'EMARTGIG-03', 'PROMO 3 CANASTAS', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616172112.jpg', '', '', '', 1, 250, 250, -4, '', 0, 0, 60, '01010101', 'H87', 'NA', 0),
(167, 'EMCABEZA-01', 'ARTESANIA BUSTO GRANDE EMCABEZA-01', '', 14, 50, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210616172703.jpg', '', '', '', 0, 7699, 1, -1, '', 1, 10, 4000, '01010101', 'H87', 'NA', 0),
(168, 'EMTARUGO-01', 'TARUGOS 3X50 EMTARUGO-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', '', '', '', '', 0, 50, 1, 6, '', 24, 120, 24, '01010101', 'H87', 'NA', 0),
(169, 'EMCHUPO-01', 'CHUPON DULCE', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', '', '', '', '', 0, 50, 1, 3, '', 4, 40, 20, '01010101', 'H87', 'NA', 0),
(170, 'EMJAMOCILLO-01', 'JAMONCILLOS DE DULCE EMJAMOCILLO-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', '', '', '', '', 0, 40, 1, 2, '', 4, 40, 20, '01010101', 'H87', 'NA', 0),
(171, 'EMSETCORCHO-01', 'SET DESTAPACORCHO EMSETCORCHO-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210620185043.jpg', '', '', '', 0, 580, 1, -2, '', 1, 10, 250, '01010101', 'H87', 'NA', 0),
(172, 'EMANFMAD-01', 'ANFORMA DE MADERA Y CRISTAL EMANFMAD-01', '', 14, 47, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV ', 'product/product_img120210623141923.jpg', '', '', '', 0, 299, 1, 3, '', 6, 60, 24, '01010101', 'H87', 'NA', 0),
(173, 'EMCHUPIRUL-01', 'CHUPIRULES DULCE EMCHUPIRUL-01', '', 14, 52, '', 'EL MINERITO', 'GRUPO ALPARIED SA DE CV', 'product/product_img120210628144716.jpg', '', '', '', 0, 16, 1, 1, '', 6, 60, 8, '01010101', 'H87', 'NA', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_sub`
--

CREATE TABLE `productos_sub` (
  `id` int(11) NOT NULL,
  `padre` int(11) NOT NULL,
  `almacen` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `ubicacion` varchar(254) NOT NULL,
  `max` int(11) NOT NULL DEFAULT 0,
  `min` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `productos_sub`
--

INSERT INTO `productos_sub` (`id`, `padre`, `almacen`, `stock`, `ubicacion`, `max`, `min`) VALUES
(1, 85, 14, -15, '', 1, 1),
(2, 171, 14, -3, '', 1, 1),
(3, 167, 14, 13, '', 1, 1),
(4, 167, 15, 100, '', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_pedido`
--

CREATE TABLE `product_pedido` (
  `id` int(11) NOT NULL,
  `folio_venta` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL,
  `p_generico` varchar(254) DEFAULT NULL,
  `ancho` decimal(64,2) NOT NULL DEFAULT 0.00,
  `alto` decimal(64,2) NOT NULL DEFAULT 0.00,
  `largo` decimal(64,2) NOT NULL DEFAULT 0.00,
  `peso` decimal(64,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_pedido`
--

INSERT INTO `product_pedido` (`id`, `folio_venta`, `product`, `unidades`, `precio`, `p_generico`, `ancho`, `alto`, `largo`, `peso`) VALUES
(22, '120210614194031', 149, 1, 1, NULL, '1.00', '1.00', '1.00', '1.00'),
(23, '120210614194031', 139, 1, 140, NULL, '0.00', '0.00', '0.00', '0.00'),
(24, '120210621074434', 149, 1, 1, NULL, '1.00', '1.00', '1.00', '1.00'),
(25, '120210621074434', 145, 1, 299, NULL, '0.00', '0.00', '0.00', '0.00'),
(28, '120210628091247', 139, 1, 140, NULL, '0.00', '0.00', '0.00', '0.00'),
(29, '120210628091854', 139, 1, 140, NULL, '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_trasnfer`
--

CREATE TABLE `product_trasnfer` (
  `id` int(11) NOT NULL,
  `folio_tranfer` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `product_sub` int(11) DEFAULT NULL,
  `almacen_destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_trasnfer`
--

INSERT INTO `product_trasnfer` (`id`, `folio_tranfer`, `product`, `unidades`, `product_sub`, `almacen_destino`) VALUES
(63, '20210605043410', 149, 1, NULL, 16),
(64, '20210605043404', 149, 1, NULL, 16),
(65, '20210605043404', 149, 3, 2, 14),
(66, '20210605043404', 149, 4, 3, 15),
(67, '20210605043404', 149, 3, 17, 14),
(68, '20210605043402', 149, 1, NULL, 14),
(69, '20210723052938', 171, 1, NULL, 14);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_venta`
--

CREATE TABLE `product_venta` (
  `id` int(11) NOT NULL,
  `folio_venta` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL,
  `product_sub` int(11) DEFAULT NULL,
  `p_generico` varchar(254) DEFAULT NULL,
  `ancho` decimal(64,2) NOT NULL DEFAULT 0.00,
  `alto` decimal(64,2) NOT NULL DEFAULT 0.00,
  `largo` decimal(64,2) NOT NULL DEFAULT 0.00,
  `peso` decimal(64,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `product_venta`
--

INSERT INTO `product_venta` (`id`, `folio_venta`, `product`, `unidades`, `precio`, `product_sub`, `p_generico`, `ancho`, `alto`, `largo`, `peso`) VALUES
(1538, '4220201226190608', 97, 1, 349, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1539, '4220201226190608', 102, 1, 249, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1657, '4320210101153648', 105, 1, 549, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1681, '4320210102112957', 118, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1682, '4320210102112957', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1683, '4320210102112957', 75, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1684, '4320210102112957', 77, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1740, '4220210103155928', 93, 1, 380, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1752, '4220210103185352', 81, 10, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1753, '4220210103185532', 81, 12, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1824, '4220210109164420', 85, 2, 199, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1825, '4220210109164420', 81, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1826, '4220210109164420', 77, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1864, '4420210113195825', 84, 1, 90, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1865, '4420210113195825', 75, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1866, '4420210113195825', 111, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1867, '4420210113195825', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1868, '4420210113195825', 102, 1, 249, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1879, '4320210115101751', 85, 1, 199, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1880, '4320210115101751', 102, 1, 249, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1881, '4320210115101751', 73, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1882, '4320210115101751', 86, 1, 75, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1883, '4320210115101751', 111, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1884, '4320210115101751', 90, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1885, '4320210115101751', 114, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1900, '4220210117111054', 119, 3, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1901, '4220210117111054', 107, 1, 249, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1902, '4220210117111054', 91, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(1903, '4220210117111054', 118, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2052, '4220210201163200', 94, 2, 320, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2086, '4220210206141722', 104, 2, 699, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2094, '4320210207101713', 81, 2, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2095, '4320210207101713', 103, 2, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2096, '4320210207101713', 110, 1, 349, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2097, '4320210207101713', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2215, '4420210217185004', 83, 1, 190, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2216, '4420210217185004', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2217, '4420210217185004', 122, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2246, '4220210221185038', 126, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2248, '4220210221185038', 111, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2249, '4220210221185038', 83, 1, 190, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2250, '4220210221185038', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2342, '4220210306184637', 130, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2343, '4220210306184637', 81, 4, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2344, '4220210306184637', 79, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2345, '4220210306184637', 66, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2346, '4220210306184637', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2347, '4220210306184637', 79, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2348, '4220210306184637', 97, 1, 349, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2380, '4320210312112128', 108, 1, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2381, '4320210312112128', 103, 2, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2382, '4320210312112128', 114, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2430, '4220210314163038', 121, 1, 80, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2431, '4220210314163038', 123, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2432, '4220210314163038', 91, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2433, '4220210314163038', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2434, '4220210314163038', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2436, '4220210314163038', 77, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2479, '4420210315191945', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2480, '4420210315191945', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2481, '4420210315191945', 127, 1, 290, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2482, '4420210315191945', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2483, '4420210315191945', 127, 1, 290, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2484, '4420210315191945', 90, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2485, '4420210315191945', 85, 1, 199, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2486, '4420210315191945', 77, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2512, '4420210319185656', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2513, '4420210319185656', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2514, '4420210319185656', 70, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2515, '4420210319185656', 85, 1, 229, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2516, '4420210319185656', 102, 2, 249, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2517, '4420210319185656', 75, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2554, '4020210323140002', 115, 2, 15, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2555, '4020210323140002', 85, 1, 229, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2557, '4020210323140002', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2571, '4420210326195205', 75, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2572, '4420210326195205', 75, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2574, '4420210326195205', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2589, '4320210328115750', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2592, '4320210328121021', 107, 2, 280, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2593, '4320210328121021', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2594, '4320210328121021', 79, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2610, '4220210329103623', 99, 2, 649, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2612, '4220210329103623', 81, 2, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2614, '4220210329103623', 82, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2630, '4420210330100406', 81, 2, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2631, '4420210330100406', 68, 2, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2632, '4420210330100406', 67, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2634, '4420210330100406', 126, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2635, '4420210330100406', 141, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2656, '4220210401133718', 80, 1, 319, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2657, '4220210401133718', 126, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2658, '4220210401133718', 144, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2659, '4220210401133718', 114, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2660, '4220210401134906', 144, 4, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2661, '4220210401134906', 114, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2662, '4220210401134906', 77, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2675, '4320210401190625', 95, 2, 349, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2676, '4320210401190625', 94, 1, 320, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2677, '4320210401190625', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2699, '4420210402145132', 145, 2, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2700, '4420210402145132', 143, 1, 549, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2701, '4420210402145132', 103, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2702, '4420210402145132', 75, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2748, '4220210403123405', 81, 2, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2749, '4220210403123405', 78, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2750, '4220210403123405', 75, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2751, '4220210403123405', 63, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2764, '4220210403144340', 148, 3, 165, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2765, '4220210403144340', 107, 1, 280, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2773, '4320210403165309', 148, 2, 165, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2774, '4320210403165309', 107, 1, 280, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2788, '4320210403190428', 68, 2, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2789, '4320210403190428', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2790, '4320210403190428', 90, 2, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2791, '4320210403190428', 70, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2792, '4320210403190428', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2793, '4320210403190428', 81, 2, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2798, '4420210402155329', 148, 1, 165, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2799, '4420210402155329', 100, 1, 150, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2969, '4420210413195747', 81, 4, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2970, '4420210413195747', 75, 2, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2971, '4420210413195747', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2972, '4420210414173304', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2973, '4420210414173304', 64, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(2974, '4420210414173304', 145, 1, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3134, '4420210501204554', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3135, '4420210501204554', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3136, '4420210501204554', 145, 1, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3203, '4420210508185908', 81, 2, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3204, '4420210508185908', 148, 2, 165, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3205, '4420210508185908', 144, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3206, '4420210508185908', 82, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3207, '4420210508185908', 134, 2, 15, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3208, '4420210508185908', 136, 1, 20, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3209, '4420210508185908', 112, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3210, '4420210508185908', 114, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3257, '4520210515161232', 145, 2, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3258, '4520210515161232', 145, 1, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3301, '4420210518110825', 68, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3302, '4420210518110825', 95, 1, 349, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3413, '4220210530171735', 85, 2, 219, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3541, '4520210613212948', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3542, '4520210613212948', 153, 3, 160, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3619, '4420210620155721', 145, 1, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3620, '4420210620155721', 67, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3621, '4420210620155721', 69, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3657, '4220210624125340', 81, 7, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3676, '4420210626155536', 63, 1, 40, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3677, '4420210626155536', 65, 1, 50, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3678, '4420210626155536', 83, 1, 220, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3679, '4420210626155536', 81, 1, 65, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3680, '4420210626155536', 153, 1, 160, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3681, '4420210626155536', 144, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3713, '4220210628153726', 108, 1, 299, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3717, '4520210628200857', 85, 1, 219, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3719, '4520210628200857', 99, 1, 649, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3832, '120210722215208', 166, 1, 250, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3833, '120210722215208', 151, 1, 60, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3834, '120210722215208', 130, 1, 120, NULL, NULL, '0.00', '0.00', '0.00', '0.00'),
(3835, '120210722214223', 66, 1, 100, NULL, NULL, '0.00', '0.00', '0.00', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prospecto_acciones`
--

CREATE TABLE `prospecto_acciones` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `propuesta` varchar(300) NOT NULL,
  `accion` varchar(300) NOT NULL,
  `realizada` tinyint(1) NOT NULL DEFAULT 0,
  `interesados` tinyint(1) NOT NULL DEFAULT 0,
  `fecha` datetime NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `folio` varchar(254) NOT NULL,
  `user` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `open` tinyint(1) NOT NULL,
  `concepto` text DEFAULT 'DESCONOCIDO'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salidas`
--

INSERT INTO `salidas` (`folio`, `user`, `fecha`, `open`, `concepto`) VALUES
('20210723055759', 1, '2021-07-23 05:57:59', 0, 'Concepto uno'),
('20210723055819', 1, '2021-07-23 05:58:19', 0, 'Concepto numero dos'),
('20210723070252', 1, '2021-07-23 07:02:52', 0, 'DESCONOCIDO	'),
('20210724053328', 1, '2021-07-24 05:33:28', 1, ''),
('20210724053332', 1, '2021-07-24 05:33:32', 1, ''),
('20210724053335', 1, '2021-07-24 05:33:35', 1, ''),
('20210724053338', 1, '2021-07-24 05:33:38', 1, ''),
('20210724053342', 1, '2021-07-24 05:33:42', 1, ''),
('20210724053345', 1, '2021-07-24 05:33:45', 1, ''),
('20210724053348', 1, '2021-07-24 05:33:48', 1, ''),
('20210724060625', 1, '2021-07-24 06:06:25', 1, ''),
('20210724060628', 1, '2021-07-24 06:06:28', 1, ''),
('20210724060631', 1, '2021-07-24 06:06:31', 1, ''),
('20210724060634', 1, '2021-07-24 06:06:34', 0, ''),
('20210724062916', 1, '2021-07-24 06:29:16', 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas_product`
--

CREATE TABLE `salidas_product` (
  `id` int(11) NOT NULL,
  `folio_salida` varchar(254) NOT NULL,
  `product` int(11) DEFAULT NULL,
  `product_sub` int(11) DEFAULT NULL,
  `unidades` int(11) NOT NULL,
  `precio` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `salidas_product`
--

INSERT INTO `salidas_product` (`id`, `folio_salida`, `product`, `product_sub`, `unidades`, `precio`) VALUES
(17, '20210723070252', 171, NULL, 1, 580),
(18, '20210723070252', 171, 2, 1, 580),
(19, '20210723070252', 167, 3, 1, 7699),
(20, '20210723070252', 167, NULL, 1, 7699),
(24, '20210723055819', 173, NULL, 1, 16),
(25, '20210723055819', 172, NULL, 1, 299),
(26, '20210723055819', 171, 2, 1, 580);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soporte`
--

CREATE TABLE `soporte` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(254) NOT NULL,
  `costo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `soporte`
--

INSERT INTO `soporte` (`id`, `descripcion`, `costo`) VALUES
(1, 'REINSTALACION SISTEMA SIN RESPALDO', 150),
(2, 'REINSTALACION DE SISTEMA CON RESPALDO', 400),
(3, 'CONFIGURACION DE WINDOWS PARA TRABAJO EN RED', 400),
(4, 'AGREGAR COMPUTADORA ADICIONAL', 100),
(5, 'INSTALACION Y CONFIGURACION DE IMPRESORAS', 150),
(6, 'RECUPERACION DE CONTRASEÑA', 350),
(7, 'ERROR EN CONFIGURACION DE SISTEMA', 180),
(8, 'ERROR EN CONFIGURACION DE SISTEMA OPERATIVO', 220),
(9, 'OPTIMIZACION DE SISTEMA OPERATIVO', 250),
(10, 'LIMPIEZA DE VIRUS Y AMENAZAS DIGITALES', 201),
(11, 'ACTUALIZACION DE SISTEMAS', 580);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursales`
--

CREATE TABLE `sucursales` (
  `id` int(11) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `direccion` varchar(254) NOT NULL,
  `telefono` varchar(254) NOT NULL,
  `cfdi_serie` varchar(254) NOT NULL DEFAULT 'A'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursales`
--

INSERT INTO `sucursales` (`id`, `nombre`, `direccion`, `telefono`, `cfdi_serie`) VALUES
(10, 'EL MINERITO', 'JUAN DE TOLOSA #820 - B COL. CENTRO ZACATECAS ', '492 292 20 40', 'A'),
(12, 'SUCURSAL 2', 'BCVB', '3535', 'B');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sucursal_almacen`
--

CREATE TABLE `sucursal_almacen` (
  `id` int(11) NOT NULL,
  `sucursal` int(11) NOT NULL,
  `almacen` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sucursal_almacen`
--

INSERT INTO `sucursal_almacen` (`id`, `sucursal`, `almacen`) VALUES
(14, 10, 14),
(15, 10, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `survey`
--

CREATE TABLE `survey` (
  `id` int(11) NOT NULL,
  `folio` varchar(254) NOT NULL,
  `fecha` datetime NOT NULL,
  `cumplimos` int(11) NOT NULL,
  `realizamos` int(11) NOT NULL,
  `atendimos` int(11) NOT NULL,
  `quejas` text DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `survey`
--

INSERT INTO `survey` (`id`, `folio`, `fecha`, `cumplimos`, `realizamos`, `atendimos`, `quejas`) VALUES
(14, '120210428222935', '2021-06-28 20:08:05', 4, 5, 4, ''),
(15, '120210622063524', '2021-06-28 20:10:51', 5, 5, 5, ''),
(16, '120210628091901', '2021-06-28 20:11:08', 6, 3, 7, ''),
(17, '120210628091247', '2021-06-28 20:21:03', 4, 5, 4, ''),
(19, '120210628091255', '2021-06-28 20:21:42', 4, 5, 4, ''),
(21, '120210627063521', '2021-06-28 20:22:53', 2, 5, 5, ''),
(22, '120210628084241', '2021-06-28 20:23:31', 5, 4, 4, ''),
(23, '120210628074543', '2021-06-28 20:27:14', 4, 8, 4, ''),
(35, '120210628195223', '2021-06-29 05:32:36', 10, 10, 10, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `traspasos`
--

CREATE TABLE `traspasos` (
  `folio` varchar(254) NOT NULL,
  `fecha` datetime NOT NULL,
  `user` int(11) NOT NULL,
  `open` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `traspasos`
--

INSERT INTO `traspasos` (`folio`, `fecha`, `user`, `open`) VALUES
('20210723052938', '2021-07-23 05:29:38', 1, 0),
('20210724064103', '2021-07-24 06:41:03', 1, 1),
('20210724064105', '2021-07-24 06:41:05', 1, 1),
('20210724064107', '2021-07-24 06:41:07', 1, 1),
('20210724064109', '2021-07-24 06:41:09', 1, 1),
('20210724064112', '2021-07-24 06:41:12', 1, 1),
('20210724064114', '2021-07-24 06:41:14', 1, 1),
('20210724064253', '2021-07-24 06:42:53', 1, 1),
('20210724064255', '2021-07-24 06:42:55', 1, 1),
('20210724064258', '2021-07-24 06:42:58', 1, 1),
('20210724064259', '2021-07-24 06:42:59', 1, 1),
('20210724064301', '2021-07-24 06:43:01', 1, 1),
('20210724064303', '2021-07-24 06:43:03', 1, 1),
('20210724064917', '2021-07-24 06:49:17', 1, 0),
('20210724064919', '2021-07-24 06:49:19', 1, 0),
('20210724064923', '2021-07-24 06:49:23', 1, 0),
('20210724070620', '2021-07-24 07:06:20', 1, 1),
('20210724072926', '2021-07-24 07:29:26', 1, 1),
('20210724072944', '2021-07-24 07:29:44', 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(254) NOT NULL,
  `password` varchar(254) NOT NULL,
  `nombre` varchar(254) NOT NULL,
  `imagen` varchar(254) NOT NULL,
  `product_add` tinyint(1) NOT NULL DEFAULT 0,
  `product_gest` tinyint(1) NOT NULL DEFAULT 0,
  `gen_orden_compra` tinyint(1) NOT NULL DEFAULT 0,
  `client_add` tinyint(1) NOT NULL DEFAULT 0,
  `client_guest` tinyint(1) NOT NULL DEFAULT 0,
  `almacen_add` tinyint(1) NOT NULL DEFAULT 0,
  `almacen_guest` tinyint(1) NOT NULL DEFAULT 0,
  `depa_add` tinyint(1) NOT NULL DEFAULT 0,
  `depa_guest` tinyint(1) NOT NULL DEFAULT 0,
  `propiedades` tinyint(1) NOT NULL DEFAULT 0,
  `usuarios` tinyint(1) NOT NULL DEFAULT 0,
  `finanzas` tinyint(1) NOT NULL DEFAULT 0,
  `descripcion` longtext NOT NULL,
  `sucursal` int(11) NOT NULL,
  `change_suc` tinyint(1) NOT NULL,
  `sucursal_gest` tinyint(1) NOT NULL DEFAULT 0,
  `caja` tinyint(1) NOT NULL DEFAULT 0,
  `super_pedidos` tinyint(1) NOT NULL DEFAULT 0,
  `comision` int(11) DEFAULT 5,
  `sueldo` float NOT NULL DEFAULT 0,
  `vtd_pg` tinyint(1) NOT NULL DEFAULT 0,
  `full_graficas` tinyint(1) NOT NULL DEFAULT 0,
  `traspasos` tinyint(1) NOT NULL DEFAULT 0,
  `facturar` tinyint(1) NOT NULL DEFAULT 0,
  `install` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `imagen`, `product_add`, `product_gest`, `gen_orden_compra`, `client_add`, `client_guest`, `almacen_add`, `almacen_guest`, `depa_add`, `depa_guest`, `propiedades`, `usuarios`, `finanzas`, `descripcion`, `sucursal`, `change_suc`, `sucursal_gest`, `caja`, `super_pedidos`, `comision`, `sueldo`, `vtd_pg`, `full_graficas`, `traspasos`, `facturar`, `install`) VALUES
(1, 'root', '63a9f0ea7bb98050796b649e85481845', 'CEO', 'users/usuario20201215062516.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'CEO', 10, 1, 1, 1, 1, 5, 1800, 1, 1, 1, 1, 1),
(40, 'admin', '202660cbaf33729ccfc296ac5b08fd0e', 'Deni Citlalli Chavez Rodriguez', '', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'Administracion', 10, 1, 1, 1, 1, 5, 0, 1, 0, 0, 0, 0),
(41, 'turno A', 'b1d3aa87d6e28095b3e410e988b8b18a', 'turno A', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'turno matutino', 10, 0, 0, 1, 1, 5, 0, 0, 0, 0, 0, 0),
(42, 'VERONICA RIVERA', '2c303f618b0408642a5e2914f48423a7', 'VERONICA RIVERA', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 10, 0, 0, 1, 1, 5, 0, 1, 0, 0, 0, 0),
(43, 'SHIARA CHAVARIN', '6c21f3fcdf9c6c1871e6c83014110203', 'SHIARA CHAVARIN', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 10, 0, 0, 1, 1, 5, 0, 1, 0, 0, 0, 0),
(44, 'CESAR MARTINEZ', '7656453c72621d2b24a95092d00ef40f', 'CESAR MARTINEZ', '', 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', 10, 0, 0, 1, 1, 5, 0, 1, 0, 0, 0, 0),
(45, 'JENNIFER MARTINEZ', 'f342dbea3eb82891e1e24da21983cd20', 'JENNIFER MARTINEZ', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'TURNO B', 10, 0, 0, 1, 1, 5, 0, 1, 0, 0, 0, 0),
(46, 'ALBA CANDELAS', 'cfbbd029805eac801d7ea2a9a1a684e8', 'ALBA CANDELAS', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'TURNO A', 10, 0, 0, 1, 1, 5, 0, 0, 0, 0, 0, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `annuities`
--
ALTER TABLE `annuities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `annuity_client` (`client`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_user` (`user`);

--
-- Indices de la tabla `credits`
--
ALTER TABLE `credits`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `factura` (`factura`),
  ADD KEY `credit_client` (`client`),
  ADD KEY `credit_sucursal` (`sucursal`);

--
-- Indices de la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `credit` (`credito`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `e_ventas`
--
ALTER TABLE `e_ventas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `cliente_cliente` (`cliente`);

--
-- Indices de la tabla `folio_venta`
--
ALTER TABLE `folio_venta`
  ADD PRIMARY KEY (`folio`),
  ADD KEY `client_folio` (`client`),
  ADD KEY `vendedor_folio` (`vendedor`),
  ADD KEY `sale_sucursal` (`sucursal`),
  ADD KEY `estrategia_venta` (`estrategia`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_almacen` (`almacen`),
  ADD KEY `producto_departamento` (`departamento`);

--
-- Indices de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  ADD PRIMARY KEY (`id`),
  ADD KEY `padre_hijo` (`padre`),
  ADD KEY `hijo_almacen` (`almacen`);

--
-- Indices de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto` (`product`),
  ADD KEY `folio` (`folio_venta`);

--
-- Indices de la tabla `product_trasnfer`
--
ALTER TABLE `product_trasnfer`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `folio_venta` (`folio_venta`),
  ADD KEY `sale_product` (`product`),
  ADD KEY `hijo` (`product_sub`);

--
-- Indices de la tabla `prospecto_acciones`
--
ALTER TABLE `prospecto_acciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `accion_prospecto` (`cliente`),
  ADD KEY `accion_prospecto_user` (`user`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`folio`);

--
-- Indices de la tabla `salidas_product`
--
ALTER TABLE `salidas_product`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `soporte`
--
ALTER TABLE `soporte`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sucursal` (`sucursal`),
  ADD KEY `almacen` (`almacen`);

--
-- Indices de la tabla `survey`
--
ALTER TABLE `survey`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `folio` (`folio`);

--
-- Indices de la tabla `traspasos`
--
ALTER TABLE `traspasos`
  ADD PRIMARY KEY (`folio`),
  ADD UNIQUE KEY `folio` (`folio`),
  ADD KEY `tras_user` (`user`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vendedor_sucursal` (`sucursal`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `annuities`
--
ALTER TABLE `annuities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=317;

--
-- AUTO_INCREMENT de la tabla `credits`
--
ALTER TABLE `credits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `e_ventas`
--
ALTER TABLE `e_ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=175;

--
-- AUTO_INCREMENT de la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `product_pedido`
--
ALTER TABLE `product_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `product_trasnfer`
--
ALTER TABLE `product_trasnfer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT de la tabla `product_venta`
--
ALTER TABLE `product_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3841;

--
-- AUTO_INCREMENT de la tabla `prospecto_acciones`
--
ALTER TABLE `prospecto_acciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salidas_product`
--
ALTER TABLE `salidas_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `soporte`
--
ALTER TABLE `soporte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `sucursales`
--
ALTER TABLE `sucursales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `sucursal_almacen`
--
ALTER TABLE `sucursal_almacen`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `survey`
--
ALTER TABLE `survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `annuities`
--
ALTER TABLE `annuities`
  ADD CONSTRAINT `annuity_client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clientes_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `credits`
--
ALTER TABLE `credits`
  ADD CONSTRAINT `credit_client` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `credit_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `credit_pay`
--
ALTER TABLE `credit_pay`
  ADD CONSTRAINT `credit` FOREIGN KEY (`credito`) REFERENCES `credits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `cliente_cliente` FOREIGN KEY (`cliente`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `folio_venta`
--
ALTER TABLE `folio_venta`
  ADD CONSTRAINT `client_folio` FOREIGN KEY (`client`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estrategia_venta` FOREIGN KEY (`estrategia`) REFERENCES `e_ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_sucursal` FOREIGN KEY (`sucursal`) REFERENCES `sucursales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `vendedor_folio` FOREIGN KEY (`vendedor`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `producto_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `producto_departamento` FOREIGN KEY (`departamento`) REFERENCES `departamentos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_sub`
--
ALTER TABLE `productos_sub`
  ADD CONSTRAINT `hijo_almacen` FOREIGN KEY (`almacen`) REFERENCES `almacen` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `padre_hijo` FOREIGN KEY (`padre`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `product_venta`
--
ALTER TABLE `product_venta`
  ADD CONSTRAINT `folio_venta` FOREIGN KEY (`folio_venta`) REFERENCES `folio_venta` (`folio`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `hijo` FOREIGN KEY (`product_sub`) REFERENCES `productos_sub` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sale_product` FOREIGN KEY (`product`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
