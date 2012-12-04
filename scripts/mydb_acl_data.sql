-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.50-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-12-04 13:41:58
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;
-- Dumping data for table mydb.cities: ~4 rows (approximately)
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` (`idcity`, `city`) VALUES
	(1, 'Zaragoza'),
	(2, 'Barcelona'),
	(3, 'Bilbao'),
	(4, 'Ourense');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;

-- Dumping data for table mydb.coders: ~2 rows (approximately)
/*!40000 ALTER TABLE `coders` DISABLE KEYS */;
INSERT INTO `coders` (`idcode`, `coder`) VALUES
	(1, 'php'),
	(2, 'java');
/*!40000 ALTER TABLE `coders` ENABLE KEYS */;

-- Dumping data for table mydb.languages: ~3 rows (approximately)
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` (`idlanguage`, `language`) VALUES
	(1, 'Castellano'),
	(2, 'English'),
	(3, 'Dutch');
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;

-- Dumping data for table mydb.pets: ~3 rows (approximately)
/*!40000 ALTER TABLE `pets` DISABLE KEYS */;
INSERT INTO `pets` (`idpet`, `pet`) VALUES
	(1, 'Gato'),
	(2, 'Perro'),
	(3, 'Tigre');
/*!40000 ALTER TABLE `pets` ENABLE KEYS */;

-- Dumping data for table mydb.resources: ~0 rows (approximately)
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` (`idresource`, `resource`) VALUES
	(1, '/users/insert'),
	(2, '/users/delete'),
	(3, '/users/update'),
	(4, '/users/select'),
	(5, '/users'),
	(6, '/index'),
	(7, '/login'),
	(8, '/login/logout'),
	(9, '/error/403'),
	(10, '/error/404');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;

-- Dumping data for table mydb.roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`idrol`, `rol`) VALUES
	(1, 'Implementor'),
	(2, 'Admin'),
	(3, 'Users'),
	(4, 'Guest');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping data for table mydb.roles_has_resources: ~0 rows (approximately)
/*!40000 ALTER TABLE `roles_has_resources` DISABLE KEYS */;
INSERT INTO `roles_has_resources` (`roles_idrol`, `resources_idresource`) VALUES
	(1, 1),
	(3, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(1, 5),
	(3, 5),
	(1, 6),
	(3, 6),
	(4, 6),
	(1, 7),
	(3, 7),
	(4, 7),
	(1, 8),
	(3, 8),
	(4, 9),
	(4, 10);
/*!40000 ALTER TABLE `roles_has_resources` ENABLE KEYS */;

-- Dumping data for table mydb.users: ~8 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`iduser`, `name`, `email`, `password`, `description`, `photo`, `coders`, `cities_idcity`, `roles_idrol`) VALUES
	(1, 'Agustin', 'aa', 'aa', 'Algo en aqui', 'poto.jpg', 'php,java', 2, 1),
	(2, 'Sebastian', 'sebastian@gmail.com', '1234', 'Otra desc', 'photo.jpg', 'php', 1, 0),
	(14, 'j2', 'j5', '', 'j', 'photo_12.jpg', 'php', 1, 0),
	(15, 'j2', 'j6', 'asdasd', 'j', 'photo_13.jpg', 'php', 1, 0),
	(17, 'j2', 'j7', '', 'j', 'photo_15.jpg', 'php', 1, 0),
	(18, 'j2', 'j8', '', 'j', 'photo_16.jpg', 'php', 1, 0),
	(19, 'kkkk', 'kkkkk', 'kkkk', 'kkkk', 'KlausRifbjerg_fotoMortenHoltum290.jpg', '', 4, 0),
	(20, 'kkkk', 'kk', 'kk', 'kkkk', 'KlausRifbjerg_fotoMortenHoltum290_1.jpg', 'php', 4, 3);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping data for table mydb.users_has_languages: ~11 rows (approximately)
/*!40000 ALTER TABLE `users_has_languages` DISABLE KEYS */;
INSERT INTO `users_has_languages` (`users_iduser`, `languages_idlanguage`) VALUES
	(1, 1),
	(14, 1),
	(15, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(1, 2),
	(19, 2),
	(20, 2),
	(14, 3);
/*!40000 ALTER TABLE `users_has_languages` ENABLE KEYS */;

-- Dumping data for table mydb.users_has_pets: ~13 rows (approximately)
/*!40000 ALTER TABLE `users_has_pets` DISABLE KEYS */;
INSERT INTO `users_has_pets` (`users_iduser`, `pets_idpet`) VALUES
	(1, 1),
	(14, 1),
	(15, 1),
	(17, 1),
	(18, 1),
	(19, 1),
	(20, 1),
	(19, 2),
	(20, 2),
	(1, 3),
	(14, 3),
	(19, 3),
	(20, 3);
/*!40000 ALTER TABLE `users_has_pets` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
