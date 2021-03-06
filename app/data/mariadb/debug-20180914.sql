-- MySQL dump 10.16  Distrib 10.1.26-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: survey_report
-- ------------------------------------------------------
-- Server version	10.1.26-MariaDB-0+deb9u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `city_point`
--

DROP TABLE IF EXISTS `city_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city_point` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `x` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `y` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city_point`
--

LOCK TABLES `city_point` WRITE;
/*!40000 ALTER TABLE `city_point` DISABLE KEYS */;
INSERT INTO `city_point` VALUES (30,'大连','121.59347778','38.94870994','{\"address\":\"CN|辽宁|大连|None|CERNET|0|0\",\"content\":{\"address\":\"辽宁省大连市\",\"address_detail\":{\"city\":\"大连市\",\"city_code\":167,\"district\":\"\",\"province\":\"辽宁省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"121.59347778\",\"y\":\"38.94870994\"}},\"status\":0}'),(32,'上海','121.48789949','31.24916171','{\"address\":\"CN|上海|上海|None|CHINANET|0|0\",\"content\":{\"address\":\"上海市\",\"address_detail\":{\"city\":\"上海市\",\"city_code\":289,\"district\":\"\",\"province\":\"上海市\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"121.48789949\",\"y\":\"31.24916171\"}},\"status\":0}'),(33,'深圳','114.02597366','22.54605355','{\"address\":\"CN|广东|深圳|None|DXTNET|0|0\",\"content\":{\"address\":\"广东省深圳市\",\"address_detail\":{\"city\":\"深圳市\",\"city_code\":340,\"district\":\"\",\"province\":\"广东省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"114.02597366\",\"y\":\"22.54605355\"}},\"status\":0}'),(37,'江西','115.89352755','28.68957800','{\"address\":\"CN|江西|南昌|None|UNICOM|0|0\",\"content\":{\"address\":\"江西省南昌市\",\"address_detail\":{\"city\":\"南昌市\",\"city_code\":163,\"district\":\"\",\"province\":\"江西省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"115.89352755\",\"y\":\"28.68957800\"}},\"status\":0}'),(38,'福建','119.33022111','26.04712550','{\"address\":\"CN|福建|福州|None|UNICOM|0|0\",\"content\":{\"address\":\"福建省福州市\",\"address_detail\":{\"city\":\"福州市\",\"city_code\":300,\"district\":\"\",\"province\":\"福建省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"119.33022111\",\"y\":\"26.04712550\"}},\"status\":0}'),(40,'天津','117.21081309','39.14392990','{\"address\":\"CN|天津|天津|None|UNICOM|0|0\",\"content\":{\"address\":\"天津市\",\"address_detail\":{\"city\":\"天津市\",\"city_code\":332,\"district\":\"\",\"province\":\"天津市\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"117.21081309\",\"y\":\"39.14392990\"}},\"status\":0}'),(41,'赣州','114.93590908','25.84529554','{\"address\":\"CN|江西|赣州|None|CHINANET|0|0\",\"content\":{\"address\":\"江西省赣州市\",\"address_detail\":{\"city\":\"赣州市\",\"city_code\":365,\"district\":\"\",\"province\":\"江西省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"114.93590908\",\"y\":\"25.84529554\"}},\"status\":0}'),(46,'陕西','108.95309828','34.27779990','{\"address\":\"CN|陕西|西安|None|UNICOM|0|0\",\"content\":{\"address\":\"陕西省西安市\",\"address_detail\":{\"city\":\"西安市\",\"city_code\":233,\"district\":\"\",\"province\":\"陕西省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"108.95309828\",\"y\":\"34.27779990\"}},\"status\":0}'),(51,'沈阳','123.43279092','41.80864478','{\"address\":\"CN|辽宁|沈阳|None|CERNET|0|0\",\"content\":{\"address\":\"辽宁省沈阳市\",\"address_detail\":{\"city\":\"沈阳市\",\"city_code\":58,\"district\":\"\",\"province\":\"辽宁省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"123.43279092\",\"y\":\"41.80864478\"}},\"status\":0}'),(63,'抚州','116.36091887','27.95454517','{\"address\":\"CN|江西|抚州|None|CHINANET|0|0\",\"content\":{\"address\":\"江西省抚州市\",\"address_detail\":{\"city\":\"抚州市\",\"city_code\":226,\"district\":\"\",\"province\":\"江西省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"116.36091887\",\"y\":\"27.95454517\"}},\"status\":0}'),(64,'安徽','117.28269909','31.86694226','{\"address\":\"CN|安徽|合肥|None|CHINANET|0|0\",\"content\":{\"address\":\"安徽省合肥市\",\"address_detail\":{\"city\":\"合肥市\",\"city_code\":127,\"district\":\"\",\"province\":\"安徽省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"117.28269909\",\"y\":\"31.86694226\"}},\"status\":0}'),(72,'武汉','114.31620010','30.58108413','{\"address\":\"CN|湖北|武汉|None|CERNET|0|0\",\"content\":{\"address\":\"湖北省武汉市\",\"address_detail\":{\"city\":\"武汉市\",\"city_code\":218,\"district\":\"\",\"province\":\"湖北省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"114.31620010\",\"y\":\"30.58108413\"}},\"status\":0}'),(74,'河南','113.64964385','34.75661006','{\"address\":\"CN|河南|郑州|None|UNICOM|0|0\",\"content\":{\"address\":\"河南省郑州市\",\"address_detail\":{\"city\":\"郑州市\",\"city_code\":268,\"district\":\"\",\"province\":\"河南省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"113.64964385\",\"y\":\"34.75661006\"}},\"status\":0}'),(76,'浙江','120.21937542','30.25924446','{\"address\":\"CN|浙江|杭州|None|UNICOM|0|0\",\"content\":{\"address\":\"浙江省杭州市\",\"address_detail\":{\"city\":\"杭州市\",\"city_code\":179,\"district\":\"\",\"province\":\"浙江省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"120.21937542\",\"y\":\"30.25924446\"}},\"status\":0}'),(78,'广东','114.02597366','22.54605355','{\"address\":\"CN|广东|深圳|None|CHINANET|0|0\",\"content\":{\"address\":\"广东省深圳市\",\"address_detail\":{\"city\":\"深圳市\",\"city_code\":340,\"district\":\"\",\"province\":\"广东省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"114.02597366\",\"y\":\"22.54605355\"}},\"status\":0}'),(82,'南京','118.77807441','32.05723550','{\"address\":\"CN|江苏|南京|None|CERNET|0|0\",\"content\":{\"address\":\"江苏省南京市\",\"address_detail\":{\"city\":\"南京市\",\"city_code\":315,\"district\":\"\",\"province\":\"江苏省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"118.77807441\",\"y\":\"32.05723550\"}},\"status\":0}'),(83,'汉中','107.04547763','33.08156898','{\"address\":\"CN|陕西|汉中|None|UNICOM|0|0\",\"content\":{\"address\":\"陕西省汉中市\",\"address_detail\":{\"city\":\"汉中市\",\"city_code\":352,\"district\":\"\",\"province\":\"陕西省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"107.04547763\",\"y\":\"33.08156898\"}},\"status\":0}'),(84,'南昌','114.40003867','27.81112990','{\"address\":\"CN|江西|宜春|None|CMNET|0|0\",\"content\":{\"address\":\"江西省宜春市\",\"address_detail\":{\"city\":\"宜春市\",\"city_code\":278,\"district\":\"\",\"province\":\"江西省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"114.40003867\",\"y\":\"27.81112990\"}},\"status\":0}'),(87,'郑州','113.64964385','34.75661006','{\"address\":\"CN|河南|郑州|None|UNICOM|0|0\",\"content\":{\"address\":\"河南省郑州市\",\"address_detail\":{\"city\":\"郑州市\",\"city_code\":268,\"district\":\"\",\"province\":\"河南省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"113.64964385\",\"y\":\"34.75661006\"}},\"status\":0}'),(89,'江苏','120.61990712','31.31798737','{\"address\":\"CN|江苏|苏州|None|CHINANET|0|0\",\"content\":{\"address\":\"江苏省苏州市\",\"address_detail\":{\"city\":\"苏州市\",\"city_code\":224,\"district\":\"\",\"province\":\"江苏省\",\"street\":\"\",\"street_number\":\"\"},\"point\":{\"x\":\"120.61990712\",\"y\":\"31.31798737\"}},\"status\":0}');
/*!40000 ALTER TABLE `city_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submitted_location`
--

DROP TABLE IF EXISTS `submitted_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `submitted_location` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `student` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`id`),
  KEY `datetime` (`datetime`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submitted_location`
--

LOCK TABLES `submitted_location` WRITE;
/*!40000 ALTER TABLE `submitted_location` DISABLE KEYS */;
INSERT INTO `submitted_location` VALUES (39,'2018','肖铭扬','49.141.192.124','2018-09-13 19:41:19','大连','[\"中国\",\"辽宁\"]'),(40,'2018','蒋克文','175.190.90.151','2018-09-13 19:46:05','大连','[\"中国\",\"辽宁\"]'),(41,'2018','null','180.163.220.3','2018-09-13 20:40:11','上海','[\"中国\",\"上海\"]'),(42,'2018','马子昂','101.233.176.78','2018-09-13 23:49:17','深圳','[\"中国\",\"广东\"]'),(43,'2018','刘艳华','180.163.220.5','2018-09-14 04:07:47','上海','[\"中国\",\"上海\"]'),(44,'2018','null','49.141.192.159','2018-09-14 08:43:54','大连','[\"中国\",\"辽宁\"]'),(45,'2018','许欢','205.175.107.80','2018-09-13 17:56:28','美国','[\"美国\"]'),(46,'2018','邱智灵','49.141.192.201','2018-09-14 09:21:59','大连','[\"中国\",\"辽宁\"]'),(47,'2018','钟敏','118.212.199.72','2018-09-14 11:17:44','江西','[\"中国\"]'),(48,'2018','方渟','220.249.162.68','2018-09-14 11:17:54','福建','[\"中国\"]'),(49,'2018','刘海东','61.151.179.27','2018-09-14 11:20:10','上海','[\"中国\",\"上海\"]'),(50,'2018','王毅梦','125.39.45.236','2018-09-14 11:24:18','天津','[\"中国\",\"天津\"]'),(51,'2018','刘水有','218.87.254.176','2018-09-14 11:25:31','赣州','[\"中国\",\"江西\"]'),(52,'2018','杨冰琳','125.39.46.56','2018-09-14 11:24:41','天津','[\"中国\",\"天津\"]'),(53,'2018','鄢金','220.249.163.59','2018-09-14 11:27:50','福建','[\"中国\"]'),(54,'2018','刘红','61.129.6.148','2018-09-14 11:31:11','上海','[\"中国\",\"上海\"]'),(55,'2018','刘红','223.166.151.235','2018-09-14 11:32:10','上海','[\"中国\",\"上海\"]'),(56,'2018','高振国','113.200.107.67','2018-09-14 11:44:30','陕西','[\"中国\"]'),(57,'2018','周波','14.116.137.166','2018-09-14 11:45:04','深圳','[\"中国\",\"广东\"]'),(58,'2018','刘红','14.116.137.166','2018-09-14 11:45:39','深圳','[\"中国\",\"广东\"]'),(59,'2018','谢丽华','61.180.66.170','2018-09-14 12:03:05','赣州','[\"中国\",\"江西\"]'),(60,'2018','刘启昊','111.75.248.70','2018-09-14 12:06:48','赣州','[\"中国\",\"江西\"]'),(61,'2018','卢贺成','210.30.193.156','2018-09-14 12:12:09','沈阳','[\"中国\",\"辽宁\"]'),(62,'2018','刘红','61.129.8.199','2018-09-14 12:17:01','上海','[\"中国\",\"上海\"]'),(63,'2018','黄婷婷','125.39.46.19','2018-09-14 12:18:22','天津','[\"中国\",\"天津\"]'),(64,'2018','季延桦','101.226.225.59','2018-09-14 12:21:13','上海','[\"中国\",\"上海\"]'),(65,'2018','汪会婷','61.129.6.148','2018-09-14 12:21:37','上海','[\"中国\",\"上海\"]'),(66,'2018','余伟勇','182.101.189.150','2018-09-14 12:22:07','赣州','[\"中国\",\"江西\"]'),(67,'2018','刘红','101.226.225.59','2018-09-14 12:23:42','上海','[\"中国\",\"上海\"]'),(68,'2018','黎萍','125.39.46.19','2018-09-14 12:35:50','天津','[\"中国\",\"天津\"]'),(69,'2018','武小利','183.3.255.28','2018-09-14 12:48:02','深圳','[\"中国\",\"广东\"]'),(70,'2018','付灵芝','113.97.56.4','2018-09-14 12:52:09','深圳','[\"中国\",\"广东\"]'),(71,'2018','吴玉华','14.116.133.169','2018-09-14 12:56:34','深圳','[\"中国\",\"广东\"]'),(72,'2018','邱家斌','140.243.183.80','2018-09-14 13:09:55','福建','[\"中国\"]'),(73,'2018','刘红','111.72.29.5','2018-09-14 13:11:20','抚州','[\"中国\",\"江西\"]'),(74,'2018','朱静怡','183.162.30.204','2018-09-14 13:21:24','安徽','[\"中国\"]'),(75,'2018','刘红','61.129.8.199','2018-09-14 13:27:28','上海','[\"中国\",\"上海\"]'),(76,'2018','何文君','106.6.92.239','2018-09-14 13:31:46','赣州','[\"中国\",\"江西\"]'),(77,'2018','毛丽霞','182.104.72.96','2018-09-14 13:34:29','江西','[\"中国\"]'),(78,'2018','李小东','223.166.151.238','2018-09-14 13:36:01','上海','[\"中国\",\"上海\"]'),(79,'2018','郭强','49.141.192.237','2018-09-14 13:54:48','大连','[\"中国\",\"辽宁\"]'),(80,'2018','王旭昇','211.94.236.184','2018-09-14 14:08:47','天津','[\"中国\",\"天津\"]'),(81,'2018','刘艳清','113.96.231.120','2018-09-14 15:21:58','深圳','[\"中国\",\"广东\"]'),(82,'2018','张虎金','222.20.63.178','2018-09-14 15:25:14','武汉','[\"中国\",\"湖北\"]'),(83,'2018','张志鹏','61.151.178.171','2018-09-14 16:01:14','上海','[\"中国\",\"上海\"]'),(84,'2018','杨冬莲','61.158.148.96','2018-09-14 16:05:24','河南','[\"中国\"]'),(85,'2018','边万里','171.10.82.77','2018-09-14 16:10:08','河南','[\"中国\"]'),(86,'2018','王其帅','124.160.218.98','2018-09-14 16:13:17','浙江','[\"中国\"]'),(87,'2018','周慧敏','61.158.149.95','2018-09-14 16:25:25','河南','[\"中国\"]'),(88,'2018','李梦然','113.115.47.212','2018-09-14 16:32:09','广东','[\"中国\"]'),(89,'2018','雷智荣','157.255.172.24','2018-09-14 16:44:02','深圳','[\"中国\",\"广东\"]'),(90,'2018','刘红','14.116.133.171','2018-09-14 16:48:42','深圳','[\"中国\",\"广东\"]'),(91,'2018','谢焕宝','14.116.133.171','2018-09-14 16:56:18','深圳','[\"中国\",\"广东\"]'),(92,'2018','张金颖','223.3.123.8','2018-09-14 17:04:36','南京','[\"中国\",\"江苏\"]'),(93,'2018','赵玉基','113.201.30.137','2018-09-14 17:03:44','汉中','[\"中国\",\"陕西\"]'),(94,'2018','邹桂生','117.169.71.71','2018-09-14 17:08:31','南昌','[\"中国\",\"江西\"]'),(95,'2018','胡成','113.96.218.51','2018-09-14 17:18:36','深圳','[\"中国\",\"广东\"]'),(96,'2018','何莹','123.151.77.123','2018-09-14 17:22:33','天津','[\"中国\",\"天津\"]'),(97,'2018','张权','115.60.51.156','2018-09-14 18:00:13','郑州','[\"中国\",\"河南\"]'),(98,'2018','房惠法','49.141.192.110','2018-09-14 18:05:38','大连','[\"中国\",\"辽宁\"]'),(99,'2018','黄过娴','49.90.146.176','2018-09-14 18:28:07','江苏','[\"中国\"]'),(100,'2018','祝灿','125.39.46.59','2018-09-14 19:16:32','天津','[\"中国\",\"天津\"]');
/*!40000 ALTER TABLE `submitted_location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-14 19:36:00
