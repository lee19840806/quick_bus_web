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
  CONSTRAINT `FK_phone_numbers_user_station_points_id` FOREIGN KEY (`user_station_id`) REFERENCES `user_station_points` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone_numbers`
--

LOCK TABLES `phone_numbers` WRITE;
/*!40000 ALTER TABLE `phone_numbers` DISABLE KEYS */;
INSERT INTO `phone_numbers` VALUES (18,41,'15216656707'),(19,41,'13918002736'),(20,42,'13918002736'),(21,42,'15516617777'),(22,58,'15216656707'),(23,59,'15216656708');
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
  KEY `FK_real_time_positions_users_id` (`user_id`),
  KEY `FK_real_time_positions_user_routes_id` (`user_route_id`),
  CONSTRAINT `FK_real_time_positions_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FK_real_time_positions_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `real_time_positions`
--

LOCK TABLES `real_time_positions` WRITE;
/*!40000 ALTER TABLE `real_time_positions` DISABLE KEYS */;
/*!40000 ALTER TABLE `real_time_positions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_route_points`
--

LOCK TABLES `user_route_points` WRITE;
/*!40000 ALTER TABLE `user_route_points` DISABLE KEYS */;
INSERT INTO `user_route_points` VALUES (28,8,1,31.20869060,121.53531075),(29,8,2,31.20178983,121.54303551),(30,8,3,31.18974899,121.54887199),(31,8,4,31.17080358,121.55608177),(32,8,5,31.16551582,121.55934334),(33,8,6,31.15023839,121.56260490),(34,9,1,31.13716248,121.57311916),(35,9,2,31.13672169,121.56316280),(36,9,3,31.13628089,121.55346394),(37,9,4,31.13510543,121.54745579),(38,9,5,31.13826445,121.54625416),(39,9,6,31.15486595,121.54196262),(40,9,7,31.16713155,121.54161930),(41,9,8,31.17131765,121.54144764),(42,9,9,31.18152509,121.53784275),(43,9,10,31.18996926,121.53595448),(44,9,11,31.19944052,121.53380871),(45,9,12,31.20443274,121.53398037),(46,9,13,31.20891083,121.53552532),(47,9,14,31.21426958,121.53767109),(48,9,15,31.21830679,121.54033184),(49,9,16,31.21955462,121.54213428),(50,9,17,31.22058223,121.54058933),(51,10,1,31.24127892,121.49033546),(52,10,2,31.22028863,121.53788567),(53,11,1,31.24670921,121.50492668),(54,11,2,31.21456320,121.48381233),(55,11,3,31.24274659,121.44879341),(56,12,1,31.23716930,121.47471428),(57,12,2,31.21250783,121.54904366),(58,13,1,31.24025153,121.49720192),(59,13,2,31.22439898,121.53376579),(60,13,3,31.20957151,121.52758598),(61,13,4,31.20913106,121.53496742),(62,13,5,31.20237715,121.54337883),(63,14,1,31.23995799,121.49737358),(64,14,2,31.22469257,121.53410912),(65,14,3,31.23878381,121.56346321),(66,14,4,31.21148013,121.57032967),(67,15,1,31.23702252,121.48758888),(68,15,2,31.21544406,121.52329445),(69,15,3,31.23012382,121.56535149),(70,16,1,31.24480130,121.48441315),(71,16,2,31.21882061,121.51136398),(72,16,3,31.24318689,121.54758453),(73,16,4,31.26153085,121.54672623),(74,17,1,31.22438541,121.53435459),(75,17,2,31.21991502,121.54215746),(76,17,3,31.21440978,121.53743677),(77,17,4,31.20433253,121.53380871),(78,17,5,31.19922688,121.53380871),(79,17,6,31.18956176,121.53560772),(80,18,1,31.25678231,121.44230976),(81,18,2,31.20981230,121.55295239),(82,19,1,31.24650962,121.45978832),(83,19,2,31.25878242,121.55950641),(84,20,1,31.24183957,121.39090404),(85,20,2,31.20740886,121.42929440),(86,21,1,31.24397356,121.49318332),(87,21,2,31.19713080,121.52220954),(88,22,1,31.24704236,121.40432452),(89,22,2,31.21435033,121.44646054),(90,22,3,31.23369947,121.47330151),(91,23,1,31.21435033,121.40510559),(92,23,2,31.25504777,121.48859482),(93,24,1,31.13444423,121.57498598),(94,24,2,31.13705228,121.57447100),(95,24,3,31.13701555,121.57215357),(96,24,4,31.13653802,121.56296968),(97,24,5,31.13624416,121.55352831),(98,24,6,31.13506870,121.54734850),(99,24,7,31.14649210,121.54404402),(100,24,8,31.15479249,121.54194117),(101,24,9,31.16709483,121.54159784),(102,24,10,31.17142781,121.54142618),(103,24,11,31.18163524,121.53786421),(104,24,12,31.18978570,121.53601885),(105,24,13,31.19944052,121.53380871),(106,24,14,31.20509345,121.53398037),(107,24,15,31.20891083,121.53543949),(108,24,16,31.21698554,121.53878689),(109,24,17,31.21970142,121.54230595),(110,25,1,31.25756886,121.51050568),(111,25,2,31.24876383,121.49848938),(112,25,3,31.24348042,121.48029327),(113,26,1,31.24626893,121.48501396),(114,26,2,31.21368233,121.54355049),(115,26,3,31.24480130,121.56226158),(116,27,1,31.24509483,121.47299767),(117,27,2,31.20281764,121.54320717),(118,27,3,31.25903628,121.51711464);
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_routes`
--

LOCK TABLES `user_routes` WRITE;
/*!40000 ALTER TABLE `user_routes` DISABLE KEYS */;
INSERT INTO `user_routes` VALUES (8,6,'沪南路1','2014-03-30 12:57:54','2014-03-30 12:57:54'),(9,6,'锦绣路','2014-04-02 12:43:18','2014-04-02 12:43:18'),(10,6,'试验1','2014-04-05 00:56:49','2014-04-05 00:56:49'),(11,6,'试验2','2014-04-05 00:57:28','2014-04-05 00:57:28'),(12,6,'试验3','2014-04-05 00:57:52','2014-04-05 00:57:52'),(13,7,'客户线路1','2014-04-06 11:16:07','2014-04-06 11:16:07'),(14,7,'第一条线路','2014-04-08 12:32:42','2014-04-08 12:32:42'),(15,7,'第二条','2014-04-08 12:35:34','2014-04-08 12:35:34'),(16,7,'远程实验','2014-04-08 12:52:54','2014-04-08 12:52:54'),(17,7,'公司实验线路','2014-04-10 02:23:30','2014-04-10 02:23:30'),(18,7,'线A','2014-04-10 02:24:09','2014-04-10 02:24:09'),(19,7,'线B','2014-04-10 02:24:41','2014-04-10 02:24:41'),(20,7,'线C','2014-04-10 02:25:10','2014-04-10 02:25:10'),(21,7,'线D','2014-04-10 02:25:36','2014-04-10 02:25:36'),(22,7,'线E','2014-04-10 02:26:07','2014-04-10 02:26:07'),(23,7,'线F','2014-04-10 02:26:39','2014-04-10 02:26:39'),(24,7,'线路G','2014-04-11 01:22:53','2014-04-11 01:22:53'),(25,9,'lineyank','2014-04-12 02:02:14','2014-04-12 02:02:14'),(26,7,'has_heading','2014-04-28 13:39:19','2014-04-28 13:39:19'),(27,7,'has_heading_2','2014-04-28 13:43:01','2014-04-28 13:43:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_station_points`
--

