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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_route_points`
--

LOCK TABLES `user_route_points` WRITE;
/*!40000 ALTER TABLE `user_route_points` DISABLE KEYS */;
INSERT INTO `user_route_points` VALUES (24,7,1,31.22461918,121.55526638),(25,7,2,31.21551746,121.55775547),(26,7,3,31.21727915,121.56925678),(27,7,4,31.21001197,121.57123089),(28,8,1,31.20869060,121.53531075),(29,8,2,31.20178983,121.54303551),(30,8,3,31.18974899,121.54887199),(31,8,4,31.17080358,121.55608177),(32,8,5,31.16551582,121.55934334),(33,8,6,31.15023839,121.56260490);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_routes`
--

LOCK TABLES `user_routes` WRITE;
/*!40000 ALTER TABLE `user_routes` DISABLE KEYS */;
INSERT INTO `user_routes` VALUES (7,6,'r1',NULL,NULL),(8,6,'沪南路1','2014-03-30 12:57:54','2014-03-30 12:57:54');
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
  `latitude` decimal(12,8) NOT NULL,
  `longitude` decimal(12,8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_station_points_id` (`id`),
  KEY `FK_user_station_points_user_routes_id` (`user_route_id`),
  CONSTRAINT `FK_user_station_points_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_station_points`
--

LOCK TABLES `user_station_points` WRITE;
/*!40000 ALTER TABLE `user_station_points` DISABLE KEYS */;
INSERT INTO `user_station_points` VALUES (15,7,1,31.21867380,121.55689716),(16,7,2,31.21654512,121.56384945),(17,7,3,31.21338871,121.57037258),(18,8,1,31.19576960,121.54612541),(19,8,2,31.17315361,121.55522346),(20,8,3,31.15141366,121.56226158);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_trigger_points_id` (`id`),
  KEY `FK_user_trigger_points_user_station_points_id` (`user_station_id`),
  CONSTRAINT `FK_user_trigger_points_user_station_points_id` FOREIGN KEY (`user_station_id`) REFERENCES `user_station_points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_trigger_points`
--

LOCK TABLES `user_trigger_points` WRITE;
/*!40000 ALTER TABLE `user_trigger_points` DISABLE KEYS */;
INSERT INTO `user_trigger_points` VALUES (7,15,31.22300442,121.55578136),(8,16,31.21559087,121.55938625),(9,17,31.21683873,121.56745434),(10,18,31.20428591,121.54046059),(11,19,31.18637140,121.55024529),(12,20,31.16860038,121.55762672);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'admin','e760237175b84dce2f77aedbda80af991dc9aa8c',1,'2014-02-10 20:59:38','2014-02-10 20:59:38');
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
  `username` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `station_sequence` tinyint NOT NULL,
  `station_lng` tinyint NOT NULL,
  `station_lat` tinyint NOT NULL,
  `trigger_lng` tinyint NOT NULL,
  `trigger_lat` tinyint NOT NULL
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
  `username` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `name` tinyint NOT NULL,
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
/*!50001 VIEW `view_user_route_detail` AS select `a`.`username` AS `username`,`b`.`id` AS `user_route_id`,`b`.`name` AS `name`,`c`.`sequence` AS `station_sequence`,`c`.`longitude` AS `station_lng`,`c`.`latitude` AS `station_lat`,`d`.`longitude` AS `trigger_lng`,`d`.`latitude` AS `trigger_lat` from (((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `user_station_points` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `user_trigger_points` `d` on((`c`.`id` = `d`.`user_station_id`))) order by `a`.`username`,`b`.`id`,`c`.`sequence` */;
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
/*!50001 VIEW `view_user_route_summary` AS select `a`.`username` AS `username`,`b`.`id` AS `user_route_id`,`b`.`name` AS `name`,`c`.`route_point_cnt` AS `route_point_cnt`,`d`.`station_cnt` AS `station_cnt`,`e`.`trigger_cnt` AS `trigger_cnt` from ((((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `view_subquery_route_point_cnt` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `view_subquery_station_cnt` `d` on((`b`.`id` = `d`.`user_route_id`))) left join `view_subquery_trigger_cnt` `e` on((`b`.`id` = `e`.`user_route_id`))) order by `a`.`username`,`b`.`id` */;
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

-- Dump completed on 2014-03-30 22:38:25