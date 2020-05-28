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

-- Volcando estructura para tabla android.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla android.categoria: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`) VALUES
	(1, 'Electronico'),
	(4, 'inmuebles'),
	(5, 'Galletas'),
	(6, 'motos'),
	(7, 'aviones'),
	(8, 'vehiculos'),
	(9, 'muebles'),
	(10, 'cigarrilos'),
	(11, 'CateCel'),
	(12, 'sin internet'),
	(13, 'con internet');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Volcando estructura para tabla android.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` text NOT NULL,
  `precio` text NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` longblob,
  `id_catg_producto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_productos_categoria` (`id_catg_producto`),
  CONSTRAINT `FK_productos_categoria` FOREIGN KEY (`id_catg_producto`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla android.productos: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `descripcion`, `imagen`, `id_catg_producto`) VALUES
	(1, 'Lux led', '50000', 'Luz de navidad', NULL, 1),
	(2, 'kira', '5000', 'feit', NULL, 4),
	(3, 'producto4', '5000', 'feit', NULL, 1),
	(6, 'Mesa', '50000', '4 patas', NULL, 4),
	(7, 'pcel', '100000', 'para dps ', NULL, 1),
	(8, 'desde el cel', 'hsh', 'hsh', NULL, 7),
	(9, 'prueba', '505050', 'uuuudd', NULL, 10);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla android.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `telefono` text NOT NULL,
  `ciudad` text NOT NULL,
  `direccion` text NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla android.usuarios: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password`, `telefono`, `ciudad`, `direccion`, `estado`) VALUES
	(1, 'Franklin', '1234', '3165076269', 'Mocoa', 'Centro', 'admin'),
	(8, 'juan', '0202', '321596', 'direccionmocoa', 'ciudadmocoa', 'ventas'),
	(11, 'userx', 'sdf', '123456789', 'dircol', 'citymocoa', 'ventas'),
	(12, 'user24', 'f', 'ttel', 'dr', 'cyt', 'ventas'),
	(14, 'Kira', '0220', '3165076285', 'MocoaCity', 'Centro', 'ventas'),
	(23, 'x', 'x', '316507', 'mocoa', 'barriox', 'ventas'),
	(24, 'usercel', '1209', '716271', 'avilla', 'las palmas', 'ventas'),
	(25, 'ayer cek', 'vt', '8282929', 'jsjs', 'jsbs', 'ventas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
