-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         5.7.24 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para android
CREATE DATABASE IF NOT EXISTS `android` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `android`;

-- Volcando estructura para tabla android.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `precio` text NOT NULL,
  `descripcion` text NOT NULL,
  `categoria` text NOT NULL,
  `imagen` longblob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla android.productos: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `descripcion`, `categoria`, `imagen`) VALUES
	(1, 'x', 'x', 'x', 'x', NULL),
	(2, 'Pollo', '5000', 'COmestible', 'Pollos', NULL),
	(3, 'dd', 'dd', 'fdsf', 'sdfdsf', NULL),
	(4, 'c', 'c', 'c', 'c', NULL),
	(5, 'jabon', '5000', 'este es un producto de uso personal para prevenir el covid para que la humanida no muera en la crisis econo mica de los seres vivos y no vivos del mundo en particular las plantas que viven fuera del vacio del inico del mundo', 'jabones', NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla android.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `telefono` text NOT NULL,
  `ciudad` text,
  `direccion` text,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla android.usuarios: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password`, `telefono`, `ciudad`, `direccion`, `estado`) VALUES
	(1, 'Franklin', '1234', '3165076269', 'Mocoa', 'Centro', 'admin'),
	(3, 'pruebauser', '123', '96325874', 'Beijing', 'Mocoa', 'ventas'),
	(4, 'fravents', '963258741', '316548521', 'Tokio', 'Mocoa', 'ventas'),
	(5, 'Kira', '123', '852369', 'Centro', 'Mocoa', 'ventas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
