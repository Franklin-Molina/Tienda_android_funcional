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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla android.categoria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id`, `nombre`) VALUES
	(1, 'Electronico'),
	(4, 'inmuebles');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla android.productos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `descripcion`, `imagen`, `id_catg_producto`) VALUES
	(1, 'Lux led', '50000', 'Luz de navidad', NULL, 1),
	(2, 'zapatos nike', '250000', 'Deportivos', NULL, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla android.usuarios: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password`, `telefono`, `ciudad`, `direccion`, `estado`) VALUES
	(1, 'Franklin', '1234', '3165076269', 'Mocoa', 'Centro', 'admin'),
	(8, 'juan', '0202', '321596', 'direccionmocoa', 'ciudadmocoa', 'ventas'),
	(11, 'userx', 'sdf', '123456789', 'dircol', 'citymocoa', 'ventas'),
	(12, 'user24', 'f', 'ttel', 'dr', 'cyt', 'ventas'),
	(14, 'Kira', '0220', '3165076285', 'MocoaCity', 'Centro', 'ventas'),
	(23, 'x', 'x', '316507', 'mocoa', 'barriox', 'ventas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
