-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: quick_bus_alpha
-- ------------------------------------------------------
-- Server version	5.6.24

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
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_companies_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `districts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(50) NOT NULL,
  `district` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_districts_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192;
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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=364;
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
  CONSTRAINT `FK_real_time_positions_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_real_time_positions_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=716730 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sub_companies`
--

DROP TABLE IF EXISTS `sub_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int(10) unsigned NOT NULL,
  `district_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sub_companies_id` (`id`),
  KEY `FK_sub_companies_companies_id` (`company_id`),
  KEY `FK_sub_companies_districts_id` (`district_id`),
  CONSTRAINT `FK_sub_companies_companies_id` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`),
  CONSTRAINT `FK_sub_companies_districts_id` FOREIGN KEY (`district_id`) REFERENCES `districts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=10082 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=275;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_route_imei_mappings`
--

DROP TABLE IF EXISTS `user_route_imei_mappings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_route_imei_mappings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_route_id` int(10) unsigned NOT NULL,
  `imei` char(15) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_route_imei_mappings_id` (`id`),
  KEY `FK_user_route_imei_mappings_user_routes_id` (`user_route_id`),
  CONSTRAINT `FK_user_route_imei_mappings_user_routes_id` FOREIGN KEY (`user_route_id`) REFERENCES `user_routes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;
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
) ENGINE=InnoDB AUTO_INCREMENT=2470 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_route_timetables`
--

DROP TABLE IF EXISTS `user_route_timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_route_timetables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_station_id` int(10) unsigned NOT NULL,
  `day_of_week` tinyint(3) unsigned NOT NULL,
  `run_sequence` tinyint(3) unsigned NOT NULL,
  `planned` time NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_route_timetables` (`user_station_id`,`day_of_week`,`run_sequence`),
  UNIQUE KEY `UK_user_route_timetables_id` (`id`),
  CONSTRAINT `FK_user_route_timetables_user_station_points_id` FOREIGN KEY (`user_station_id`) REFERENCES `user_station_points` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=881 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048;
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
  `sub_company_id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL,
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_user_routes_id` (`id`),
  KEY `FK_user_routes_user_accounts_id` (`user_id`),
  KEY `FK_user_routes_sub_companies_id` (`sub_company_id`),
  CONSTRAINT `FK_user_routes_sub_companies_id` FOREIGN KEY (`sub_company_id`) REFERENCES `sub_companies` (`id`),
  CONSTRAINT `FK_user_routes_user_accounts_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;
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
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=237;
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
) ENGINE=InnoDB AUTO_INCREMENT=588 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=237;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `view_route_passed_stations`
--

