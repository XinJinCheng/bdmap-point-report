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
CREATE DATABASE IF NOT EXISTS `survey_report` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `survey_report`;

-- Dumping structure for table survey_report.city_point
CREATE TABLE IF NOT EXISTS `city_point` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `x` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `y` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
-- Dumping structure for table survey_report.submitted_location
CREATE TABLE IF NOT EXISTS `submitted_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `student` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_datetime_id` (`datetime`,`id`),
  KEY `idx_name_city` (`name`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
