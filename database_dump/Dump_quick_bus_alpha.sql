CREATE DATABASE  IF NOT EXISTS `quick_bus_alpha` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quick_bus_alpha`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: quick_bus_alpha
-- ------------------------------------------------------
-- Server version	5.6.12-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_groups_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admin','2014-01-14 20:40:43',NULL),(2,'guest','2014-01-14 20:40:57',NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phone_numbers`
--

DROP TABLE IF EXISTS `phone_numbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phone_numbers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_station_id` int(10) unsigned DEFAULT NULL,
  `phone_number` char(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_phone_numbers_id` (`id`),
  KEY `FK_phone_numbers_user_station_points_id` (`user_station_id`),
  CONSTRAINT `FK_phone_numbers_user_station_points_id` FOREIGN KEY (`user_station_id`) REFERENCES `user_station_points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (18,41,'15216656707'),(19,41,'13918002736'),(20,42,'13918002736'),(21,42,'15516617777'),(22,58,'15216656707'),(23,59,'15216656708'),(39,62,'15216656707'),(40,62,'13524677703'),(41,62,'15821765327'),(42,63,'15216656707'),(43,64,'15216656707'),(44,65,'15216656707'),(45,65,'13524677703'),(46,65,'15821765327'),(47,66,'15216656707'),(48,66,'13524677703'),(49,66,'15821765327'),(50,67,'15216656707'),(51,67,'13524677703'),(52,67,'15821765327');
/*!40000 ALTER TABLE `phone_numbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `real_time_positions`
--

DROP TABLE IF EXISTS `real_time_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `real_time_positions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `user_route_id` int(10) unsigned NOT NULL,
  `latitude` decimal(12,8) NOT NULL,
  `longitude` decimal(12,8) NOT NULL,
  `heading` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_real_time_positions_id` (`id`),
  KEY `FK_real_time_positions_user_routes_id` (`user_route_id`),
  KEY `FK_real_time_positions_users_id` (`user_id`),
  CONSTRAINT `FK_real_time_positions_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_real_time_positions_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_time_positions`
--

LOCK TABLES `real_time_positions` WRITE;
/*!40000 ALTER TABLE `real_time_positions` DISABLE KEYS */;
INSERT INTO `real_time_positions` VALUES (11010,7,29,31.13330764,121.57287787,0,'2014-05-29 06:02:51','2014-05-29 06:02:52'),(11011,7,29,31.13319208,121.57275426,0,'2014-05-29 06:02:58','2014-05-29 06:02:59'),(11012,7,29,31.13319654,121.57286308,0,'2014-05-29 06:03:05','2014-05-29 06:03:07'),(11013,7,29,31.13317115,121.57287066,0,'2014-05-29 06:03:19','2014-05-29 06:03:20'),(11014,7,29,31.13318657,121.57287722,0,'2014-05-29 06:03:26','2014-05-29 06:03:27'),(11015,7,29,31.13337089,121.57273919,337,'2014-05-29 06:03:34','2014-05-29 06:03:35'),(11016,7,29,31.13396387,121.57283395,93,'2014-05-29 06:03:46','2014-05-29 06:03:47'),(11017,7,29,31.13409328,121.57334820,82,'2014-05-29 06:03:53','2014-05-29 06:03:54'),(11018,7,29,31.13411222,121.57357135,99,'2014-05-29 06:04:00','2014-05-29 06:04:01'),(11019,7,29,31.13411222,121.57357135,99,'2014-05-29 06:04:07','2014-05-29 06:04:08'),(11020,7,29,31.13434728,121.57364728,10,'2014-05-29 06:04:16','2014-05-29 06:04:17'),(11021,7,29,31.13489213,121.57368047,358,'2014-05-29 06:04:21','2014-05-29 06:04:22'),(11022,7,29,31.13543750,121.57369200,359,'2014-05-29 06:04:28','2014-05-29 06:04:29'),(11023,7,29,31.13664430,121.57356435,353,'2014-05-29 06:04:41','2014-05-29 06:04:42'),(11024,7,29,31.13714170,121.57257633,264,'2014-05-29 06:04:57','2014-05-29 06:04:58'),(11025,7,29,31.13716665,121.57027960,267,'2014-05-29 06:05:12','2014-05-29 06:05:13'),(11026,7,29,31.13759351,121.56894683,339,'2014-05-29 06:05:26','2014-05-29 06:05:27'),(11027,7,29,31.13943623,121.56813096,339,'2014-05-29 06:05:42','2014-05-29 06:05:43'),(11028,7,29,31.14006942,121.56787054,338,'2014-05-29 06:05:48','2014-05-29 06:05:49'),(11029,7,29,31.14051265,121.56763294,321,'2014-05-29 06:06:05','2014-05-29 06:06:06'),(11030,7,29,31.14051265,121.56763294,321,'2014-05-29 06:06:12','2014-05-29 06:06:13'),(11031,7,29,31.14121022,121.56729214,339,'2014-05-29 06:06:26','2014-05-29 06:06:27'),(11032,7,29,31.14183353,121.56701079,337,'2014-05-29 06:06:34','2014-05-29 06:06:35'),(11033,7,29,31.14294771,121.56643834,332,'2014-05-29 06:06:45','2014-05-29 06:06:46'),(11034,7,29,31.14357719,121.56603663,330,'2014-05-29 06:06:52','2014-05-29 06:06:53'),(11035,7,29,31.14385834,121.56585498,328,'2014-05-29 06:06:59','2014-05-29 06:07:00'),(11036,7,29,31.14385834,121.56585498,328,'2014-05-29 06:07:06','2014-05-29 06:07:07'),(11037,7,29,31.14385834,121.56585498,328,'2014-05-29 06:07:13','2014-05-29 06:07:14'),(11038,7,29,31.14385834,121.56585498,328,'2014-05-29 06:07:20','2014-05-29 06:07:21'),(11039,7,29,31.14385834,121.56585498,328,'2014-05-29 06:07:27','2014-05-29 06:07:28'),(11040,7,29,31.14394008,121.56574570,309,'2014-05-29 06:07:34','2014-05-29 06:07:35'),(11041,7,29,31.14386650,121.56509365,243,'2014-05-29 06:07:39','2014-05-29 06:07:40'),(11042,7,29,31.14355692,121.56432729,241,'2014-05-29 06:07:46','2014-05-29 06:07:47'),(11043,7,29,31.14339507,121.56357151,286,'2014-05-29 06:07:53','2014-05-29 06:07:54'),(11044,7,29,31.14391684,121.56333218,357,'2014-05-29 06:07:59','2014-05-29 06:08:00'),(11045,7,29,31.14465032,121.56336758,0,'2014-05-29 06:08:06','2014-05-29 06:08:07'),(11046,7,29,31.14630603,121.56345587,15,'2014-05-29 06:08:19','2014-05-29 06:08:20'),(11047,7,29,31.14656937,121.56391577,83,'2014-05-29 06:08:27','2014-05-29 06:08:28'),(11048,7,29,31.14668414,121.56589172,83,'2014-05-29 06:08:40','2014-05-29 06:08:41'),(11049,7,29,31.14682093,121.56743323,83,'2014-05-29 06:08:48','2014-05-29 06:08:49'),(11050,7,29,31.14713430,121.57003874,79,'2014-05-29 06:08:59','2014-05-29 06:09:01'),(11051,7,29,31.14739893,121.57212828,84,'2014-05-29 06:09:09','2014-05-29 06:09:10'),(11052,7,29,31.14751487,121.57353883,83,'2014-05-29 06:09:14','2014-05-29 06:09:15'),(11053,7,29,31.14767891,121.57527104,82,'2014-05-29 06:09:22','2014-05-29 06:09:23'),(11054,7,29,31.14789112,121.57734049,83,'2014-05-29 06:09:30','2014-05-29 06:09:31'),(11055,7,29,31.14802990,121.57916892,84,'2014-05-29 06:09:37','2014-05-29 06:09:38'),(11056,7,29,31.14823302,121.58124642,83,'2014-05-29 06:09:45','2014-05-29 06:09:46'),(11057,7,29,31.14846798,121.58354528,83,'2014-05-29 06:09:54','2014-05-29 06:09:55'),(11058,7,29,31.14861233,121.58506576,83,'2014-05-29 06:09:59','2014-05-29 06:10:00'),(11059,7,29,31.14874635,121.58688188,87,'2014-05-29 06:10:07','2014-05-29 06:10:08'),(11060,7,29,31.14862087,121.58876965,102,'2014-05-29 06:10:14','2014-05-29 06:10:16'),(11061,7,29,31.14829317,121.59064607,82,'2014-05-29 06:10:23','2014-05-29 06:10:24'),(11062,7,29,31.14897510,121.59170414,29,'2014-05-29 06:10:29','2014-05-29 06:10:30'),(11063,7,29,31.15034558,121.59163331,326,'2014-05-29 06:10:38','2014-05-29 06:10:39'),(11064,7,29,31.15132865,121.59060345,319,'2014-05-29 06:10:44','2014-05-29 06:10:45'),(11065,7,29,31.15276125,121.58960580,334,'2014-05-29 06:10:54','2014-05-29 06:10:55'),(11066,7,29,31.15372740,121.58908163,339,'2014-05-29 06:10:59','2014-05-29 06:11:00'),(11067,7,29,31.15495118,121.58861908,340,'2014-05-29 06:11:08','2014-05-29 06:11:09'),(11068,7,29,31.15579889,121.58831195,345,'2014-05-29 06:11:14','2014-05-29 06:11:16'),(11069,7,29,31.15654892,121.58805544,342,'2014-05-29 06:11:23','2014-05-29 06:11:24'),(11070,7,29,31.15714527,121.58781064,341,'2014-05-29 06:11:29','2014-05-29 06:11:30'),(11071,7,29,31.15780186,121.58757742,349,'2014-05-29 06:11:37','2014-05-29 06:11:38'),(11072,7,29,31.15854523,121.58739296,344,'2014-05-29 06:11:44','2014-05-29 06:11:46'),(11073,7,29,31.15929301,121.58709731,342,'2014-05-29 06:11:52','2014-05-29 06:11:53'),(11074,7,29,31.16015458,121.58681219,346,'2014-05-29 06:11:59','2014-05-29 06:12:00'),(11075,7,29,31.16102609,121.58651161,339,'2014-05-29 06:12:07','2014-05-29 06:12:08'),(11076,7,29,31.16297568,121.58569116,341,'2014-05-29 06:12:20','2014-05-29 06:12:21'),(11077,7,29,31.16418042,121.58514840,336,'2014-05-29 06:12:27','2014-05-29 06:12:28'),(11078,7,29,31.16499172,121.58472478,338,'2014-05-29 06:12:35','2014-05-29 06:12:36'),(11079,7,29,31.16603166,121.58424843,340,'2014-05-29 06:12:43','2014-05-29 06:12:44'),(11080,7,29,31.16691414,121.58382339,331,'2014-05-29 06:12:49','2014-05-29 06:12:50'),(11081,7,29,31.16801768,121.58329399,338,'2014-05-29 06:12:57','2014-05-29 06:12:58'),(11082,7,29,31.16938793,121.58259672,338,'2014-05-29 06:13:04','2014-05-29 06:13:05'),(11083,7,29,31.17060557,121.58199168,337,'2014-05-29 06:13:12','2014-05-29 06:13:13'),(11084,7,29,31.17209849,121.58132486,338,'2014-05-29 06:13:19','2014-05-29 06:13:21'),(11085,7,29,31.17349827,121.58075503,339,'2014-05-29 06:13:27','2014-05-29 06:13:28'),(11086,7,29,31.17513757,121.58003680,339,'2014-05-29 06:13:34','2014-05-29 06:13:35'),(11087,7,29,31.17686538,121.57932262,342,'2014-05-29 06:13:43','2014-05-29 06:13:44'),(11088,7,29,31.17944758,121.57860631,347,'2014-05-29 06:13:55','2014-05-29 06:13:56'),(11089,7,29,31.18139412,121.57810311,348,'2014-05-29 06:14:03','2014-05-29 06:14:04'),(11090,7,29,31.18267601,121.57774482,346,'2014-05-29 06:14:10','2014-05-29 06:14:11'),(11091,7,29,31.18420717,121.57731169,345,'2014-05-29 06:14:18','2014-05-29 06:14:19'),(11092,7,29,31.18545805,121.57700546,346,'2014-05-29 06:14:24','2014-05-29 06:14:25'),(11093,7,29,31.18687143,121.57667447,347,'2014-05-29 06:14:32','2014-05-29 06:14:33'),(11094,7,29,31.18851238,121.57623455,347,'2014-05-29 06:14:39','2014-05-29 06:14:41'),(11095,7,29,31.19017040,121.57578581,346,'2014-05-29 06:14:48','2014-05-29 06:14:49'),(11096,7,29,31.19157741,121.57540802,347,'2014-05-29 06:14:54','2014-05-29 06:14:55'),(11097,7,29,31.19323396,121.57498511,347,'2014-05-29 06:15:03','2014-05-29 06:15:04'),(11098,7,29,31.19467865,121.57462229,347,'2014-05-29 06:15:10','2014-05-29 06:15:11'),(11099,7,29,31.19645970,121.57416242,346,'2014-05-29 06:15:18','2014-05-29 06:15:19'),(11100,7,29,31.19805146,121.57373868,347,'2014-05-29 06:15:25','2014-05-29 06:15:26'),(11101,7,29,31.20012198,121.57321402,347,'2014-05-29 06:15:34','2014-05-29 06:15:35'),(11102,7,29,31.20152017,121.57285004,346,'2014-05-29 06:15:42','2014-05-29 06:15:43'),(11103,7,29,31.20316727,121.57244616,348,'2014-05-29 06:15:54','2014-05-29 06:15:55'),(11104,7,29,31.20517266,121.57194764,348,'2014-05-29 06:16:06','2014-05-29 06:16:07'),(11105,7,29,31.20707734,121.57149757,348,'2014-05-29 06:16:09','2014-05-29 06:16:10'),(11106,7,29,31.20845753,121.57121177,349,'2014-05-29 06:16:17','2014-05-29 06:16:18'),(11107,7,29,31.21000346,121.57081817,353,'2014-05-29 06:16:24','2014-05-29 06:16:25'),(11108,7,29,31.21140403,121.57043257,347,'2014-05-29 06:16:32','2014-05-29 06:16:33'),(11109,7,29,31.21300987,121.57007680,347,'2014-05-29 06:16:40','2014-05-29 06:16:41'),(11110,7,29,31.21458784,121.56967771,347,'2014-05-29 06:16:49','2014-05-29 06:16:50'),(11111,7,29,31.21692678,121.56908280,349,'2014-05-29 06:17:03','2014-05-29 06:17:04'),(11112,7,29,31.21877559,121.56865691,350,'2014-05-29 06:17:10','2014-05-29 06:17:11'),(11113,7,29,31.22050742,121.56822708,348,'2014-05-29 06:17:19','2014-05-29 06:17:20'),(11114,7,29,31.22165322,121.56798546,350,'2014-05-29 06:17:24','2014-05-29 06:17:25'),(11115,7,29,31.22290765,121.56773188,348,'2014-05-29 06:17:32','2014-05-29 06:17:33'),(11116,7,29,31.22438848,121.56740611,349,'2014-05-29 06:17:39','2014-05-29 06:17:40'),(11117,7,29,31.22570570,121.56709096,345,'2014-05-29 06:17:47','2014-05-29 06:17:48'),(11118,7,29,31.22715127,121.56670648,347,'2014-05-29 06:17:55','2014-05-29 06:17:56'),(11119,7,29,31.22871844,121.56628414,345,'2014-05-29 06:18:17','2014-05-29 06:18:18'),(11120,7,29,31.22871844,121.56628414,345,'2014-05-29 06:18:25','2014-05-29 06:18:26'),(11121,7,29,31.22871844,121.56628414,345,'2014-05-29 06:18:33','2014-05-29 06:18:34'),(11122,7,29,31.22871844,121.56628414,345,'2014-05-29 06:18:41','2014-05-29 06:18:42'),(11123,7,29,31.22627976,121.55928396,15,'2014-05-29 06:20:49','2014-05-29 06:20:50'),(11124,7,29,31.22625798,121.55888769,245,'2014-05-29 06:20:56','2014-05-29 06:20:57'),(11125,7,29,31.22570254,121.55741200,243,'2014-05-29 06:21:09','2014-05-29 06:21:10'),(11126,7,29,31.22518172,121.55657909,245,'2014-05-29 06:21:17','2014-05-29 06:21:18'),(11127,7,29,31.22494895,121.55601895,245,'2014-05-29 06:21:23','2014-05-29 06:21:24'),(11128,7,29,31.22491678,121.55590101,244,'2014-05-29 06:21:33','2014-05-29 06:21:34'),(11129,7,29,31.22494450,121.55581150,244,'2014-05-29 06:21:38','2014-05-29 06:21:39'),(11130,7,29,31.22494450,121.55581150,244,'2014-05-29 06:21:46','2014-05-29 06:21:47'),(11131,7,29,31.22494450,121.55581150,244,'2014-05-29 06:21:55','2014-05-29 06:21:56');
/*!40000 ALTER TABLE `real_time_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_notify_phone_history`
--

DROP TABLE IF EXISTS `user_notify_phone_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_notify_phone_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `real_time_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `username` varchar(50) NOT NULL,
  `user_route_id` int(10) unsigned NOT NULL,
  `route_name` varchar(50) NOT NULL,
  `station_sequence` int(10) unsigned NOT NULL,
  `station_name` varchar(50) NOT NULL,
  `phone_number` char(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_table1_id` (`id`),
  KEY `FK_user_notify_phone_history_real_time_positions_id` (`real_time_id`),
  CONSTRAINT `FK_user_notify_phone_history_real_time_positions_id` FOREIGN KEY (`real_time_id`) REFERENCES `real_time_positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_notify_phone_history`
--

LOCK TABLES `user_notify_phone_history` WRITE;
/*!40000 ALTER TABLE `user_notify_phone_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_notify_phone_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_route_points`
--

DROP TABLE IF EXISTS `user_route_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_route_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_route_id` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `latitude` decimal(12,8) NOT NULL,
  `longitude` decimal(12,8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_route_points_id` (`id`),
  KEY `FK_user_route_points_user_routes_id` (`user_route_id`),
  CONSTRAINT `FK_user_route_points_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=149 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_route_points`
--

LOCK TABLES `user_route_points` WRITE;
/*!40000 ALTER TABLE `user_route_points` DISABLE KEYS */;
INSERT INTO `user_route_points` VALUES (28,8,1,31.20869060,121.53531075),(29,8,2,31.20178983,121.54303551),(30,8,3,31.18974899,121.54887199),(31,8,4,31.17080358,121.55608177),(32,8,5,31.16551582,121.55934334),(33,8,6,31.15023839,121.56260490),(34,9,1,31.13716248,121.57311916),(35,9,2,31.13672169,121.56316280),(36,9,3,31.13628089,121.55346394),(37,9,4,31.13510543,121.54745579),(38,9,5,31.13826445,121.54625416),(39,9,6,31.15486595,121.54196262),(40,9,7,31.16713155,121.54161930),(41,9,8,31.17131765,121.54144764),(42,9,9,31.18152509,121.53784275),(43,9,10,31.18996926,121.53595448),(44,9,11,31.19944052,121.53380871),(45,9,12,31.20443274,121.53398037),(46,9,13,31.20891083,121.53552532),(47,9,14,31.21426958,121.53767109),(48,9,15,31.21830679,121.54033184),(49,9,16,31.21955462,121.54213428),(50,9,17,31.22058223,121.54058933),(51,10,1,31.24127892,121.49033546),(52,10,2,31.22028863,121.53788567),(53,11,1,31.24670921,121.50492668),(54,11,2,31.21456320,121.48381233),(55,11,3,31.24274659,121.44879341),(56,12,1,31.23716930,121.47471428),(57,12,2,31.21250783,121.54904366),(74,17,1,31.22438541,121.53435459),(75,17,2,31.21991502,121.54215746),(76,17,3,31.21440978,121.53743677),(77,17,4,31.20433253,121.53380871),(78,17,5,31.19922688,121.53380871),(79,17,6,31.18956176,121.53560772),(110,25,1,31.25756886,121.51050568),(111,25,2,31.24876383,121.49848938),(112,25,3,31.24348042,121.48029327),(113,26,1,31.24626893,121.48501396),(114,26,2,31.21368233,121.54355049),(115,26,3,31.24480130,121.56226158),(116,27,1,31.24509483,121.47299767),(117,27,2,31.20281764,121.54320717),(118,27,3,31.25903628,121.51711464),(119,28,1,31.22146304,121.54092193),(120,28,2,31.21981153,121.53967738),(121,28,3,31.21920596,121.53804660),(122,28,4,31.21949957,121.53684497),(123,28,5,31.22043543,121.53602958),(124,28,6,31.21993998,121.53444171),(125,28,7,31.21900411,121.53388381),(126,28,8,31.21575603,121.53260708),(127,28,9,31.21432463,121.53731704),(128,28,10,31.20916776,121.53519273),(129,28,11,31.20439603,121.53369069),(130,28,12,31.19944052,121.53374434),(131,28,13,31.18963885,121.53580427),(132,28,14,31.18163524,121.53764963),(133,28,15,31.17337392,121.54069662),(134,28,16,31.16724172,121.54134035),(135,28,17,31.15549028,121.54155493),(136,28,18,31.14641865,121.54378653),(137,28,19,31.13499523,121.54717684),(138,28,20,31.13609723,121.55352831),(139,28,21,31.13664822,121.56318426),(140,28,22,31.13714411,121.57231450),(141,29,1,31.13718085,121.57231450),(142,29,2,31.13685025,121.56317353),(143,29,3,31.14652883,121.56339884),(144,29,4,31.14943038,121.59088612),(145,29,5,31.17983617,121.57852650),(146,29,6,31.21059924,121.57084465),(147,29,7,31.22865595,121.56638145),(148,29,8,31.22105934,121.54443026);
/*!40000 ALTER TABLE `user_route_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_routes`
--

DROP TABLE IF EXISTS `user_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_routes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_routes_id` (`id`),
  KEY `FK_user_routes_user_accounts_id` (`user_id`),
  CONSTRAINT `FK_user_routes_user_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_routes`
--

LOCK TABLES `user_routes` WRITE;
/*!40000 ALTER TABLE `user_routes` DISABLE KEYS */;
INSERT INTO `user_routes` VALUES (8,6,'沪南路1','2014-03-30 12:57:54','2014-03-30 12:57:54'),(9,6,'锦绣路','2014-04-02 12:43:18','2014-04-02 12:43:18'),(10,6,'试验1','2014-04-05 00:56:49','2014-04-05 00:56:49'),(11,6,'试验2','2014-04-05 00:57:28','2014-04-05 00:57:28'),(12,6,'试验3','2014-04-05 00:57:52','2014-04-05 00:57:52'),(17,7,'公司实验线路','2014-04-10 02:23:30','2014-04-10 02:23:30'),(25,9,'lineyank','2014-04-12 02:02:14','2014-04-12 02:02:14'),(26,7,'has_heading','2014-04-28 13:39:19','2014-04-28 13:39:19'),(27,7,'has_heading_2','2014-04-28 13:43:01','2014-04-28 13:43:01'),(28,7,'锦绣线','2014-05-03 10:16:59','2014-05-03 10:16:59'),(29,7,'罗山路线','2014-05-28 22:04:56','2014-05-28 22:04:56');
/*!40000 ALTER TABLE `user_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_station_points`
--

DROP TABLE IF EXISTS `user_station_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_station_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_route_id` int(10) unsigned NOT NULL,
  `sequence` int(10) unsigned NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `latitude` decimal(12,8) NOT NULL,
  `longitude` decimal(12,8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_station_points_id` (`id`),
  KEY `FK_user_station_points_user_routes_id` (`user_route_id`),
  CONSTRAINT `FK_user_station_points_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_station_points`
--

LOCK TABLES `user_station_points` WRITE;
/*!40000 ALTER TABLE `user_station_points` DISABLE KEYS */;
INSERT INTO `user_station_points` VALUES (18,8,1,NULL,31.19576960,121.54612541),(19,8,2,NULL,31.17315361,121.55522346),(20,8,3,NULL,31.15141366,121.56226158),(21,9,1,NULL,31.14641865,121.54402256),(22,9,2,NULL,31.18174538,121.53767109),(23,9,3,NULL,31.19929369,121.53380871),(24,9,4,NULL,31.21441639,121.53784275),(25,10,1,NULL,31.22850916,121.52003288),(26,11,1,NULL,31.22483937,121.47128105),(27,12,1,NULL,31.22351821,121.51488304),(41,17,1,'上海科技馆',31.22064242,121.54071808),(42,17,2,'花木路',31.21438996,121.53736295),(43,17,3,'龙阳路',31.19937444,121.53385162),(44,17,4,'高科西路',31.19123142,121.53525581),(57,25,1,'yank1',31.24891059,121.49763107),(58,26,1,'aa',31.23056418,121.51299477),(59,26,2,'bb',31.23467408,121.55608177),(60,27,1,'a1',31.22028863,121.51368141),(61,27,2,'a2',31.23995799,121.52569771),(62,28,1,'龙阳路站',31.19922027,121.53374434),(63,28,2,'成山路站',31.18163524,121.53756380),(64,28,3,'华夏西路站',31.16158652,121.54138327),(65,29,1,'外环路站',31.14551878,121.56336665),(66,29,2,'16号线罗山路站',31.15508630,121.58850431),(67,29,3,'芳甸路站',31.22531645,121.55671477);
/*!40000 ALTER TABLE `user_station_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_trigger_points`
--

DROP TABLE IF EXISTS `user_trigger_points`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_trigger_points` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_station_id` int(10) unsigned NOT NULL,
  `latitude` decimal(12,8) NOT NULL,
  `longitude` decimal(12,8) NOT NULL,
  `heading` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_trigger_points_id` (`id`),
  KEY `FK_user_trigger_points_user_station_points_id` (`user_station_id`),
  CONSTRAINT `FK_user_trigger_points_user_station_points_id` FOREIGN KEY (`user_station_id`) REFERENCES `user_station_points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trigger_points`
--

LOCK TABLES `user_trigger_points` WRITE;
/*!40000 ALTER TABLE `user_trigger_points` DISABLE KEYS */;
INSERT INTO `user_trigger_points` VALUES (10,18,31.20428591,121.54046059,0),(11,19,31.18637140,121.55024529,0),(12,20,31.16860038,121.55762672,0),(13,21,31.13679515,121.56608105,0),(14,22,31.14612481,121.54410839,0),(15,23,31.17337392,121.54076099,0),(16,24,31.18952871,121.53604031,0),(17,25,31.23584831,121.50286675,0),(18,26,31.23100453,121.49428368,0),(19,27,31.23217881,121.48964882,0),(33,41,31.22344555,121.53592701,0),(34,42,31.22029010,121.54138927,0),(35,43,31.21352965,121.53709774,0),(36,44,31.20545465,121.53421039,0),(49,57,31.24797501,121.49585009,0),(50,58,31.24142569,121.49359703,120),(51,59,31.22205023,121.54818535,31),(52,60,31.23658219,121.48707390,122),(53,61,31.22836237,121.53136253,335),(54,62,31.20913106,121.53519273,197),(55,63,31.18971228,121.53576136,168),(56,64,31.17355751,121.54061079,160),(57,65,31.14522495,121.56334519,1),(58,66,31.15427833,121.58897638,338),(59,67,31.22583023,121.55810952,250);
/*!40000 ALTER TABLE `user_trigger_points` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` char(40) NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_accounts_id` (`id`),
  KEY `FK_user_accounts_user_groups_id` (`group_id`),
  CONSTRAINT `FK_user_accounts_user_groups_id` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'admin','d4c8b97a3775741bac3b92c901f3e1a1094d442b',1,'2014-02-10 20:59:38','2014-02-10 20:59:38'),(7,'guest1','d4c8b97a3775741bac3b92c901f3e1a1094d442b',2,'2014-04-06 11:00:08','2014-04-06 11:00:08'),(8,'forjzt','a71fa1a2c396b4bfb13cd2925dbb291550ae37ff',2,'2014-04-12 01:57:41','2014-04-12 01:57:41'),(9,'yank','e760237175b84dce2f77aedbda80af991dc9aa8c',2,'2014-04-12 01:57:50','2014-04-12 01:57:50'),(10,'francis','29d1586e179658e6e205b14c459cb0b4e190022e',2,'2014-04-12 01:57:51','2014-04-12 01:57:51'),(11,'lyc8412','e760237175b84dce2f77aedbda80af991dc9aa8c',2,'2014-05-25 03:22:18','2014-05-25 03:22:18');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_subquery_eligible_gps`
--

DROP TABLE IF EXISTS `view_subquery_eligible_gps`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_gps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_eligible_gps` (
  `id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL,
  `heading` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `station_sequence` tinyint NOT NULL,
  `station_name` tinyint NOT NULL,
  `trigger_lat` tinyint NOT NULL,
  `trigger_lng` tinyint NOT NULL,
  `trigger_heading` tinyint NOT NULL,
  `time_diff` tinyint NOT NULL,
  `gps_diff` tinyint NOT NULL,
  `heading_diff` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_subquery_eligible_stations`
--

DROP TABLE IF EXISTS `view_subquery_eligible_stations`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_stations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_eligible_stations` (
  `real_time_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `station_sequence` tinyint NOT NULL,
  `cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_subquery_route_point_cnt`
--

DROP TABLE IF EXISTS `view_subquery_route_point_cnt`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_point_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_route_point_cnt` (
  `user_route_id` tinyint NOT NULL,
  `route_point_cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_subquery_station_cnt`
--

DROP TABLE IF EXISTS `view_subquery_station_cnt`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_station_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_station_cnt` (
  `user_route_id` tinyint NOT NULL,
  `station_cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_subquery_trigger_cnt`
--

DROP TABLE IF EXISTS `view_subquery_trigger_cnt`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_trigger_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_trigger_cnt` (
  `user_route_id` tinyint NOT NULL,
  `trigger_cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_notify_phone`
--

DROP TABLE IF EXISTS `view_user_notify_phone`;
/*!50001 DROP VIEW IF EXISTS `view_user_notify_phone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_notify_phone` (
  `real_time_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `station_sequence` tinyint NOT NULL,
  `station_name` tinyint NOT NULL,
  `phone_number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_route_detail`
--

DROP TABLE IF EXISTS `view_user_route_detail`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_route_detail` (
  `user_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `station_sequence` tinyint NOT NULL,
  `station_name` tinyint NOT NULL,
  `station_lng` tinyint NOT NULL,
  `station_lat` tinyint NOT NULL,
  `trigger_lng` tinyint NOT NULL,
  `trigger_lat` tinyint NOT NULL,
  `trigger_heading` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_route_phone_number`
--

DROP TABLE IF EXISTS `view_user_route_phone_number`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_phone_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_route_phone_number` (
  `user_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `route_id` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `station_sequence` tinyint NOT NULL,
  `station_name` tinyint NOT NULL,
  `station_lng` tinyint NOT NULL,
  `station_lat` tinyint NOT NULL,
  `trigger_lng` tinyint NOT NULL,
  `trigger_lat` tinyint NOT NULL,
  `trigger_heading` tinyint NOT NULL,
  `phone_number` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_route_summary`
--

DROP TABLE IF EXISTS `view_user_route_summary`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_route_summary` (
  `user_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `modified` tinyint NOT NULL,
  `route_point_cnt` tinyint NOT NULL,
  `station_cnt` tinyint NOT NULL,
  `trigger_cnt` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'quick_bus_alpha'
--

--
-- Dumping routines for database 'quick_bus_alpha'
--

--
-- Final view structure for view `view_subquery_eligible_gps`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_eligible_gps`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_gps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_eligible_gps` AS select `a`.`id` AS `id`,`a`.`user_id` AS `user_id`,`a`.`user_route_id` AS `user_route_id`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude`,`a`.`heading` AS `heading`,`a`.`created` AS `created`,`b`.`station_sequence` AS `station_sequence`,`b`.`station_name` AS `station_name`,`b`.`trigger_lat` AS `trigger_lat`,`b`.`trigger_lng` AS `trigger_lng`,`b`.`trigger_heading` AS `trigger_heading`,time_to_sec(timediff(now(),`a`.`created`)) AS `time_diff`,(abs((`a`.`latitude` - `b`.`trigger_lat`)) + abs((`a`.`longitude` - `b`.`trigger_lng`))) AS `gps_diff`,abs(sin(radians(((cast(`a`.`heading` as signed) - cast(`b`.`trigger_heading` as signed)) / 2)))) AS `heading_diff` from (`real_time_positions` `a` left join `view_user_route_detail` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`user_route_id`)))) where ((time_to_sec(timediff(now(),`a`.`created`)) >= 0) and (time_to_sec(timediff(now(),`a`.`created`)) <= 1800) and ((abs((`a`.`latitude` - `b`.`trigger_lat`)) + abs((`a`.`longitude` - `b`.`trigger_lng`))) <= 0.0010) and (abs(sin(radians(((cast(`a`.`heading` as signed) - cast(`b`.`trigger_heading` as signed)) / 2)))) <= 0.174)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_eligible_stations`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_eligible_stations`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_stations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_eligible_stations` AS select `view_subquery_eligible_gps`.`id` AS `real_time_id`,`view_subquery_eligible_gps`.`user_id` AS `user_id`,`view_subquery_eligible_gps`.`user_route_id` AS `user_route_id`,`view_subquery_eligible_gps`.`station_sequence` AS `station_sequence`,count(0) AS `cnt` from `view_subquery_eligible_gps` group by 1,2,3 having (`cnt` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_route_point_cnt`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_route_point_cnt`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_point_cnt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_route_point_cnt` AS select `user_route_points`.`user_route_id` AS `user_route_id`,count(0) AS `route_point_cnt` from `user_route_points` group by 1 order by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_station_cnt`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_station_cnt`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_station_cnt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_station_cnt` AS select `user_station_points`.`user_route_id` AS `user_route_id`,count(0) AS `station_cnt` from `user_station_points` group by 1 order by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_trigger_cnt`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_trigger_cnt`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_trigger_cnt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_trigger_cnt` AS select `t2`.`user_route_id` AS `user_route_id`,count(0) AS `trigger_cnt` from (`user_trigger_points` `t1` left join `user_station_points` `t2` on((`t1`.`user_station_id` = `t2`.`id`))) group by 1 order by 1 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_notify_phone`
--

/*!50001 DROP TABLE IF EXISTS `view_user_notify_phone`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_notify_phone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_notify_phone` AS select `a`.`real_time_id` AS `real_time_id`,`a`.`user_id` AS `user_id`,`b`.`username` AS `username`,`a`.`user_route_id` AS `user_route_id`,`b`.`route_name` AS `route_name`,`a`.`station_sequence` AS `station_sequence`,`b`.`station_name` AS `station_name`,`b`.`phone_number` AS `phone_number` from (`view_subquery_eligible_stations` `a` left join `view_user_route_phone_number` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`route_id`) and (`a`.`station_sequence` = `b`.`station_sequence`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_route_detail`
--

/*!50001 DROP TABLE IF EXISTS `view_user_route_detail`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_route_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_route_detail` AS select `a`.`id` AS `user_id`,`a`.`username` AS `username`,`b`.`id` AS `user_route_id`,`b`.`name` AS `route_name`,`c`.`sequence` AS `station_sequence`,`c`.`name` AS `station_name`,`c`.`longitude` AS `station_lng`,`c`.`latitude` AS `station_lat`,`d`.`longitude` AS `trigger_lng`,`d`.`latitude` AS `trigger_lat`,`d`.`heading` AS `trigger_heading` from (((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `user_station_points` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `user_trigger_points` `d` on((`c`.`id` = `d`.`user_station_id`))) where (`b`.`id` is not null) order by `a`.`username`,`b`.`id`,`c`.`sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_route_phone_number`
--

/*!50001 DROP TABLE IF EXISTS `view_user_route_phone_number`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_route_phone_number`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_route_phone_number` AS select `a`.`id` AS `user_id`,`a`.`username` AS `username`,`b`.`id` AS `route_id`,`b`.`name` AS `route_name`,`c`.`sequence` AS `station_sequence`,`c`.`name` AS `station_name`,`c`.`longitude` AS `station_lng`,`c`.`latitude` AS `station_lat`,`d`.`longitude` AS `trigger_lng`,`d`.`latitude` AS `trigger_lat`,`d`.`heading` AS `trigger_heading`,`e`.`phone_number` AS `phone_number` from ((((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `user_station_points` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `user_trigger_points` `d` on((`c`.`id` = `d`.`user_station_id`))) left join `phone_numbers` `e` on((`c`.`id` = `e`.`user_station_id`))) where ((`b`.`id` is not null) and (`e`.`phone_number` is not null)) order by `a`.`id`,`b`.`id`,`c`.`sequence`,`e`.`phone_number` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_route_summary`
--

/*!50001 DROP TABLE IF EXISTS `view_user_route_summary`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_route_summary`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_route_summary` AS select `a`.`id` AS `user_id`,`a`.`username` AS `username`,`b`.`id` AS `user_route_id`,`b`.`name` AS `name`,`b`.`modified` AS `modified`,`c`.`route_point_cnt` AS `route_point_cnt`,`d`.`station_cnt` AS `station_cnt`,`e`.`trigger_cnt` AS `trigger_cnt` from ((((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `view_subquery_route_point_cnt` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `view_subquery_station_cnt` `d` on((`b`.`id` = `d`.`user_route_id`))) left join `view_subquery_trigger_cnt` `e` on((`b`.`id` = `e`.`user_route_id`))) where (`b`.`id` is not null) order by `a`.`username`,`b`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-31 10:27:22