DROP TABLE IF EXISTS `view_route_passed_stations`;
/*!50001 DROP VIEW IF EXISTS `view_route_passed_stations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_route_passed_stations` AS SELECT 
 1 AS `user_route_id`,
 1 AS `route_name`,
 1 AS `station_sequence`,
 1 AS `station_name`,
 1 AS `trigger_time`,
 1 AS `minutes_elapsed`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_eligible_gps`
--

DROP TABLE IF EXISTS `view_subquery_eligible_gps`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_gps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_eligible_gps` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `heading`,
 1 AS `created`,
 1 AS `station_sequence`,
 1 AS `station_name`,
 1 AS `trigger_lat`,
 1 AS `trigger_lng`,
 1 AS `trigger_heading`,
 1 AS `time_diff`,
 1 AS `gps_diff`,
 1 AS `heading_diff`,
 1 AS `latest_created`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_eligible_stations`
--

DROP TABLE IF EXISTS `view_subquery_eligible_stations`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_stations`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_eligible_stations` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `heading`,
 1 AS `created`,
 1 AS `station_sequence`,
 1 AS `station_name`,
 1 AS `trigger_lat`,
 1 AS `trigger_lng`,
 1 AS `trigger_heading`,
 1 AS `time_diff`,
 1 AS `gps_diff`,
 1 AS `heading_diff`,
 1 AS `latest_created`,
 1 AS `history_created`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_latest_pos_created`
--

DROP TABLE IF EXISTS `view_subquery_latest_pos_created`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_latest_pos_created`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_latest_pos_created` AS SELECT 
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `created`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_positions_1_hour`
--

DROP TABLE IF EXISTS `view_subquery_positions_1_hour`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_positions_1_hour`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_positions_1_hour` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `heading`,
 1 AS `created`,
 1 AS `modified`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_prev_next_run`
--

DROP TABLE IF EXISTS `view_subquery_prev_next_run`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_prev_next_run`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_prev_next_run` AS SELECT 
 1 AS `user_route_id`,
 1 AS `time_now`,
 1 AS `sequence`,
 1 AS `name`,
 1 AS `day_of_week`,
 1 AS `run_sequence`,
 1 AS `planned`,
 1 AS `diff_now_and_planned`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_route_hist_60_days`
--

DROP TABLE IF EXISTS `view_subquery_route_hist_60_days`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_hist_60_days`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_route_hist_60_days` AS SELECT 
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `replay_day`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_route_phone_pair`
--

DROP TABLE IF EXISTS `view_subquery_route_phone_pair`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_phone_pair`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_route_phone_pair` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `route_id`,
 1 AS `route_name`,
 1 AS `phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_route_point_cnt`
--

DROP TABLE IF EXISTS `view_subquery_route_point_cnt`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_route_point_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_route_point_cnt` AS SELECT 
 1 AS `user_route_id`,
 1 AS `route_point_cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_station_cnt`
--

DROP TABLE IF EXISTS `view_subquery_station_cnt`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_station_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_station_cnt` AS SELECT 
 1 AS `user_route_id`,
 1 AS `station_cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_today_positions`
--

DROP TABLE IF EXISTS `view_subquery_today_positions`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_today_positions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_today_positions` AS SELECT 
 1 AS `id`,
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `heading`,
 1 AS `created`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_subquery_trigger_cnt`
--

DROP TABLE IF EXISTS `view_subquery_trigger_cnt`;
/*!50001 DROP VIEW IF EXISTS `view_subquery_trigger_cnt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_subquery_trigger_cnt` AS SELECT 
 1 AS `user_route_id`,
 1 AS `trigger_cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_latest_pos_phone`
--

DROP TABLE IF EXISTS `view_user_latest_pos_phone`;
/*!50001 DROP VIEW IF EXISTS `view_user_latest_pos_phone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_latest_pos_phone` AS SELECT 
 1 AS `real_time_id`,
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `heading`,
 1 AS `created`,
 1 AS `modified`,
 1 AS `route_name`,
 1 AS `phone_number`,
 1 AS `time_diff`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_latest_positions`
--

DROP TABLE IF EXISTS `view_user_latest_positions`;
/*!50001 DROP VIEW IF EXISTS `view_user_latest_positions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_latest_positions` AS SELECT 
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `name`,
 1 AS `latitude`,
 1 AS `longitude`,
 1 AS `heading`,
 1 AS `created`,
 1 AS `run_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_notify_phone`
--

DROP TABLE IF EXISTS `view_user_notify_phone`;
/*!50001 DROP VIEW IF EXISTS `view_user_notify_phone`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_notify_phone` AS SELECT 
 1 AS `real_time_id`,
 1 AS `user_id`,
 1 AS `username`,
 1 AS `user_route_id`,
 1 AS `route_name`,
 1 AS `station_sequence`,
 1 AS `station_name`,
 1 AS `phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_operation_status`
--

DROP TABLE IF EXISTS `view_user_operation_status`;
/*!50001 DROP VIEW IF EXISTS `view_user_operation_status`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_operation_status` AS SELECT 
 1 AS `user_route_id`,
 1 AS `route_name`,
 1 AS `latest`,
 1 AS `time_now`,
 1 AS `day_of_week`,
 1 AS `diff_latest_and_now`,
 1 AS `previous_run_sequence`,
 1 AS `previous_planned_diff`,
 1 AS `previous_planned`,
 1 AS `next_run_sequence`,
 1 AS `next_planned_diff`,
 1 AS `next_planned`,
 1 AS `run_status`,
 1 AS `ph`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_route_detail`
--

DROP TABLE IF EXISTS `view_user_route_detail`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_route_detail` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `user_route_id`,
 1 AS `route_name`,
 1 AS `station_id`,
 1 AS `station_sequence`,
 1 AS `station_name`,
 1 AS `station_lng`,
 1 AS `station_lat`,
 1 AS `trigger_lng`,
 1 AS `trigger_lat`,
 1 AS `trigger_heading`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_route_history_days`
--

DROP TABLE IF EXISTS `view_user_route_history_days`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_history_days`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_route_history_days` AS SELECT 
 1 AS `user_id`,
 1 AS `user_route_id`,
 1 AS `name`,
 1 AS `replay_day`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_route_maps`
--

DROP TABLE IF EXISTS `view_user_route_maps`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_maps`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_route_maps` AS SELECT 
 1 AS `user_route_id`,
 1 AS `route_name`,
 1 AS `sequence`,
 1 AS `latitude`,
 1 AS `longitude`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_route_phone_number`
--

DROP TABLE IF EXISTS `view_user_route_phone_number`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_phone_number`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_route_phone_number` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `route_id`,
 1 AS `route_name`,
 1 AS `station_sequence`,
 1 AS `station_name`,
 1 AS `station_lng`,
 1 AS `station_lat`,
 1 AS `trigger_lng`,
 1 AS `trigger_lat`,
 1 AS `trigger_heading`,
 1 AS `phone_number`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_route_summary`
--

DROP TABLE IF EXISTS `view_user_route_summary`;
/*!50001 DROP VIEW IF EXISTS `view_user_route_summary`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_route_summary` AS SELECT 
 1 AS `user_id`,
 1 AS `username`,
 1 AS `user_route_id`,
 1 AS `name`,
 1 AS `modified`,
 1 AS `route_point_cnt`,
 1 AS `station_cnt`,
 1 AS `trigger_cnt`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_route_passed_stations`
--

/*!50001 DROP VIEW IF EXISTS `view_route_passed_stations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_route_passed_stations` AS select `a`.`user_route_id` AS `user_route_id`,`a`.`route_name` AS `route_name`,`a`.`station_sequence` AS `station_sequence`,`a`.`station_name` AS `station_name`,max(`b`.`created`) AS `trigger_time`,cast((timestampdiff(SECOND,max(`b`.`created`),now()) / 60) as signed) AS `minutes_elapsed` from (`view_user_route_detail` `a` left join `view_subquery_today_positions` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`user_route_id`)))) where ((`a`.`station_name` is not null) and (timestampdiff(SECOND,`b`.`created`,now()) <= 432000) and (timestampdiff(SECOND,`b`.`created`,now()) >= 0) and ((abs((`b`.`latitude` - `a`.`trigger_lat`)) + abs((`b`.`longitude` - `a`.`trigger_lng`))) <= 0.0020) and (abs(sin(radians(((cast(`b`.`heading` as signed) - cast(`a`.`trigger_heading` as signed)) / 2)))) <= 0.174)) group by 1,2,3,4 order by `a`.`user_route_id`,`trigger_time` desc,`a`.`station_sequence` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_eligible_gps`
--

/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_gps`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_eligible_gps` AS select `a`.`id` AS `id`,`a`.`user_id` AS `user_id`,`a`.`user_route_id` AS `user_route_id`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude`,`a`.`heading` AS `heading`,`a`.`created` AS `created`,`b`.`station_sequence` AS `station_sequence`,`b`.`station_name` AS `station_name`,`b`.`trigger_lat` AS `trigger_lat`,`b`.`trigger_lng` AS `trigger_lng`,`b`.`trigger_heading` AS `trigger_heading`,timestampdiff(SECOND,`a`.`created`,now()) AS `time_diff`,(abs((`a`.`latitude` - `b`.`trigger_lat`)) + abs((`a`.`longitude` - `b`.`trigger_lng`))) AS `gps_diff`,abs(sin(radians(((cast(`a`.`heading` as signed) - cast(`b`.`trigger_heading` as signed)) / 2)))) AS `heading_diff`,`c`.`created` AS `latest_created` from ((`view_subquery_positions_1_hour` `a` left join `view_user_route_detail` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`user_route_id`)))) left join `view_subquery_latest_pos_created` `c` on(((`a`.`user_id` = `c`.`user_id`) and (`a`.`user_route_id` = `c`.`user_route_id`)))) where (((abs((`a`.`latitude` - `b`.`trigger_lat`)) + abs((`a`.`longitude` - `b`.`trigger_lng`))) <= 0.0020) and (abs(sin(radians(((cast(`a`.`heading` as signed) - cast(`b`.`trigger_heading` as signed)) / 2)))) <= 0.174)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_eligible_stations`
--

/*!50001 DROP VIEW IF EXISTS `view_subquery_eligible_stations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_eligible_stations` AS select `a`.`id` AS `id`,`a`.`user_id` AS `user_id`,`a`.`user_route_id` AS `user_route_id`,`a`.`latitude` AS `latitude`,`a`.`longitude` AS `longitude`,`a`.`heading` AS `heading`,`a`.`created` AS `created`,`a`.`station_sequence` AS `station_sequence`,`a`.`station_name` AS `station_name`,`a`.`trigger_lat` AS `trigger_lat`,`a`.`trigger_lng` AS `trigger_lng`,`a`.`trigger_heading` AS `trigger_heading`,`a`.`time_diff` AS `time_diff`,`a`.`gps_diff` AS `gps_diff`,`a`.`heading_diff` AS `heading_diff`,`a`.`latest_created` AS `latest_created`,`b`.`created` AS `history_created` from (`view_subquery_eligible_gps` `a` left join `view_subquery_eligible_gps` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`user_route_id`) and (`a`.`station_sequence` = `b`.`station_sequence`) and (`a`.`latest_created` > `b`.`created`)))) where ((`a`.`latest_created` = `a`.`created`) and isnull(`b`.`created`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_latest_pos_created`
--

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
-- Final view structure for view `view_subquery_positions_1_hour`
--

/*!50001 DROP VIEW IF EXISTS `view_subquery_positions_1_hour`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_positions_1_hour` AS select `real_time_positions`.`id` AS `id`,`real_time_positions`.`user_id` AS `user_id`,`real_time_positions`.`user_route_id` AS `user_route_id`,`real_time_positions`.`latitude` AS `latitude`,`real_time_positions`.`longitude` AS `longitude`,`real_time_positions`.`heading` AS `heading`,`real_time_positions`.`created` AS `created`,`real_time_positions`.`modified` AS `modified` from `real_time_positions` where ((timestampdiff(SECOND,`real_time_positions`.`created`,now()) >= 0) and (timestampdiff(SECOND,`real_time_positions`.`created`,now()) <= 3600)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_prev_next_run`
--

/*!50001 DROP VIEW IF EXISTS `view_subquery_prev_next_run`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_prev_next_run` AS (select `i`.`user_route_id` AS `user_route_id`,now() AS `time_now`,`b`.`sequence` AS `sequence`,`b`.`name` AS `name`,`c`.`day_of_week` AS `day_of_week`,max(`c`.`run_sequence`) AS `run_sequence`,max(`c`.`planned`) AS `planned`,max(timestampdiff(MINUTE,cast(now() as time),`c`.`planned`)) AS `diff_now_and_planned` from ((`view_user_route_summary` `i` left join `user_station_points` `b` on((`i`.`user_route_id` = `b`.`user_route_id`))) left join `user_route_timetables` `c` on(((`b`.`id` = `c`.`user_station_id`) and (`c`.`day_of_week` = dayofweek(now()))))) where ((`b`.`sequence` = 1) and (timestampdiff(MINUTE,cast(now() as time),`c`.`planned`) <= 0)) group by 1,2,3,4,5 order by 1,2,3,4,5) union (select `i`.`user_route_id` AS `user_route_id`,now() AS `time_now`,`b`.`sequence` AS `sequence`,`b`.`name` AS `name`,`c`.`day_of_week` AS `day_of_week`,min(`c`.`run_sequence`) AS `run_sequence`,min(`c`.`planned`) AS `planned`,min(timestampdiff(MINUTE,cast(now() as time),`c`.`planned`)) AS `diff_now_and_planned` from ((`view_user_route_summary` `i` left join `user_station_points` `b` on((`i`.`user_route_id` = `b`.`user_route_id`))) left join `user_route_timetables` `c` on(((`b`.`id` = `c`.`user_station_id`) and (`c`.`day_of_week` = dayofweek(now()))))) where ((`b`.`sequence` = 1) and (timestampdiff(MINUTE,cast(now() as time),`c`.`planned`) > 0)) group by 1,2,3,4,5 order by 1,2,3,4,5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_route_hist_60_days`
--

/*!50001 DROP VIEW IF EXISTS `view_subquery_route_hist_60_days`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_route_hist_60_days` AS select `real_time_positions`.`user_id` AS `user_id`,`real_time_positions`.`user_route_id` AS `user_route_id`,makedate(extract(year from `real_time_positions`.`created`),dayofyear(`real_time_positions`.`created`)) AS `replay_day` from `real_time_positions` where ((to_days(now()) - to_days(`real_time_positions`.`created`)) <= 60) group by `real_time_positions`.`user_route_id`,`replay_day` order by `real_time_positions`.`user_id`,`real_time_positions`.`user_route_id`,`replay_day` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_route_phone_pair`
--

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
-- Final view structure for view `view_subquery_today_positions`
--

/*!50001 DROP VIEW IF EXISTS `view_subquery_today_positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_subquery_today_positions` AS select `real_time_positions`.`id` AS `id`,`real_time_positions`.`user_id` AS `user_id`,`real_time_positions`.`user_route_id` AS `user_route_id`,`real_time_positions`.`latitude` AS `latitude`,`real_time_positions`.`longitude` AS `longitude`,`real_time_positions`.`heading` AS `heading`,`real_time_positions`.`created` AS `created` from `real_time_positions` where (cast(`real_time_positions`.`created` as date) = cast(now() as date)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_subquery_trigger_cnt`
--

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
-- Final view structure for view `view_user_latest_positions`
--

/*!50001 DROP VIEW IF EXISTS `view_user_latest_positions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_latest_positions` AS select `a`.`user_id` AS `user_id`,`a`.`user_route_id` AS `user_route_id`,`b`.`name` AS `name`,`c`.`latitude` AS `latitude`,`c`.`longitude` AS `longitude`,`c`.`heading` AS `heading`,`a`.`created` AS `created`,`d`.`run_status` AS `run_status` from (((`view_subquery_latest_pos_created` `a` left join `user_routes` `b` on((`a`.`user_route_id` = `b`.`id`))) left join `real_time_positions` `c` on(((`a`.`user_id` = `c`.`user_id`) and (`a`.`user_route_id` = `c`.`user_route_id`) and (`a`.`created` = `c`.`created`)))) left join `view_user_operation_status` `d` on((`a`.`user_route_id` = `d`.`user_route_id`))) order by `a`.`user_id`,`a`.`user_route_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_notify_phone`
--

/*!50001 DROP VIEW IF EXISTS `view_user_notify_phone`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_notify_phone` AS select `a`.`id` AS `real_time_id`,`a`.`user_id` AS `user_id`,`b`.`username` AS `username`,`a`.`user_route_id` AS `user_route_id`,`b`.`route_name` AS `route_name`,`a`.`station_sequence` AS `station_sequence`,`b`.`station_name` AS `station_name`,`b`.`phone_number` AS `phone_number` from (`view_subquery_eligible_stations` `a` left join `view_user_route_phone_number` `b` on(((`a`.`user_id` = `b`.`user_id`) and (`a`.`user_route_id` = `b`.`route_id`) and (`a`.`station_sequence` = `b`.`station_sequence`)))) where (`b`.`phone_number` is not null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_operation_status`
--

/*!50001 DROP VIEW IF EXISTS `view_user_operation_status`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_operation_status` AS select `a`.`user_route_id` AS `user_route_id`,`a`.`name` AS `route_name`,`l`.`created` AS `latest`,`b`.`time_now` AS `time_now`,`b`.`day_of_week` AS `day_of_week`,timestampdiff(MINUTE,`l`.`created`,`b`.`time_now`) AS `diff_latest_and_now`,`b`.`run_sequence` AS `previous_run_sequence`,`b`.`diff_now_and_planned` AS `previous_planned_diff`,`b`.`planned` AS `previous_planned`,`c`.`run_sequence` AS `next_run_sequence`,`c`.`diff_now_and_planned` AS `next_planned_diff`,`c`.`planned` AS `next_planned`,(case when isnull(`c`.`planned`) then '今天所有运营已结束' when (isnull(`b`.`planned`) and (`c`.`planned` is not null)) then concat('班车目前暂停服务。下一趟',date_format(`c`.`planned`,'%H点%i分'),'发车') when ((`b`.`planned` not between cast(`l`.`created` as time) and cast(`b`.`time_now` as time)) and (timestampdiff(MINUTE,`l`.`created`,`b`.`time_now`) between 0 and 5)) then concat('班车',date_format(`b`.`planned`,'%H点%i分'),'已发车，正常运营') when (`c`.`diff_now_and_planned` between 0 and 5) then concat('班车',date_format(`c`.`planned`,'%H点%i分'),'已发车，正常运营') when (`b`.`diff_now_and_planned` between -(5) and 0) then concat('班车',date_format(`b`.`planned`,'%H点%i分'),'已发车，正常运营') when ((`b`.`planned` between cast(`l`.`created` as time) and cast(`b`.`time_now` as time)) and (timestampdiff(MINUTE,`l`.`created`,`b`.`time_now`) > 5)) then concat('班车目前暂停服务。下一趟',date_format(`c`.`planned`,'%H点%i分'),'发车') when ((`b`.`planned` not between cast(`l`.`created` as time) and cast(`b`.`time_now` as time)) and (timestampdiff(MINUTE,`l`.`created`,`b`.`time_now`) > 5)) then concat('班车目前暂停服务。下一趟',date_format(`c`.`planned`,'%H点%i分'),'发车') when (timestampdiff(MINUTE,`l`.`created`,`b`.`time_now`) >= 480) then concat('班车目前暂停服务。下一趟',date_format(`c`.`planned`,'%H点%i分'),'发车') else '正常运营中' end) AS `run_status`,'place_holder' AS `ph` from (((`view_user_route_summary` `a` left join `view_subquery_latest_pos_created` `l` on((`a`.`user_route_id` = `l`.`user_route_id`))) left join `view_subquery_prev_next_run` `b` on(((`a`.`user_route_id` = `b`.`user_route_id`) and (`b`.`diff_now_and_planned` <= 0)))) left join `view_subquery_prev_next_run` `c` on(((`a`.`user_route_id` = `c`.`user_route_id`) and (`c`.`diff_now_and_planned` > 0)))) where ((`b`.`time_now` is not null) or (`c`.`time_now` is not null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_route_detail`
--

/*!50001 DROP VIEW IF EXISTS `view_user_route_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_route_detail` AS select `a`.`id` AS `user_id`,`a`.`username` AS `username`,`b`.`id` AS `user_route_id`,`b`.`name` AS `route_name`,`c`.`id` AS `station_id`,`c`.`sequence` AS `station_sequence`,`c`.`name` AS `station_name`,`c`.`longitude` AS `station_lng`,`c`.`latitude` AS `station_lat`,`d`.`longitude` AS `trigger_lng`,`d`.`latitude` AS `trigger_lat`,`d`.`heading` AS `trigger_heading` from (((`users` `a` left join `user_routes` `b` on((`a`.`id` = `b`.`user_id`))) left join `user_station_points` `c` on((`b`.`id` = `c`.`user_route_id`))) left join `user_trigger_points` `d` on((`c`.`id` = `d`.`user_station_id`))) where (`b`.`id` is not null) order by `a`.`username`,`b`.`id`,`c`.`sequence` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_route_history_days`
--

/*!50001 DROP VIEW IF EXISTS `view_user_route_history_days`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_route_history_days` AS select `a`.`user_id` AS `user_id`,`a`.`user_route_id` AS `user_route_id`,`a`.`name` AS `name`,`b`.`replay_day` AS `replay_day` from (`view_user_route_summary` `a` left join `view_subquery_route_hist_60_days` `b` on((`a`.`user_route_id` = `b`.`user_route_id`))) order by `a`.`user_id`,`a`.`user_route_id`,`b`.`replay_day` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_route_maps`
--

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

-- Dump completed on 2015-08-09 19:06:13