LOCK TABLES `user_station_points` WRITE;
/*!40000 ALTER TABLE `user_station_points` DISABLE KEYS */;
INSERT INTO `user_station_points` VALUES (18,8,1,NULL,31.19576960,121.54612541),(19,8,2,NULL,31.17315361,121.55522346),(20,8,3,NULL,31.15141366,121.56226158),(21,9,1,NULL,31.14641865,121.54402256),(22,9,2,NULL,31.18174538,121.53767109),(23,9,3,NULL,31.19929369,121.53380871),(24,9,4,NULL,31.21441639,121.53784275),(25,10,1,NULL,31.22850916,121.52003288),(26,11,1,NULL,31.22483937,121.47128105),(27,12,1,NULL,31.22351821,121.51488304),(28,13,1,NULL,31.22968346,121.52140617),(29,13,2,NULL,31.21456320,121.52998924),(30,14,1,'陆家嘴',31.23599509,121.50767326),(31,14,2,'杨高中路',31.22645409,121.53033257),(32,14,3,'民生路',31.23438053,121.55436516),(33,14,4,'锦绣路',31.22894952,121.56638145),(34,15,1,'人民路隧道',31.23115132,121.49703026),(35,15,2,'浦东南路',31.22131624,121.51402473),(36,15,3,'芳甸路',31.22660089,121.55509472),(37,16,1,'第一站',31.23115132,121.49866104),(38,16,2,'第二站',31.22498616,121.52097702),(39,16,3,'第三站',31.23570153,121.53676987),(40,16,4,'最后一站',31.25375345,121.54689789),(41,17,1,'上海科技馆',31.22064242,121.54071808),(42,17,2,'花木路',31.21438996,121.53736295),(43,17,3,'龙阳路',31.19937444,121.53385162),(44,17,4,'高科西路',31.19123142,121.53525581),(45,18,1,'1',31.24344080,121.47414436),(46,18,2,'2',31.21982180,121.52891980),(47,19,1,'站1',31.24944478,121.48460025),(48,19,2,'站2',31.25651524,121.54171714),(49,20,1,'AAA',31.22329068,121.41103649),(50,21,1,'DDD',31.21021164,121.51362647),(51,22,1,'EE',31.22969667,121.42664050),(52,23,1,'F1',31.23236522,121.44146689),(53,23,2,'F2',31.24891059,121.47564295),(54,24,1,'沪南路',31.13672169,121.56191826),(55,24,2,'华夏西路',31.16279838,121.54187679),(56,24,3,'高科西路',31.18985912,121.53606176),(57,25,1,'yank1',31.24891059,121.49763107),(58,26,1,'aa',31.23056418,121.51299477),(59,26,2,'bb',31.23467408,121.55608177),(60,27,1,'a1',31.22028863,121.51368141),(61,27,2,'a2',31.23995799,121.52569771);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trigger_points`
--

LOCK TABLES `user_trigger_points` WRITE;
/*!40000 ALTER TABLE `user_trigger_points` DISABLE KEYS */;
INSERT INTO `user_trigger_points` VALUES (10,18,31.20428591,121.54046059,0),(11,19,31.18637140,121.55024529,0),(12,20,31.16860038,121.55762672,0),(13,21,31.13679515,121.56608105,0),(14,22,31.14612481,121.54410839,0),(15,23,31.17337392,121.54076099,0),(16,24,31.18952871,121.53604031,0),(17,25,31.23584831,121.50286675,0),(18,26,31.23100453,121.49428368,0),(19,27,31.23217881,121.48964882,0),(20,28,31.23790317,121.50303841,0),(21,29,31.22704126,121.52775764,0),(22,30,31.23995799,121.49840355,0),(23,31,31.23261915,121.51471138,0),(24,32,31.22806879,121.52621269,0),(25,33,31.22938989,121.54440880,0),(26,34,31.23577492,121.48977757,0),(27,35,31.22674768,121.50462627,0),(28,36,31.21757276,121.52934551,0),(29,37,31.24010476,121.48887634,0),(30,38,31.22293102,121.50741577,0),(31,39,31.23041739,121.52921677,0),(32,40,31.24729625,121.54741287,0),(33,41,31.22344555,121.53592701,0),(34,42,31.22029010,121.54138927,0),(35,43,31.21352965,121.53709774,0),(36,44,31.20545465,121.53421039,0),(37,45,31.25277903,121.45182838,0),(38,46,31.23249879,121.49942493,0),(39,47,31.24762940,121.46868210,0),(40,48,31.25296687,121.51315784,0),(41,49,31.23530083,121.39855156,0),(42,50,31.23556797,121.49864559,0),(43,51,31.24157245,121.41150340,0),(44,52,31.22409218,121.42461318,0),(45,53,31.24117178,121.45941238,0),(46,54,31.13561970,121.57474995,0),(47,55,31.13613396,121.55354977,0),(48,56,31.14179068,121.54556751,0),(49,57,31.24797501,121.49585009,0),(50,58,31.24142569,121.49359703,120),(51,59,31.22205023,121.54818535,31),(52,60,31.23658219,121.48707390,122),(53,61,31.22836237,121.53136253,335);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'admin','d4c8b97a3775741bac3b92c901f3e1a1094d442b',1,'2014-02-10 20:59:38','2014-02-10 20:59:38'),(7,'guest1','d4c8b97a3775741bac3b92c901f3e1a1094d442b',2,'2014-04-06 11:00:08','2014-04-06 11:00:08'),(8,'forjzt','a71fa1a2c396b4bfb13cd2925dbb291550ae37ff',2,'2014-04-12 01:57:41','2014-04-12 01:57:41'),(9,'yank','e760237175b84dce2f77aedbda80af991dc9aa8c',2,'2014-04-12 01:57:50','2014-04-12 01:57:50'),(10,'francis','29d1586e179658e6e205b14c459cb0b4e190022e',2,'2014-04-12 01:57:51','2014-04-12 01:57:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

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
/*!50001 VIEW `view_user_route_detail` AS select `a`.`id` AS `user_id`,`a`.`username` AS `username`,`b`.`id` AS `user_route_id`,`b`.`name` AS `route_name`,`c`.`sequence` AS `station_sequence`,`c`.`longitude` AS `station_lng`,`c`.`latitude` AS `station_lat`,`d`.`longitude` AS `trigger_lng`,`d`.`latitude` AS `trigger_lat`,`d`.`heading` AS `trigger_heading` from (((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `user_station_points` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `user_trigger_points` `d` on((`c`.`id` = `d`.`user_station_id`))) where (`b`.`id` is not null) order by `a`.`username`,`b`.`id`,`c`.`sequence` */;
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
/*!50001 VIEW `view_user_route_phone_number` AS select `a`.`id` AS `user_id`,`a`.`username` AS `username`,`b`.`id` AS `route_id`,`b`.`name` AS `route_name`,`c`.`sequence` AS `station_sequence`,`c`.`longitude` AS `station_lng`,`c`.`latitude` AS `station_lat`,`d`.`longitude` AS `trigger_lng`,`d`.`latitude` AS `trigger_lat`,`d`.`heading` AS `trigger_heading`,`e`.`phone_number` AS `phone_number` from ((((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `user_station_points` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `user_trigger_points` `d` on((`c`.`id` = `d`.`user_station_id`))) left join `phone_numbers` `e` on((`c`.`id` = `e`.`user_station_id`))) where ((`b`.`id` is not null) and (`e`.`phone_number` is not null)) order by `a`.`id`,`b`.`id`,`c`.`sequence`,`e`.`phone_number` */;
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

-- Dump completed on 2014-05-02  8:31:09
