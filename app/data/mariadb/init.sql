-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.9-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for survey_report
DROP DATABASE IF EXISTS `survey_report`;
CREATE DATABASE IF NOT EXISTS `survey_report` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `survey_report`;

-- Dumping structure for table survey_report.city_point
DROP TABLE IF EXISTS `city_point`;
CREATE TABLE IF NOT EXISTS `city_point` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `x` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `y` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table survey_report.city_point: ~1 rows (approximately)
/*!40000 ALTER TABLE `city_point` DISABLE KEYS */;
INSERT INTO `city_point` (`id`, `city`, `x`, `y`, `location`) VALUES
	(1, '赤峰市', '118.93076119', '42.29711232', NULL),
	(3, '赤峰', '118.93076119', '42.29711232', '{"address":"CN|内蒙古|赤峰|None|CHINANET|0|0","content":{"address":"内蒙古自治区赤峰市","address_detail":{"city":"赤峰市","city_code":297,"district":"","province":"内蒙古自治区","street":"","street_number":""},"point":{"x":"118.93076119","y":"42.29711232"}},"status":0}');
/*!40000 ALTER TABLE `city_point` ENABLE KEYS */;

-- Dumping structure for table survey_report.submitted_location
DROP TABLE IF EXISTS `submitted_location`;
CREATE TABLE IF NOT EXISTS `submitted_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table survey_report.submitted_location: ~5 rows (approximately)
/*!40000 ALTER TABLE `submitted_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `submitted_location` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;


CREATE USER IF NOT EXISTS 'report'@'localhost' IDENTIFIED BY '123456';
GRANT ALL ON `survey_report`.* TO 'report'@'localhost';
