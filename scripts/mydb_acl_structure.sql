-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.50-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2012-12-04 13:41:40
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping structure for table mydb.cities
CREATE TABLE IF NOT EXISTS `cities` (
  `idcity` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`idcity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.coders
CREATE TABLE IF NOT EXISTS `coders` (
  `idcode` int(11) NOT NULL AUTO_INCREMENT,
  `coder` varchar(45) NOT NULL,
  PRIMARY KEY (`idcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.languages
CREATE TABLE IF NOT EXISTS `languages` (
  `idlanguage` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  PRIMARY KEY (`idlanguage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.pets
CREATE TABLE IF NOT EXISTS `pets` (
  `idpet` int(11) NOT NULL AUTO_INCREMENT,
  `pet` varchar(255) NOT NULL,
  PRIMARY KEY (`idpet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.resources
CREATE TABLE IF NOT EXISTS `resources` (
  `idresource` int(11) NOT NULL AUTO_INCREMENT,
  `resource` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idresource`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.roles_has_resources
CREATE TABLE IF NOT EXISTS `roles_has_resources` (
  `roles_idrol` int(11) NOT NULL,
  `resources_idresource` int(11) NOT NULL,
  PRIMARY KEY (`roles_idrol`,`resources_idresource`),
  KEY `fk_roles_has_resources_resources1_idx` (`resources_idresource`),
  KEY `fk_roles_has_resources_roles1_idx` (`roles_idrol`),
  CONSTRAINT `fk_roles_has_resources_roles1` FOREIGN KEY (`roles_idrol`) REFERENCES `roles` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_roles_has_resources_resources1` FOREIGN KEY (`resources_idresource`) REFERENCES `resources` (`idresource`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.users
CREATE TABLE IF NOT EXISTS `users` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `description` text,
  `photo` varchar(255) DEFAULT NULL,
  `coders` varchar(255) DEFAULT NULL,
  `cities_idcity` int(11) NOT NULL,
  `roles_idrol` int(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_users_cities_idx` (`cities_idcity`),
  KEY `fk_users_roles1_idx` (`roles_idrol`),
  CONSTRAINT `fk_users_roles1` FOREIGN KEY (`roles_idrol`) REFERENCES `roles` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_cities` FOREIGN KEY (`cities_idcity`) REFERENCES `cities` (`idcity`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.users_has_languages
CREATE TABLE IF NOT EXISTS `users_has_languages` (
  `users_iduser` int(11) NOT NULL,
  `languages_idlanguage` int(11) NOT NULL,
  PRIMARY KEY (`users_iduser`,`languages_idlanguage`),
  KEY `fk_users_has_languages_languages1_idx` (`languages_idlanguage`),
  KEY `fk_users_has_languages_users1_idx` (`users_iduser`),
  CONSTRAINT `fk_users_has_languages_users1` FOREIGN KEY (`users_iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_languages_languages1` FOREIGN KEY (`languages_idlanguage`) REFERENCES `languages` (`idlanguage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.


-- Dumping structure for table mydb.users_has_pets
CREATE TABLE IF NOT EXISTS `users_has_pets` (
  `users_iduser` int(11) NOT NULL,
  `pets_idpet` int(11) NOT NULL,
  PRIMARY KEY (`users_iduser`,`pets_idpet`),
  KEY `fk_users_has_pets_pets1_idx` (`pets_idpet`),
  KEY `fk_users_has_pets_users1_idx` (`users_iduser`),
  CONSTRAINT `fk_users_has_pets_users1` FOREIGN KEY (`users_iduser`) REFERENCES `users` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_pets_pets1` FOREIGN KEY (`pets_idpet`) REFERENCES `pets` (`idpet`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
