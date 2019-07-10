-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-07-2019 a las 16:50:06
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
-- Base de datos: `andressu_legoapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_asistencia_pruebas`
--

CREATE TABLE `academia_asistencia_pruebas` (
  `id` int(10) UNSIGNED NOT NULL,
  `users_id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_configuracion`
--

CREATE TABLE `academia_configuracion` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `configuracion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_configuracion`
--

INSERT INTO `academia_configuracion` (`id`, `tipo`, `configuracion`, `valor`, `created_at`, `updated_at`) VALUES
(1, 'Prueba', 'Locaciones', '1,2', '2019-02-13 05:00:00', NULL),
(2, 'Academia', 'Locaciones', '1,2', '2019-02-13 05:00:00', NULL),
(3, 'Prueba', 'Duración de la clase', '90', '2019-02-13 05:00:00', NULL),
(4, 'Academia', 'Duración de la clase', '90', '2019-02-13 05:00:00', NULL),
(5, 'Prueba', 'Dias de clases', '1,2,3,4', '2019-02-13 05:00:00', NULL),
(6, 'Academia', 'Dias de clases', '1,2,3,4', '2019-02-13 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_horarios`
--

CREATE TABLE `academia_horarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `locaciones_id` int(10) UNSIGNED NOT NULL,
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

INSERT INTO `academia_horarios` (`id`, `locaciones_id`, `edad_inicio`, `edad_fin`, `hora_inicio`, `hora_fin`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 14, '17:00', '18:30', 1, '2019-02-13 05:00:00', NULL),
(2, 1, 15, NULL, '18:30', '20:00', 1, '2019-02-13 05:00:00', NULL),
(3, 2, 6, 14, '17:00', '18:30', 1, '2019-02-13 05:00:00', NULL),
(4, 2, 15, NULL, '18:30', '20:00', 1, '2019-02-13 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_horarios_tarifas`
--

CREATE TABLE `academia_horarios_tarifas` (
  `id` int(10) UNSIGNED NOT NULL,
  `academia_horarios_id` int(10) UNSIGNED NOT NULL,
  `academia_tarifas_id` int(10) UNSIGNED NOT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `academia_horarios_tarifas`
--

INSERT INTO `academia_horarios_tarifas` (`id`, `academia_horarios_id`, `academia_tarifas_id`, `activo`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2019-02-13 05:00:00', NULL),
(2, 1, 2, 1, '2019-02-13 05:00:00', NULL),
(3, 1, 3, 1, '2019-02-13 05:00:00', NULL),
(4, 1, 4, 1, '2019-02-13 05:00:00', NULL),
(5, 2, 1, 1, '2019-02-13 05:00:00', NULL),
(6, 2, 2, 1, '2019-02-13 05:00:00', NULL),
(7, 2, 3, 1, '2019-02-13 05:00:00', NULL),
(8, 2, 4, 1, '2019-02-13 05:00:00', NULL),
(9, 3, 1, 1, '2019-02-13 05:00:00', NULL),
(10, 3, 2, 1, '2019-02-13 05:00:00', NULL),
(11, 3, 3, 1, '2019-02-13 05:00:00', NULL),
(12, 3, 4, 1, '2019-02-13 05:00:00', NULL),
(13, 4, 1, 1, '2019-02-13 05:00:00', NULL),
(14, 4, 2, 1, '2019-02-13 05:00:00', NULL),
(15, 4, 3, 1, '2019-02-13 05:00:00', NULL),
(16, 4, 4, 1, '2019-02-13 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_matricula`
--

CREATE TABLE `academia_matricula` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `academia_horarios_tarifas_id` int(10) UNSIGNED NOT NULL,
  `fecha` date NOT NULL,
  `mes` int(11) NOT NULL,
  `anyo` int(11) NOT NULL,
  `codigo_dupla` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `academia_tarifas`
--

CREATE TABLE `academia_tarifas` (
  `id` int(10) UNSIGNED NOT NULL,
  `frecuencia` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `academia_tarifas` (`id`, `frecuencia`, `cant_clases`, `tarifa_individual`, `tarifa_dupla`, `activo`, `created_at`, `updated_at`) VALUES
(1, '1 vez', 1, '12.00', '20.00', 1, '2019-02-13 05:00:00', NULL),
(2, '2 veces', 8, '75.00', '100.00', 1, '2019-02-13 05:00:00', NULL),
(3, '3 veces', 12, '100.00', '150.00', 1, '2019-02-13 05:00:00', NULL),
(4, '4 veces', 16, '125.00', '200.00', 1, '2019-02-13 05:00:00', NULL);

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
(1, 2, '2019-02-14', '12:00', '14:00', 1, 'Pendiente', '60.00', '2019-02-14 03:12:40', '2019-02-14 03:12:40'),
(2, 2, '2019-03-03', '8:00', '9:00', 1, 'Pagado', '30.00', '2019-03-03 07:47:29', '2019-03-09 07:30:48'),
(3, 2, '2019-03-05', '9:00', '10:00', 1, 'Pagado', '30.00', '2019-03-05 08:24:06', '2019-03-09 07:30:54'),
(4, 2, '2019-03-09', '9:00', '11:00', 1, 'Pagado', '60.00', '2019-03-09 07:18:17', '2019-03-09 07:30:59'),
(5, 2, '2019-03-23', '11:00', '13:00', 1, 'Pendiente', '70.00', '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(6, 2, '2019-03-23', '11:00', '13:00', 3, 'Pendiente', '80.00', '2019-03-21 01:53:13', '2019-03-21 01:53:13');

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
(1, 1, 5, 1, '2019-02-14 03:12:40', '2019-02-14 03:12:40'),
(2, 2, 6, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(3, 2, 7, 0, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(4, 2, 8, 0, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(5, 2, 9, 0, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(6, 2, 10, 0, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(7, 2, 11, 0, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(8, 3, 6, 1, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(9, 3, 12, 0, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(10, 3, 13, 0, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(11, 3, 14, 0, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(12, 3, 15, 0, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(13, 3, 16, 0, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(14, 4, 6, 1, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(15, 4, 17, 0, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(16, 4, 12, 0, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(17, 4, 18, 0, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(18, 4, 19, 0, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(19, 4, 15, 0, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(20, 5, 20, 1, '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(21, 5, 21, 0, '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(22, 5, 22, 0, '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(23, 6, 23, 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(24, 6, 21, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(25, 6, 22, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(26, 6, 24, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(27, 6, 25, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(28, 6, 26, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(29, 6, 27, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(30, 6, 28, 0, '2019-03-21 01:53:13', '2019-03-21 01:53:13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atletas`
--

CREATE TABLE `atletas` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` bigint(20) DEFAULT NULL,
  `nombre` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genero` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `red_social` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telf_contacto` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instituto` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `talla_top` int(11) DEFAULT NULL,
  `talla_camiseta` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `atletas`
--

INSERT INTO `atletas` (`id`, `cedula`, `nombre`, `apellido`, `genero`, `fecha_nacimiento`, `red_social`, `telf_contacto`, `instituto`, `email`, `talla_top`, `talla_camiseta`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Ilanna', 'Dvorquez', 'Femenino', '2007-05-21', NULL, NULL, 'Logos', NULL, 32, 32, '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(2, NULL, 'Eitan', 'Dvorquez', 'Masculino', '2011-01-12', NULL, NULL, 'Logos', NULL, 0, 0, '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(3, NULL, 'María Cristina', 'Aguirre Briones', 'Femenino', '2007-10-08', NULL, NULL, 'Americano', NULL, 34, 34, '2019-01-26 22:27:44', '2019-01-26 22:27:44'),
(4, 930022413, 'Luciana Sofia', 'Dager Chang', 'Femenino', '2006-11-24', NULL, NULL, 'Liceo Los Andes', NULL, 38, 38, '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(5, 932349319, 'Camila Sofia', 'Dager Chang', 'Femenino', '2012-08-07', NULL, NULL, 'Liceo Los Andes', NULL, 38, 38, '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(6, NULL, 'Martina Ariana', 'Fernandez Ferreccio', 'Femenino', '2009-04-06', NULL, NULL, 'Javier', NULL, 32, 34, '2019-01-29 01:25:22', '2019-01-29 01:25:22'),
(8, NULL, 'Nicole', 'Serrano', 'Femenino', '2006-05-11', 'Instagram', NULL, 'La Moderna', NULL, 38, 38, '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(9, NULL, 'Domenica', 'García García', 'Femenino', '2006-05-02', NULL, NULL, 'Delta', NULL, 0, 0, '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(10, NULL, 'Alessia', 'García García', 'Femenino', '2011-04-28', NULL, NULL, 'Delta', NULL, 0, 0, '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(11, 955527619, 'Mariela', 'Béjar', 'Femenino', '2006-06-06', NULL, NULL, 'La  Asunción', NULL, 34, 36, '2019-01-31 22:37:45', '2019-01-31 22:37:45'),
(12, NULL, 'Andrea Priscilla', 'Montalvan Amoroso', 'Femenino', '2003-10-31', NULL, NULL, 'santo domingo de guzman', NULL, 36, 36, '2019-02-01 21:46:36', '2019-02-01 21:46:36'),
(13, 931051122, 'Juan José', 'Terán López', 'Masculino', '2009-02-16', NULL, NULL, 'Colegio Menor', NULL, 34, 34, '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(14, 931880082, 'Juan Ignacio', 'Terán López', 'Masculino', '2011-07-30', NULL, NULL, 'Colegio Menor', NULL, 32, 32, '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(15, 931117717, 'Luciana Isabel', 'Aguilera Ampuero', 'Femenino', '2009-03-11', NULL, NULL, 'Javier', NULL, 36, 0, '2019-02-05 22:22:10', '2019-02-05 22:22:10'),
(16, NULL, 'Victoria', 'Ronquillo', 'Femenino', '2007-10-26', NULL, NULL, 'Americano', NULL, 36, 38, '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(17, 931041826, 'Arianna', 'Burgos', 'Femenino', '2006-06-03', NULL, NULL, 'Monte tabor', NULL, 36, 36, '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(18, 932194830, 'Sofia', 'Burgos', 'Femenino', '2012-10-04', NULL, NULL, 'Monte Tabor', NULL, 36, 36, '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(19, 931678155, 'Matilde', 'Burgos', 'Femenino', '2007-08-10', NULL, NULL, 'Monte Tabor', NULL, 38, 38, '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(20, 1727128645, 'Paula Michelle', 'Vargas Coba', 'Femenino', '2007-05-15', NULL, NULL, 'Educamundo', NULL, 36, 36, '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(21, 1750425181, 'Mateo Enrique', 'Vargas Coba', 'Masculino', '2010-07-07', NULL, NULL, 'Educamundo', NULL, 0, 34, '2019-02-06 08:05:53', '2019-02-06 08:05:53'),
(22, 930113378, 'María De los Ángeles', 'Zambrano Izquierdo', 'Femenino', '2007-02-11', NULL, NULL, 'Torremolinos', NULL, 34, 36, '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(23, 930967922, 'Cristina Jael', 'Carrasco López', 'Femenino', '2009-01-17', NULL, NULL, 'Unidad educativa Alfredo Verá Vera', NULL, 36, 36, '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(24, NULL, 'Lucia', 'Molestina', 'Femenino', '2006-06-29', NULL, NULL, 'Monte Tabor', NULL, 0, 0, '2019-02-06 23:12:41', '2019-02-06 23:12:41'),
(25, NULL, 'Valeria', 'Alban', 'Femenino', '2009-11-21', NULL, NULL, 'Santo Domingo de Guzman', NULL, 32, 32, '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(26, NULL, 'Isabella', 'Albán', 'Femenino', '2011-02-04', NULL, NULL, 'Santo Domingo de Guzman', NULL, 34, 34, '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(27, 930915582, 'Matias Sebastian', 'Herrera Montenegro', 'Masculino', '2008-11-22', NULL, NULL, 'Ecomundo', NULL, 0, 36, '2019-02-07 22:21:37', '2019-02-07 22:21:37'),
(28, 930932546, 'Mia Valentina', 'Moncayo Almeida', 'Femenino', '2008-11-25', NULL, NULL, 'Unidad Educativa Javier', NULL, 32, 34, '2019-02-07 23:38:43', '2019-02-07 23:38:43'),
(29, NULL, 'Natalia Maria', 'Villacis Avengo', 'Femenino', '2006-09-07', NULL, NULL, 'Nuevo Mundo', NULL, 36, 36, '2019-02-08 22:50:34', '2019-02-08 22:50:34'),
(30, NULL, 'Natalia Maria', 'Villacis Avengo', 'Femenino', '2006-09-07', NULL, NULL, 'Nuevo Mundo', NULL, 36, 36, '2019-02-08 22:51:11', '2019-02-08 22:51:11'),
(31, 931766968, 'Marcela', 'Faytong Petalta', 'Femenino', '2011-03-10', NULL, NULL, 'Colegio La Moderna', NULL, 32, 32, '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(32, NULL, 'Valeria', 'Alban', 'Femenino', '2009-11-21', NULL, NULL, 'Santo domingo de Guzmán', NULL, 32, 32, '2019-02-11 20:27:48', '2019-02-11 20:27:48'),
(33, NULL, 'Isabella', 'Alban', 'Femenino', '2011-02-04', NULL, NULL, 'Santo domingo de guzman', NULL, 32, 32, '2019-02-11 20:27:48', '2019-02-11 20:27:48'),
(34, NULL, 'ANDREA', 'GOMEZ SARITAMA', 'Femenino', '2006-08-27', NULL, NULL, 'LICEO PANAMERICANO', NULL, 0, 0, '2019-02-12 02:42:17', '2019-02-12 02:42:17'),
(35, 954177747, 'Paula andrea', 'Cruz bonilla', 'Femenino', '2004-08-05', '@andrea.paula.cruz', NULL, 'Liceo panamericano', NULL, 34, 36, '2019-02-12 22:53:43', '2019-02-12 22:53:43'),
(36, NULL, 'Paula', 'Villegas', 'Femenino', '2004-12-03', NULL, NULL, 'Santo domingo de Guzmán', NULL, 34, 34, '2019-02-13 20:10:30', '2019-02-13 20:10:30'),
(37, 123456, 'pepita', 'perez', 'Femenino', '2011-01-12', NULL, NULL, 'logos', NULL, 36, 34, '2019-02-14 00:44:14', '2019-02-14 00:44:14');

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
(1, 4, 1, 'No', '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(2, 4, 2, 'No', '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(3, 4, 3, 'No', '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(4, 5, 1, 'No', '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(5, 5, 2, 'No', '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(6, 5, 3, 'No', '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(7, 6, 1, 'Ninguno', '2019-01-29 01:25:22', '2019-01-29 01:25:22'),
(8, 6, 2, 'Ninguna', '2019-01-29 01:25:22', '2019-01-29 01:25:22'),
(9, 6, 3, 'No', '2019-01-29 01:25:22', '2019-01-29 01:25:22'),
(10, 8, 1, 'No', '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(11, 8, 2, 'No', '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(12, 8, 3, 'Acaros', '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(13, 8, 4, 'Si. Urbanización Castilla mz 20 Villa 21', '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(14, 9, 3, 'No puede estar cerca de fumigaciones insecticidas ni nada que tenga olor fuerte o veneno', '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(15, 13, 1, 'ninguno', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(16, 13, 2, 'ninguno', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(17, 13, 3, 'no', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(18, 13, 4, 'no', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(19, 14, 1, 'ninguno', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(20, 14, 2, 'ninguno', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(21, 14, 3, 'no', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(22, 14, 4, 'no', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(23, 16, 1, 'No', '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(24, 16, 2, 'No', '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(25, 16, 3, 'No', '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(26, 16, 4, 'Si.  Urb vía al sol mz 577 v 25', '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(27, 20, 1, 'No', '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(28, 20, 2, 'No', '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(29, 20, 3, 'Alergia al polvo y polen', '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(30, 20, 4, 'Necesito transporte sólo para la semana de 19 al 24 de febrero Matices Verde Esmeralda MZ 52 villa 21', '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(31, 21, 1, 'No', '2019-02-06 08:05:53', '2019-02-06 08:05:53'),
(32, 21, 2, 'No', '2019-02-06 08:05:53', '2019-02-06 08:05:53'),
(33, 21, 3, 'Al polvo y polen', '2019-02-06 08:05:53', '2019-02-06 08:05:53'),
(34, 21, 4, 'Necesito sólo para la semana de 19 Al 24 de febrero', '2019-02-06 08:05:53', '2019-02-06 08:05:53'),
(35, 22, 1, 'Temporal por ésta semana por un esguince', '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(36, 22, 2, 'No', '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(37, 22, 3, 'No', '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(38, 22, 4, 'No', '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(39, 23, 1, 'No', '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(40, 23, 2, 'No', '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(41, 23, 3, 'Es alérgica al colorante en los alimentos', '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(42, 23, 4, 'No', '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(43, 27, 1, 'No', '2019-02-07 22:21:37', '2019-02-07 22:21:37'),
(44, 27, 2, 'No', '2019-02-07 22:21:37', '2019-02-07 22:21:37'),
(45, 27, 3, 'No', '2019-02-07 22:21:37', '2019-02-07 22:21:37'),
(46, 29, 1, 'Es Diabetica', '2019-02-08 22:50:34', '2019-02-08 22:50:34'),
(47, 30, 1, 'Es Diabetica', '2019-02-08 22:51:11', '2019-02-08 22:51:11'),
(48, 31, 1, 'Ninguno', '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(49, 31, 2, 'Ninguno', '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(50, 31, 3, 'Ninguno.', '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(51, 31, 4, 'Si. Urb. Cataluña Mz 27 Villa 5', '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(52, 34, 1, 'NO', '2019-02-12 02:42:17', '2019-02-12 02:42:17'),
(53, 34, 2, 'NO', '2019-02-12 02:42:18', '2019-02-12 02:42:18'),
(54, 34, 3, 'NO', '2019-02-12 02:42:18', '2019-02-12 02:42:18'),
(55, 34, 4, 'NO', '2019-02-12 02:42:18', '2019-02-12 02:42:18'),
(56, 35, 1, 'No', '2019-02-12 22:53:43', '2019-02-12 22:53:43'),
(57, 35, 2, 'No', '2019-02-12 22:53:43', '2019-02-12 22:53:43'),
(58, 35, 3, 'No', '2019-02-12 22:53:43', '2019-02-12 22:53:43'),
(59, 35, 4, 'No', '2019-02-12 22:53:43', '2019-02-12 22:53:43');

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
(1, 3, 'Campamento para adolescentes', 16, NULL, 10, NULL, '2019-01-26', 1, NULL, '2019-01-24 05:00:00', NULL),
(2, 3, 'Campamento para niños', 12, 15, 10, NULL, '2019-02-23', 1, NULL, '2019-01-24 05:00:00', NULL);

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
(1, 1, '2019-02-09', '2019-02-10', '2019-01-24 05:00:00', NULL),
(2, 2, '2019-02-09', '2019-02-10', '2019-01-24 05:00:00', NULL),
(3, 2, '2019-02-16', '2019-02-17', '2019-01-24 05:00:00', NULL),
(4, 3, '2019-02-09', '2019-02-10', '2019-01-24 05:00:00', NULL),
(5, 3, '2019-02-09', '2019-02-10', '2019-01-24 05:00:00', NULL),
(6, 3, '2019-02-23', '2019-02-24', '2019-01-24 05:00:00', NULL),
(7, 4, '2019-03-09', '2019-03-10', '2019-01-24 05:00:00', NULL),
(8, 5, '2019-03-09', '2019-03-10', '2019-01-24 05:00:00', NULL),
(9, 5, '2019-03-16', '2019-03-17', '2019-01-24 05:00:00', NULL),
(10, 6, '2019-03-09', '2019-03-10', '2019-01-24 05:00:00', NULL),
(11, 6, '2019-03-09', '2019-03-10', '2019-01-24 05:00:00', NULL),
(12, 6, '2019-03-23', '2019-03-24', '2019-01-24 05:00:00', NULL);

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
(1, 1, '1 fin de semana', '90.00', 1, '2019-01-24 05:00:00', NULL),
(2, 1, '2 fines de semana', '120.00', 1, '2019-01-24 05:00:00', NULL),
(3, 1, '3 fines de semana', '150.00', 1, '2019-01-24 05:00:00', NULL),
(4, 2, '1 fin de semana', '90.00', 1, '2019-01-24 05:00:00', NULL),
(5, 2, '2 fines de semana', '120.00', 1, '2019-01-24 05:00:00', NULL),
(6, 2, '3 fines de semana', '150.00', 1, '2019-01-24 05:00:00', NULL);

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
(1, 1, 8, 13, '17:00', '18:30', '2019-01-24 05:00:00', NULL),
(2, 1, 14, 100, '18:30', '20:00', '2019-01-24 05:00:00', NULL),
(3, 2, 8, 13, '17:00', '18:30', '2019-01-24 05:00:00', NULL),
(4, 2, 14, 100, '18:30', '20:00', '2019-01-24 05:00:00', NULL);

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
(1, '¿Tiene algún problema físico o enfermedad que le limite hacer ejercicios?', '2019-01-24 05:00:00', NULL),
(2, '¿Toma algún medicamento?', '2019-01-24 05:00:00', NULL),
(3, '¿Tiene alguna alergia: animales, insectos, medicamentos u otros?', '2019-01-24 05:00:00', NULL),
(4, '¿Necesita transporte? Indícanos tu dirección', '2019-01-24 05:00:00', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inscripciones_academia`
--

CREATE TABLE `inscripciones_academia` (
  `id` int(10) UNSIGNED NOT NULL,
  `atletas_id` int(10) UNSIGNED NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `estatus` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Regular',
  `prueba_fecha` date DEFAULT NULL,
  `prueba_horario_id` int(10) UNSIGNED DEFAULT NULL,
  `activo` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 1, 3, '150.00', 23, '127.50', 'Pendiente', '2019-01-25', 0, '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(2, 2, 3, '150.00', 23, '127.50', 'Pendiente', '2019-01-25', 0, '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(3, 3, 4, '90.00', 9, '81.00', 'Pagado', '2019-01-26', 1, '2019-01-26 22:27:44', '2019-02-07 20:37:46'),
(4, 4, 4, '90.00', 14, '76.50', 'Pagado', '2019-01-28', 1, '2019-01-28 20:20:17', '2019-02-07 20:19:59'),
(5, 5, 4, '90.00', 14, '76.50', 'Pagado', '2019-01-28', 0, '2019-01-28 20:20:17', '2019-02-10 07:19:43'),
(6, 6, 4, '90.00', 9, '81.00', 'Pagado', '2019-01-28', 1, '2019-01-29 01:25:22', '2019-02-07 20:37:52'),
(8, 8, 1, '90.00', 0, '90.00', 'Pagado', '2019-01-29', 1, '2019-01-29 23:27:15', '2019-02-07 20:37:56'),
(9, 9, 1, '90.00', 14, '76.50', 'Pendiente', '2019-01-29', 0, '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(10, 10, 1, '90.00', 14, '76.50', 'Pendiente', '2019-01-29', 0, '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(11, 11, 4, '90.00', 0, '90.00', 'Pagado', '2019-01-31', 1, '2019-01-31 22:37:45', '2019-02-07 20:41:16'),
(12, 12, 2, '90.00', 0, '90.00', 'Pendiente', '2019-02-01', 0, '2019-02-01 21:46:36', '2019-02-01 21:46:36'),
(13, 13, 2, '90.00', 9, '81.00', 'Pagado', '2019-02-05', 1, '2019-02-05 06:36:19', '2019-02-07 20:36:33'),
(14, 14, 2, '90.00', 9, '81.00', 'Pagado', '2019-02-05', 1, '2019-02-05 06:36:19', '2019-02-07 20:36:47'),
(15, 15, 4, '90.00', 0, '90.00', 'Pagado', '2019-02-05', 1, '2019-02-05 22:22:10', '2019-02-07 20:35:45'),
(16, 16, 4, '90.00', 0, '90.00', 'Pendiente', '2019-02-05', 0, '2019-02-05 23:31:56', '2019-02-09 00:01:46'),
(17, 17, 2, '90.00', 9, '81.00', 'Pendiente', '2019-02-05', 0, '2019-02-05 23:41:06', '2019-02-11 20:17:41'),
(18, 18, 2, '90.00', 9, '81.00', 'Pendiente', '2019-02-05', 0, '2019-02-05 23:41:06', '2019-02-11 20:17:52'),
(19, 19, 2, '90.00', 9, '81.00', 'Pendiente', '2019-02-05', 0, '2019-02-05 23:41:06', '2019-02-11 20:17:59'),
(20, 20, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 1, '2019-02-06 08:01:21', '2019-02-07 20:36:56'),
(21, 21, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 1, '2019-02-06 08:05:53', '2019-02-07 20:37:31'),
(22, 22, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 1, '2019-02-06 08:12:14', '2019-02-07 20:37:38'),
(23, 23, 1, '90.00', 0, '90.00', 'Pagado', '2019-02-06', 0, '2019-02-06 21:09:56', '2019-02-10 05:52:47'),
(24, 24, 5, '90.00', 0, '90.00', 'Pendiente', '2019-02-06', 0, '2019-02-06 23:12:41', '2019-02-06 23:12:41'),
(25, 25, 1, '90.00', 9, '81.00', 'Pendiente', '2019-02-06', 0, '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(26, 26, 1, '90.00', 9, '81.00', 'Pendiente', '2019-02-06', 0, '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(27, 27, 1, '90.00', 0, '90.00', 'Pagado', '2019-02-07', 1, '2019-02-07 22:21:37', '2019-02-12 04:04:01'),
(28, 23, 1, '90.00', 0, '90.00', 'Pagado', '2019-02-07', 1, '2019-02-07 22:23:36', '2019-02-12 22:34:15'),
(29, 28, 4, '90.00', 0, '90.00', 'Pendiente', '2019-02-07', 1, '2019-02-07 23:38:43', '2019-02-07 23:38:43'),
(30, 29, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-08', 0, '2019-02-08 22:50:34', '2019-02-08 22:52:14'),
(31, 30, 2, '90.00', 0, '90.00', 'Pagado', '2019-02-08', 1, '2019-02-08 22:51:11', '2019-02-12 22:35:43'),
(32, 31, 1, '90.00', NULL, '90.00', 'Pagado', '2019-02-08', 1, '2019-02-09 02:38:08', '2019-02-12 22:34:34'),
(33, 32, 1, '90.00', NULL, '81.00', 'Pagado', '2019-02-11', 1, '2019-02-11 20:27:48', '2019-02-12 22:35:29'),
(34, 33, 1, '90.00', NULL, '81.00', 'Pendiente', '2019-02-11', 1, '2019-02-11 20:27:48', '2019-02-11 20:27:48'),
(35, 34, 2, '90.00', NULL, '90.00', 'Pagado', '2019-02-11', 1, '2019-02-12 02:42:18', '2019-02-13 20:11:16'),
(36, 35, 2, '90.00', NULL, '90.00', 'Pagado', '2019-02-12', 1, '2019-02-12 22:53:43', '2019-02-13 20:11:08'),
(37, 36, 2, '90.00', NULL, '90.00', 'Pendiente', '2019-02-13', 1, '2019-02-13 20:10:30', '2019-02-13 20:10:30');

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
(1, 962597001, 'Carmen', 'Soto', 'carsoto8691@gmail.com', '0993517326', 'carmensoto86', 1, '2019-02-13 01:09:53', '2019-02-13 01:09:53'),
(2, 123456, 'A1', 'A1', NULL, NULL, NULL, 1, '2019-02-13 01:09:53', '2019-02-13 01:09:53'),
(3, 1234567, 'A2', 'A2', NULL, NULL, NULL, 1, '2019-02-13 01:09:53', '2019-02-13 01:09:53'),
(4, 12345678, 'A3', 'A3', NULL, NULL, NULL, 1, '2019-02-13 01:09:53', '2019-02-13 01:09:53'),
(5, 801928292, 'Andrea', 'Macias', 'Acmaciash@gmail.com', '0994405720', 'Andreitamaciash', 1, '2019-02-14 03:12:40', '2019-02-14 03:12:40'),
(6, 916542533, 'Jaime Andres', 'Vera Regalado', 'jaime14.vera10@gmail.com', '0993210650', NULL, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(7, 916913916, 'Jaime Antonio', 'Smith Gellibert', NULL, NULL, NULL, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(8, 918582081, 'Hernan Xavier', 'Eguez San Andres', NULL, NULL, NULL, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(9, 917142127, 'Ivan Danilo', 'Castro Briones', NULL, NULL, NULL, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(10, 910117126, 'Ricardo Javier', 'Garcia Quirola', NULL, NULL, NULL, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(11, 917089047, 'Pablo Antonio', 'Chavez Cañizares', NULL, NULL, NULL, 1, '2019-03-03 07:47:29', '2019-03-03 07:47:29'),
(12, 916913916, 'Jaime Antonio', 'Smith Gellibert', NULL, '0998391880', NULL, 1, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(13, 918582081, 'Hernan Xavier', 'Eguez San Andres', NULL, '0999882723', NULL, 1, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(14, 917142127, 'Ivan Danilo', 'Castro Briones', NULL, '0995598805', NULL, 1, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(15, 910117126, 'Ricardo Javier', 'Garcia Quirola', NULL, '0968230012', NULL, 1, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(16, 917089047, 'Pablo Antonio', 'Chavez Cañizares', NULL, '0987381782', NULL, 1, '2019-03-05 08:24:06', '2019-03-05 08:24:06'),
(17, 916635212, 'Allan Jose', 'Haraldsson Rojas', NULL, '0999544332', NULL, 1, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(18, 918166869, 'Pablo Xavier', 'Rojas Chacon', NULL, '0987877135', NULL, 1, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(19, 918580903, 'Dario Fernando', 'Del Pezo Zambrano', NULL, '0987208288', NULL, 1, '2019-03-09 07:18:17', '2019-03-09 07:18:17'),
(20, 920002847, 'maria paulina', 'carrión antepara', 'pollicarrion@gmail.com', '0999431379', 'mpcarrion', 1, '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(21, 926328295, 'Robert', 'Moreno', NULL, '0987225993', NULL, 1, '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(22, 917707473, 'Michelle', 'Avila', NULL, '0987547245', NULL, 1, '2019-03-21 01:39:57', '2019-03-21 01:39:57'),
(23, 920002847, 'paulina', 'carrion', 'pollicarrion@gmail.com', '0999431379', 'mpcarrion', 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(24, 926130725, 'juan', 'leon', NULL, '0999630387', NULL, 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(25, 916915184, 'marines', 'garcia', NULL, '0939587539', NULL, 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(26, 919756205, 'santiago', 'rios', NULL, '0994935218', NULL, 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(27, 918058264, 'jessica', 'jaramillo', NULL, '0994118538', NULL, 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13'),
(28, 924851165, 'nicolas', 'escandon', NULL, '0981521344', NULL, 1, '2019-03-21 01:53:13', '2019-03-21 01:53:13');

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
(1, 'Vía a la costa', 'LACOSTA PADEL', 1, '2019-01-24 05:00:00', NULL),
(2, 'Samborondón', 'CLUB BIBLOS', 1, '2019-01-24 05:00:00', NULL),
(3, 'Salinas', '', 1, '2019-01-24 05:00:00', NULL);

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
(29, '2019_02_06_213310_create_academia_tarifas_table', 1),
(30, '2019_02_08_164948_create_academia_horarios_table', 1),
(31, '2019_02_08_203028_create_academia_horarios_tarifas_table', 1),
(32, '2019_02_08_205342_create_academia_asistencia_pruebas_table', 1),
(33, '2019_02_11_153343_create_inscripciones_academia_table', 1),
(34, '2019_02_11_153410_create_academia_matricula_table', 1),
(183, '2014_10_12_000000_create_users_table', 1),
(184, '2014_10_12_100000_create_password_resets_table', 1),
(185, '2018_10_13_043900_create_roles_table', 1),
(186, '2018_10_13_044356_create_role_user_table', 1),
(187, '2019_01_02_165656_create_deportes_table', 1),
(188, '2019_01_02_165838_create_servicios_table', 1),
(189, '2019_01_02_165907_create_locaciones_table', 1),
(190, '2019_01_02_165917_create_periodos_table', 1),
(191, '2019_01_02_165927_create_tarifas_table', 1),
(192, '2019_01_02_165936_create_promociones_table', 1),
(193, '2019_01_02_165944_create_representantes_table', 1),
(194, '2019_01_02_170017_create_atletas_table', 1),
(195, '2019_01_02_170026_create_representantes_atletas_table', 1),
(196, '2019_01_02_170044_create_informacion_adicional_table', 1),
(197, '2019_01_02_170052_create_atletas_informacion_adicional_table', 1),
(198, '2019_01_09_205624_create_horarios_table', 1),
(199, '2019_01_14_151323_create_vacacional_table', 1),
(200, '2019_01_14_151711_create_vacacional_horarios_table', 1),
(201, '2019_01_15_191805_create_inscripciones_vacacional_table', 1),
(202, '2019_01_18_201217_create_campamentos_table', 1),
(203, '2019_01_23_153513_create_campamentos_horarios_table', 1),
(204, '2019_01_23_153633_create_campamentos_fechas_table', 1),
(205, '2019_01_23_212936_create_inscripciones_campamento_table', 1);

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
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `red_social` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `representantes`
--

INSERT INTO `representantes` (`id`, `cedula`, `nombres`, `apellidos`, `telf_contacto`, `email`, `red_social`, `created_at`, `updated_at`) VALUES
(1, 912787785, 'Ena Maria', 'Chang Estrella', '0987216053', 'enamariachang@gmail.com', '@ena_chang', '2019-01-25 23:23:04', '2019-01-25 23:23:04'),
(2, 9999999999, 'Stepanie Silvia', 'Saman', '0993517326', 'ssaman@galapagosluxurycharters.com', 'stephi_saman', '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(3, 917425944, 'María Fernanda', 'Briones hidalgo', '0997057933', 'Mbriones78@hotmail.com', 'María Fernanda Briones hidalgo', '2019-01-26 22:27:44', '2019-01-26 22:27:44'),
(4, 916559446, 'Alexandra', 'Ferreccio Damacela', '0997210740', 'Alexafd@hotmail.com', 'Alexaferreccio', '2019-01-29 01:25:22', '2019-01-29 01:25:22'),
(6, 921930608, 'Dalia', 'Salazar', '0994029036', 'damasa84@hotmail.com', 'Instagram', '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(7, 1304354515, 'María Gabriela', 'García serrano', '0991122950', 'Ggarcia@oceanfreightcargo.com', 'Gabygarci', '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(8, 908396310, 'Mariela', 'Molina', '0990631895', 'mari_molinaolvera@hotmail.com', 'Mariela Molina', '2019-01-31 22:37:45', '2019-01-31 22:37:45'),
(9, 914103726, 'Priscilla Alexandra', 'Amoroso Ron', '0998489257', 'andreamontalvan_2@hotmail.com', 'Facebook', '2019-02-01 06:00:05', '2019-02-01 06:00:05'),
(10, 908913585, 'Fanny del  Rocío', 'López Medina', '0999420200', 'flopez@silcex.com.ec', '@fannylopezmedina', '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(11, 920456944, 'Daniela', 'Ampuero', '0984884657', 'dani_ampu@yahoo.com', '@dani_ampu', '2019-02-05 22:22:10', '2019-02-05 22:22:10'),
(12, 913159687, 'Elsy', 'Villacis', '0997656415', 'evillacis@evasa.com.ec', 'NA', '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(13, 908747207, 'Matilde', 'Casal', '0995620748', 'matildecasalo@hotmail.com', 'Matilde Casalo', '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(14, 1706827597, 'Naddya', 'Coba', '0981072515', 'ncoba@hotmail.com', '@naddyacoba', '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(15, 915865091, 'Sonia Cecilia', 'Zambrano Izquierdo', '0987130378', 'sonycecilia1708@gmail.com', 'Sonia Zambrano', '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(16, 802136515, 'Alejandra Maria', 'López Andrade', '0958940675', 'Isicristijero.al@gmail.com', '@isicristijero', '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(17, 909532988, 'Denisse', 'Aguirre', '0991613190', 'Deagpa@gmail.com', 'Denisse Aguirre', '2019-02-06 23:12:41', '2019-02-06 23:12:41'),
(18, 921897096, 'Linda', 'Pinagoarte', '0967566764', 'lindapina@gmail.com', 'Linda Pinagoarte', '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(19, 914343413, 'Monica', 'Montenegro', '099148412', 'monik_montenegroa@hormail.com', '@monicamontenegroa', '2019-02-07 22:21:37', '2019-02-07 22:21:37'),
(20, 914228374, 'Gabriella', 'Almeida', '0995553958', 'gaby_285@hotmail.com', '@gabyalmeida', '2019-02-07 23:38:43', '2019-02-07 23:38:43'),
(21, 917324683, 'Natalia', 'Avengo', '0982843022', 'nataliaavengov@hotmail.com', 'Natalia  Avengo', '2019-02-08 22:50:34', '2019-02-08 22:50:34'),
(22, 922071055, 'Andrea', 'Peralta Chicaiza', '0993031810', 'andreita_p86@hotmail.com', 'Andrea Peralta', '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(23, 915371090, 'JOSE EDUARDO', 'GOMEZ BRIONES', '0992228018', 'pepo070774@msn.com', 'pepogomez', '2019-02-12 02:42:17', '2019-02-12 02:42:17'),
(24, 914154372, 'Solange', 'Bonilla', '0984188724', 'Solangebonillab@icloud.com', '@solangebonilla', '2019-02-12 22:53:43', '2019-02-12 22:53:43'),
(25, 916682271, 'John', 'Villegas', '0995604483', 'john_ville06@hotmail.com', 'John Villegas', '2019-02-13 20:10:30', '2019-02-13 20:10:30'),
(26, 915745905, 'stephanie', 'saman', '0997360287', 'stephanie@gmail.com', 'stephisaman', '2019-02-14 00:44:14', '2019-02-14 00:44:14');

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
(1, 2, 1, '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(2, 2, 2, '2019-01-26 02:50:09', '2019-01-26 02:50:09'),
(3, 3, 3, '2019-01-26 22:27:44', '2019-01-26 22:27:44'),
(4, 1, 4, '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(5, 1, 5, '2019-01-28 20:20:17', '2019-01-28 20:20:17'),
(6, 4, 6, '2019-01-29 01:25:22', '2019-01-29 01:25:22'),
(8, 6, 8, '2019-01-29 23:27:15', '2019-01-29 23:27:15'),
(9, 7, 9, '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(10, 7, 10, '2019-01-30 00:35:07', '2019-01-30 00:35:07'),
(11, 8, 11, '2019-01-31 22:37:45', '2019-01-31 22:37:45'),
(12, 9, 12, '2019-02-01 21:46:36', '2019-02-01 21:46:36'),
(13, 10, 13, '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(14, 10, 14, '2019-02-05 06:36:19', '2019-02-05 06:36:19'),
(15, 11, 15, '2019-02-05 22:22:10', '2019-02-05 22:22:10'),
(16, 12, 16, '2019-02-05 23:31:56', '2019-02-05 23:31:56'),
(17, 13, 17, '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(18, 13, 18, '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(19, 13, 19, '2019-02-05 23:41:06', '2019-02-05 23:41:06'),
(20, 14, 20, '2019-02-06 08:01:21', '2019-02-06 08:01:21'),
(21, 14, 21, '2019-02-06 08:05:53', '2019-02-06 08:05:53'),
(22, 15, 22, '2019-02-06 08:12:14', '2019-02-06 08:12:14'),
(23, 16, 23, '2019-02-06 21:09:56', '2019-02-06 21:09:56'),
(24, 17, 24, '2019-02-06 23:12:41', '2019-02-06 23:12:41'),
(25, 18, 25, '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(26, 18, 26, '2019-02-06 23:32:42', '2019-02-06 23:32:42'),
(27, 19, 27, '2019-02-07 22:21:37', '2019-02-07 22:21:37'),
(28, 20, 28, '2019-02-07 23:38:43', '2019-02-07 23:38:43'),
(29, 21, 29, '2019-02-08 22:50:34', '2019-02-08 22:50:34'),
(30, 21, 30, '2019-02-08 22:51:11', '2019-02-08 22:51:11'),
(31, 22, 31, '2019-02-09 02:38:08', '2019-02-09 02:38:08'),
(32, 18, 32, '2019-02-11 20:27:48', '2019-02-11 20:27:48'),
(33, 18, 33, '2019-02-11 20:27:48', '2019-02-11 20:27:48'),
(34, 23, 34, '2019-02-12 02:42:18', '2019-02-12 02:42:18'),
(35, 24, 35, '2019-02-12 22:53:43', '2019-02-12 22:53:43'),
(36, 25, 36, '2019-02-13 20:10:30', '2019-02-13 20:10:30'),
(37, 26, 37, '2019-02-14 00:44:14', '2019-02-14 00:44:14');

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
(1, 'Tarifa por hora', '5', '2019-01-31 11:00:00', NULL),
(2, 'Cantidad de personas por tarifa', '4', '2019-01-31 11:00:00', NULL),
(3, 'Cantidad de canchas', '3', '2019-01-31 11:00:00', NULL),
(4, 'Hora inicio', '8', '2019-01-31 11:00:00', NULL),
(5, 'Hora fin', '21', '2019-01-31 11:00:00', NULL),
(6, 'Locaciones', '1,2', NULL, NULL);

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
(1, 'admin', 'Administrator', '2019-01-25 01:26:52', '2019-01-25 01:26:52');

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
(1, 1, 1, '2019-01-25 01:26:53', '2019-01-25 01:26:53'),
(2, 1, 2, '2019-02-02 03:06:08', '2019-02-02 03:06:08'),
(3, 1, 3, '2019-02-04 20:44:28', '2019-02-04 20:44:28');

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
(1, 'Academia', 1, '2019-01-24 05:00:00', NULL),
(2, 'Alquiler de canchas', 1, '2019-01-24 05:00:00', NULL),
(3, 'Vacacional', 1, '2019-01-24 05:00:00', NULL),
(4, 'Campamentos', 1, '2019-01-24 05:00:00', NULL),
(5, 'Torneos', 1, '2019-01-24 05:00:00', NULL);

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
(1, 'ssaman', 'Stephanie', 'Saman', 'admin@example.com', 'Activo', NULL, '$2y$10$G8dslrPwz5HBhdumHB8N7OcRGVa9xnXpGp2pXQF5KPhjNodoehZqq', 'vCaZC7DPE9i2yiv8egBR3IKABZPnFQli2NccGIakM6GhuxDwPaAQCV5lQ4h7', '2019-01-25 01:26:53', '2019-01-25 01:26:53'),
(2, 'bespinoza', 'Brenda', 'Espinoza', 'brenda@example.com', 'Activo', NULL, '$2y$10$ygi8HOA3.c99dnD0J.68KOY3JwUVpmXOGIldLa00L0znJr7S34zFu', 'TrLAzElv9nNWb9Ixd7OgpE9LcY1c6e4itM2mQ6AqIeKpPe0tHxDk9esaQoCL', '2019-02-02 03:06:08', '2019-02-02 03:06:08'),
(3, 'vvillarroel', 'Vanessa', 'Villarroel', 'vvillarroel@example.com', 'Activo', NULL, '$2y$10$MhIv3H/U7EyqgY5xXUSWN.zndaxO20AMikwIJmmXqQRKeTda9w0au', 'Ga1jQ9dDDHWsDuxfY5wwCxawx0kEb18Wm0IulNGMIzsTmzX0SrHbByzTwjLH', '2019-02-04 20:44:28', '2019-02-04 20:44:28');

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
(1, 2, '2019-02-11', '2019-03-13', '2019-01-28', 6, 14, 10, 10, 1, '2019-01-24 05:00:00', NULL),
(2, 1, '2019-02-11', '2019-03-13', '2019-01-28', 6, 14, 10, 10, 1, '2019-01-24 05:00:00', NULL);

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
(1, 1, '08:30', '10:30', '90.00', 1, '2019-01-24 05:00:00', NULL),
(2, 1, '10:30', '12:30', '90.00', 1, '2019-01-24 05:00:00', NULL),
(3, 1, '08:30', '12:30', '150.00', 0, '2019-01-24 05:00:00', NULL),
(4, 2, '08:30', '10:30', '90.00', 1, '2019-01-24 05:00:00', NULL),
(5, 2, '10:30', '12:30', '90.00', 1, '2019-01-24 05:00:00', NULL),
(6, 2, '08:30', '12:30', '150.00', 0, '2019-01-24 05:00:00', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `academia_asistencia_pruebas`
--
ALTER TABLE `academia_asistencia_pruebas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_asistencia_pruebas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_academia_asistencia_pruebas_users1_idx` (`users_id`);

--
-- Indices de la tabla `academia_configuracion`
--
ALTER TABLE `academia_configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `academia_horarios`
--
ALTER TABLE `academia_horarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_locaciones_academia_horarios_idx` (`locaciones_id`);

--
-- Indices de la tabla `academia_horarios_tarifas`
--
ALTER TABLE `academia_horarios_tarifas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_horarios_has_academia_tarifas_academia_tarifas1_idx` (`academia_tarifas_id`),
  ADD KEY `fk_academia_horarios_has_academia_tarifas_academia_horarios_idx` (`academia_horarios_id`);

--
-- Indices de la tabla `academia_matricula`
--
ALTER TABLE `academia_matricula`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_academia_matricula_academia_horarios_tarifas1_idx` (`academia_horarios_tarifas_id`),
  ADD KEY `fk_academia_matricula_atletas1_idx` (`atletas_id`);

--
-- Indices de la tabla `academia_tarifas`
--
ALTER TABLE `academia_tarifas`
  ADD PRIMARY KEY (`id`);

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
  ADD KEY `fk_prueba_horario_academia1_idx` (`prueba_horario_id`);

--
-- Indices de la tabla `inscripciones_campamento`
--
ALTER TABLE `inscripciones_campamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_campamentos_horarios_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_campamentos_horarios_has_atletas_campamentos_horarios1_idx` (`campamentos_horarios_id`);

--
-- Indices de la tabla `inscripciones_vacacional`
--
ALTER TABLE `inscripciones_vacacional`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_vacacional_horarios_has_atletas_atletas1_idx` (`atletas_id`),
  ADD KEY `fk_vacacional_horarios_has_atletas_vacacional_horarios1_idx` (`vacacional_horarios_id`);

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
-- Indices de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_tarifas_servicios1_idx` (`servicios_id`),
  ADD KEY `fk_tarifas_locaciones1_idx` (`locaciones_id`),
  ADD KEY `fk_tarifas_periodos1_idx` (`periodos_id`),
  ADD KEY `fk_tarifas_deportes1_idx` (`deportes_id`);

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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `academia_asistencia_pruebas`
--
ALTER TABLE `academia_asistencia_pruebas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `academia_configuracion`
--
ALTER TABLE `academia_configuracion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `academia_horarios`
--
ALTER TABLE `academia_horarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `academia_horarios_tarifas`
--
ALTER TABLE `academia_horarios_tarifas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `academia_matricula`
--
ALTER TABLE `academia_matricula`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `academia_tarifas`
--
ALTER TABLE `academia_tarifas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `alquiler_invitados`
--
ALTER TABLE `alquiler_invitados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `atletas`
--
ALTER TABLE `atletas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `atletas_informacion_adicional`
--
ALTER TABLE `atletas_informacion_adicional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones_campamento`
--
ALTER TABLE `inscripciones_campamento`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inscripciones_vacacional`
--
ALTER TABLE `inscripciones_vacacional`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `invitados`
--
ALTER TABLE `invitados`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `locaciones`
--
ALTER TABLE `locaciones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `representantes_atletas`
--
ALTER TABLE `representantes_atletas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `reserva_configuracion`
--
ALTER TABLE `reserva_configuracion`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tarifas`
--
ALTER TABLE `tarifas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `academia_asistencia_pruebas`
--
ALTER TABLE `academia_asistencia_pruebas`
  ADD CONSTRAINT `academia_asistencia_pruebas_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `academia_asistencia_pruebas_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `academia_horarios`
--
ALTER TABLE `academia_horarios`
  ADD CONSTRAINT `academia_horarios_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `academia_horarios_tarifas`
--
ALTER TABLE `academia_horarios_tarifas`
  ADD CONSTRAINT `academia_horarios_tarifas_academia_horarios_id_foreign` FOREIGN KEY (`academia_horarios_id`) REFERENCES `academia_horarios` (`id`),
  ADD CONSTRAINT `academia_horarios_tarifas_academia_tarifas_id_foreign` FOREIGN KEY (`academia_tarifas_id`) REFERENCES `academia_tarifas` (`id`);

--
-- Filtros para la tabla `academia_matricula`
--
ALTER TABLE `academia_matricula`
  ADD CONSTRAINT `academia_matricula_academia_horarios_tarifas_id_foreign` FOREIGN KEY (`academia_horarios_tarifas_id`) REFERENCES `academia_horarios_tarifas` (`id`),
  ADD CONSTRAINT `academia_matricula_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`);

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
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `horarios_locaciones_id_foreign` FOREIGN KEY (`locaciones_id`) REFERENCES `locaciones` (`id`);

--
-- Filtros para la tabla `inscripciones_academia`
--
ALTER TABLE `inscripciones_academia`
  ADD CONSTRAINT `inscripciones_academia_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_academia_prueba_horario_id_foreign` FOREIGN KEY (`prueba_horario_id`) REFERENCES `academia_horarios` (`id`);

--
-- Filtros para la tabla `inscripciones_campamento`
--
ALTER TABLE `inscripciones_campamento`
  ADD CONSTRAINT `inscripciones_campamento_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_campamento_campamentos_horarios_id_foreign` FOREIGN KEY (`campamentos_horarios_id`) REFERENCES `campamentos_horarios` (`id`);

--
-- Filtros para la tabla `inscripciones_vacacional`
--
ALTER TABLE `inscripciones_vacacional`
  ADD CONSTRAINT `inscripciones_vacacional_atletas_id_foreign` FOREIGN KEY (`atletas_id`) REFERENCES `atletas` (`id`),
  ADD CONSTRAINT `inscripciones_vacacional_vacacional_horarios_id_foreign` FOREIGN KEY (`vacacional_horarios_id`) REFERENCES `vacacional_horarios` (`id`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
