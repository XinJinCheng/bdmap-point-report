
CREATE DATABASE IF NOT EXISTS `survey_report` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `survey_report`;

CREATE TABLE IF NOT EXISTS `submitted_location` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE USER IF NOT EXISTS 'report'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON `survey_report`.* TO 'report'@'localhost';
