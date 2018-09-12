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

-- Dumping data for table survey_report.city_point: ~0 rows (approximately)
/*!40000 ALTER TABLE `city_point` DISABLE KEYS */;
INSERT INTO `city_point` (`id`, `city`, `x`, `y`, `location`) VALUES
	(1, '锡林郭勒盟', '116.02733969', '43.93970484', '{"address":"CN|内蒙古|锡林郭勒盟|None|CHINANET|0|0","content":{"address":"内蒙古自治区锡林郭勒盟","address_detail":{"city":"锡林郭勒盟","city_code":63,"district":"","province":"内蒙古自治区","street":"","street_number":""},"point":{"x":"116.02733969","y":"43.93970484"}},"status":0}'),
	(2, '通辽', '122.26036326', '43.63375607', '{"address":"CN|内蒙古|通辽|None|CHINANET|0|0","content":{"address":"内蒙古自治区通辽市","address_detail":{"city":"通辽市","city_code":64,"district":"","province":"内蒙古自治区","street":"","street_number":""},"point":{"x":"122.26036326","y":"43.63375607"}},"status":0}'),
	(3, '乌海', '106.83199910', '39.68317701', '{"address":"CN|内蒙古|乌海|None|CHINANET|0|0","content":{"address":"内蒙古自治区乌海市","address_detail":{"city":"乌海市","city_code":123,"district":"","province":"内蒙古自治区","street":"","street_number":""},"point":{"x":"106.83199910","y":"39.68317701"}},"status":0}'),
	(4, '呼和浩特', '111.66035052', '40.82831887', '{"address":"CN|内蒙古|呼和浩特|None|CHINANET|0|0","content":{"address":"内蒙古自治区呼和浩特市","address_detail":{"city":"呼和浩特市","city_code":321,"district":"","province":"内蒙古自治区","street":"","street_number":""},"point":{"x":"111.66035052","y":"40.82831887"}},"status":0}'),
	(5, '深圳', '113.30764968', '23.12004910', '{"address":"CN|广东|广州|None|CERNET|0|0","content":{"address":"广东省广州市","address_detail":{"city":"广州市","city_code":257,"district":"","province":"广东省","street":"","street_number":""},"point":{"x":"113.30764968","y":"23.12004910"}},"status":0}'),
	(6, '桂林', '110.26092015', '25.26290125', '{"address":"CN|广西|桂林|None|CERNET|0|0","content":{"address":"广西壮族自治区桂林市","address_detail":{"city":"桂林市","city_code":142,"district":"","province":"广西壮族自治区","street":"","street_number":""},"point":{"x":"110.26092015","y":"25.26290125"}},"status":0}'),
	(7, '绥化', '126.98909457', '46.64606393', '{"address":"CN|黑龙江|绥化|None|UNICOM|0|0","content":{"address":"黑龙江省绥化市","address_detail":{"city":"绥化市","city_code":44,"district":"","province":"黑龙江省","street":"","street_number":""},"point":{"x":"126.98909457","y":"46.64606393"}},"status":0}'),
	(8, '哈尔滨', '126.65771686', '45.77322463', '{"address":"CN|黑龙江|哈尔滨|None|UNICOM|0|0","content":{"address":"黑龙江省哈尔滨市","address_detail":{"city":"哈尔滨市","city_code":48,"district":"","province":"黑龙江省","street":"","street_number":""},"point":{"x":"126.65771686","y":"45.77322463"}},"status":0}'),
	(10, '大兴安岭地区', '124.19610419', '51.99178897', '{"address":"CN|黑龙江|大兴安岭|None|UNICOM|0|0","content":{"address":"黑龙江省大兴安岭地区","address_detail":{"city":"大兴安岭地区","city_code":38,"district":"","province":"黑龙江省","street":"","street_number":""},"point":{"x":"124.19610419","y":"51.99178897"}},"status":0}'),
	(11, '郑州', '113.64964385', '34.75661006', '{"address":"CN|河南|郑州|None|CHINANET|0|0","content":{"address":"河南省郑州市","address_detail":{"city":"郑州市","city_code":268,"district":"","province":"河南省","street":"","street_number":""},"point":{"x":"113.64964385","y":"34.75661006"}},"status":0}'),
	(12, '开封', '114.35164212', '34.80185418', '{"address":"CN|河南|开封|None|CHINANET|0|0","content":{"address":"河南省开封市","address_detail":{"city":"开封市","city_code":210,"district":"","province":"河南省","street":"","street_number":""},"point":{"x":"114.35164212","y":"34.80185418"}},"status":0}'),
	(13, '安阳', '114.04915355', '32.98315815', '{"address":"CN|河南|驻马店|None|CHINANET|0|0","content":{"address":"河南省驻马店市","address_detail":{"city":"驻马店市","city_code":269,"district":"","province":"河南省","street":"","street_number":""},"point":{"x":"114.04915355","y":"32.98315815"}},"status":0}');
/*!40000 ALTER TABLE `city_point` ENABLE KEYS */;

-- Dumping data for table survey_report.submitted_location: ~0 rows (approximately)
/*!40000 ALTER TABLE `submitted_location` DISABLE KEYS */;
INSERT INTO `submitted_location` (`id`, `name`, `ip`, `datetime`, `city`, `location`) VALUES
	(1, '调查问卷02', '1.180.222.242', '2018-09-13 12:00:00', '锡林郭勒盟', '["中国","内蒙古"]'),
	(2, '调查问卷02', '1.181.222.242', '2018-09-13 12:00:00', '通辽', '["中国","内蒙古"]'),
	(3, '调查问卷02', '1.182.222.242', '2018-09-13 12:00:00', '乌海', '["中国","内蒙古"]'),
	(4, '调查问卷02', '1.183.222.242', '2018-09-13 12:00:00', '呼和浩特', '["中国","内蒙古"]'),
	(5, '调查问卷02', '1.184.222.242', '2018-09-13 12:00:00', '深圳', '["中国","广东"]'),
	(6, '调查问卷02', '1.185.222.242', '2018-09-13 12:00:00', '桂林', '["中国","广西"]'),
	(7, '调查问卷02', '1.186.222.242', '2018-09-13 12:00:00', '印度', '["印度"]'),
	(8, '调查问卷02', '1.187.222.242', '2018-09-13 12:00:00', '印度', '["印度"]'),
	(9, '调查问卷02', '1.188.222.242', '2018-09-13 12:00:00', '绥化', '["中国","黑龙江"]'),
	(10, '调查问卷02', '1.189.222.242', '2018-09-13 12:00:00', '哈尔滨', '["中国","黑龙江"]'),
	(11, '调查问卷02', '1.190.222.242', '2018-09-13 12:00:00', '哈尔滨', '["中国","黑龙江"]'),
	(12, '调查问卷02', '1.191.222.242', '2018-09-13 12:00:00', '大兴安岭地区', '["中国","黑龙江"]'),
	(13, '调查问卷02', '1.192.222.242', '2018-09-13 12:00:00', '郑州', '["中国","河南"]'),
	(14, '调查问卷02', '1.193.222.242', '2018-09-13 12:00:00', '开封', '["中国","河南"]'),
	(15, '调查问卷02', '1.194.222.242', '2018-09-13 12:00:00', '安阳', '["中国","河南"]');
/*!40000 ALTER TABLE `submitted_location` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
