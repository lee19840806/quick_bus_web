-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quick_bus_alpha
-- ------------------------------------------------------
-- Server version	5.6.16

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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=66306 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
  UNIQUE KEY `UK_table1_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5220 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=402 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Temporary table structure for view `view_subquery_latest_pos_created`
--

DROP TABLE IF EXISTS `view_subquery_latest_pos_created`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_latest_pos_created`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_latest_pos_created` (
  `user_id` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `created` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_subquery_route_phone_pair`
--

DROP TABLE IF EXISTS `view_subquery_route_phone_pair`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_phone_pair`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_subquery_route_phone_pair` (
  `user_id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `route_id` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `phone_number` tinyint NOT NULL
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
-- Temporary table structure for view `view_user_latest_pos_phone`
--

DROP TABLE IF EXISTS `view_user_latest_pos_phone`;
/*!50001 DROP VIEW IF EXISTS `view_user_latest_pos_phone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_latest_pos_phone` (
  `real_time_id` tinyint NOT NULL,
  `user_id` tinyint NOT NULL,
  `user_route_id` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL,
  `heading` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `modified` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `phone_number` tinyint NOT NULL,
  `time_diff` tinyint NOT NULL
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
-- Temporary table structure for view `view_user_route_maps`
--

DROP TABLE IF EXISTS `view_user_route_maps`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_maps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_route_maps` (
  `user_route_id` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `sequence` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL
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
/*!50001 VIEW `view_subquery_eligible_gps` AS select `a`.`id` AS `id`,`a`.`user_id` AS `user_id`,`a`.`user_route_id` AS `user_route_id`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude`,`a`.`heading` AS `heading`,`a`.`created` AS `created`,`b`.`station_sequence` AS `station_sequence`,`b`.`station_name` AS `station_name`,`b`.`trigger_lat` AS `trigger_lat`,`b`.`trigger_lng` AS `trigger_lng`,`b`.`trigger_heading` AS `trigger_heading`,time_to_sec(timediff(now(),`a`.`created`)) AS `time_diff`,(abs((`a`.`latitude` - `b`.`trigger_lat`)) + abs((`a`.`longitude` - `b`.`trigger_lng`))) AS `gps_diff`,abs(sin(radians(((cast(`a`.`heading` as signed) - cast(`b`.`trigger_heading` as signed)) / 2)))) AS `heading_diff` from (`real_time_positions` `a` left join `view_user_route_detail` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`user_route_id`)))) where ((time_to_sec(timediff(now(),`a`.`created`)) >= 0) and (time_to_sec(timediff(now(),`a`.`created`)) <= 3600) and ((abs((`a`.`latitude` - `b`.`trigger_lat`)) + abs((`a`.`longitude` - `b`.`trigger_lng`))) <= 0.0010) and (abs(sin(radians(((cast(`a`.`heading` as signed) - cast(`b`.`trigger_heading` as signed)) / 2)))) <= 0.174)) */;
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
/*!50001 VIEW `view_subquery_eligible_stations` AS select max(`view_subquery_eligible_gps`.`id`) AS `real_time_id`,`view_subquery_eligible_gps`.`user_id` AS `user_id`,`view_subquery_eligible_gps`.`user_route_id` AS `user_route_id`,`view_subquery_eligible_gps`.`station_sequence` AS `station_sequence`,count(0) AS `cnt` from `view_subquery_eligible_gps` group by 2,3,4 having (`cnt` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_latest_pos_created`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_latest_pos_created`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_latest_pos_created`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_latest_pos_created` AS select `real_time_positions`.`user_id` AS `user_id`,`real_time_positions`.`user_route_id` AS `user_route_id`,max(`real_time_positions`.`created`) AS `created` from `real_time_positions` group by 1,2 order by 1,2 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_route_phone_pair`
--

/*!50001 DROP TABLE IF EXISTS `view_subquery_route_phone_pair`*/;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_phone_pair`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_route_phone_pair` AS select distinct `view_user_route_phone_number`.`user_id` AS `user_id`,`view_user_route_phone_number`.`username` AS `username`,`view_user_route_phone_number`.`route_id` AS `route_id`,`view_user_route_phone_number`.`route_name` AS `route_name`,`view_user_route_phone_number`.`phone_number` AS `phone_number` from `view_user_route_phone_number` */;
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
-- Final view structure for view `view_user_latest_pos_phone`
--

/*!50001 DROP TABLE IF EXISTS `view_user_latest_pos_phone`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_latest_pos_phone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_latest_pos_phone` AS select `b`.`id` AS `real_time_id`,`b`.`user_id` AS `user_id`,`b`.`user_route_id` AS `user_route_id`,`b`.`latitude` AS `latitude`,`b`.`longitude` AS `longitude`,`b`.`heading` AS `heading`,`b`.`created` AS `created`,`b`.`modified` AS `modified`,`c`.`route_name` AS `route_name`,`c`.`phone_number` AS `phone_number`,time_to_sec(timediff(now(),`a`.`created`)) AS `time_diff` from ((`view_subquery_latest_pos_created` `a` left join `real_time_positions` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`user_route_id`) and (`a`.`created` = `b`.`created`)))) join `view_subquery_route_phone_pair` `c` on(((`a`.`user_id` = `c`.`user_id`) and (`a`.`user_route_id` = `c`.`route_id`)))) where (time_to_sec(timediff(now(),`a`.`created`)) <= 18000000) order by `b`.`user_id`,`b`.`user_route_id` */;
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
-- Final view structure for view `view_user_route_maps`
--

/*!50001 DROP TABLE IF EXISTS `view_user_route_maps`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_route_maps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_route_maps` AS select `a`.`user_route_id` AS `user_route_id`,`b`.`name` AS `route_name`,`a`.`sequence` AS `sequence`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude` from (`user_route_points` `a` left join `user_routes` `b` on((`a`.`user_route_id` = `b`.`id`))) order by `a`.`user_route_id`,`a`.`sequence` */;
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

-- Dump completed on 2015-01-01  9:50:16
