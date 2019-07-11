-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 11-07-2019 a las 11:12:31
-- Versión del servidor: 5.6.41-84.1
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `andressu_academialego`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_asistencias`
--

CREATE TABLE `academia_asistencias` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `mes` int(11) NOT NULL,
  `anyo` int(11) NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `academia_horarios_id` int(10) UNSIGNED NOT NULL,
  `modalidad` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_asistencias`
--

INSERT INTO `academia_asistencias` (`id`, `users_id`, `atletas_id`, `fecha`, `mes`, `anyo`, `locaciones_id`, `academia_horarios_id`, `modalidad`, `created_at`, `updated_at`) VALUES
(1, 1, 81, '2019-04-29', 4, 2019, 2, 1, 'Prueba', '2019-04-28 02:48:39', '2019-04-28 02:48:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_configuracion`
--

CREATE TABLE `academia_configuracion` (
  `id` int(10) UNSIGNED NOT NULL,
  `configuracion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_configuracion`
--

INSERT INTO `academia_configuracion` (`id`, `configuracion`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'Locaciones', '1,2', '2019-03-21 05:00:00', NULL),
(2, 'Duración de la clase', '90', '2019-03-21 05:00:00', NULL),
(3, 'Dias de clases', '1,2,3,4', '2019-03-21 05:00:00', NULL),
(4, 'Edad minima', '6', '2019-03-21 05:00:00', NULL),
(5, 'Descuento mas de 1', '25', '2019-03-21 05:00:00', NULL),
(6, 'Clase por dia', '10', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_detalles_factura`
--

CREATE TABLE `academia_detalles_factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `academia_factura_id` int(10) UNSIGNED NOT NULL,
  `inscripciones_academia_id` int(10) UNSIGNED NOT NULL,
  `pago` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_detalles_factura`
--

INSERT INTO `academia_detalles_factura` (`id`, `academia_factura_id`, `inscripciones_academia_id`, `pago`, `created_at`, `updated_at`) VALUES
(3, 6, 67, '50.00', '2019-05-06 22:28:05', '2019-05-06 22:28:05'),
(4, 6, 68, '50.00', '2019-05-06 22:58:53', '2019-05-06 22:58:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_factura`
--

CREATE TABLE `academia_factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `representantes_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pago` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_factura`
--

INSERT INTO `academia_factura` (`id`, `representantes_id`, `fecha`, `subtotal`, `descuento`, `total`, `status`, `tipo_pago`, `created_at`, `updated_at`) VALUES
(6, 65, '2019-05-06', '150.00', '50.00', '100.00', 'Pendiente', 'Transferencia', '2019-05-06 22:28:05', '2019-05-06 22:28:05');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_factura_abonos`
--

CREATE TABLE `academia_factura_abonos` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `academia_factura_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `monto` decimal(9,2) NOT NULL,
  `tipo_pago` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_horarios`
--

CREATE TABLE `academia_horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `edad_inicio` int(11) DEFAULT NULL,
  `edad_fin` int(11) DEFAULT NULL,
  `hora_inicio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_fin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_horarios`
--

INSERT INTO `academia_horarios` (`id`, `edad_inicio`, `edad_fin`, `hora_inicio`, `hora_fin`, `activo`, `created_at`, `updated_at`) VALUES
(1, 6, 15, '17:00', '18:30', 1, '2019-03-21 05:00:00', NULL),
(2, 16, 100, '18:30', '20:00', 1, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_horarios_disponibles`
--

CREATE TABLE `academia_horarios_disponibles` (
  `id` int(10) UNSIGNED NOT NULL,
  `academia_horarios_id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `academia_tarifas_id` int(10) UNSIGNED NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_horarios_disponibles`
--

INSERT INTO `academia_horarios_disponibles` (`id`, `academia_horarios_id`, `locaciones_id`, `academia_tarifas_id`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, '2019-03-21 05:00:00', NULL),
(2, 1, 1, 2, 1, '2019-03-21 05:00:00', NULL),
(3, 1, 1, 3, 1, '2019-03-21 05:00:00', NULL),
(4, 1, 1, 4, 1, '2019-03-21 05:00:00', NULL),
(5, 1, 2, 1, 1, '2019-03-21 05:00:00', NULL),
(6, 1, 2, 2, 1, '2019-03-21 05:00:00', NULL),
(7, 1, 2, 3, 1, '2019-03-21 05:00:00', NULL),
(8, 1, 2, 4, 1, '2019-03-21 05:00:00', NULL),
(9, 2, 1, 1, 1, '2019-03-21 05:00:00', NULL),
(10, 2, 1, 2, 1, '2019-03-21 05:00:00', NULL),
(11, 2, 1, 3, 1, '2019-03-21 05:00:00', NULL),
(12, 2, 1, 4, 1, '2019-03-21 05:00:00', NULL),
(13, 2, 2, 1, 1, '2019-03-21 05:00:00', NULL),
(14, 2, 2, 2, 1, '2019-03-21 05:00:00', NULL),
(15, 2, 2, 3, 1, '2019-03-21 05:00:00', NULL),
(16, 2, 2, 4, 1, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_matricula`
--

CREATE TABLE `academia_matricula` (
  `id` int(10) UNSIGNED NOT NULL,
  `inscripciones_academia_id` int(10) UNSIGNED NOT NULL,
  `academia_horarios_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `cantd_clases` int(11) NOT NULL,
  `mes` int(11) NOT NULL,
  `anyo` int(11) NOT NULL,
  `dias_asistencia` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo_dupla` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_matricula`
--

INSERT INTO `academia_matricula` (`id`, `inscripciones_academia_id`, `academia_horarios_id`, `fecha`, `cantd_clases`, `mes`, `anyo`, `dias_asistencia`, `codigo_dupla`, `activo`, `created_at`, `updated_at`) VALUES
(3, 67, 2, '2019-05-06', 8, 5, 2019, '2,4', NULL, 1, '2019-05-06 22:28:05', '2019-05-06 22:28:05'),
(4, 68, 2, '2019-05-06', 8, 5, 2019, '2,4', NULL, 1, '2019-05-06 22:58:53', '2019-05-06 22:58:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_tarifas`
--

CREATE TABLE `academia_tarifas` (
  `id` int(10) UNSIGNED NOT NULL,
  `frecuencia` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cant_dias` int(11) NOT NULL,
  `cant_clases` int(11) NOT NULL,
  `tarifa_individual` decimal(9,2) NOT NULL,
  `tarifa_dupla` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_tarifas`
--

INSERT INTO `academia_tarifas` (`id`, `frecuencia`, `cant_dias`, `cant_clases`, `tarifa_individual`, `tarifa_dupla`, `activo`, `created_at`, `updated_at`) VALUES
(1, '1 vez', 1, 1, '12.00', '20.00', 1, '2019-03-21 05:00:00', NULL),
(2, '2 veces', 2, 8, '75.00', '100.00', 1, '2019-03-21 05:00:00', NULL),
(3, '3 veces', 3, 12, '100.00', '150.00', 1, '2019-03-21 05:00:00', NULL),
(4, '4 veces', 4, 16, '125.00', '200.00', 1, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_uniformes`
--

CREATE TABLE `academia_uniformes` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniformes_id` int(10) UNSIGNED NOT NULL,
  `tallas_id` int(10) UNSIGNED NOT NULL,
  `colores_id` int(10) UNSIGNED NOT NULL,
  `imagen` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `en_stock` int(11) DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `hora_inicio` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_fin` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cancha` int(11) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pago` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alquiler`
--

INSERT INTO `alquiler` (`id`, `locaciones_id`, `fecha`, `hora_inicio`, `hora_fin`, `cancha`, `status`, `pago`, `created_at`, `updated_at`) VALUES
(1, 2, '2019-02-14', '12:00', '14:00', 1, 'Pendiente', '60.00', '2019-02-14 08:12:40', '2019-02-14 08:12:40'),
(2, 2, '2019-03-03', '8:00', '9:00', 1, 'Pagado', '30.00', '2019-03-03 12:47:29', '2019-03-09 12:30:48'),
(3, 2, '2019-03-05', '9:00', '10:00', 1, 'Pagado', '30.00', '2019-03-05 13:24:06', '2019-03-09 12:30:54'),
(4, 2, '2019-03-09', '9:00', '11:00', 1, 'Pagado', '60.00', '2019-03-09 12:18:17', '2019-03-09 12:30:59'),
(9, 2, '2019-03-22', '18:00', '19:00', 1, 'Pendiente', '30.00', '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(10, 2, '2019-03-23', '10:00', '12:00', 1, 'Pendiente', '70.00', '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(11, 2, '2019-03-23', '18:00', '19:00', 1, 'Pendiente', '30.00', '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(12, 1, '2019-04-02', '20:00', '21:00', 1, 'Pagado', '20.00', '2019-04-03 02:51:09', '2019-04-03 22:20:50'),
(13, 1, '2019-04-16', '20:00', '21:00', 1, 'Pendiente', '20.00', '2019-04-16 18:20:01', '2019-04-16 18:20:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler_invitados`
--

CREATE TABLE `alquiler_invitados` (
  `id` int(10) UNSIGNED NOT NULL,
  `alquiler_id` int(10) UNSIGNED NOT NULL,
  `invitados_id` int(10) UNSIGNED NOT NULL,
  `responsable` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `alquiler_invitados`
--

INSERT INTO `alquiler_invitados` (`id`, `alquiler_id`, `invitados_id`, `responsable`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 1, '2019-02-14 08:12:40', '2019-02-14 08:12:40'),
(2, 2, 6, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(3, 2, 7, 0, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(4, 2, 8, 0, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(5, 2, 9, 0, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(6, 2, 10, 0, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(7, 2, 11, 0, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(8, 3, 6, 1, '2019-03-05 13:24:06', '2019-03-05 13:24:06'),
(9, 3, 7, 0, '2019-03-05 13:24:06', '2019-03-05 13:24:06'),
(10, 3, 8, 0, '2019-03-05 13:24:06', '2019-03-05 13:24:06'),
(11, 3, 9, 0, '2019-03-05 13:24:06', '2019-03-05 13:24:06'),
(12, 3, 10, 0, '2019-03-05 13:24:06', '2019-03-05 13:24:06'),
(13, 3, 11, 0, '2019-03-05 13:24:06', '2019-03-05 13:24:06'),
(14, 4, 6, 1, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(15, 4, 17, 0, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(16, 4, 7, 0, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(17, 4, 18, 0, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(18, 4, 19, 0, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(19, 4, 10, 0, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(33, 9, 29, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(34, 9, 30, 0, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(35, 9, 31, 0, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(36, 9, 32, 0, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(37, 9, 33, 0, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(38, 9, 34, 0, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(39, 10, 35, 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(40, 10, 36, 0, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(41, 10, 37, 0, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(42, 10, 38, 0, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(43, 10, 39, 0, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(44, 10, 40, 0, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(45, 10, 41, 0, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(46, 11, 42, 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(47, 11, 43, 0, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(48, 11, 44, 0, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(49, 11, 45, 0, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(50, 11, 46, 0, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(51, 11, 47, 0, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(52, 12, 48, 1, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(53, 12, 49, 0, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(54, 12, 50, 0, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(55, 12, 51, 0, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(56, 13, 48, 1, '2019-04-16 18:20:02', '2019-04-16 18:20:02'),
(57, 13, 52, 0, '2019-04-16 18:20:02', '2019-04-16 18:20:02'),
(58, 13, 53, 0, '2019-04-16 18:20:02', '2019-04-16 18:20:02'),
(59, 13, 54, 0, '2019-04-16 18:20:02', '2019-04-16 18:20:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atletas`
--

CREATE TABLE `atletas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` bigint(20) DEFAULT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `red_social` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telf_contacto` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `talla_top` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `talla_camiseta` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instituto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `atletas`
--

INSERT INTO `atletas` (`id`, `cedula`, `nombre`, `apellido`, `fecha_nacimiento`, `red_social`, `telf_contacto`, `talla_top`, `talla_camiseta`, `instituto`, `email`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Ilanna', 'Dvorquez', '2007-05-21', NULL, NULL, '32', '32', 'Logos', NULL, '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(2, NULL, 'Eitan', 'Dvorquez', '2011-01-12', NULL, NULL, '0', '0', 'Logos', NULL, '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(3, NULL, 'María Cristina', 'Aguirre Briones', '2007-10-08', NULL, NULL, '34', '34', 'Americano', NULL, '2019-01-27 03:27:44', '2019-01-27 03:27:44'),
(4, 930022413, 'Luciana Sofia', 'Dager Chang', '2006-11-24', NULL, NULL, '38', '38', 'Liceo Los Andes', NULL, '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(5, 932349319, 'Camila Sofia', 'Dager Chang', '2012-08-07', NULL, NULL, '38', '38', 'Liceo Los Andes', NULL, '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(6, NULL, 'Martina Ariana', 'Fernandez Ferreccio', '2009-04-06', NULL, NULL, '32', '34', 'Javier', NULL, '2019-01-29 06:25:22', '2019-01-29 06:25:22'),
(8, NULL, 'Nicole', 'Serrano', '2006-05-11', 'Instagram', NULL, '38', '38', 'La Moderna', NULL, '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(9, NULL, 'Domenica', 'García García', '2006-05-02', NULL, NULL, '0', '0', 'Delta', NULL, '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(10, NULL, 'Alessia', 'García García', '2011-04-28', NULL, NULL, '0', '0', 'Delta', NULL, '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(11, 955527619, 'Mariela', 'Béjar', '2006-06-06', NULL, NULL, '34', '36', 'La  Asunción', NULL, '2019-02-01 03:37:45', '2019-02-01 03:37:45'),
(12, NULL, 'Andrea Priscilla', 'Montalvan Amoroso', '2003-10-31', NULL, NULL, '36', '36', 'santo domingo de guzman', NULL, '2019-02-02 02:46:36', '2019-02-02 02:46:36'),
(13, 931051122, 'Juan José', 'Terán López', '2009-02-16', NULL, NULL, '34', '34', 'Colegio Menor', NULL, '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(14, 931880082, 'Juan Ignacio', 'Terán López', '2011-07-30', NULL, NULL, '32', '32', 'Colegio Menor', NULL, '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(15, 931117717, 'Luciana Isabel', 'Aguilera Ampuero', '2009-03-11', NULL, NULL, '36', '0', 'Javier', NULL, '2019-02-06 03:22:10', '2019-02-06 03:22:10'),
(16, NULL, 'Victoria', 'Ronquillo', '2007-10-26', NULL, NULL, '36', '38', 'Americano', NULL, '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(17, 931041826, 'Arianna', 'Burgos', '2006-06-03', NULL, NULL, '36', '36', 'Monte tabor', NULL, '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(18, 932194830, 'Sofia', 'Burgos', '2012-10-04', NULL, NULL, '36', '36', 'Monte Tabor', NULL, '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(19, 931678155, 'Matilde', 'Burgos', '2007-08-10', NULL, NULL, '38', '38', 'Monte Tabor', NULL, '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(20, 1727128645, 'Paula Michelle', 'Vargas Coba', '2007-05-15', NULL, NULL, '36', '36', 'Educamundo', NULL, '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(21, 1750425181, 'Mateo Enrique', 'Vargas Coba', '2010-07-07', NULL, NULL, '0', '34', 'Educamundo', NULL, '2019-02-06 13:05:53', '2019-02-06 13:05:53'),
(22, 930113378, 'María De los Ángeles', 'Zambrano Izquierdo', '2007-02-11', NULL, NULL, '34', '36', 'Torremolinos', NULL, '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(23, 930967922, 'Cristina Jael', 'Carrasco López', '2009-01-17', NULL, NULL, '36', '36', 'Unidad educativa Alfredo Verá Vera', NULL, '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(24, NULL, 'Lucia', 'Molestina', '2006-06-29', NULL, NULL, '0', '0', 'Monte Tabor', NULL, '2019-02-07 04:12:41', '2019-02-07 04:12:41'),
(25, NULL, 'Valeria', 'Alban', '2009-11-21', NULL, NULL, '32', '32', 'Santo Domingo de Guzman', NULL, '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(26, NULL, 'Isabella', 'Albán', '2011-02-04', NULL, NULL, '34', '34', 'Santo Domingo de Guzman', NULL, '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(27, 930915582, 'Matias Sebastian', 'Herrera Montenegro', '2008-11-22', NULL, NULL, '0', '36', 'Ecomundo', NULL, '2019-02-08 03:21:37', '2019-02-08 03:21:37'),
(28, 930932546, 'Mia Valentina', 'Moncayo Almeida', '2008-11-25', NULL, NULL, '32', '34', 'Unidad Educativa Javier', NULL, '2019-02-08 04:38:43', '2019-02-08 04:38:43'),
(29, NULL, 'Natalia Maria', 'Villacis Avengo', '2006-09-07', NULL, NULL, '36', '36', 'Nuevo Mundo', NULL, '2019-02-09 03:50:34', '2019-02-09 03:50:34'),
(30, NULL, 'Natalia Maria', 'Villacis Avengo', '2006-09-07', NULL, NULL, '36', '36', 'Nuevo Mundo', NULL, '2019-02-09 03:51:11', '2019-02-09 03:51:11'),
(31, 931766968, 'Marcela', 'Faytong Petalta', '2011-03-10', NULL, NULL, '32', '32', 'Colegio La Moderna', NULL, '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(32, NULL, 'Valeria', 'Alban', '2009-11-21', NULL, NULL, '32', '32', 'Santo domingo de Guzmán', NULL, '2019-02-12 01:27:48', '2019-02-12 01:27:48'),
(33, NULL, 'Isabella', 'Alban', '2011-02-04', NULL, NULL, '32', '32', 'Santo domingo de guzman', NULL, '2019-02-12 01:27:48', '2019-02-12 01:27:48'),
(34, NULL, 'ANDREA', 'GOMEZ SARITAMA', '2006-08-27', NULL, NULL, '0', '0', 'LICEO PANAMERICANO', NULL, '2019-02-12 07:42:17', '2019-02-12 07:42:17'),
(35, 954177747, 'Paula andrea', 'Cruz bonilla', '2004-08-05', '@andrea.paula.cruz', NULL, '34', '36', 'Liceo panamericano', NULL, '2019-02-13 03:53:43', '2019-02-13 03:53:43'),
(36, NULL, 'Paula', 'Villegas', '2004-12-03', NULL, NULL, '34', '34', 'Santo domingo de Guzmán', NULL, '2019-02-14 01:10:30', '2019-02-14 01:10:30'),
(37, 123456, 'pepita', 'perez', '2011-01-12', NULL, NULL, '36', '34', 'logos', NULL, '2019-02-14 05:44:14', '2019-02-14 05:44:14'),
(38, 995397064, 'Verónica Estefanía', 'Monserrate Maggi', '1990-11-24', 'monserrateveronica', NULL, 'undefined', 'undefined', 'Jefferson Salinas', NULL, '2019-03-25 16:23:11', '2019-03-25 16:23:11'),
(39, NULL, 'Bertha Lorena', 'Monserrate Maggi', '1986-10-06', NULL, NULL, 'undefined', 'undefined', 'Jefferson', NULL, '2019-03-25 16:28:12', '2019-03-25 16:28:12'),
(40, 924312218, 'Maria emilia', 'Tazan', '2000-04-21', NULL, NULL, 'undefined', 'undefined', 'Logos', NULL, '2019-03-27 20:53:11', '2019-03-27 20:53:11'),
(41, 925827404, 'Domenica', 'Oviedo', '2000-02-14', 'Domenica', NULL, 'undefined', 'undefined', 'Catolica', NULL, '2019-03-28 00:27:55', '2019-03-28 00:27:55'),
(42, 926230624, 'Monica Elizabeth', 'Ordoñez Criollo', '2001-10-17', 'Monica_ordonez17', NULL, 'undefined', 'undefined', 'Nuevo mundo', NULL, '2019-03-28 01:28:35', '2019-03-28 01:28:35'),
(43, 932434863, 'Nicole Lorena', 'Gilbert Palacios', '2007-11-12', NULL, NULL, 'undefined', 'undefined', 'Liceo los Andes', NULL, '2019-03-29 00:28:15', '2019-03-29 00:28:15'),
(46, NULL, 'Melina', 'Tazan', '2005-11-19', 'Melinatazan', NULL, 'undefined', 'undefined', 'Logos', NULL, '2019-04-01 21:30:24', '2019-04-01 21:30:24'),
(47, NULL, 'Martina', 'Londoño', '2011-09-28', NULL, NULL, 'undefined', 'undefined', 'La Moderna', NULL, '2019-04-03 00:26:23', '2019-04-03 00:26:23'),
(55, NULL, 'NATALIA', 'FLORES', '2005-08-06', NULL, NULL, NULL, NULL, 'COPOL', NULL, '2019-04-11 23:13:14', '2019-04-12 01:10:20'),
(56, NULL, 'VICTORIA', 'VILLAMAR', '2009-03-06', NULL, NULL, NULL, NULL, 'JAVIER', NULL, '2019-04-12 01:18:24', '2019-04-12 01:18:24'),
(57, NULL, 'ALEJANDRA', 'ORTIZ', '2005-04-26', NULL, NULL, NULL, NULL, 'ECOMUNDO', NULL, '2019-04-12 01:24:04', '2019-04-12 01:24:04'),
(58, NULL, 'DANIELA', 'ITURRALDE', '2005-08-12', NULL, NULL, NULL, NULL, 'JAVIER', NULL, '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(59, NULL, 'ISABELA', 'ITURRALDE', '2008-10-02', NULL, NULL, NULL, NULL, 'JAVIER', NULL, '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(60, NULL, 'VIVIANA', 'CARBO', '2005-04-12', NULL, NULL, NULL, NULL, 'JAVIER', NULL, '2019-04-12 01:33:28', '2019-04-12 01:33:28'),
(61, NULL, 'VALERIA', 'MOLINA', '2005-08-08', NULL, NULL, NULL, NULL, 'JAVIER', NULL, '2019-04-12 01:37:19', '2019-04-12 01:37:19'),
(62, NULL, 'NATASHA', 'VILLAO', '2007-10-09', NULL, NULL, NULL, NULL, 'SAGRADOS CORAZONES', NULL, '2019-04-12 01:47:10', '2019-04-12 01:47:10'),
(63, NULL, 'VALENITNA', 'PINZON', '2006-05-30', NULL, NULL, NULL, NULL, 'MONTE TABOR', NULL, '2019-04-12 01:58:00', '2019-04-12 01:58:00'),
(64, NULL, 'JULIANA', 'PINZON', '2009-05-09', NULL, NULL, NULL, NULL, 'MONTE TABOR', NULL, '2019-04-12 02:00:24', '2019-04-12 02:00:24'),
(65, NULL, 'MA EMILIA', 'SUAREZ', '2012-10-11', NULL, NULL, NULL, NULL, 'MONTE TABOR', NULL, '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(66, NULL, 'DOMENICA', 'SUAREZ', '2008-10-25', NULL, NULL, NULL, NULL, 'MONTE TABOR', NULL, '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(67, NULL, 'SHANTAL', 'PARIS', '2009-02-02', NULL, NULL, NULL, NULL, 'NUEVO MUNDO', NULL, '2019-04-12 02:06:29', '2019-04-12 02:06:29'),
(68, NULL, 'LUCIA', 'MOLESTINA', '2006-06-29', NULL, NULL, NULL, NULL, 'MONTE TABOR', NULL, '2019-04-12 02:15:34', '2019-04-12 02:15:34'),
(69, NULL, 'MATHIAS', 'HERRERA', '2008-10-22', NULL, NULL, NULL, NULL, 'CR', NULL, '2019-04-12 02:22:37', '2019-04-12 02:22:37'),
(70, NULL, 'CAMILA', 'CUEVA', '2008-09-14', NULL, NULL, NULL, NULL, 'NUEVO MUNDO', NULL, '2019-04-12 02:25:33', '2019-04-12 02:25:33'),
(71, NULL, 'MA GRACIA', 'CASTILLO', '2005-12-24', NULL, NULL, NULL, NULL, 'NUEVO MUNDO', NULL, '2019-04-12 02:28:08', '2019-04-12 02:28:08'),
(72, NULL, 'FRANCESCA', 'AVELLAN', '2007-08-27', NULL, NULL, NULL, NULL, 'DELTA', NULL, '2019-04-12 02:32:42', '2019-04-12 02:32:42'),
(73, NULL, 'MARCELA', 'FAYTONG', '2011-03-10', NULL, NULL, NULL, NULL, 'CR', NULL, '2019-04-12 02:35:02', '2019-04-12 02:35:02'),
(74, NULL, 'NAOMI', 'HATOMI', '2006-10-26', NULL, NULL, NULL, NULL, 'DELTA', NULL, '2019-04-12 02:38:21', '2019-04-12 02:38:21'),
(75, NULL, 'M. ALEJANDRA', 'TORRES', '2008-02-17', NULL, NULL, NULL, NULL, 'NUEVO MUNDO', NULL, '2019-04-12 02:40:57', '2019-04-12 02:40:57'),
(76, NULL, 'LUCIANA', 'GARCIA', '2009-04-14', NULL, NULL, NULL, NULL, 'DELTA', NULL, '2019-04-12 02:43:21', '2019-04-12 02:43:21'),
(77, NULL, 'ARIANA', 'ZAMBRANO', '2005-05-22', NULL, NULL, NULL, NULL, 'MONTE TABOR', NULL, '2019-04-12 02:45:03', '2019-04-12 02:45:03'),
(78, NULL, 'EMILIO', 'CABRERA', '2002-09-07', NULL, NULL, NULL, NULL, 'JAVIER', NULL, '2019-04-12 02:46:38', '2019-04-12 02:46:38'),
(79, NULL, 'IVANA', 'SOLIS', '2008-01-04', NULL, NULL, NULL, NULL, 'NUEVO MUNDO', NULL, '2019-04-12 02:48:06', '2019-04-12 02:48:06'),
(80, NULL, 'Danna', 'Giler', '2010-09-27', NULL, NULL, NULL, NULL, 'Liceo los Andes', NULL, '2019-04-23 01:27:24', '2019-04-23 01:27:24'),
(81, NULL, 'Dante', 'Casierra', '2011-05-03', NULL, NULL, 'null', 'null', 'Ecomundo', NULL, '2019-04-28 02:40:05', '2019-04-28 02:40:05'),
(83, 924343213, 'Liliana', 'Estrella Murillo', '1992-01-19', NULL, NULL, 'null', 'null', NULL, NULL, '2019-04-30 10:02:50', '2019-04-30 10:02:50'),
(84, 924116619, 'Monica', 'Mendoza', '1995-06-21', 'monicamendoza_nailart', NULL, 'null', 'null', 'La MODERNA', NULL, '2019-04-30 20:56:37', '2019-04-30 20:56:37'),
(85, 960677342, 'Vanessa', 'Villarroel', '1989-02-22', 'vaneessavr', NULL, 'null', 'null', 'La MODERNA', NULL, '2019-04-30 20:56:38', '2019-04-30 20:56:38'),
(86, 703246033, 'Hernan Javier', 'Verduga Ludeña', '1980-01-07', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-30 22:26:42', '2019-05-06 22:28:05'),
(87, 917276214, 'Luz Elena', 'Teran Calle', '1983-11-30', NULL, NULL, NULL, NULL, NULL, NULL, '2019-04-30 22:26:42', '2019-05-06 22:58:53'),
(88, 927866095, 'VALENTINA', 'TORRES PARAMO', '2004-05-14', NULL, NULL, 'undefined', 'undefined', 'NUEVO MUNDO', NULL, '2019-05-02 22:45:32', '2019-05-02 22:45:32'),
(89, NULL, 'Valentina', 'Torres', '2009-02-04', NULL, NULL, 'undefined', 'undefined', 'MODERNA', NULL, '2019-05-02 22:45:35', '2019-05-02 22:45:35'),
(90, 929808251, 'Arianna', 'Carvajal', '2002-07-24', 'Arianna carvajal', NULL, 'null', 'null', 'Monte Tabor Nazaret', NULL, '2019-05-03 02:09:38', '2019-05-03 02:09:38'),
(91, 931368245, 'Hani Rosana', 'Ruiz Alban', '2003-10-20', '@rosanaruizalban/ Rosana Ruiz', NULL, 'null', 'null', 'Delfos', NULL, '2019-05-04 18:24:00', '2019-05-04 18:24:00'),
(92, 926959305, 'Tabatha', 'Jara Guzman', '2001-01-22', 'tabathajara', NULL, 'null', 'null', 'Javier', NULL, '2019-05-07 03:03:22', '2019-05-07 03:03:22'),
(93, NULL, 'ROMINA', 'ARRIAGA', '2004-05-02', NULL, NULL, 'undefined', 'undefined', 'Nuevo Mundo', NULL, '2019-05-15 01:19:17', '2019-05-15 01:19:17'),
(94, 2515, 'vnxn', 'fhgfj', '2008-06-20', NULL, NULL, 'undefined', 'undefined', 'fhlmfslh', NULL, '2019-05-15 23:32:44', '2019-05-15 23:32:44'),
(95, 1754698809, 'VALENITINA', 'VALENZUELA', '2008-11-04', NULL, NULL, 'undefined', 'undefined', 'Nuevo Mundo', NULL, '2019-05-16 21:46:31', '2019-05-16 21:46:31'),
(96, NULL, 'Alejandra', 'Torres', '2008-02-17', NULL, NULL, 'undefined', 'undefined', 'Nuevo Mundo', NULL, '2019-05-17 20:22:46', '2019-05-17 20:22:46'),
(97, NULL, 'Alejandra', 'Torres', '2008-02-17', NULL, NULL, 'undefined', 'undefined', 'Nuevo Mundo', NULL, '2019-05-17 20:23:01', '2019-05-17 20:23:01'),
(98, NULL, 'DOMENICA', 'SUAREZ', '2008-11-25', NULL, NULL, 'undefined', 'undefined', 'MONTE TABOR', NULL, '2019-05-17 21:17:36', '2019-05-17 21:17:36'),
(99, 931053649, 'MARIA PAULA', 'PALOMINO ESTRELLA', '2009-02-24', '@majoestrellarod', NULL, 'null', 'null', 'Liceo Panamericano', NULL, '2019-05-17 21:23:03', '2019-05-17 21:23:03'),
(100, NULL, 'CAMILA', 'CUEVA', '2008-09-14', NULL, NULL, 'undefined', 'undefined', 'Nuevo Mundo', NULL, '2019-05-17 22:13:52', '2019-05-17 22:13:52'),
(101, 920090776, 'Rosendo Florencio', 'Leon Leon', '1988-08-20', 'Rosendolion', NULL, 'null', 'null', NULL, NULL, '2019-05-19 09:59:21', '2019-05-19 09:59:21'),
(102, 923886173, 'Paulo Cesar', 'SalazarCastillo', '2005-10-03', NULL, NULL, 'null', 'null', 'DomingoComin', NULL, '2019-05-20 22:47:50', '2019-05-20 22:47:50'),
(103, 931845416, 'Isabella', 'Albán', '2011-02-04', NULL, NULL, 'undefined', 'undefined', 'Santo Domingo de Guzman', NULL, '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(104, 958378747, 'Valeria', 'Albán', '2009-11-21', NULL, NULL, 'undefined', 'undefined', 'Santo Domingo de Guzman', NULL, '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(105, NULL, 'ROMINA', 'AVILES', '2008-08-18', NULL, NULL, 'undefined', 'undefined', 'Nuevo Mundo', NULL, '2019-05-21 21:24:18', '2019-05-21 21:24:18'),
(106, 931229363, 'Ivana Javiera', 'Verduga maldonado', '2009-05-26', NULL, NULL, 'null', 'null', 'Aleman', NULL, '2019-05-21 23:08:16', '2019-05-21 23:08:16'),
(107, 931764369, 'Erika Javiera', 'Verduga maldonado', '2010-12-09', NULL, NULL, 'null', 'null', 'Alemán', NULL, '2019-05-21 23:11:02', '2019-05-21 23:11:02'),
(108, NULL, 'Rebeca', 'Saltos', '2004-04-27', NULL, NULL, 'undefined', 'undefined', 'Club de Voleibol Bahia', NULL, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(109, NULL, 'Ana', 'Cevallos', '2005-01-07', NULL, NULL, 'undefined', 'undefined', 'Club de Voleibol Bahia', NULL, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(110, NULL, 'Maria Gracia', 'Dueñas', '2005-04-11', NULL, NULL, 'undefined', 'undefined', 'Club de Voleibol Bahia', NULL, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(111, NULL, 'Ashley', 'Rosado', '2005-09-16', NULL, NULL, 'undefined', 'undefined', 'Club de Voleibol Bahia', NULL, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(112, NULL, 'ANANDA', 'ROMERO', '2009-04-21', NULL, NULL, 'undefined', 'undefined', 'NUEVO MUNDO', NULL, '2019-05-28 03:34:00', '2019-05-28 03:34:00'),
(113, 931040109, 'RAFAELA', 'LEON', '2006-11-24', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-05-29 21:28:10', '2019-05-29 21:28:10'),
(114, 9310400117, 'CAMILA', 'LEON', '2006-11-24', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-05-29 21:28:10', '2019-05-29 21:28:10'),
(115, NULL, 'Xaviera', 'Estrada Pérez', '2007-02-13', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-05-30 00:42:15', '2019-05-30 00:42:15'),
(116, NULL, 'Fngn', 'Fkgkg', '2008-06-19', NULL, NULL, 'null', 'null', 'Fkgkg', NULL, '2019-06-01 22:52:50', '2019-06-01 22:52:50'),
(117, NULL, 'ANA SOFIA', 'HATOMI', '2005-06-09', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(118, NULL, 'NAOMI', 'HATOMI', '2005-06-21', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(119, NULL, 'NICOLE', 'MIRANDA', '2005-06-06', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(120, NULL, 'MIA', 'CARTWRIGHT', '2005-06-10', NULL, NULL, 'undefined', 'undefined', 'DELTA', NULL, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(121, NULL, 'RAFAELA', 'MORALES', '2010-06-10', NULL, NULL, 'undefined', 'undefined', 'MENOR', NULL, '2019-06-02 02:20:09', '2019-06-02 02:20:09'),
(122, NULL, 'MARINA', 'CUEVA', '2008-03-13', NULL, NULL, 'undefined', 'undefined', 'NUEVO MUNDO', NULL, '2019-06-03 07:49:08', '2019-06-03 07:49:08'),
(123, NULL, 'ROMINA', 'CRUZ', '2009-06-19', NULL, NULL, 'undefined', 'undefined', 'MONTE TABOR', NULL, '2019-06-03 07:51:25', '2019-06-03 07:51:25'),
(124, NULL, 'ALESKA', 'CORDOVA', '2008-08-07', NULL, NULL, 'undefined', 'undefined', 'MONTE TABOR', NULL, '2019-06-03 07:56:05', '2019-06-03 07:56:05'),
(125, NULL, 'SURY', 'NAVARRETE', '2005-07-08', NULL, NULL, 'undefined', 'undefined', 'monte tabor', NULL, '2019-06-03 08:00:58', '2019-06-03 08:00:58'),
(126, NULL, 'Alexa', 'Luque', '2007-02-14', NULL, NULL, 'undefined', 'undefined', 'Asuncion', NULL, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(127, NULL, 'Ivanna', 'Luque', '2006-06-15', NULL, NULL, 'undefined', 'undefined', 'Asuncion', NULL, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(128, NULL, 'Valentina', 'Morales', '2006-06-06', NULL, NULL, 'undefined', 'undefined', 'na', NULL, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(129, 92666112, 'Andrea', 'Cedeño', '2003-10-28', NULL, NULL, 'null', 'null', 'UEB Delta', NULL, '2019-06-12 01:38:25', '2019-06-12 01:38:25'),
(130, NULL, 'Gabriela', 'Vargas', '2003-04-17', NULL, NULL, 'null', 'null', 'Espiritu santo', NULL, '2019-06-12 03:03:58', '2019-06-12 03:03:58'),
(131, NULL, 'Amy', 'Vargas', '2005-01-13', NULL, NULL, 'null', 'null', 'Espiritu Santo', NULL, '2019-06-12 03:03:59', '2019-06-12 03:03:59'),
(132, NULL, 'Pamela', 'Santos Moreira', '2005-02-11', NULL, NULL, 'null', 'null', 'Steiner', NULL, '2019-06-12 03:05:07', '2019-06-12 03:05:07'),
(133, 916564198, 'Mónica', 'Loaiza Quintana', '1988-01-28', NULL, NULL, 'null', 'null', 'INDEPENDIENTE', NULL, '2019-06-13 02:16:15', '2019-06-13 02:16:15'),
(134, NULL, 'Milena', 'Guerrero', '2006-09-18', NULL, NULL, 'null', 'null', 'Balandra Cruz del Sur', NULL, '2019-06-13 23:19:43', '2019-06-13 23:19:43'),
(135, 925168080, 'Kevin Franklin', 'Sisalima Jiménez', '1992-08-14', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-01 21:51:22', '2019-07-01 21:51:22'),
(136, 922429576, 'Gabriel Abraham', 'Neira Robles', '1998-10-07', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-01 21:51:22', '2019-07-01 21:51:22'),
(137, 123, 'Pepito 1', 'Test 1', '1991-06-08', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(138, 124, 'Pepito 2', 'Test 2', '1991-06-14', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(139, 930482799, 'Pablo Andres', 'Orellana Camacho', '1993-11-23', 'pablo_orellana23', NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-05 00:29:27', '2019-07-05 00:29:27'),
(140, 918068032, 'Christian Joao', 'Garcia Delvicier', '1991-10-10', 'chrisgd10', NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-05 00:29:28', '2019-07-05 00:29:28'),
(141, 925498297, 'Doménica Lorena', 'Velasco Ramos', '2000-02-03', '@dome_velasco63', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-08 06:14:16', '2019-07-08 06:14:16'),
(142, 928633312, 'María José', 'Zuñiga Delgado', '2001-01-06', 'https://www.facebook.com/majo.zunigadelgado', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-08 06:14:16', '2019-07-08 06:14:16'),
(143, 925647836, 'LUIS PATRICIO', 'PAREDES FRANCO', '1999-04-14', '@luispareds14', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(144, 1313311837, 'ANGEL RAUL', 'GAMBOA ZAMORA', '1998-04-23', '@raulgamboaz', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(145, 802772681, 'JULIO ANDRE', 'RIVADENEIRA SALAZAR', '2000-06-02', 'jars_2', NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(146, 803602143, 'NATHANIEL SAMIR', 'MEZA TRUJILLO', '1996-02-26', 'SamiirMeza', NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(147, 19845897, 'Carmen', 'Soto', '1991-06-08', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(148, 123456789, 'Vanessa', 'Villarroel', '1995-06-12', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(149, 927815381, 'VICTOR', 'LUDEÑA', '1997-02-04', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(150, 803311539, 'FRANCK', 'BANGUERA', '1996-11-24', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(151, 1315911758, 'Kaira Antonella', 'Mendoza Zambrano', '1998-05-27', 'Kaira Mendoza', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(152, 923029862, 'María Victoria', 'Ortega Andrade', '1998-02-21', 'Vicky Ortega', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(153, 932635527, 'ELIAS', 'MUÑOZ', '1999-11-09', '@Eliasmon077', NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(154, 942058629, 'OSCAR', 'NAVARRO', '2001-04-12', '@Oscar_david_12', NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(155, 929623650, 'ALFREDO', 'MATUTE', '2002-05-19', NULL, NULL, 'undefined', 'undefined', 'LEGO', NULL, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(156, 1250324959, 'PABLO', 'LAMA', '2001-10-30', NULL, NULL, 'undefined', 'undefined', 'LEGO', NULL, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(157, 804824077, 'MARITZA', 'VERA', '1998-03-15', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(158, 99172893, 'YHOVANNA AISKEL', 'GUANIPA', '1982-11-09', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(159, 959665223, 'FERNANDO XAVIER', 'LOAIZA GOYES', '1999-07-26', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(160, 1313192344, 'BRYAN JAVIER', 'VALDIVIEZO', '1996-03-04', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(161, 920013877, 'XAVIER ALFREDO', 'CRUZ SANTOS', '1993-12-15', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-09 21:59:58', '2019-07-09 21:59:58'),
(162, 932033467, 'GEOVANNY FRANCISCO', 'VELEZ MIRANDA', '2000-03-08', NULL, NULL, 'undefined', 'undefined', NULL, NULL, '2019-07-09 21:59:58', '2019-07-09 21:59:58'),
(163, 930499645, 'Carlos Andrés', 'Castillo Salazar', '1996-05-12', '@carloscastillo_s', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-10 07:00:34', '2019-07-10 07:00:34'),
(164, 704293588, 'Bryan Daniel', 'Jirón Abad', '1996-10-16', '@bjiron16', NULL, 'undefined', 'undefined', 'ESPOL', NULL, '2019-07-10 07:00:34', '2019-07-10 07:00:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atletas_informacion_adicional`
--

CREATE TABLE `atletas_informacion_adicional` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `informacion_adicional_id` int(10) UNSIGNED NOT NULL,
  `respuesta` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `atletas_informacion_adicional`
--

INSERT INTO `atletas_informacion_adicional` (`id`, `atletas_id`, `informacion_adicional_id`, `respuesta`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'No', '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(2, 4, 2, 'No', '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(3, 4, 3, 'No', '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(4, 5, 1, 'No', '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(5, 5, 2, 'No', '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(6, 5, 3, 'No', '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(7, 6, 1, 'Ninguno', '2019-01-29 06:25:22', '2019-01-29 06:25:22'),
(8, 6, 2, 'Ninguna', '2019-01-29 06:25:22', '2019-01-29 06:25:22'),
(9, 6, 3, 'No', '2019-01-29 06:25:22', '2019-01-29 06:25:22'),
(10, 8, 1, 'No', '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(11, 8, 2, 'No', '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(12, 8, 3, 'Acaros', '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(13, 8, 4, 'Si. Urbanización Castilla mz 20 Villa 21', '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(14, 9, 3, 'No puede estar cerca de fumigaciones insecticidas ni nada que tenga olor fuerte o veneno', '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(15, 13, 1, 'ninguno', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(16, 13, 2, 'ninguno', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(17, 13, 3, 'no', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(18, 13, 4, 'no', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(19, 14, 1, 'ninguno', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(20, 14, 2, 'ninguno', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(21, 14, 3, 'no', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(22, 14, 4, 'no', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(23, 16, 1, 'No', '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(24, 16, 2, 'No', '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(25, 16, 3, 'No', '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(26, 16, 4, 'Si.  Urb vía al sol mz 577 v 25', '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(27, 20, 1, 'No', '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(28, 20, 2, 'No', '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(29, 20, 3, 'Alergia al polvo y polen', '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(30, 20, 4, 'Necesito transporte sólo para la semana de 19 al 24 de febrero Matices Verde Esmeralda MZ 52 villa 21', '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(31, 21, 1, 'No', '2019-02-06 13:05:53', '2019-02-06 13:05:53'),
(32, 21, 2, 'No', '2019-02-06 13:05:53', '2019-02-06 13:05:53'),
(33, 21, 3, 'Al polvo y polen', '2019-02-06 13:05:53', '2019-02-06 13:05:53'),
(34, 21, 4, 'Necesito sólo para la semana de 19 Al 24 de febrero', '2019-02-06 13:05:53', '2019-02-06 13:05:53'),
(35, 22, 1, 'Temporal por ésta semana por un esguince', '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(36, 22, 2, 'No', '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(37, 22, 3, 'No', '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(38, 22, 4, 'No', '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(39, 23, 1, 'No', '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(40, 23, 2, 'No', '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(41, 23, 3, 'Es alérgica al colorante en los alimentos', '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(42, 23, 4, 'No', '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(43, 27, 1, 'No', '2019-02-08 03:21:37', '2019-02-08 03:21:37'),
(44, 27, 2, 'No', '2019-02-08 03:21:37', '2019-02-08 03:21:37'),
(45, 27, 3, 'No', '2019-02-08 03:21:37', '2019-02-08 03:21:37'),
(46, 29, 1, 'Es Diabetica', '2019-02-09 03:50:34', '2019-02-09 03:50:34'),
(47, 30, 1, 'Es Diabetica', '2019-02-09 03:51:11', '2019-02-09 03:51:11'),
(48, 31, 1, 'Ninguno', '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(49, 31, 2, 'Ninguno', '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(50, 31, 3, 'Ninguno.', '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(51, 31, 4, 'Si. Urb. Cataluña Mz 27 Villa 5', '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(52, 34, 1, 'NO', '2019-02-12 07:42:17', '2019-02-12 07:42:17'),
(53, 34, 2, 'NO', '2019-02-12 07:42:18', '2019-02-12 07:42:18'),
(54, 34, 3, 'NO', '2019-02-12 07:42:18', '2019-02-12 07:42:18'),
(55, 34, 4, 'NO', '2019-02-12 07:42:18', '2019-02-12 07:42:18'),
(56, 35, 1, 'No', '2019-02-13 03:53:43', '2019-02-13 03:53:43'),
(57, 35, 2, 'No', '2019-02-13 03:53:43', '2019-02-13 03:53:43'),
(58, 35, 3, 'No', '2019-02-13 03:53:43', '2019-02-13 03:53:43'),
(59, 35, 4, 'No', '2019-02-13 03:53:43', '2019-02-13 03:53:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atletas_uniformes`
--

CREATE TABLE `atletas_uniformes` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `uniformes_id` int(10) UNSIGNED DEFAULT NULL,
  `tallas_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campamentos`
--

CREATE TABLE `campamentos` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad_inicio` int(11) NOT NULL,
  `edad_fin` int(11) DEFAULT NULL,
  `porcentaje_individual` int(11) DEFAULT NULL,
  `porcentaje_grupal` int(11) DEFAULT NULL,
  `fecha_limite` date NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campamentos`
--

INSERT INTO `campamentos` (`id`, `locaciones_id`, `descripcion`, `edad_inicio`, `edad_fin`, `porcentaje_individual`, `porcentaje_grupal`, `fecha_limite`, `activo`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 3, 'Campamento para adolescentes', 16, NULL, 10, NULL, '2019-01-26', 0, NULL, '2019-03-21 05:00:00', NULL),
(2, 3, 'Campamento para niños', 12, 15, 10, NULL, '2019-02-23', 0, NULL, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campamentos_fechas`
--

CREATE TABLE `campamentos_fechas` (
  `id` int(10) UNSIGNED NOT NULL,
  `campamentos_horarios_id` int(10) UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campamentos_fechas`
--

INSERT INTO `campamentos_fechas` (`id`, `campamentos_horarios_id`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-02-09', '2019-02-10', '2019-03-21 05:00:00', NULL),
(2, 2, '2019-02-09', '2019-02-10', '2019-03-21 05:00:00', NULL),
(3, 2, '2019-02-16', '2019-02-17', '2019-03-21 05:00:00', NULL),
(4, 3, '2019-02-09', '2019-02-10', '2019-03-21 05:00:00', NULL),
(5, 3, '2019-02-09', '2019-02-10', '2019-03-21 05:00:00', NULL),
(6, 3, '2019-02-23', '2019-02-24', '2019-03-21 05:00:00', NULL),
(7, 4, '2019-03-09', '2019-03-10', '2019-03-21 05:00:00', NULL),
(8, 5, '2019-03-09', '2019-03-10', '2019-03-21 05:00:00', NULL),
(9, 5, '2019-03-16', '2019-03-17', '2019-03-21 05:00:00', NULL),
(10, 6, '2019-03-09', '2019-03-10', '2019-03-21 05:00:00', NULL),
(11, 6, '2019-03-09', '2019-03-10', '2019-03-21 05:00:00', NULL),
(12, 6, '2019-03-23', '2019-03-24', '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campamentos_horarios`
--

CREATE TABLE `campamentos_horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `campamentos_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarifa_ins` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campamentos_horarios`
--

INSERT INTO `campamentos_horarios` (`id`, `campamentos_id`, `descripcion`, `tarifa_ins`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, '1 fin de semana', '90.00', 0, '2019-03-21 05:00:00', NULL),
(2, 1, '2 fines de semana', '120.00', 0, '2019-03-21 05:00:00', NULL),
(3, 1, '3 fines de semana', '150.00', 0, '2019-03-21 05:00:00', NULL),
(4, 2, '1 fin de semana', '90.00', 0, '2019-03-21 05:00:00', NULL),
(5, 2, '2 fines de semana', '120.00', 0, '2019-03-21 05:00:00', NULL),
(6, 2, '3 fines de semana', '150.00', 0, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonatos`
--

CREATE TABLE `campeonatos` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad_inicio` int(11) NOT NULL,
  `edad_fin` int(11) DEFAULT NULL,
  `h_inicio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `h_fin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porcentaje_individual` int(11) DEFAULT NULL,
  `porcentaje_grupal` int(11) DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campeonatos`
--

INSERT INTO `campeonatos` (`id`, `locaciones_id`, `descripcion`, `edad_inicio`, `edad_fin`, `h_inicio`, `h_fin`, `porcentaje_individual`, `porcentaje_grupal`, `fecha_limite`, `activo`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 2, 'Campeonato de beach volley', 9, 15, '10:30', '19:30', 5, 0, '2019-05-27', 0, 'NULL', '2019-05-14 05:00:00', '0000-00-00 00:00:00'),
(2, 2, '4to Campeonato Abierto', 16, 50, '10:00', '16:00', NULL, NULL, '2019-07-16', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato_categorias`
--

CREATE TABLE `campeonato_categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `campeonato_horarios_id` int(10) UNSIGNED NOT NULL,
  `edad_maxima` int(11) NOT NULL,
  `anyo_inicio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `anyo_fin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campeonato_categorias`
--

INSERT INTO `campeonato_categorias` (`id`, `campeonato_horarios_id`, `edad_maxima`, `anyo_inicio`, `anyo_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 15, '2004', '2005', '2019-05-14 05:00:00', '0000-00-00 00:00:00'),
(2, 1, 13, '2006', '2007', '2019-05-14 05:00:00', '0000-00-00 00:00:00'),
(3, 1, 11, '2008', '2009', '2019-05-14 05:00:00', '0000-00-00 00:00:00'),
(4, 2, 50, 'SERIE', 'A', '2019-07-01 05:00:00', NULL),
(5, 2, 50, 'SERIE', 'B', '2019-07-01 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato_duplas`
--

CREATE TABLE `campeonato_duplas` (
  `id` int(10) UNSIGNED NOT NULL,
  `campeonato_categorias_id` int(10) UNSIGNED NOT NULL,
  `representantes_id` int(10) UNSIGNED NOT NULL,
  `atleta_id_jugador1` int(11) DEFAULT NULL,
  `jugador_1` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `atleta_id_jugador2` int(11) DEFAULT NULL,
  `jugador_2` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campeonato_duplas`
--

INSERT INTO `campeonato_duplas` (`id`, `campeonato_categorias_id`, `representantes_id`, `atleta_id_jugador1`, `jugador_1`, `atleta_id_jugador2`, `jugador_2`, `created_at`, `updated_at`) VALUES
(1, 2, 2, 1, 'Ilanna Dvorquez', 94, 'vnxn fhgfj', '2019-05-15 23:32:44', '2019-05-15 23:32:44'),
(2, 1, 80, 108, 'Rebeca Saltos', 109, 'Ana Cevallos', '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(3, 1, 80, 110, 'Maria Gracia Dueñas', 111, 'Ashley Rosado', '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(4, 4, 85, 137, 'Pepito 1 Test 1', 138, 'Pepito 2 Test 2', '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(5, 5, 96, 139, 'Pablo Andres Orellana Camacho', 140, 'Christian Joao Garcia Delvicier', '2019-07-05 00:29:28', '2019-07-05 00:29:28'),
(6, 4, 98, 143, 'LUIS PATRICIO PAREDES FRANCO', 144, 'ANGEL RAUL GAMBOA ZAMORA', '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(7, 4, 97, 142, 'María José Zuñiga Delgado', 141, 'Doménica Lorena Velasco Ramos', '2019-07-08 10:02:07', '2019-07-08 10:02:07'),
(8, 5, 99, 145, 'JULIO ANDRE RIVADENEIRA SALAZAR', 146, 'NATHANIEL SAMIR MEZA TRUJILLO', '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(9, 4, 100, 147, 'Carmen Soto', 148, 'Vanessa Villarroel', '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(10, 4, 101, 150, 'FRANCK BANGUERA', 149, 'VICTOR LUDEÑA', '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(11, 4, 102, 152, 'María Victoria Ortega Andrade', 151, 'Kaira Antonella Mendoza Zambrano', '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(12, 5, 95, 135, 'Kevin Franklin Sisalima Jiménez', 136, 'Gabriel Abraham Neira Robles', '2019-07-08 21:51:54', '2019-07-08 21:51:54'),
(13, 5, 103, 153, 'ELIAS MUÑOZ', 154, 'OSCAR NAVARRO', '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(14, 5, 104, 155, 'ALFREDO MATUTE', 156, 'PABLO LAMA', '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(15, 4, 105, 157, 'MARITZA VERA', 158, 'YHOVANNA AISKEL GUANIPA', '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(16, 4, 105, 159, 'FERNANDO XAVIER LOAIZA GOYES', 160, 'BRYAN JAVIER VALDIVIEZO', '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(17, 5, 106, 162, 'GEOVANNY FRANCISCO VELEZ MIRANDA', 161, 'XAVIER ALFREDO CRUZ SANTOS', '2019-07-09 22:01:43', '2019-07-09 22:01:43'),
(18, 5, 107, 163, 'Carlos Andrés Castillo Salazar', 164, 'Bryan Daniel Jirón Abad', '2019-07-10 07:00:35', '2019-07-10 07:00:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato_factura`
--

CREATE TABLE `campeonato_factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `campeonatos_id` int(10) UNSIGNED NOT NULL,
  `representantes_id` int(10) UNSIGNED NOT NULL,
  `campeonato_duplas_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pago` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campeonato_factura`
--

INSERT INTO `campeonato_factura` (`id`, `campeonatos_id`, `representantes_id`, `campeonato_duplas_id`, `fecha`, `subtotal`, `descuento`, `total`, `status`, `tipo_pago`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, '2019-05-15', '30.00', '1.50', '28.50', 'Pendiente', 'Efectivo', 1, '2019-05-15 23:32:44', '2019-05-15 23:32:44'),
(2, 1, 80, 2, '2019-05-27', '60.00', '3.00', '57.00', 'Pendiente', 'Efectivo', 1, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(3, 1, 80, 3, '2019-05-27', '60.00', '3.00', '57.00', 'Pendiente', 'Efectivo', 1, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(4, 2, 85, 4, '2019-07-01', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(5, 2, 96, 5, '2019-07-04', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-05 00:29:28', '2019-07-05 00:29:28'),
(6, 2, 98, 6, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(7, 2, 97, 7, '2019-07-08', '30.00', '0.00', '0.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 10:02:07', '2019-07-08 10:02:07'),
(8, 2, 99, 8, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(9, 2, 100, 9, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(10, 2, 101, 10, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(11, 2, 102, 11, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(12, 2, 95, 12, '2019-07-08', '30.00', '0.00', '0.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 21:51:54', '2019-07-08 21:51:54'),
(13, 2, 103, 13, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(14, 2, 104, 14, '2019-07-08', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(15, 2, 105, 15, '2019-07-09', '60.00', '0.00', '60.00', 'Pendiente', 'Efectivo', 1, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(16, 2, 105, 16, '2019-07-09', '60.00', '0.00', '60.00', 'Pendiente', 'Efectivo', 1, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(17, 2, 106, 17, '2019-07-09', '60.00', '0.00', '60.00', 'Pendiente', 'Efectivo', 1, '2019-07-09 22:01:43', '2019-07-09 22:01:43'),
(18, 2, 107, 18, '2019-07-10', '30.00', '0.00', '30.00', 'Pendiente', 'Efectivo', 1, '2019-07-10 07:00:35', '2019-07-10 07:00:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `campeonato_horarios`
--

CREATE TABLE `campeonato_horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `campeonato_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarifa_ins` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `campeonato_horarios`
--

INSERT INTO `campeonato_horarios` (`id`, `campeonato_id`, `descripcion`, `tarifa_ins`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tarifa única', '30.00', 1, '2019-05-14 05:00:00', '0000-00-00 00:00:00'),
(2, 2, 'Tarifa única', '30.00', 1, '2019-07-01 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `colores`
--

CREATE TABLE `colores` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `desde` int(11) NOT NULL COMMENT 'Edad inicio',
  `hasta` int(11) NOT NULL COMMENT 'Edad fin',
  `hora_inicio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_fin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `horarios`
--

INSERT INTO `horarios` (`id`, `locaciones_id`, `desde`, `hasta`, `hora_inicio`, `hora_fin`, `created_at`, `updated_at`) VALUES
(1, 1, 8, 13, '17:00', '18:30', '2019-03-21 05:00:00', NULL),
(2, 1, 14, 100, '18:30', '20:00', '2019-03-21 05:00:00', NULL),
(3, 2, 8, 13, '17:00', '18:30', '2019-03-21 05:00:00', NULL),
(4, 2, 14, 100, '18:30', '20:00', '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_adicional`
--

CREATE TABLE `informacion_adicional` (
  `id` int(10) UNSIGNED NOT NULL,
  `pregunta` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `informacion_adicional`
--

INSERT INTO `informacion_adicional` (`id`, `pregunta`, `created_at`, `updated_at`) VALUES
(1, '¿Tiene algún problema físico o enfermedad que le limite hacer ejercicios?', '2019-03-21 05:00:00', NULL),
(2, '¿Toma algún medicamento?', '2019-03-21 05:00:00', NULL),
(3, '¿Tiene alguna alergia: animales, insectos, medicamentos u otros?', '2019-03-21 05:00:00', NULL),
(4, '¿Necesita transporte? Indícanos tu dirección', '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_academia`
--

CREATE TABLE `inscripciones_academia` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `estatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Regular',
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `uniformes` int(11) NOT NULL DEFAULT '0',
  `activo` int(11) NOT NULL DEFAULT '1',
  `prueba_fecha` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones_academia`
--

INSERT INTO `inscripciones_academia` (`id`, `atletas_id`, `fecha_inscripcion`, `estatus`, `locaciones_id`, `uniformes`, `activo`, `prueba_fecha`, `created_at`, `updated_at`) VALUES
(1, 38, '2019-03-25', 'Prueba', 1, 0, 1, '2019-03-25', '2019-03-25 16:23:11', '2019-03-25 16:23:11'),
(2, 39, '2019-03-25', 'Prueba', 1, 0, 1, '2019-03-25', '2019-03-25 16:28:12', '2019-03-25 16:28:12'),
(3, 40, '2019-03-27', 'Prueba', 1, 0, 1, '2019-03-27', '2019-03-27 20:53:11', '2019-03-27 20:53:11'),
(4, 41, '2019-03-27', 'Prueba', 1, 0, 1, '2019-03-27', '2019-03-28 00:27:55', '2019-03-28 00:27:55'),
(5, 42, '2019-03-27', 'Prueba', 2, 0, 1, '2019-03-28', '2019-03-28 01:28:35', '2019-03-28 01:28:35'),
(6, 43, '2019-03-28', 'Prueba', 1, 0, 1, '2019-03-28', '2019-03-29 00:28:15', '2019-03-29 00:28:15'),
(9, 46, '2019-04-01', 'Prueba', 1, 0, 1, '2019-04-01', '2019-04-01 21:30:24', '2019-04-01 21:30:24'),
(10, 47, '2019-04-02', 'Prueba', 2, 0, 1, '2019-04-01', '2019-04-03 00:26:23', '2019-04-03 00:26:23'),
(29, 55, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-11 23:13:14', '2019-04-11 23:13:14'),
(31, 56, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:18:24', '2019-04-12 01:18:24'),
(32, 57, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:24:04', '2019-04-12 01:24:04'),
(33, 58, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(34, 59, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(35, 60, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:33:28', '2019-04-12 01:33:28'),
(36, 61, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:37:19', '2019-04-12 01:37:19'),
(37, 62, '2019-04-11', 'Prueba', 1, 0, 1, '2019-04-11', '2019-04-12 01:47:10', '2019-04-12 01:47:10'),
(38, 63, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 01:58:00', '2019-04-12 01:58:00'),
(39, 64, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:00:24', '2019-04-12 02:00:24'),
(40, 65, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(41, 66, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(42, 67, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:06:29', '2019-04-12 02:06:29'),
(43, 68, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:15:34', '2019-04-12 02:15:34'),
(44, 69, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:22:37', '2019-04-12 02:22:37'),
(45, 70, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:25:33', '2019-04-12 02:25:33'),
(46, 71, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:28:08', '2019-04-12 02:28:08'),
(47, 72, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:32:42', '2019-04-12 02:32:42'),
(48, 73, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:35:02', '2019-04-12 02:35:02'),
(49, 74, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:38:21', '2019-04-12 02:38:21'),
(50, 75, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:40:57', '2019-04-12 02:40:57'),
(51, 76, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:43:21', '2019-04-12 02:43:21'),
(52, 77, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:45:03', '2019-04-12 02:45:03'),
(53, 78, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:46:38', '2019-04-12 02:46:38'),
(54, 79, '2019-04-11', 'Prueba', 2, 0, 1, '2019-04-11', '2019-04-12 02:48:06', '2019-04-12 02:48:06'),
(55, 80, '2019-04-22', 'Prueba', 1, 0, 1, '2019-04-22', '2019-04-23 01:27:24', '2019-04-23 01:27:24'),
(56, 81, '2019-04-27', 'Prueba', 2, 0, 1, '2019-04-29', '2019-04-28 02:40:05', '2019-04-28 02:40:05'),
(58, 83, '2019-04-30', 'Prueba', 1, 0, 1, '2019-05-09', '2019-04-30 10:02:50', '2019-04-30 10:02:50'),
(59, 84, '2019-04-30', 'Prueba', 2, 0, 1, '2019-05-02', '2019-04-30 20:56:38', '2019-04-30 20:56:38'),
(60, 85, '2019-04-30', 'Prueba', 2, 0, 1, '2019-05-02', '2019-04-30 20:56:38', '2019-04-30 20:56:38'),
(61, 86, '2019-04-30', 'Prueba', 1, 0, 1, '2019-04-29', '2019-04-30 22:26:42', '2019-04-30 22:26:42'),
(62, 87, '2019-04-30', 'Prueba', 1, 0, 1, '2019-04-29', '2019-04-30 22:26:42', '2019-04-30 22:26:42'),
(63, 90, '2019-05-02', 'Prueba', 1, 0, 1, '2019-05-06', '2019-05-03 02:09:39', '2019-05-03 02:09:39'),
(64, 91, '2019-05-04', 'Prueba', 2, 0, 1, '2019-05-06', '2019-05-04 18:24:01', '2019-05-04 18:24:01'),
(67, 86, '2019-05-06', 'Regular', 1, 0, 1, NULL, '2019-05-06 22:28:05', '2019-05-06 22:28:05'),
(68, 87, '2019-05-06', 'Regular', 1, 0, 1, NULL, '2019-05-06 22:58:53', '2019-05-06 22:58:53'),
(69, 92, '2019-05-06', 'Prueba', 1, 0, 1, '2019-05-06', '2019-05-07 03:03:22', '2019-05-07 03:03:22'),
(70, 99, '2019-05-17', 'Prueba', 2, 0, 1, '2019-05-20', '2019-05-17 21:23:03', '2019-05-17 21:23:03'),
(71, 101, '2019-05-19', 'Prueba', 2, 0, 1, '2019-05-20', '2019-05-19 09:59:21', '2019-05-19 09:59:21'),
(72, 102, '2019-05-20', 'Prueba', 2, 0, 1, '2019-05-23', '2019-05-20 22:47:50', '2019-05-20 22:47:50'),
(73, 106, '2019-05-21', 'Prueba', 1, 0, 1, '2019-05-23', '2019-05-21 23:08:16', '2019-05-21 23:08:16'),
(74, 107, '2019-05-21', 'Prueba', 1, 0, 1, '2019-05-23', '2019-05-21 23:11:02', '2019-05-21 23:11:02'),
(75, 116, '2019-06-01', 'Prueba', 1, 0, 1, '2019-06-03', '2019-06-01 22:52:50', '2019-06-01 22:52:50'),
(76, 129, '2019-06-11', 'Prueba', 2, 0, 1, '2019-06-11', '2019-06-12 01:38:25', '2019-06-12 01:38:25'),
(77, 130, '2019-06-11', 'Prueba', 2, 0, 1, '2019-06-13', '2019-06-12 03:03:59', '2019-06-12 03:03:59'),
(78, 131, '2019-06-11', 'Prueba', 2, 0, 1, '2019-06-13', '2019-06-12 03:03:59', '2019-06-12 03:03:59'),
(79, 132, '2019-06-11', 'Prueba', 1, 0, 1, '2019-06-11', '2019-06-12 03:05:07', '2019-06-12 03:05:07'),
(80, 133, '2019-06-12', 'Prueba', 2, 0, 1, '2019-06-13', '2019-06-13 02:16:15', '2019-06-13 02:16:15'),
(81, 134, '2019-06-13', 'Prueba', 1, 0, 1, '2019-06-13', '2019-06-13 23:19:43', '2019-06-13 23:19:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_campamento`
--

CREATE TABLE `inscripciones_campamento` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `campamentos_horarios_id` int(10) UNSIGNED NOT NULL,
  `tarifa` decimal(9,2) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `pago` decimal(9,2) NOT NULL,
  `estatus_pago` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `fecha_inscripcion` date NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_campeonato`
--

CREATE TABLE `inscripciones_campeonato` (
  `id` int(10) UNSIGNED NOT NULL,
  `campeonato_horarios_id` int(10) UNSIGNED NOT NULL,
  `campeonato_duplas_id` int(10) UNSIGNED NOT NULL,
  `tarifa` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) DEFAULT NULL,
  `pago` decimal(9,2) NOT NULL,
  `estatus_pago` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `fecha_inscripcion` date NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones_campeonato`
--

INSERT INTO `inscripciones_campeonato` (`id`, `campeonato_horarios_id`, `campeonato_duplas_id`, `tarifa`, `descuento`, `pago`, `estatus_pago`, `fecha_inscripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '30.00', '0.75', '14.25', 'Pendiente', '2019-05-15', 1, '2019-05-15 23:32:44', '2019-05-15 23:32:44'),
(2, 1, 1, '30.00', '0.75', '14.25', 'Pendiente', '2019-05-15', 1, '2019-05-15 23:32:44', '2019-05-15 23:32:44'),
(3, 1, 2, '30.00', '0.75', '14.25', 'Pendiente', '2019-05-27', 1, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(4, 1, 3, '30.00', '0.75', '14.25', 'Pendiente', '2019-05-27', 1, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(5, 2, 4, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-01', 0, '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(6, 2, 5, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-04', 1, '2019-07-05 00:29:28', '2019-07-05 00:29:28'),
(7, 2, 6, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(8, 2, 7, '30.00', '0.00', '0.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 10:02:07', '2019-07-08 10:02:07'),
(9, 2, 8, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(10, 2, 9, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(11, 2, 10, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(12, 2, 11, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(13, 2, 12, '30.00', '0.00', '0.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 21:51:54', '2019-07-08 21:51:54'),
(14, 2, 13, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(15, 2, 14, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-08', 1, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(16, 2, 15, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-09', 1, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(17, 2, 16, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-09', 1, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(18, 2, 17, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-09', 1, '2019-07-09 22:01:43', '2019-07-09 22:01:43'),
(19, 2, 18, '30.00', '0.00', '15.00', 'Pendiente', '2019-07-10', 1, '2019-07-10 07:00:35', '2019-07-10 07:00:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_vacacional`
--

CREATE TABLE `inscripciones_vacacional` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `vacacional_horarios_id` int(10) UNSIGNED NOT NULL,
  `tarifa` decimal(9,2) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `pago` decimal(9,2) NOT NULL,
  `estatus_pago` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `fecha_inscripcion` date NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones_vacacional`
--

INSERT INTO `inscripciones_vacacional` (`id`, `atletas_id`, `vacacional_horarios_id`, `tarifa`, `descuento`, `pago`, `estatus_pago`, `fecha_inscripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '150.00', 23, '127.50', 'Pendiente', '2019-01-25', 0, '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(2, 2, 3, '150.00', 23, '127.50', 'Pendiente', '2019-01-25', 0, '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(3, 3, 4, '90.00', 9, '81.00', 'Pagado', '2019-01-26', 1, '2019-01-27 03:27:44', '2019-02-08 01:37:46'),
(4, 4, 4, '90.00', 14, '76.50', 'Pagado', '2019-01-28', 1, '2019-01-29 01:20:17', '2019-02-08 01:19:59'),
(5, 5, 4, '90.00', 14, '76.50', 'Pagado', '2019-01-28', 0, '2019-01-29 01:20:17', '2019-02-10 12:19:43'),
(6, 6, 4, '90.00', 9, '81.00', 'Pagado', '2019-01-28', 1, '2019-01-29 06:25:22', '2019-02-08 01:37:52'),
(8, 8, 1, '90.00', 0, '90.00', 'Pagado', '2019-01-29', 1, '2019-01-30 04:27:15', '2019-02-08 01:37:56'),
(9, 9, 1, '90.00', 14, '76.50', 'Pendiente', '2019-01-29', 0, '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(10, 10, 1, '90.00', 14, '76.50', 'Pendiente', '2019-01-29', 0, '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(11, 11, 4, '90.00', 0, '90.00', 'Pagado', '2019-01-31', 1, '2019-02-01 03:37:45', '2019-02-08 01:41:16'),
(12, 12, 2, '90.00', 0, '90.00', 'Pendiente', '2019-02-01', 0, '2019-02-02 02:46:36', '2019-02-02 02:46:36'),
(13, 13, 2, '90.00', 9, '81.00', 'Pagado', '2019-02-05', 1, '2019-02-05 11:36:19', '2019-02-08 01:36:33'),
(14, 14, 2, '90.00', 9, '81.00', 'Pagado', '2019-02-05', 1, '2019-02-05 11:36:19', '2019-02-08 01:36:47'),
(15, 15, 4, '90.00', 0, '90.00', 'Pagado', '2019-02-05', 1, '2019-02-06 03:22:10', '2019-02-08 01:35:45'),
(16, 16, 4, '90.00', 0, '90.00', 'Pendiente', '2019-02-05', 0, '2019-02-06 04:31:56', '2019-02-09 05:01:46'),
(17, 17, 2, '90.00', 9, '81.00', 'Pendiente', '2019-02-05', 0, '2019-02-06 04:41:06', '2019-02-12 01:17:41'),
(18, 18, 2, '90.00', 9, '81.00', 'Pendiente', '2019-02-05', 0, '2019-02-06 04:41:06', '2019-02-12 01:17:52'),
(19, 19, 2, '90.00', 9, '81.00', 'Pendiente', '2019-02-05', 0, '2019-02-06 04:41:06', '2019-02-12 01:17:59'),
(20, 20, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 1, '2019-02-06 13:01:21', '2019-02-08 01:36:56'),
(21, 21, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 1, '2019-02-06 13:05:53', '2019-02-08 01:37:31'),
(22, 22, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 1, '2019-02-06 13:12:14', '2019-02-08 01:37:38'),
(23, 23, 1, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 0, '2019-02-07 02:09:56', '2019-02-10 10:52:47'),
(24, 24, 5, '90.00', 0, '90.00', 'Pendiente', '2019-02-06', 0, '2019-02-07 04:12:41', '2019-02-07 04:12:41'),
(25, 25, 1, '90.00', 9, '81.00', 'Pendiente', '2019-02-06', 0, '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(26, 26, 1, '90.00', 9, '81.00', 'Pendiente', '2019-02-06', 0, '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(27, 27, 1, '90.00', 0, '90.00', 'Pagado', '2019-02-07', 1, '2019-02-08 03:21:37', '2019-02-12 09:04:01'),
(28, 23, 1, '90.00', 0, '90.00', 'Pagado', '2019-02-07', 1, '2019-02-08 03:23:36', '2019-02-13 03:34:15'),
(29, 28, 4, '90.00', 0, '90.00', 'Pendiente', '2019-02-07', 1, '2019-02-08 04:38:43', '2019-02-08 04:38:43'),
(30, 29, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-08', 0, '2019-02-09 03:50:34', '2019-02-09 03:52:14'),
(31, 30, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-08', 1, '2019-02-09 03:51:11', '2019-02-13 03:35:43'),
(32, 31, 1, '90.00', NULL, '90.00', 'Pagado', '2019-02-08', 1, '2019-02-09 07:38:08', '2019-02-13 03:34:34'),
(33, 32, 1, '90.00', NULL, '81.00', 'Pagado', '2019-02-11', 1, '2019-02-12 01:27:48', '2019-02-13 03:35:29'),
(34, 33, 1, '90.00', NULL, '81.00', 'Pendiente', '2019-02-11', 1, '2019-02-12 01:27:48', '2019-02-12 01:27:48'),
(35, 34, 2, '90.00', NULL, '90.00', 'Pagado', '2019-02-11', 1, '2019-02-12 07:42:18', '2019-02-14 01:11:16'),
(36, 35, 2, '90.00', NULL, '90.00', 'Pagado', '2019-02-12', 1, '2019-02-13 03:53:43', '2019-02-14 01:11:08'),
(37, 36, 2, '90.00', NULL, '90.00', 'Pendiente', '2019-02-13', 1, '2019-02-14 01:10:30', '2019-02-14 01:10:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_workshop`
--

CREATE TABLE `inscripciones_workshop` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `workshop_horarios_id` int(10) UNSIGNED NOT NULL,
  `tarifa` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) DEFAULT NULL,
  `pago` decimal(9,2) NOT NULL,
  `estatus_pago` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Pendiente',
  `fecha_inscripcion` date NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `inscripciones_workshop`
--

INSERT INTO `inscripciones_workshop` (`id`, `atletas_id`, `workshop_horarios_id`, `tarifa`, `descuento`, `pago`, `estatus_pago`, `fecha_inscripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '45.00', '2.25', '42.50', 'Pendiente', '2019-04-26', 0, '2019-04-27 02:21:34', '2019-05-06 20:58:44'),
(2, 88, 1, '45.00', '2.25', '0.00', 'Pagado', '2019-05-02', 1, '2019-05-02 22:45:32', '2019-05-23 21:12:34'),
(3, 89, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-02', 0, '2019-05-02 22:45:35', '2019-05-06 20:58:35'),
(4, 93, 1, '45.00', '2.25', '45.00', 'Pagado', '2019-05-14', 1, '2019-05-15 01:19:17', '2019-05-23 21:12:42'),
(5, 95, 1, '45.00', '2.25', '45.00', 'Pagado', '2019-05-16', 1, '2019-05-16 21:46:32', '2019-06-03 18:08:59'),
(6, 96, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-17', 1, '2019-05-17 20:22:46', '2019-05-17 20:22:46'),
(7, 97, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-17', 0, '2019-05-17 20:23:01', '2019-05-17 20:24:30'),
(8, 98, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-17', 1, '2019-05-17 21:17:36', '2019-05-17 21:17:36'),
(9, 100, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-17', 1, '2019-05-17 22:13:52', '2019-05-17 22:13:52'),
(10, 103, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-20', 1, '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(11, 104, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-20', 1, '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(12, 105, 1, '45.00', '2.25', '42.75', 'Pendiente', '2019-05-21', 1, '2019-05-21 21:24:18', '2019-05-21 21:24:18'),
(13, 9, 1, '45.00', '2.25', '40.00', 'Pagado', '2019-05-23', 1, '2019-05-23 21:10:54', '2019-05-23 21:13:02'),
(14, 112, 1, '45.00', '2.25', '45.00', 'Pagado', '2019-05-27', 1, '2019-05-28 03:34:00', '2019-05-30 19:53:28'),
(15, 72, 1, '45.00', '0.00', '45.00', 'Pagado', '2019-05-28', 1, '2019-05-28 22:39:14', '2019-05-29 19:58:02'),
(16, 77, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-05-29', 1, '2019-05-29 19:56:45', '2019-05-29 19:56:45'),
(17, 79, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-05-29', 1, '2019-05-29 20:05:45', '2019-05-29 20:05:45'),
(18, 67, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-05-29', 1, '2019-05-29 20:07:07', '2019-05-29 20:07:07'),
(19, 113, 1, '45.00', '0.00', '45.00', 'Pagado', '2019-05-29', 1, '2019-05-29 21:28:10', '2019-06-03 18:02:12'),
(20, 114, 1, '45.00', '0.00', '45.00', 'Pagado', '2019-05-29', 1, '2019-05-29 21:28:10', '2019-06-03 18:02:34'),
(21, 115, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-05-29', 1, '2019-05-30 00:42:15', '2019-05-30 00:42:15'),
(22, 63, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-05-29', 1, '2019-05-30 02:58:42', '2019-05-30 02:58:42'),
(23, 117, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-01', 1, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(24, 118, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-01', 1, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(25, 119, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-01', 1, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(26, 120, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-01', 1, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(27, 121, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-01', 1, '2019-06-02 02:20:09', '2019-06-02 02:20:09'),
(28, 122, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 07:49:08', '2019-06-03 07:49:08'),
(29, 123, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 07:51:25', '2019-06-03 07:51:25'),
(30, 124, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 07:56:05', '2019-06-03 07:56:05'),
(31, 125, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 08:00:58', '2019-06-03 08:00:58'),
(32, 126, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(33, 127, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(34, 128, 1, '45.00', '0.00', '0.00', 'Pendiente', '2019-06-03', 1, '2019-06-03 17:41:06', '2019-06-03 17:41:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `invitados`
--

CREATE TABLE `invitados` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` bigint(20) NOT NULL,
  `nombres` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `red_social` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `invitados`
--

INSERT INTO `invitados` (`id`, `cedula`, `nombres`, `apellidos`, `email`, `telefono`, `red_social`, `activo`, `created_at`, `updated_at`) VALUES
(1, 962597001, 'Carmen', 'Soto', 'carsoto8691@gmail.com', '0993517326', 'carmensoto86', 1, '2019-02-13 06:09:53', '2019-02-13 06:09:53'),
(2, 123456, 'A1', 'A1', NULL, NULL, NULL, 1, '2019-02-13 06:09:53', '2019-02-13 06:09:53'),
(3, 1234567, 'A2', 'A2', NULL, NULL, NULL, 1, '2019-02-13 06:09:53', '2019-02-13 06:09:53'),
(4, 12345678, 'A3', 'A3', NULL, NULL, NULL, 1, '2019-02-13 06:09:53', '2019-02-13 06:09:53'),
(5, 801928292, 'Andrea', 'Macias', 'Acmaciash@gmail.com', '0994405720', 'Andreitamaciash', 1, '2019-02-14 08:12:40', '2019-02-14 08:12:40'),
(6, 916542533, 'Jaime Andres', 'Vera Regalado', 'jaime14.vera10@gmail.com', '0993210650', NULL, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(7, 916913916, 'Jaime Antonio', 'Smith Gellibert', NULL, NULL, NULL, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(8, 918582081, 'Hernan Xavier', 'Eguez San Andres', NULL, NULL, NULL, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(9, 917142127, 'Ivan Danilo', 'Castro Briones', NULL, NULL, NULL, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(10, 910117126, 'Ricardo Javier', 'Garcia Quirola', NULL, NULL, NULL, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(11, 917089047, 'Pablo Antonio', 'Chavez Cañizares', NULL, NULL, NULL, 1, '2019-03-03 12:47:29', '2019-03-03 12:47:29'),
(17, 916635212, 'Allan Jose', 'Haraldsson Rojas', NULL, '0999544332', NULL, 1, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(18, 918166869, 'Pablo Xavier', 'Rojas Chacon', NULL, '0987877135', NULL, 1, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(19, 918580903, 'Dario Fernando', 'Del Pezo Zambrano', NULL, '0987208288', NULL, 1, '2019-03-09 12:18:17', '2019-03-09 12:18:17'),
(29, 919529628, 'Maria Jose', 'Aviles Zambrano', 'majose_ecuador@hotmail.com', '0987207853', NULL, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(30, 931623821, 'Maria Jose', 'Blanco Intriago', NULL, '0993595794', NULL, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(31, 931893929, 'Ellen stefania', 'Garzon pazmiño', NULL, '09959624118', NULL, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(32, 932109804, 'Milton Jesús', 'Camacho Fierro', NULL, '0994492261', NULL, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(33, 931619951, 'Jimmy Alejandro', 'Blanco Intriago', NULL, '0939449878', NULL, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(34, 924207582, 'Maria Teresa', 'Fuentes Mendoza', NULL, '0981114098', NULL, 1, '2019-03-22 20:17:36', '2019-03-22 20:17:36'),
(35, 920002847, 'Maria Paulina', 'Carrion', 'pollicarrion@gmail.com', '0999431379', 'mpcarrion', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(36, 926328295, 'Robert', 'Moreno', NULL, '0987225993', 'robertmoreno_v', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(37, 917707473, 'Michelle', 'Avila', NULL, '0987547245', '', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(38, 916915184, 'Maria Ines', 'Garcia', NULL, '0939587539', '', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(39, 919756205, 'Santiago', 'Rios', NULL, '0994935218', '', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(40, 918058264, 'Jessica', 'Jaramillo', NULL, '0994118535', '', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(41, 926130725, 'Juan', 'Leon', NULL, '0999630387', '', 1, '2019-03-23 04:43:31', '2019-03-23 04:43:31'),
(42, 930498472, 'Christian', 'Triviño', 'trivinochristian96@gmail.com', '0983814075', '', 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(43, 922719695, 'Ricardo', 'Del Pino', NULL, '0985868526', '', 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(44, 940425408, 'Valentina', 'Heyman', NULL, '0986750514', '', 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(45, 924163470, 'Diego', 'Delgado', NULL, '0980913637', '', 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(46, 920711884, 'Christian', 'Amen', NULL, '0993724818', '', 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(47, 922376231, 'Alejandra', 'Santos', NULL, '0992365368', '', 1, '2019-03-23 04:44:41', '2019-03-23 04:44:41'),
(48, 916635212, 'Allan', 'Haraldsson', 'allan_haraldsson@hotmail.com', '0999544332', NULL, 1, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(49, 916635213, 'Byron', 'Casierra', NULL, '0999544332', NULL, 1, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(50, 916635215, 'Oscar', 'Oetiz', NULL, '0995443321', NULL, 1, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(51, 9166352341, 'Leonardo', 'Burbano', NULL, '0999544332', NULL, 1, '2019-04-03 02:51:09', '2019-04-03 02:51:09'),
(52, 0, 'Ronald', 'Feraud', 'allan_haraldsson@hotmail.com', '0999184627', NULL, 1, '2019-04-16 18:20:02', '2019-04-16 18:20:02'),
(53, 91234528, 'Leonardo', 'burbano', 'allan_haraldsson@hotmail.com', '0996789334', NULL, 1, '2019-04-16 18:20:02', '2019-04-16 18:20:02'),
(54, 8172335211, 'Byron', 'Casierra', 'allan_haraldsson@hotmail.com', '096081160', NULL, 1, '2019-04-16 18:20:02', '2019-04-16 18:20:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `locaciones`
--

CREATE TABLE `locaciones` (
  `id` int(10) UNSIGNED NOT NULL,
  `ubicacion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `locaciones`
--

INSERT INTO `locaciones` (`id`, `ubicacion`, `direccion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Vía a la costa', 'LACOSTA PADEL', 1, '2019-03-21 05:00:00', NULL),
(2, 'Samborondón', 'CLUB BIBLOS', 1, '2019-03-21 05:00:00', NULL),
(3, 'Salinas', '', 1, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_10_13_043900_create_roles_table', 1),
(4, '2018_10_13_044356_create_role_user_table', 1),
(5, '2019_01_02_165656_create_deportes_table', 1),
(6, '2019_01_02_165838_create_servicios_table', 1),
(7, '2019_01_02_165907_create_locaciones_table', 1),
(8, '2019_01_02_165917_create_periodos_table', 1),
(9, '2019_01_02_165927_create_tarifas_table', 1),
(10, '2019_01_02_165936_create_promociones_table', 1),
(11, '2019_01_02_165944_create_representantes_table', 1),
(12, '2019_01_02_170017_create_atletas_table', 1),
(13, '2019_01_02_170026_create_representantes_atletas_table', 1),
(14, '2019_01_02_170044_create_informacion_adicional_table', 1),
(15, '2019_01_02_170052_create_atletas_informacion_adicional_table', 1),
(16, '2019_01_09_205624_create_horarios_table', 1),
(17, '2019_01_14_151323_create_vacacional_table', 1),
(18, '2019_01_14_151711_create_vacacional_horarios_table', 1),
(19, '2019_01_15_191805_create_inscripciones_vacacional_table', 1),
(20, '2019_01_18_201217_create_campamentos_table', 1),
(21, '2019_01_23_153513_create_campamentos_horarios_table', 1),
(22, '2019_01_23_153633_create_campamentos_fechas_table', 1),
(23, '2019_01_23_212936_create_inscripciones_campamento_table', 1),
(24, '2019_01_29_195532_create_reserva_configuracion_table', 1),
(25, '2019_01_31_153917_create_alquiler_table', 1),
(26, '2019_01_31_153934_create_invitados_table', 1),
(27, '2019_01_31_153945_create_alquiler_invitados_table', 1),
(28, '2019_02_06_212438_create_academia_configuracion_table', 1),
(29, '2019_02_21_190715_create_academia_horarios_table', 1),
(30, '2019_02_21_191229_create_academia_tarifas_table', 1),
(31, '2019_02_21_191340_create_academia_horarios_disponibles_table', 1),
(32, '2019_02_21_191501_create_inscripciones_academia_table', 1),
(33, '2019_02_21_191711_create_academia_matricula_table', 1),
(34, '2019_03_01_212720_create_uniformes_table', 1),
(35, '2019_03_01_212737_create_tallas_table', 1),
(36, '2019_03_01_213835_create_colores_table', 1),
(37, '2019_03_01_215802_create_academia_uniformes_table', 1),
(38, '2019_03_01_215921_create_atletas_uniformes_table', 1),
(39, '2019_03_15_174150_create_academia_factura_table', 1),
(40, '2019_03_15_174338_create_academia_detalles_factura_table', 1),
(41, '2019_03_15_174612_create_academia_factura_abonos_table', 1),
(42, '2019_03_20_192714_create_academia_asistencias_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodos`
--

CREATE TABLE `periodos` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes`
--

CREATE TABLE `representantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` bigint(20) NOT NULL,
  `nombres` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telf_contacto` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `red_social` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`id`, `cedula`, `nombres`, `apellidos`, `telf_contacto`, `email`, `red_social`, `created_at`, `updated_at`) VALUES
(1, 912787785, 'Ena Maria', 'Chang Estrella', '0987216053', 'enamariachang@gmail.com', '@ena_chang', '2019-01-26 04:23:04', '2019-01-26 04:23:04'),
(2, 9999999999, 'Stepanie Silvia', 'Saman', '0993517326', 'ssaman@galapagosluxurycharters.com', 'stephi_saman', '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(3, 917425944, 'María Fernanda', 'Briones hidalgo', '0997057933', 'Mbriones78@hotmail.com', 'María Fernanda Briones hidalgo', '2019-01-27 03:27:44', '2019-01-27 03:27:44'),
(4, 916559446, 'Alexandra', 'Ferreccio Damacela', '0997210740', 'Alexafd@hotmail.com', 'Alexaferreccio', '2019-01-29 06:25:22', '2019-01-29 06:25:22'),
(6, 921930608, 'Dalia', 'Salazar', '0994029036', 'damasa84@hotmail.com', 'Instagram', '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(7, 1304354515, 'María Gabriela', 'García serrano', '0991122950', 'Ggarcia@oceanfreightcargo.com', 'Gabygarci', '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(8, 908396310, 'Mariela', 'Molina', '0990631895', 'mari_molinaolvera@hotmail.com', 'Mariela Molina', '2019-02-01 03:37:45', '2019-02-01 03:37:45'),
(9, 914103726, 'Priscilla Alexandra', 'Amoroso Ron', '0998489257', 'andreamontalvan_2@hotmail.com', 'Facebook', '2019-02-01 11:00:05', '2019-02-01 11:00:05'),
(10, 908913585, 'Fanny del  Rocío', 'López Medina', '0999420200', 'flopez@silcex.com.ec', '@fannylopezmedina', '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(11, 920456944, 'Daniela', 'Ampuero', '0984884657', 'dani_ampu@yahoo.com', '@dani_ampu', '2019-02-06 03:22:10', '2019-02-06 03:22:10'),
(12, 913159687, 'Elsy', 'Villacis', '0997656415', 'evillacis@evasa.com.ec', 'NA', '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(13, 908747207, 'Matilde', 'Casal', '0995620748', 'matildecasalo@hotmail.com', 'Matilde Casalo', '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(14, 1706827597, 'Naddya', 'Coba', '0981072515', 'ncoba@hotmail.com', '@naddyacoba', '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(15, 915865091, 'Sonia Cecilia', 'Zambrano Izquierdo', '0987130378', 'sonycecilia1708@gmail.com', 'Sonia Zambrano', '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(16, 802136515, 'Alejandra Maria', 'López Andrade', '0958940675', 'Isicristijero.al@gmail.com', '@isicristijero', '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(17, 909532988, 'Denisse', 'Aguirre', '0991613190', 'Deagpa@gmail.com', 'Denisse Aguirre', '2019-02-07 04:12:41', '2019-02-07 04:12:41'),
(18, 921897096, 'Linda', 'Pinagoarte', '0967566764', 'lindapina@gmail.com', 'Linda Pinagoarte', '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(19, 914343413, 'Monica', 'Montenegro', '099148412', 'monik_montenegroa@hormail.com', '@monicamontenegroa', '2019-02-08 03:21:37', '2019-02-08 03:21:37'),
(20, 914228374, 'Gabriella', 'Almeida', '0995553958', 'gaby_285@hotmail.com', '@gabyalmeida', '2019-02-08 04:38:43', '2019-02-08 04:38:43'),
(21, 917324683, 'Natalia', 'Avengo', '0982843022', 'nataliaavengov@hotmail.com', 'Natalia  Avengo', '2019-02-09 03:50:34', '2019-02-09 03:50:34'),
(22, 922071055, 'Andrea', 'Peralta Chicaiza', '0993031810', 'andreita_p86@hotmail.com', 'Andrea Peralta', '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(23, 915371090, 'JOSE EDUARDO', 'GOMEZ BRIONES', '0992228018', 'pepo070774@msn.com', 'pepogomez', '2019-02-12 07:42:17', '2019-02-12 07:42:17'),
(24, 914154372, 'Solange', 'Bonilla', '0984188724', 'Solangebonillab@icloud.com', '@solangebonilla', '2019-02-13 03:53:43', '2019-02-13 03:53:43'),
(25, 916682271, 'John', 'Villegas', '0995604483', 'john_ville06@hotmail.com', 'John Villegas', '2019-02-14 01:10:30', '2019-02-14 01:10:30'),
(26, 915745905, 'stephanie', 'saman', '0997360287', 'stephanie@gmail.com', 'stephisaman', '2019-02-14 05:44:14', '2019-02-14 05:44:14'),
(27, 926949728, 'Verónica Estefanía', 'Monserrate Maggi', '0995397064', 'veronicamonserrate3@gmail.com', 'monserrateveronica', '2019-03-25 16:23:11', '2019-03-25 16:23:11'),
(28, 916062433, 'Bertha Lorena', 'Monserrate Maggi', '0998168247', 'belomoma2004@hotmail.com', 'belomoma', '2019-03-25 16:28:12', '2019-03-25 16:28:12'),
(29, 924312218, 'Maria emilia', 'Tazan elizalde', '0985142395', 'Maria_emiliatazan@hotmail.es', 'Mariaemiliatazan', '2019-03-27 20:53:11', '2019-03-27 20:53:11'),
(30, 925827404, 'Domenica', 'Oviedo', '0999732881', 'Dome2000@hormail.es', 'Domenica', '2019-03-28 00:27:55', '2019-03-28 00:27:55'),
(31, 912199379, 'Monica maribel', 'Criollo salazar', '0959460831', 'mmcs68@hotmail.com', 'Monica criollo Salazar', '2019-03-28 01:28:35', '2019-03-28 01:28:35'),
(32, 911383719, 'Maria Lorena', 'Palacios Dueñas', '0990801924', 'lorepalaciosd@yahoo.com', 'lorepalaciosduenas', '2019-03-29 00:28:15', '2019-03-29 00:28:15'),
(34, 913312286, 'Jorge', 'Tazan', '0995142395', 'Lexproec@gmail.com', 'Jorge Tazan', '2019-04-01 21:30:24', '2019-04-01 21:30:24'),
(35, 1708176035, 'Pablo', 'Londoño', '0987576611', 'rosannafg@gmail.com', '@rosannaferranteg', '2019-04-03 00:26:23', '2019-04-03 00:26:23'),
(41, 913557252, 'ANDREA', 'ENMANUELE', '987401295', '', 'ANDREA ENMANUELE', '2019-04-11 23:13:14', '2019-04-11 23:13:14'),
(42, 910975523, 'DIANA', 'TORRES', '981799554', '', 'Diana Torres Márquez', '2019-04-12 01:18:24', '2019-04-12 01:18:24'),
(43, 914763958, 'MAFER', 'ORTIZ', '999806134', '', '@m_ferortiz', '2019-04-12 01:24:04', '2019-04-12 01:24:04'),
(44, 1308443637, 'OLGA', 'ZAMBRANO', '997195965', '', '@olgazr', '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(45, 1303957540, 'MARIA ELENA', 'RODRIGUEZ', '995092237', '', 'María Elena Rodríguez', '2019-04-12 01:33:28', '2019-04-12 01:33:28'),
(46, 908901887, 'NICOLAS', 'MOLINA', '983320150', '', 'NICOLAS MOLINA', '2019-04-12 01:37:19', '2019-04-12 01:37:19'),
(47, 915528012, 'CARMEN', 'ZAMBRANO', '959443038', '', 'CARMEN ZAMBRANO', '2019-04-12 01:47:10', '2019-04-12 01:47:10'),
(48, 925534414, 'SANDRA', 'CHACON', '999104001', NULL, '@sandrajchacon', '2019-04-12 01:58:00', '2019-05-30 02:58:42'),
(49, 917289985, 'PAOLA', 'BRIONES', '992109839', '', 'PAOLA BRIONES', '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(50, 960930154, 'ISBETH', 'OJEDA', '983316272', NULL, '@isbetto', '2019-04-12 02:06:29', '2019-05-29 20:07:07'),
(51, 917773228, 'VERONICA', 'VERA', '992764113', NULL, NULL, '2019-04-12 02:28:08', '2019-04-12 02:28:08'),
(52, 909716573, 'VILMA', 'HERNANDEZ', '999740530', NULL, '@bimbijoyas', '2019-04-12 02:32:42', '2019-04-12 02:32:42'),
(53, 917666000, 'YAMEL', 'YSVATEGUI', '999122854', NULL, '@yvelaste', '2019-04-12 02:38:21', '2019-04-12 02:38:21'),
(54, 1206474411, 'CRISTINA ELIZABETH', 'FIGUEROA', '991156223', '@cristiarteaga', NULL, '2019-04-12 02:40:57', '2019-04-12 02:40:57'),
(55, 920006814, 'MARIUXI', 'BARREZUETA', '987233138', NULL, '@mariuxi', '2019-04-12 02:43:21', '2019-04-12 02:43:21'),
(56, 914542584, 'NELLY', 'BRIONES', '994660266', NULL, 'nellybriones29', '2019-04-12 02:45:03', '2019-04-12 02:45:03'),
(57, 907875918, 'ALFREDO', 'BONNAR', '994330700', NULL, NULL, '2019-04-12 02:46:38', '2019-04-12 02:46:38'),
(58, 923192603, 'EVELYN', 'VALDIVIESO', '982919919', NULL, '@everatiana', '2019-04-12 02:48:06', '2019-04-12 02:48:06'),
(59, 923409072, 'Janine', 'zambrano', '0992675979', 'Janine.zambrano@gizlocorp.com', 'Jmzambrank', '2019-04-23 01:27:24', '2019-04-23 01:27:24'),
(60, 908456551, 'Danilo', 'Diaz', '09908456551', 'Nadadordanilo@hotmail.com', '@danilo', '2019-04-28 02:40:05', '2019-04-28 02:40:05'),
(62, 924343213, 'Liliana', 'Estrella Murillo', '', '', NULL, '2019-04-30 10:02:50', '2019-04-30 10:02:50'),
(63, 924116619, 'Monica', 'Mendoza', '', '', 'monicamendoza_nailart', '2019-04-30 20:56:37', '2019-04-30 20:56:37'),
(64, 960677342, 'Vanessa', 'Villarroel', '', '', 'vaneessavr', '2019-04-30 20:56:38', '2019-04-30 20:56:38'),
(65, 703246033, 'Hernan Javier', 'Verduga Ludeña', '', NULL, NULL, '2019-04-30 22:26:42', '2019-05-06 22:28:05'),
(66, 917276214, 'Luz Elena', 'Teran Calle', '0991407188', 'luzteran@gmail.com', 'luz_teran', '2019-04-30 22:26:42', '2019-05-06 20:57:22'),
(67, 1310175656, 'VICTOR', 'TORRES', '0997504653', 'vimatota@hotmail.com', 'https://www.facebook.com/victormanuel.torrestamayo', '2019-05-02 22:45:32', '2019-05-02 22:45:32'),
(68, 1203885858, 'Maria Veronica', 'Borja Suarez', '0988670432', 'Maria_suarez30@hotmail.com', 'Flaquita Borja', '2019-05-03 02:09:38', '2019-05-03 02:09:38'),
(69, 902718279, 'Xavier Antonio', 'Ruiz Thomas', '0999856444', 'xartho@yahoo.es', 'Xavier Ruiz Thomas', '2019-05-04 18:24:00', '2019-05-04 18:24:00'),
(70, 926959305, 'Tabatha', 'Jara Guzman', '', '', 'tabathajara', '2019-05-07 03:03:22', '2019-05-07 03:03:22'),
(71, 915400303, 'GUSTAVO', 'ARRIAGA', '0989160664', 'econoprinterecuadoro@hotmail.com', NULL, '2019-05-15 01:19:17', '2019-05-15 01:19:17'),
(72, 914377312, 'Andrea', 'Bravo', '0980863885', 'abravovillagomez@gmail.com', 'abravo', '2019-05-16 21:46:31', '2019-05-16 21:46:31'),
(73, 991156223, 'Cristina', 'Arteaga', '0991156223', 'aleluna170208@gmail.com', 'Crisarteaga', '2019-05-17 20:22:46', '2019-05-17 20:22:46'),
(74, 914542568, 'PAOLA', 'BRIONES', '0992109839', 'pbriones@ondu.com.ec', 'Pao Briones', '2019-05-17 21:17:36', '2019-05-17 21:17:36'),
(75, 924934649, 'Maria Jóse', 'Estrella Rodriguez', '0993108724', 'estrellarodriguezmariajose@gmail.com', '@majoestrellarod', '2019-05-17 21:23:03', '2019-05-17 21:23:03'),
(76, 920090776, 'Rosendo Florencio', 'Leon Leon', '', '', 'Rosendolion', '2019-05-19 09:59:21', '2019-05-19 09:59:21'),
(77, 920442258, 'Mariela', 'Castillo', '0984731242', 'mapaormaza@gmail.com', NULL, '2019-05-20 22:47:50', '2019-05-20 22:47:50'),
(78, 1753365509, 'ERIKA', 'JARA', '0999437052', 'erikaj74@hotmail.com', 'Erika Jara', '2019-05-21 21:24:18', '2019-05-21 21:24:18'),
(79, 704006188, 'Erika', 'Maldonado', '0994950202', 'erikajohana28@outlook.com', 'ERIKAJOHANA', '2019-05-21 23:08:16', '2019-05-21 23:08:16'),
(80, 1311123648, 'NOLBERTO ISAAC', 'ESTRADA ZAMBRANO', '0959099429', 'nestradazambrano@gmail.com', NULL, '2019-05-28 02:01:52', '2019-05-28 02:01:52'),
(81, 1708455421, 'MANUEL', 'ROMERO', '0992257737', 'manuroverov@hotmail.com', 'Manuromero', '2019-05-28 03:34:00', '2019-05-28 03:34:00'),
(82, 1711498681, 'MELISSA', 'MARTINEZ VELEZ', '0939559655', 'martinez_meli45@hotmail.com', 'melissavmc', '2019-05-29 21:28:10', '2019-05-29 21:28:10'),
(83, 912886330, 'GABRIELA', 'PEREZ DE ESTRADA', '0997385015', 'perezgabriela@gmail.com', 'brielaga', '2019-05-30 00:42:15', '2019-05-30 00:42:15'),
(84, 12346677899, 'Cbgng', 'Fngng', '17347', 'Fbgng', 'Fjfng', '2019-06-01 22:52:50', '2019-06-01 22:52:50'),
(85, 123456789, 'BRENDA', 'ESPINOZA', '12345679', NULL, '@STEPHANIE', '2019-06-02 02:20:09', '2019-06-02 02:20:09'),
(86, 22215555, 'ROMMY', 'FUENTES', '0987556944', 'rommyfuentes@gmail.com', 'rommy', '2019-06-03 07:49:08', '2019-06-03 07:49:08'),
(87, 125222552966, 'TATIANA', 'CRUZ', '022385455', 'tatianacruz@gmail.com', 'tatycruz', '2019-06-03 07:51:25', '2019-06-03 07:51:25'),
(88, 336333516, 'HAYLY', 'CORDOVA', '02223652518', 'cordova@gmail.com', 'gvy', '2019-06-03 07:56:05', '2019-06-03 07:56:05'),
(89, 114144152, 'IRA', 'SEMA', '09445262694', 'irasema@gmail.com', 'isanavarrete', '2019-06-03 08:00:58', '2019-06-03 08:00:58'),
(90, 92666112, 'Andrea', 'Cedeño', '', '', NULL, '2019-06-12 01:38:25', '2019-06-12 01:38:25'),
(91, 952633295, 'Gabriela', 'Chalen', '0995950207', 'gabyvargas17@hotmail.com', 'gabbchalen', '2019-06-12 03:03:58', '2019-06-12 03:03:58'),
(92, 908800261, 'Elizabeth', 'Moreira', '0991090003', 'moreira.eliza@hotmail.com', NULL, '2019-06-12 03:05:07', '2019-06-12 03:05:07'),
(93, 916564198, 'Mónica', 'Loaiza Quintana', '', '', NULL, '2019-06-13 02:16:15', '2019-06-13 02:16:15'),
(94, 914407812, 'Paola', 'Vanegas', '0999607575', 'paovanegass@hotmail.com', 'PaoVanegas', '2019-06-13 23:19:43', '2019-06-13 23:19:43'),
(95, 925168080, 'Kevin', 'Sisalima', '0989619241', 'Kefrsisa@gmail.com', '@kevinsisa', '2019-07-01 21:51:22', '2019-07-01 21:51:22'),
(96, 918068032, 'Christian Joao', 'Garcia Delvicier', '0978923755', 'christiangarciadelvicier@gmail.com', 'chrisgd10', '2019-07-05 00:29:27', '2019-07-05 00:29:27'),
(97, 925498297, 'Doménica Lorena', 'Velasco Ramos', '0986555412', 'domenicavr20@gmail.com', '@dome_velasco63', '2019-07-08 06:14:16', '2019-07-08 06:14:16'),
(98, 925647836, 'LUIS PATRICIO', 'PAREDES FRANCO', '0980906338', 'luisparef@gmail.com', '@luispareds14', '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(99, 802772681, 'JULIO ANDRE', 'RIVADENEIRA SALAZAR', '0969750833', 'andzr9@gmail.com', 'jars_2', '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(100, 19845897, 'Carmen', 'Soto', '0993517326', 'carsoto8691@gmail.com', 'carmensoto86', '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(101, 927815381, 'VICTOR', 'LUDEÑA', '0982339486', NULL, NULL, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(102, 1315911758, 'Kaira Antonella', 'Mendoza Zambrano', '0969040034', 'Kairamz1998@gmail.com', 'Kaira Mendoza', '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(103, 932635527, 'ELÍAS GABRIEL', 'MUÑOZ', '0987195839', NULL, NULL, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(104, 929623650, 'Alfredo', 'Matute', '0967095662', 'alfredomatute2002@hotmail.com', NULL, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(105, 804824077, 'MARITZA', 'VERA', '0981224163', 'aykelina_93@hotmail.com', NULL, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(106, 920013877, 'XAVIER ALFREDO', 'CRUZ SANTOS', '0920013877', 'xcruzsantos@hotmail.com', NULL, '2019-07-09 21:59:58', '2019-07-09 21:59:58'),
(107, 930499645, 'Carlos Andrés', 'Castillo Salazar', '0992311540', 'cacs.castillo@gmail.com', '@carloscastillo_s', '2019-07-10 07:00:34', '2019-07-10 07:00:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `representantes_atletas`
--

CREATE TABLE `representantes_atletas` (
  `id` int(10) UNSIGNED NOT NULL,
  `representantes_id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `representantes_atletas`
--

INSERT INTO `representantes_atletas` (`id`, `representantes_id`, `atletas_id`, `created_at`, `updated_at`) VALUES
(1, 2, 1, '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(2, 2, 2, '2019-01-26 07:50:09', '2019-01-26 07:50:09'),
(3, 3, 3, '2019-01-27 03:27:44', '2019-01-27 03:27:44'),
(4, 1, 4, '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(5, 1, 5, '2019-01-29 01:20:17', '2019-01-29 01:20:17'),
(6, 4, 6, '2019-01-29 06:25:22', '2019-01-29 06:25:22'),
(8, 6, 8, '2019-01-30 04:27:15', '2019-01-30 04:27:15'),
(9, 7, 9, '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(10, 7, 10, '2019-01-30 05:35:07', '2019-01-30 05:35:07'),
(11, 8, 11, '2019-02-01 03:37:45', '2019-02-01 03:37:45'),
(12, 9, 12, '2019-02-02 02:46:36', '2019-02-02 02:46:36'),
(13, 10, 13, '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(14, 10, 14, '2019-02-05 11:36:19', '2019-02-05 11:36:19'),
(15, 11, 15, '2019-02-06 03:22:10', '2019-02-06 03:22:10'),
(16, 12, 16, '2019-02-06 04:31:56', '2019-02-06 04:31:56'),
(17, 13, 17, '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(18, 13, 18, '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(19, 13, 19, '2019-02-06 04:41:06', '2019-02-06 04:41:06'),
(20, 14, 20, '2019-02-06 13:01:21', '2019-02-06 13:01:21'),
(21, 14, 21, '2019-02-06 13:05:53', '2019-02-06 13:05:53'),
(22, 15, 22, '2019-02-06 13:12:14', '2019-02-06 13:12:14'),
(23, 16, 23, '2019-02-07 02:09:56', '2019-02-07 02:09:56'),
(24, 17, 24, '2019-02-07 04:12:41', '2019-02-07 04:12:41'),
(25, 18, 25, '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(26, 18, 26, '2019-02-07 04:32:42', '2019-02-07 04:32:42'),
(27, 19, 27, '2019-02-08 03:21:37', '2019-02-08 03:21:37'),
(28, 20, 28, '2019-02-08 04:38:43', '2019-02-08 04:38:43'),
(29, 21, 29, '2019-02-09 03:50:34', '2019-02-09 03:50:34'),
(30, 21, 30, '2019-02-09 03:51:11', '2019-02-09 03:51:11'),
(31, 22, 31, '2019-02-09 07:38:08', '2019-02-09 07:38:08'),
(32, 18, 32, '2019-02-12 01:27:48', '2019-02-12 01:27:48'),
(33, 18, 33, '2019-02-12 01:27:48', '2019-02-12 01:27:48'),
(34, 23, 34, '2019-02-12 07:42:18', '2019-02-12 07:42:18'),
(35, 24, 35, '2019-02-13 03:53:43', '2019-02-13 03:53:43'),
(36, 25, 36, '2019-02-14 01:10:30', '2019-02-14 01:10:30'),
(37, 26, 37, '2019-02-14 05:44:14', '2019-02-14 05:44:14'),
(38, 27, 38, '2019-03-25 16:23:11', '2019-03-25 16:23:11'),
(39, 28, 39, '2019-03-25 16:28:12', '2019-03-25 16:28:12'),
(40, 29, 40, '2019-03-27 20:53:11', '2019-03-27 20:53:11'),
(41, 30, 41, '2019-03-28 00:27:55', '2019-03-28 00:27:55'),
(42, 31, 42, '2019-03-28 01:28:35', '2019-03-28 01:28:35'),
(43, 32, 43, '2019-03-29 00:28:15', '2019-03-29 00:28:15'),
(46, 34, 46, '2019-04-01 21:30:24', '2019-04-01 21:30:24'),
(47, 35, 47, '2019-04-03 00:26:23', '2019-04-03 00:26:23'),
(55, 41, 55, '2019-04-11 23:13:14', '2019-04-11 23:13:14'),
(56, 42, 56, '2019-04-12 01:18:24', '2019-04-12 01:18:24'),
(57, 43, 57, '2019-04-12 01:24:04', '2019-04-12 01:24:04'),
(58, 44, 58, '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(59, 44, 59, '2019-04-12 01:29:07', '2019-04-12 01:29:07'),
(60, 45, 60, '2019-04-12 01:33:28', '2019-04-12 01:33:28'),
(61, 46, 61, '2019-04-12 01:37:19', '2019-04-12 01:37:19'),
(62, 47, 62, '2019-04-12 01:47:10', '2019-04-12 01:47:10'),
(63, 48, 63, '2019-04-12 01:58:00', '2019-04-12 01:58:00'),
(64, 48, 64, '2019-04-12 02:00:24', '2019-04-12 02:00:24'),
(65, 49, 65, '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(66, 49, 66, '2019-04-12 02:04:03', '2019-04-12 02:04:03'),
(67, 50, 67, '2019-04-12 02:06:29', '2019-04-12 02:06:29'),
(68, 17, 68, '2019-04-12 02:15:34', '2019-04-12 02:15:34'),
(69, 19, 69, '2019-04-12 02:22:37', '2019-04-12 02:22:37'),
(70, 49, 70, '2019-04-12 02:25:33', '2019-04-12 02:25:33'),
(71, 51, 71, '2019-04-12 02:28:08', '2019-04-12 02:28:08'),
(72, 52, 72, '2019-04-12 02:32:42', '2019-04-12 02:32:42'),
(73, 22, 73, '2019-04-12 02:35:02', '2019-04-12 02:35:02'),
(74, 53, 74, '2019-04-12 02:38:21', '2019-04-12 02:38:21'),
(75, 54, 75, '2019-04-12 02:40:57', '2019-04-12 02:40:57'),
(76, 55, 76, '2019-04-12 02:43:21', '2019-04-12 02:43:21'),
(77, 56, 77, '2019-04-12 02:45:03', '2019-04-12 02:45:03'),
(78, 57, 78, '2019-04-12 02:46:38', '2019-04-12 02:46:38'),
(79, 58, 79, '2019-04-12 02:48:06', '2019-04-12 02:48:06'),
(80, 59, 80, '2019-04-23 01:27:24', '2019-04-23 01:27:24'),
(81, 60, 81, '2019-04-28 02:40:05', '2019-04-28 02:40:05'),
(83, 62, 83, '2019-04-30 10:02:50', '2019-04-30 10:02:50'),
(84, 63, 84, '2019-04-30 20:56:38', '2019-04-30 20:56:38'),
(85, 64, 85, '2019-04-30 20:56:38', '2019-04-30 20:56:38'),
(86, 65, 86, '2019-04-30 22:26:42', '2019-04-30 22:26:42'),
(87, 66, 87, '2019-04-30 22:26:42', '2019-04-30 22:26:42'),
(88, 67, 88, '2019-05-02 22:45:32', '2019-05-02 22:45:32'),
(89, 63, 89, '2019-05-02 22:45:35', '2019-05-02 22:45:35'),
(90, 68, 90, '2019-05-03 02:09:39', '2019-05-03 02:09:39'),
(91, 69, 91, '2019-05-04 18:24:01', '2019-05-04 18:24:01'),
(92, 70, 92, '2019-05-07 03:03:22', '2019-05-07 03:03:22'),
(93, 71, 93, '2019-05-15 01:19:17', '2019-05-15 01:19:17'),
(94, 2, 94, '2019-05-15 23:32:44', '2019-05-15 23:32:44'),
(95, 72, 95, '2019-05-16 21:46:32', '2019-05-16 21:46:32'),
(96, 73, 96, '2019-05-17 20:22:46', '2019-05-17 20:22:46'),
(97, 73, 97, '2019-05-17 20:23:01', '2019-05-17 20:23:01'),
(98, 74, 98, '2019-05-17 21:17:36', '2019-05-17 21:17:36'),
(99, 75, 99, '2019-05-17 21:23:03', '2019-05-17 21:23:03'),
(100, 49, 100, '2019-05-17 22:13:52', '2019-05-17 22:13:52'),
(101, 76, 101, '2019-05-19 09:59:21', '2019-05-19 09:59:21'),
(102, 77, 102, '2019-05-20 22:47:50', '2019-05-20 22:47:50'),
(103, 18, 103, '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(104, 18, 104, '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(105, 78, 105, '2019-05-21 21:24:18', '2019-05-21 21:24:18'),
(106, 79, 106, '2019-05-21 23:08:16', '2019-05-21 23:08:16'),
(107, 79, 107, '2019-05-21 23:11:02', '2019-05-21 23:11:02'),
(108, 80, 108, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(109, 80, 109, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(110, 80, 110, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(111, 80, 111, '2019-05-28 03:16:55', '2019-05-28 03:16:55'),
(112, 81, 112, '2019-05-28 03:34:00', '2019-05-28 03:34:00'),
(113, 82, 113, '2019-05-29 21:28:10', '2019-05-29 21:28:10'),
(114, 82, 114, '2019-05-29 21:28:10', '2019-05-29 21:28:10'),
(115, 83, 115, '2019-05-30 00:42:15', '2019-05-30 00:42:15'),
(116, 84, 116, '2019-06-01 22:52:50', '2019-06-01 22:52:50'),
(117, 26, 117, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(118, 26, 118, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(119, 26, 119, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(120, 26, 120, '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(121, 85, 121, '2019-06-02 02:20:09', '2019-06-02 02:20:09'),
(122, 86, 122, '2019-06-03 07:49:08', '2019-06-03 07:49:08'),
(123, 87, 123, '2019-06-03 07:51:25', '2019-06-03 07:51:25'),
(124, 88, 124, '2019-06-03 07:56:05', '2019-06-03 07:56:05'),
(125, 89, 125, '2019-06-03 08:00:58', '2019-06-03 08:00:58'),
(126, 26, 126, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(127, 26, 127, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(128, 26, 128, '2019-06-03 17:41:06', '2019-06-03 17:41:06'),
(129, 90, 129, '2019-06-12 01:38:25', '2019-06-12 01:38:25'),
(130, 91, 130, '2019-06-12 03:03:58', '2019-06-12 03:03:58'),
(131, 91, 131, '2019-06-12 03:03:59', '2019-06-12 03:03:59'),
(132, 92, 132, '2019-06-12 03:05:07', '2019-06-12 03:05:07'),
(133, 93, 133, '2019-06-13 02:16:15', '2019-06-13 02:16:15'),
(134, 94, 134, '2019-06-13 23:19:43', '2019-06-13 23:19:43'),
(135, 95, 135, '2019-07-01 21:51:22', '2019-07-01 21:51:22'),
(136, 95, 136, '2019-07-01 21:51:22', '2019-07-01 21:51:22'),
(137, 85, 137, '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(138, 85, 138, '2019-07-02 01:08:47', '2019-07-02 01:08:47'),
(139, 96, 139, '2019-07-05 00:29:28', '2019-07-05 00:29:28'),
(140, 96, 140, '2019-07-05 00:29:28', '2019-07-05 00:29:28'),
(141, 97, 141, '2019-07-08 06:14:16', '2019-07-08 06:14:16'),
(142, 97, 142, '2019-07-08 06:14:16', '2019-07-08 06:14:16'),
(143, 98, 143, '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(144, 98, 144, '2019-07-08 08:02:04', '2019-07-08 08:02:04'),
(145, 99, 145, '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(146, 99, 146, '2019-07-08 11:15:28', '2019-07-08 11:15:28'),
(147, 100, 147, '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(148, 100, 148, '2019-07-08 20:13:31', '2019-07-08 20:13:31'),
(149, 101, 149, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(150, 101, 150, '2019-07-08 20:57:42', '2019-07-08 20:57:42'),
(151, 102, 151, '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(152, 102, 152, '2019-07-08 21:50:49', '2019-07-08 21:50:49'),
(153, 103, 153, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(154, 103, 154, '2019-07-08 21:55:27', '2019-07-08 21:55:27'),
(155, 104, 155, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(156, 104, 156, '2019-07-08 23:19:21', '2019-07-08 23:19:21'),
(157, 105, 157, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(158, 105, 158, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(159, 105, 159, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(160, 105, 160, '2019-07-09 21:16:24', '2019-07-09 21:16:24'),
(161, 106, 161, '2019-07-09 21:59:58', '2019-07-09 21:59:58'),
(162, 106, 162, '2019-07-09 21:59:58', '2019-07-09 21:59:58'),
(163, 107, 163, '2019-07-10 07:00:34', '2019-07-10 07:00:34'),
(164, 107, 164, '2019-07-10 07:00:34', '2019-07-10 07:00:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva_configuracion`
--

CREATE TABLE `reserva_configuracion` (
  `id` int(10) UNSIGNED NOT NULL,
  `propiedad` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `reserva_configuracion`
--

INSERT INTO `reserva_configuracion` (`id`, `propiedad`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'Tarifa por hora', '5', '2019-03-21 05:00:00', NULL),
(2, 'Cantidad de personas por tarifa', '4', '2019-03-21 05:00:00', NULL),
(3, 'Cantidad de canchas', '3', '2019-03-21 05:00:00', NULL),
(4, 'Hora inicio', '8', '2019-03-21 05:00:00', NULL),
(5, 'Hora fin', '21', '2019-03-21 05:00:00', NULL),
(6, 'Locaciones', '1,2', '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2019-03-21 22:02:28', '2019-03-21 22:02:28'),
(2, 'profesor', 'Profesor', '2019-03-21 22:02:28', '2019-03-21 22:02:28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role_user`
--

CREATE TABLE `role_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-03-21 22:02:28', '2019-03-21 22:02:28'),
(3, 1, 2, '2019-03-24 04:16:50', '2019-03-24 04:16:50'),
(4, 2, 3, '2019-03-28 02:03:30', '2019-03-28 02:03:30'),
(5, 2, 4, '2019-03-28 02:07:00', '2019-03-28 02:07:00'),
(6, 2, 5, '2019-03-28 02:07:55', '2019-03-28 02:07:55'),
(7, 2, 6, '2019-04-04 20:08:14', '2019-04-04 20:08:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`id`, `descripcion`, `activo`, `created_at`, `updated_at`) VALUES
(1, 'Academia', 1, '2019-03-21 05:00:00', NULL),
(2, 'Alquiler de canchas', 1, '2019-03-21 05:00:00', NULL),
(3, 'Vacacional', 1, '2019-03-21 05:00:00', NULL),
(4, 'Campamentos', 1, '2019-03-21 05:00:00', NULL),
(5, 'Torneos', 1, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tallas`
--

CREATE TABLE `tallas` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarifas`
--

CREATE TABLE `tarifas` (
  `id` int(10) UNSIGNED NOT NULL,
  `deportes_id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `servicios_id` int(10) UNSIGNED NOT NULL,
  `periodos_id` int(10) UNSIGNED NOT NULL,
  `frecuencia` int(11) NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uniformes`
--

CREATE TABLE `uniformes` (
  `id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` decimal(9,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Activo','Inactivo') COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `name`, `lastname`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'ssaman', 'Stephanie', 'Saman', 'admin@example.com', 'Activo', NULL, '$2y$10$7ZwKL5ldZkc8IpLFZtVb4O4q4sVDAXKq8dQkaoycSrPJyPbO7EMAq', 'MoO22Amw2jDWEkHWFysLwH0fCaiZGi7rK7rM2FOuQMfvi1eojty1o9KwWUDp', '2019-03-21 22:02:28', '2019-03-21 22:02:28'),
(2, 'bespinoza', 'Brenda', 'Espinoza', 'brendaespinoza@gmail.com', 'Activo', NULL, '$2y$10$tXFbkZFhUUp7Z44ai.TK5uDZmtxDzRojQ6vgWvMUlS9kmnT4yEeXa', 'NlKESf7D3RGDCHWpsBWTHZ10oSua1VGPzOy4f8aBn8sOXLYDatp5JEH787wT', '2019-03-21 23:54:52', '2019-03-28 02:01:17'),
(3, 'nmartinez', 'Norelis', 'Martinez', 'nore.martinez2018@gmail.com', 'Activo', NULL, '$2y$10$ZD2YveTo41ZHYl87cQ3yCuh9V259ZQ75XGQDpSVfH7SC7NGNn3T5C', 'BogSklXbpb8x1aeFq4wU2RtjZyY0IilCYlMgdLt3oLs9vNeQG5uYFScyzMyi', '2019-03-28 02:03:30', '2019-03-28 02:03:30'),
(4, 'bcasierra', 'Byron', 'Casierra', 'bcasierra@ecomundo.edu.ec', 'Activo', NULL, '$2y$10$4u2D6tcHUIWH4Wk4bTR8F.D7qu1RpG5NoDuh5Yj/F7JUaXzS7UC7C', 'iUxTml6mM9wnOE7PKyA95uFJWbwBjjWA9bNIPYmOWhG0VP60T877xloXXxRY', '2019-03-28 02:07:00', '2019-03-28 02:07:00'),
(5, 'acastillo', 'Alex', 'Castillo', 'lupito_8@hotmail.com', 'Activo', NULL, '$2y$10$9942FtC5s3hKkCa.CoPNTe9vKO0Pm6qJxjAjrvF8GPUFhxGQ1gwMi', 'n7MX7xDlMv3lWNf3986QbmzsxenoopdPuQ1Hx9syGPWyIyTX8wxhncduXnhy', '2019-03-28 02:07:54', '2019-03-28 02:07:54'),
(6, 'jdiaz', 'José Danilo', 'Díaz Ordóñez', 'nadadordanilo@hotmail.com', 'Activo', NULL, '$2y$10$O1jSi42Sv5uOyFSuS11Pi.z5EbtbfHk8pD6PmDK7ob0Jod4KQWYD.', NULL, '2019-04-04 20:08:14', '2019-04-04 20:08:14');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacacional`
--

CREATE TABLE `vacacional` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `edad_inicio` int(11) NOT NULL,
  `edad_fin` int(11) NOT NULL,
  `porcentaje_individual` int(11) NOT NULL,
  `porcentaje_grupal` int(11) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vacacional`
--

INSERT INTO `vacacional` (`id`, `locaciones_id`, `fecha_inicio`, `fecha_fin`, `fecha_limite`, `edad_inicio`, `edad_fin`, `porcentaje_individual`, `porcentaje_grupal`, `activo`, `created_at`, `updated_at`) VALUES
(1, 2, '2019-02-11', '2019-03-13', '2019-01-28', 6, 14, 10, 15, 0, '2019-03-21 05:00:00', NULL),
(2, 1, '2019-02-11', '2019-03-13', '2019-01-28', 6, 14, 10, 15, 0, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vacacional_horarios`
--

CREATE TABLE `vacacional_horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `vacacional_id` int(10) UNSIGNED NOT NULL,
  `hora_inicio` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hora_fin` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarifa_ins` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `vacacional_horarios`
--

INSERT INTO `vacacional_horarios` (`id`, `vacacional_id`, `hora_inicio`, `hora_fin`, `tarifa_ins`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, '08:30', '10:30', '90.00', 0, '2019-03-21 05:00:00', NULL),
(2, 1, '10:30', '12:30', '90.00', 0, '2019-03-21 05:00:00', NULL),
(3, 1, '08:30', '12:30', '150.00', 0, '2019-03-21 05:00:00', NULL),
(4, 2, '08:30', '10:30', '90.00', 0, '2019-03-21 05:00:00', NULL),
(5, 2, '10:30', '12:30', '90.00', 0, '2019-03-21 05:00:00', NULL),
(6, 2, '08:30', '12:30', '150.00', 0, '2019-03-21 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workshop`
--

CREATE TABLE `workshop` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `edad_inicio` int(11) NOT NULL,
  `edad_fin` int(11) DEFAULT NULL,
  `h_inicio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `h_fin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porcentaje_individual` int(11) DEFAULT NULL,
  `porcentaje_grupal` int(11) DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `imagen` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `workshop`
--

INSERT INTO `workshop` (`id`, `locaciones_id`, `descripcion`, `edad_inicio`, `edad_fin`, `h_inicio`, `h_fin`, `porcentaje_individual`, `porcentaje_grupal`, `fecha_limite`, `activo`, `imagen`, `created_at`, `updated_at`) VALUES
(1, 2, 'Workshop internacional de beach volley', 8, 15, '15:30', '19:30', 5, NULL, '2019-05-27', 1, NULL, '2019-04-25 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workshop_factura`
--

CREATE TABLE `workshop_factura` (
  `id` int(10) UNSIGNED NOT NULL,
  `workshop_id` int(10) UNSIGNED NOT NULL,
  `representantes_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `subtotal` decimal(9,2) NOT NULL,
  `descuento` decimal(9,2) NOT NULL,
  `total` decimal(9,2) NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_pago` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `workshop_factura`
--

INSERT INTO `workshop_factura` (`id`, `workshop_id`, `representantes_id`, `fecha`, `subtotal`, `descuento`, `total`, `status`, `tipo_pago`, `created_at`, `updated_at`) VALUES
(1, 1, 2, '2019-04-26', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-04-27 02:21:34', '2019-04-27 02:21:34'),
(2, 1, 67, '2019-05-02', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-02 22:45:32', '2019-05-02 22:45:32'),
(3, 1, 63, '2019-05-02', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-02 22:45:35', '2019-05-02 22:45:35'),
(4, 1, 71, '2019-05-14', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-15 01:19:17', '2019-05-15 01:19:17'),
(5, 1, 72, '2019-05-16', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-16 21:46:32', '2019-05-16 21:46:32'),
(6, 1, 73, '2019-05-17', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-17 20:22:46', '2019-05-17 20:22:46'),
(7, 1, 74, '2019-05-17', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-17 21:17:36', '2019-05-17 21:17:36'),
(8, 1, 49, '2019-05-17', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-17 22:13:52', '2019-05-17 22:13:52'),
(9, 1, 18, '2019-05-20', '90.00', '4.50', '85.50', 'Pendiente', 'Efectivo', '2019-05-20 23:24:00', '2019-05-20 23:24:00'),
(10, 1, 78, '2019-05-21', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-21 21:24:18', '2019-05-21 21:24:18'),
(11, 1, 7, '2019-05-23', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-23 21:10:54', '2019-05-23 21:10:54'),
(12, 1, 81, '2019-05-27', '45.00', '2.25', '42.75', 'Pendiente', 'Efectivo', '2019-05-28 03:34:00', '2019-05-28 03:34:00'),
(13, 1, 52, '2019-05-28', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-05-28 22:39:14', '2019-05-28 22:39:14'),
(14, 1, 56, '2019-05-29', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-05-29 19:56:45', '2019-05-29 19:56:45'),
(15, 1, 58, '2019-05-29', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-05-29 20:05:45', '2019-05-29 20:05:45'),
(16, 1, 50, '2019-05-29', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-05-29 20:07:07', '2019-05-29 20:07:07'),
(17, 1, 82, '2019-05-29', '90.00', '0.00', '90.00', 'Pendiente', 'Efectivo', '2019-05-29 21:28:10', '2019-05-29 21:28:10'),
(18, 1, 83, '2019-05-29', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-05-30 00:42:15', '2019-05-30 00:42:15'),
(19, 1, 48, '2019-05-29', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-05-30 02:58:42', '2019-05-30 02:58:42'),
(20, 1, 26, '2019-06-01', '180.00', '0.00', '180.00', 'Pendiente', 'Efectivo', '2019-06-02 02:06:09', '2019-06-02 02:06:09'),
(21, 1, 85, '2019-06-01', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-06-02 02:20:09', '2019-06-02 02:20:09'),
(22, 1, 86, '2019-06-03', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-06-03 07:49:08', '2019-06-03 07:49:08'),
(23, 1, 87, '2019-06-03', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-06-03 07:51:25', '2019-06-03 07:51:25'),
(24, 1, 88, '2019-06-03', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-06-03 07:56:05', '2019-06-03 07:56:05'),
(25, 1, 89, '2019-06-03', '45.00', '0.00', '45.00', 'Pendiente', 'Efectivo', '2019-06-03 08:00:58', '2019-06-03 08:00:58'),
(26, 1, 26, '2019-06-03', '135.00', '0.00', '135.00', 'Pendiente', 'Efectivo', '2019-06-03 17:41:06', '2019-06-03 17:41:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workshop_fechas`
--

CREATE TABLE `workshop_fechas` (
  `id` int(10) UNSIGNED NOT NULL,
  `workshop_horarios_id` int(10) UNSIGNED NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `workshop_fechas`
--

INSERT INTO `workshop_fechas` (`id`, `workshop_horarios_id`, `fecha_inicio`, `fecha_fin`, `created_at`, `updated_at`) VALUES
(1, 1, '2019-06-03', '0000-00-00', '2019-04-25 05:00:00', NULL),
(2, 1, '2019-06-04', '0000-00-00', '2019-04-25 05:00:00', NULL),
(3, 1, '2019-06-05', '0000-00-00', '2019-04-25 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workshop_horarios`
--

CREATE TABLE `workshop_horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `workshop_id` int(10) UNSIGNED NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tarifa_ins` decimal(9,2) NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `workshop_horarios`
--

INSERT INTO `workshop_horarios` (`id`, `workshop_id`, `descripcion`, `tarifa_ins`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tarifa única', '45.00', 1, '2019-04-25 05:00:00', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academia_asistencias`
--
ALTER TABLE `academia_asistencias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_asistencia_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_academia_asistencia_users1_idx` (`users_id`),
  ADD KEY `fk_academia_asistencia_locaciones1_idx` (`locaciones_id`),
  ADD KEY `fk_academia_asistencia_academia_horarios1_idx` (`academia_horarios_id`);

--
-- Indices de la tabla `academia_configuracion`
--
ALTER TABLE `academia_configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `academia_detalles_factura`
--
ALTER TABLE `academia_detalles_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_detalles_factura_academia_factura1_idx` (`academia_factura_id`),
  ADD KEY `fk_academia_detalles_factura_inscripciones_academia1_idx` (`inscripciones_academia_id`);

--
-- Indices de la tabla `academia_factura`
--
ALTER TABLE `academia_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_factura_representantes1_idx` (`representantes_id`);

--
-- Indices de la tabla `academia_factura_abonos`
--
ALTER TABLE `academia_factura_abonos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_factura_abonos_academia_factura1_idx` (`academia_factura_id`),
  ADD KEY `fk_academia_factura_abonos_users1_idx` (`users_id`);

--
-- Indices de la tabla `academia_horarios`
--
ALTER TABLE `academia_horarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `academia_horarios_disponibles`
--
ALTER TABLE `academia_horarios_disponibles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table1_academia_horarios1_idx` (`academia_horarios_id`),
  ADD KEY `fk_table1_locaciones1_idx` (`locaciones_id`),
  ADD KEY `fk_table1_academia_tarifas1_idx` (`academia_tarifas_id`);

--
-- Indices de la tabla `academia_matricula`
--
ALTER TABLE `academia_matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_matricula_academia_horarios1_idx` (`academia_horarios_id`),
  ADD KEY `fk_academia_matricula_inscripciones_academia1_idx` (`inscripciones_academia_id`);

--
-- Indices de la tabla `academia_tarifas`
--
ALTER TABLE `academia_tarifas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `academia_uniformes`
--
ALTER TABLE `academia_uniformes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table1_uniformes1_idx` (`uniformes_id`),
  ADD KEY `fk_table1_tallas1_idx` (`tallas_id`),
  ADD KEY `fk_table1_colores1_idx` (`colores_id`);

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alquiler_locaciones1_idx` (`locaciones_id`);

--
-- Indices de la tabla `alquiler_invitados`
--
ALTER TABLE `alquiler_invitados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_alquiler_has_invitados_invitados1_idx` (`invitados_id`),
  ADD KEY `fk_alquiler_has_invitados_alquiler1_idx` (`alquiler_id`);

--
-- Indices de la tabla `atletas`
--
ALTER TABLE `atletas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `atletas_cedula_unique` (`cedula`);

--
-- Indices de la tabla `atletas_informacion_adicional`
--
ALTER TABLE `atletas_informacion_adicional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_atletas_has_informacion_adicional_informacion_adicional1_idx` (`informacion_adicional_id`),
  ADD KEY `fk_atletas_has_informacion_adicional_atletas1_idx` (`atletas_id`);

--
-- Indices de la tabla `atletas_uniformes`
--
ALTER TABLE `atletas_uniformes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_table1_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_atletas_uniformes_uniformes1_idx` (`uniformes_id`),
  ADD KEY `fk_atletas_uniformes_tallas1_idx` (`tallas_id`);

--
-- Indices de la tabla `campamentos`
--
ALTER TABLE `campamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_locaciones_campamentos_idx` (`locaciones_id`);

--
-- Indices de la tabla `campamentos_fechas`
--
ALTER TABLE `campamentos_fechas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campamentos_fechas_campamentos_horarios1_idx` (`campamentos_horarios_id`);

--
-- Indices de la tabla `campamentos_horarios`
--
ALTER TABLE `campamentos_horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campamentos_horarios_campamentos1_idx` (`campamentos_id`);

--
-- Indices de la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_locaciones_campeonato_idx` (`locaciones_id`);

--
-- Indices de la tabla `campeonato_categorias`
--
ALTER TABLE `campeonato_categorias`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campeonato_fechas_campeonato_horarios1_idx` (`campeonato_horarios_id`);

--
-- Indices de la tabla `campeonato_duplas`
--
ALTER TABLE `campeonato_duplas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campeonato_duplas_campeonato_categorias1_idx` (`campeonato_categorias_id`),
  ADD KEY `fk_campeonato_duplas_representantes1_idx` (`representantes_id`);

--
-- Indices de la tabla `campeonato_factura`
--
ALTER TABLE `campeonato_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campeonato_factura_representantes1_idx` (`representantes_id`),
  ADD KEY `fk_campeonato_factura_campeonatos1_idx` (`campeonatos_id`);

--
-- Indices de la tabla `campeonato_horarios`
--
ALTER TABLE `campeonato_horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campeonatos_horarios_campeonatos1_idx` (`campeonato_id`);

--
-- Indices de la tabla `colores`
--
ALTER TABLE `colores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_horario_locaciones1_idx` (`locaciones_id`);

--
-- Indices de la tabla `informacion_adicional`
--
ALTER TABLE `informacion_adicional`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inscripciones_academia`
--
ALTER TABLE `inscripciones_academia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_horarios_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_academia_horarios_has_locaciones1_idx` (`locaciones_id`);

--
-- Indices de la tabla `inscripciones_campamento`
--
ALTER TABLE `inscripciones_campamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campamentos_horarios_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_campamentos_horarios_has_atletas_campamentos_horarios1_idx` (`campamentos_horarios_id`);

--
-- Indices de la tabla `inscripciones_campeonato`
--
ALTER TABLE `inscripciones_campeonato`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campeonato_horarios_has_atletas_campeonato_horarios1_idx` (`campeonato_horarios_id`),
  ADD KEY `inscripciones_campeonato_campeonato_duplas_id_foreign_idx` (`campeonato_duplas_id`);

--
-- Indices de la tabla `inscripciones_vacacional`
--
ALTER TABLE `inscripciones_vacacional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vacacional_horarios_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_vacacional_horarios_has_atletas_vacacional_horarios1_idx` (`vacacional_horarios_id`);

--
-- Indices de la tabla `inscripciones_workshop`
--
ALTER TABLE `inscripciones_workshop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_workshop_horarios_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_workshop_horarios_has_atletas_workshop_horarios1_idx` (`workshop_horarios_id`);

--
-- Indices de la tabla `invitados`
--
ALTER TABLE `invitados`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `locaciones`
--
ALTER TABLE `locaciones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `periodos`
--
ALTER TABLE `periodos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `representantes`
--
ALTER TABLE `representantes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `representantes_cedula_unique` (`cedula`);

--
-- Indices de la tabla `representantes_atletas`
--
ALTER TABLE `representantes_atletas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_representantes_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_representantes_has_atletas_representantes1_idx` (`representantes_id`);

--
-- Indices de la tabla `reserva_configuracion`
--
ALTER TABLE `reserva_configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `role_user_user_id_unique` (`user_id`),
  ADD KEY `fk_role_user_roles_idx` (`role_id`),
  ADD KEY `fk_role_user_users1_idx` (`user_id`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tallas`
--
ALTER TABLE `tallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tarifas_servicios1_idx` (`servicios_id`),
  ADD KEY `fk_tarifas_locaciones1_idx` (`locaciones_id`),
  ADD KEY `fk_tarifas_periodos1_idx` (`periodos_id`),
  ADD KEY `fk_tarifas_deportes1_idx` (`deportes_id`);

--
-- Indices de la tabla `uniformes`
--
ALTER TABLE `uniformes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `vacacional`
--
ALTER TABLE `vacacional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_locaciones_vacacional_idx` (`locaciones_id`);

--
-- Indices de la tabla `vacacional_horarios`
--
ALTER TABLE `vacacional_horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vacacional_horarios_idx` (`vacacional_id`);

--
-- Indices de la tabla `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_locaciones_workshop_idx` (`locaciones_id`);

--
-- Indices de la tabla `workshop_factura`
--
ALTER TABLE `workshop_factura`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_workshop_factura_representantes1_idx` (`representantes_id`),
  ADD KEY `fk_workshop1_idx` (`workshop_id`);

--
-- Indices de la tabla `workshop_fechas`
--
ALTER TABLE `workshop_fechas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_workshop_fechas_workshop_horarios1_idx` (`workshop_horarios_id`);

--
-- Indices de la tabla `workshop_horarios`
--
ALTER TABLE `workshop_horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_workshop_horarios_workshop1_idx` (`workshop_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academia_asistencias`
--
ALTER TABLE `academia_asistencias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `academia_configuracion`
--
ALTER TABLE `academia_configuracion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `academia_detalles_factura`
--
ALTER TABLE `academia_detalles_factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `academia_factura`
--
ALTER TABLE `academia_factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `academia_factura_abonos`
--
ALTER TABLE `academia_factura_abonos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `academia_horarios`
--
ALTER TABLE `academia_horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `academia_horarios_disponibles`
--
ALTER TABLE `academia_horarios_disponibles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `academia_matricula`
--
ALTER TABLE `academia_matricula`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `academia_tarifas`
--
ALTER TABLE `academia_tarifas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `academia_uniformes`
--
ALTER TABLE `academia_uniformes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `alquiler_invitados`
--
ALTER TABLE `alquiler_invitados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `atletas`
--
ALTER TABLE `atletas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `atletas_informacion_adicional`
--
ALTER TABLE `atletas_informacion_adicional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `atletas_uniformes`
--
ALTER TABLE `atletas_uniformes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `campamentos`
--
ALTER TABLE `campamentos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `campamentos_fechas`
--
ALTER TABLE `campamentos_fechas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `campamentos_horarios`
--
ALTER TABLE `campamentos_horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `campeonato_categorias`
--
ALTER TABLE `campeonato_categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `campeonato_duplas`
--
ALTER TABLE `campeonato_duplas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `campeonato_factura`
--
ALTER TABLE `campeonato_factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `campeonato_horarios`
--
ALTER TABLE `campeonato_horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `colores`
--
ALTER TABLE `colores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `informacion_adicional`
--
ALTER TABLE `informacion_adicional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `inscripciones_academia`
--
ALTER TABLE `inscripciones_academia`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT de la tabla `inscripciones_campamento`
--
ALTER TABLE `inscripciones_campamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones_campeonato`
--
ALTER TABLE `inscripciones_campeonato`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `inscripciones_vacacional`
--
ALTER TABLE `inscripciones_vacacional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `inscripciones_workshop`
--
ALTER TABLE `inscripciones_workshop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `invitados`
--
ALTER TABLE `invitados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `locaciones`
--
ALTER TABLE `locaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT de la tabla `periodos`
--
ALTER TABLE `periodos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `representantes`
--
ALTER TABLE `representantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT de la tabla `representantes_atletas`
--
ALTER TABLE `representantes_atletas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=165;

--
-- AUTO_INCREMENT de la tabla `reserva_configuracion`
--
ALTER TABLE `reserva_configuracion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tallas`
--
ALTER TABLE `tallas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uniformes`
--
ALTER TABLE `uniformes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `vacacional`
--
ALTER TABLE `vacacional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `vacacional_horarios`
--
ALTER TABLE `vacacional_horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `workshop`
--
ALTER TABLE `workshop`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `workshop_factura`
--
ALTER TABLE `workshop_factura`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `workshop_fechas`
--
ALTER TABLE `workshop_fechas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `workshop_horarios`
--
ALTER TABLE `workshop_horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `academia_asistencias`
--
ALTER TABLE `academia_asistencias`
  ADD CONSTRAINT `academia_asistencias_academia_horarios_id_foreign` FOREIGN KEY (`academia_horarios_id`) REFERENCES `academia_horarios` (`id`),
  ADD CONSTRAINT `academia_asistencias_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `academia_asistencias_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`),
  ADD CONSTRAINT `academia_asistencias_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `academia_detalles_factura`
--
ALTER TABLE `academia_detalles_factura`
  ADD CONSTRAINT `academia_detalles_factura_academia_factura_id_foreign` FOREIGN KEY (`academia_factura_id`) REFERENCES `academia_factura` (`id`),
  ADD CONSTRAINT `academia_detalles_factura_inscripciones_academia_id_foreign` FOREIGN KEY (`inscripciones_academia_id`) REFERENCES `inscripciones_academia` (`id`);

--
-- Filtros para la tabla `academia_factura`
--
ALTER TABLE `academia_factura`
  ADD CONSTRAINT `academia_factura_representantes_id_foreign` FOREIGN KEY (`representantes_id`) REFERENCES `representantes` (`id`);

--
-- Filtros para la tabla `academia_factura_abonos`
--
ALTER TABLE `academia_factura_abonos`
  ADD CONSTRAINT `academia_factura_abonos_academia_factura_id_foreign` FOREIGN KEY (`academia_factura_id`) REFERENCES `academia_factura` (`id`),
  ADD CONSTRAINT `academia_factura_abonos_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `academia_horarios_disponibles`
--
ALTER TABLE `academia_horarios_disponibles`
  ADD CONSTRAINT `academia_horarios_disponibles_academia_horarios_id_foreign` FOREIGN KEY (`academia_horarios_id`) REFERENCES `academia_horarios` (`id`),
  ADD CONSTRAINT `academia_horarios_disponibles_academia_tarifas_id_foreign` FOREIGN KEY (`academia_tarifas_id`) REFERENCES `academia_tarifas` (`id`),
  ADD CONSTRAINT `academia_horarios_disponibles_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `academia_matricula`
--
ALTER TABLE `academia_matricula`
  ADD CONSTRAINT `academia_matricula_academia_horarios_id_foreign` FOREIGN KEY (`academia_horarios_id`) REFERENCES `academia_horarios` (`id`),
  ADD CONSTRAINT `academia_matricula_inscripciones_academia_id_foreign` FOREIGN KEY (`inscripciones_academia_id`) REFERENCES `inscripciones_academia` (`id`);

--
-- Filtros para la tabla `academia_uniformes`
--
ALTER TABLE `academia_uniformes`
  ADD CONSTRAINT `academia_uniformes_colores_id_foreign` FOREIGN KEY (`colores_id`) REFERENCES `colores` (`id`),
  ADD CONSTRAINT `academia_uniformes_tallas_id_foreign` FOREIGN KEY (`tallas_id`) REFERENCES `tallas` (`id`),
  ADD CONSTRAINT `academia_uniformes_uniformes_id_foreign` FOREIGN KEY (`uniformes_id`) REFERENCES `uniformes` (`id`);

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `alquiler_invitados`
--
ALTER TABLE `alquiler_invitados`
  ADD CONSTRAINT `alquiler_invitados_alquiler_id_foreign` FOREIGN KEY (`alquiler_id`) REFERENCES `alquiler` (`id`),
  ADD CONSTRAINT `alquiler_invitados_invitados_id_foreign` FOREIGN KEY (`invitados_id`) REFERENCES `invitados` (`id`);

--
-- Filtros para la tabla `atletas_informacion_adicional`
--
ALTER TABLE `atletas_informacion_adicional`
  ADD CONSTRAINT `atletas_informacion_adicional_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `atletas_informacion_adicional_informacion_adicional_id_foreign` FOREIGN KEY (`informacion_adicional_id`) REFERENCES `informacion_adicional` (`id`);

--
-- Filtros para la tabla `atletas_uniformes`
--
ALTER TABLE `atletas_uniformes`
  ADD CONSTRAINT `atletas_uniformes_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `atletas_uniformes_tallas_id_foreign` FOREIGN KEY (`tallas_id`) REFERENCES `tallas` (`id`),
  ADD CONSTRAINT `atletas_uniformes_uniformes_id_foreign` FOREIGN KEY (`uniformes_id`) REFERENCES `uniformes` (`id`);

--
-- Filtros para la tabla `campamentos`
--
ALTER TABLE `campamentos`
  ADD CONSTRAINT `campamentos_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `campamentos_fechas`
--
ALTER TABLE `campamentos_fechas`
  ADD CONSTRAINT `campamentos_fechas_campamentos_horarios_id_foreign` FOREIGN KEY (`campamentos_horarios_id`) REFERENCES `campamentos_horarios` (`id`);

--
-- Filtros para la tabla `campamentos_horarios`
--
ALTER TABLE `campamentos_horarios`
  ADD CONSTRAINT `campamentos_horarios_campamentos_id_foreign` FOREIGN KEY (`campamentos_id`) REFERENCES `campamentos` (`id`);

--
-- Filtros para la tabla `campeonatos`
--
ALTER TABLE `campeonatos`
  ADD CONSTRAINT `campeonatos_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `campeonato_categorias`
--
ALTER TABLE `campeonato_categorias`
  ADD CONSTRAINT `campeonato_categorias_campeonato_horarios_id_foreign` FOREIGN KEY (`campeonato_horarios_id`) REFERENCES `campeonato_horarios` (`id`);

--
-- Filtros para la tabla `campeonato_duplas`
--
ALTER TABLE `campeonato_duplas`
  ADD CONSTRAINT `campeonato_duplas_campeonato_categorias_id_foreign` FOREIGN KEY (`campeonato_categorias_id`) REFERENCES `campeonato_categorias` (`id`),
  ADD CONSTRAINT `campeonato_duplas_representantes_id_foreign` FOREIGN KEY (`representantes_id`) REFERENCES `representantes` (`id`);

--
-- Filtros para la tabla `campeonato_factura`
--
ALTER TABLE `campeonato_factura`
  ADD CONSTRAINT `campeonato_factura_campeonato_duplas_id_foreign` FOREIGN KEY (`campeonatos_id`) REFERENCES `campeonato_duplas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `campeonato_factura_campeonatos_id_foreign` FOREIGN KEY (`campeonatos_id`) REFERENCES `campeonatos` (`id`),
  ADD CONSTRAINT `campeonato_factura_representantes_id_foreign` FOREIGN KEY (`representantes_id`) REFERENCES `representantes` (`id`);

--
-- Filtros para la tabla `campeonato_horarios`
--
ALTER TABLE `campeonato_horarios`
  ADD CONSTRAINT `campeonato_horarios_campeonato_id_foreign` FOREIGN KEY (`campeonato_id`) REFERENCES `campeonatos` (`id`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `inscripciones_academia`
--
ALTER TABLE `inscripciones_academia`
  ADD CONSTRAINT `inscripciones_academia_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_academia_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `inscripciones_campamento`
--
ALTER TABLE `inscripciones_campamento`
  ADD CONSTRAINT `inscripciones_campamento_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_campamento_campamentos_horarios_id_foreign` FOREIGN KEY (`campamentos_horarios_id`) REFERENCES `campamentos_horarios` (`id`);

--
-- Filtros para la tabla `inscripciones_campeonato`
--
ALTER TABLE `inscripciones_campeonato`
  ADD CONSTRAINT `inscripciones_campeonato_campeonato_duplas_id_foreign` FOREIGN KEY (`campeonato_duplas_id`) REFERENCES `campeonato_duplas` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `inscripciones_campeonato_campeonato_horarios_id_foreign` FOREIGN KEY (`campeonato_horarios_id`) REFERENCES `campeonato_horarios` (`id`);

--
-- Filtros para la tabla `inscripciones_vacacional`
--
ALTER TABLE `inscripciones_vacacional`
  ADD CONSTRAINT `inscripciones_vacacional_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_vacacional_vacacional_horarios_id_foreign` FOREIGN KEY (`vacacional_horarios_id`) REFERENCES `vacacional_horarios` (`id`);

--
-- Filtros para la tabla `inscripciones_workshop`
--
ALTER TABLE `inscripciones_workshop`
  ADD CONSTRAINT `inscripciones_workshop_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_workshop_workshop_horarios_id_foreign` FOREIGN KEY (`workshop_horarios_id`) REFERENCES `workshop_horarios` (`id`);

--
-- Filtros para la tabla `representantes_atletas`
--
ALTER TABLE `representantes_atletas`
  ADD CONSTRAINT `representantes_atletas_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `representantes_atletas_representantes_id_foreign` FOREIGN KEY (`representantes_id`) REFERENCES `representantes` (`id`);

--
-- Filtros para la tabla `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD CONSTRAINT `tarifas_deportes_id_foreign` FOREIGN KEY (`deportes_id`) REFERENCES `deportes` (`id`),
  ADD CONSTRAINT `tarifas_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`),
  ADD CONSTRAINT `tarifas_periodos_id_foreign` FOREIGN KEY (`periodos_id`) REFERENCES `periodos` (`id`),
  ADD CONSTRAINT `tarifas_servicios_id_foreign` FOREIGN KEY (`servicios_id`) REFERENCES `servicios` (`id`);

--
-- Filtros para la tabla `vacacional`
--
ALTER TABLE `vacacional`
  ADD CONSTRAINT `vacacional_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `vacacional_horarios`
--
ALTER TABLE `vacacional_horarios`
  ADD CONSTRAINT `vacacional_horarios_vacacional_id_foreign` FOREIGN KEY (`vacacional_id`) REFERENCES `vacacional` (`id`);

--
-- Filtros para la tabla `workshop`
--
ALTER TABLE `workshop`
  ADD CONSTRAINT `workshop_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `workshop_factura`
--
ALTER TABLE `workshop_factura`
  ADD CONSTRAINT `workshop_factura_representantes_id_foreign` FOREIGN KEY (`representantes_id`) REFERENCES `representantes` (`id`),
  ADD CONSTRAINT `workshop_factura_workshop_id_foreign` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`id`);

--
-- Filtros para la tabla `workshop_fechas`
--
ALTER TABLE `workshop_fechas`
  ADD CONSTRAINT `workshop_fechas_workshop_horarios_id_foreign` FOREIGN KEY (`workshop_horarios_id`) REFERENCES `workshop_horarios` (`id`);

--
-- Filtros para la tabla `workshop_horarios`
--
ALTER TABLE `workshop_horarios`
  ADD CONSTRAINT `workshop_horarios_workshop_id_foreign` FOREIGN KEY (`workshop_id`) REFERENCES `workshop` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
