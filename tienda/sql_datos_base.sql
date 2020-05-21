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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla android.productos: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombre`, `precio`, `descripcion`, `categoria`, `imagen`) VALUES
	(2, 'Pollo', '5000', 'COmestible', 'Pollos', NULL),
	(7, 'Carroeditado', '5000editado', 'Vehiculo de cargaeditado', 'Carroseditado', NULL),
	(10, 'yueditado', 'yueditado', 'uyud', 'yud', NULL),
	(12, 'Teclado', '6302', 'Teclado gamer', 'Digital', NULL),
	(13, 'prueba', '76', 'df', 'sdf', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla android.usuarios: ~16 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `username`, `password`, `telefono`, `ciudad`, `direccion`, `estado`) VALUES
	(1, 'Franklin', '1234', '3165076269', 'Mocoa', 'Centro', 'admin'),
	(3, 'pruebauser', '123', '96325874', 'Beijing', 'Mocoa', 'ventas'),
	(4, 'Cueta borrada x el admin !', '963258741', '316548521', 'Tokio', 'Mocoa', 'ventas'),
	(6, 'x', 'x', 'x', 'x', 'x', 'ventas'),
	(7, 'cuentaVentas', '852', '963258', 'Centro', 'Mocoa', 'ventas'),
	(8, 'juan', '0202', '321596', 'direccionmocoa', 'ciudadmocoa', 'ventas'),
	(9, 'userventas', '852', '741', 'mocoaa', 'mocoa', 'ventas'),
	(10, 'uventas', '852', '852', 'dircel', 'CityKrs', 'ventas'),
	(11, 'userx', 'sdf', '123456789', 'dircol', 'citymocoa', 'ventas'),
	(12, 'u', 'f', 'ttel', 'dr', 'cyt', 'ventas'),
	(13, 'user', 'pasw', '741', 'cit', 'dur', 'ventas'),
	(14, 'Kira', '0220', '3165076285', 'MocoaCity', 'Centro', 'ventas'),
	(15, 'x1', 'x2', 'x3', 'x4', 'x5', 'ventas'),
	(16, 'juan2', '123', '852', 'citymocoa', 'dircent', 'ventas'),
	(17, 'jose', '852', '31689', 'choco', 'la esquina', 'ventas'),
	(18, 'Pruebauser', '123', '369852', 'citymocoa', 'dir', 'ventas'),
	(19, 'cuentaadmins', '123', 'telf', 'city', 'direc', 'ventas');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
