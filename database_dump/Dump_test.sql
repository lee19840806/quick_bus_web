CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `test`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: test
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
-- Table structure for table `bus_checkpoints`
--

DROP TABLE IF EXISTS `bus_checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_checkpoints` (
  `Checkpoint_ID` int(16) NOT NULL,
  `Route_ID` int(16) NOT NULL,
  `Station_ID` int(16) NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  `Heading` double(9,6) NOT NULL,
  PRIMARY KEY (`Checkpoint_ID`),
  UNIQUE KEY `UK_bus_checkpoints_Checkpoint_ID` (`Checkpoint_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_checkpoints`
--

LOCK TABLES `bus_checkpoints` WRITE;
/*!40000 ALTER TABLE `bus_checkpoints` DISABLE KEYS */;
INSERT INTO `bus_checkpoints` VALUES (1,4,53,31.289595,121.410242,266.000000),(2,4,54,31.203912,121.387162,269.000000),(3,4,55,31.203912,121.387162,269.000000),(4,4,56,31.207748,121.371990,297.000000),(5,4,57,31.206608,121.359372,158.000000),(6,4,58,31.194752,121.384475,169.000000),(7,4,59,31.185088,121.389728,238.000000),(8,4,60,31.218402,121.372082,345.000000),(9,5,62,31.253828,121.609772,160.000000),(10,5,63,31.250150,121.606245,255.000000),(11,5,64,31.250995,121.593337,325.000000),(12,6,67,31.253587,121.609648,156.000000),(13,7,53,31.289595,121.410242,266.000000),(14,7,55,31.203912,121.387162,269.000000),(15,7,56,31.203912,121.387162,269.000000),(16,7,57,31.203912,121.387162,269.000000),(17,7,58,31.194752,121.384475,169.000000),(18,7,59,31.185088,121.389728,238.000000),(19,7,60,31.218402,121.372082,345.000000),(20,8,54,31.209235,121.375775,135.000000),(21,8,55,31.210238,121.365063,285.000000),(22,8,56,31.210238,121.365063,285.000000),(23,8,57,31.210238,121.365063,285.000000),(24,8,58,31.194752,121.384475,169.000000),(25,8,59,31.185088,121.389728,238.000000),(26,8,60,31.218402,121.372082,345.000000);
/*!40000 ALTER TABLE `bus_checkpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bus_route_detail`
--

DROP TABLE IF EXISTS `bus_route_detail`;
/*!50001 DROP VIEW IF EXISTS `bus_route_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `bus_route_detail` (
  `Route_ID` tinyint NOT NULL,
  `Route_Name` tinyint NOT NULL,
  `Direction` tinyint NOT NULL,
  `Start_Station_ID` tinyint NOT NULL,
  `Start_Station_Name` tinyint NOT NULL,
  `Start_Station_Latitude` tinyint NOT NULL,
  `Start_Station_Longitude` tinyint NOT NULL,
  `End_Station_ID` tinyint NOT NULL,
  `End_Station_Name` tinyint NOT NULL,
  `End_Station_Latitude` tinyint NOT NULL,
  `End_Station_Longitude` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bus_route_station`
--

DROP TABLE IF EXISTS `bus_route_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_route_station` (
  `Route_ID` int(16) unsigned NOT NULL,
  `Station_ID` int(16) unsigned NOT NULL,
  `Sequence_Number` int(16) unsigned NOT NULL,
  UNIQUE KEY `UK_bus_route_station` (`Route_ID`,`Sequence_Number`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 AVG_ROW_LENGTH=244;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_route_station`
--

LOCK TABLES `bus_route_station` WRITE;
/*!40000 ALTER TABLE `bus_route_station` DISABLE KEYS */;
INSERT INTO `bus_route_station` VALUES (1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10),(1,11,11),(1,12,12),(1,13,13),(1,14,14),(1,15,15),(2,16,1),(2,17,2),(2,18,3),(2,19,4),(2,20,5),(2,21,6),(2,22,7),(2,23,8),(2,24,9),(2,25,10),(2,26,11),(2,27,12),(3,28,1),(3,29,2),(3,30,3),(3,31,4),(3,32,5),(3,33,6),(3,34,7),(3,35,8),(3,36,9),(3,37,10),(3,38,11),(3,39,12),(3,40,13),(3,41,14),(3,42,15),(3,43,16),(3,44,17),(3,45,18),(3,46,19),(3,47,20),(3,48,21),(3,49,22),(3,50,23),(3,51,24),(4,52,1),(4,53,2),(4,54,3),(4,55,4),(4,56,5),(4,57,6),(4,58,7),(4,59,8),(4,60,9),(4,52,10),(5,61,1),(5,62,2),(5,63,3),(5,64,4),(5,65,5),(5,61,6),(6,66,1),(6,67,2),(7,52,1),(7,53,2),(7,55,3),(7,56,4),(7,57,5),(7,58,6),(7,59,7),(7,60,8),(7,52,9),(8,52,1),(8,54,2),(8,55,3),(8,56,4),(8,57,5),(8,58,6),(8,59,7),(8,60,8),(8,52,9);
/*!40000 ALTER TABLE `bus_route_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `bus_route_station_detail`
--

DROP TABLE IF EXISTS `bus_route_station_detail`;
/*!50001 DROP VIEW IF EXISTS `bus_route_station_detail`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `bus_route_station_detail` (
  `route_id` tinyint NOT NULL,
  `station_id` tinyint NOT NULL,
  `sequence_number` tinyint NOT NULL,
  `route_name` tinyint NOT NULL,
  `direction` tinyint NOT NULL,
  `station_name` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL,
  `checkpoint_id` tinyint NOT NULL,
  `checkpoint_latitude` tinyint NOT NULL,
  `checkpoint_longitude` tinyint NOT NULL,
  `checkpoint_heading` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bus_routes`
--

DROP TABLE IF EXISTS `bus_routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_routes` (
  `Route_ID` int(16) unsigned NOT NULL,
  `Route_Name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `Direction` varchar(16) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`Route_ID`),
  UNIQUE KEY `UK_bus_routes_Route_ID` (`Route_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 AVG_ROW_LENGTH=3276;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_routes`
--

LOCK TABLES `bus_routes` WRITE;
/*!40000 ALTER TABLE `bus_routes` DISABLE KEYS */;
INSERT INTO `bus_routes` VALUES (1,'85路','上行'),(2,'85路','下行'),(3,'783路','上行'),(4,'校车专线1','环线'),(5,'试验专线','环线'),(6,'蒋的上班线路','上行'),(7,'校车专线2','环线'),(8,'校车专线3','环线');
/*!40000 ALTER TABLE `bus_routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_stations`
--

DROP TABLE IF EXISTS `bus_stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_stations` (
  `Station_ID` int(16) unsigned NOT NULL,
  `Station_Name` varchar(64) CHARACTER SET utf8 NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  PRIMARY KEY (`Station_ID`),
  UNIQUE KEY `UK_bus_stations_Station_ID` (`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 AVG_ROW_LENGTH=252;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_stations`
--

LOCK TABLES `bus_stations` WRITE;
/*!40000 ALTER TABLE `bus_stations` DISABLE KEYS */;
INSERT INTO `bus_stations` VALUES (1,'陆家嘴地铁站',31.240028,121.498492),(2,'浦东大道浦东南路',31.240267,121.507688),(3,'浦东大道钱仓路',31.242503,121.516235),(4,'浦东大道源深路',31.242693,121.522838),(5,'浦东大道民生路',31.245837,121.535227),(6,'浦东大道北洋径路',31.248175,121.541183),(7,'浦东大道歇浦路',31.251972,121.546618),(8,'浦东大道居家桥路',31.259783,121.555232),(9,'浦东大道金桥路',31.266538,121.564333),(10,'八号桥',31.271067,121.569803),(11,'浦东大道五莲路',31.276865,121.576567),(12,'五莲路莱阳路',31.270712,121.580222),(13,'兰城路五莲路',31.268333,121.578582),(14,'兰城路博兴路',31.266665,121.583950),(15,'博兴路张杨北路',31.268222,121.589067),(16,'五莲路莱阳路',31.275752,121.577655),(17,'浦东大道五莲路',31.276020,121.572157),(18,'八号桥',31.271170,121.569650),(19,'浦东大道金桥路',31.269492,121.567542),(20,'浦东大道居家桥路',31.269233,121.567337),(21,'浦东大道歇浦路',31.252400,121.546683),(22,'浦东大道北洋径路',31.247953,121.539883),(23,'浦东大道民生路',31.245697,121.534015),(24,'浦东大道源深路',31.243483,121.526105),(25,'浦东大道钱仓路',31.242460,121.514407),(26,'浦东大道浦东南路',31.240710,121.508003),(27,'陆家嘴地铁站',31.240028,121.498492),(28,'普安路延安东路',31.228317,121.471978),(29,'西藏南路宁海东路',31.229772,121.474153),(30,'淮海东路西藏南路',31.227937,121.476827),(31,'浦东南路东昌路',31.234208,121.509928),(32,'张杨路浦东南路',31.229523,121.512925),(33,'张杨路东方路',31.231295,121.518643),(34,'张杨路福山路',31.232627,121.523197),(35,'张杨路源深路',31.234532,121.528755),(36,'张杨路桃林路',31.235510,121.532080),(37,'张杨路民生路',31.237083,121.537063),(38,'张杨路巨野路',31.238488,121.541478),(39,'张杨路苗圃路',31.241115,121.548145),(40,'张杨路罗山路',31.244768,121.555547),(41,'张杨路居家桥路',31.249525,121.563737),(42,'金杨路居家桥路',31.248405,121.566840),(43,'金杨路云山路',31.249468,121.571780),(44,'金杨路金口路',31.251150,121.575680),(45,'金杨路枣庄路',31.253832,121.577583),(46,'金杨路金桥路',31.255905,121.579235),(47,'张杨北路博兴路',31.264023,121.581878),(48,'博兴路张杨北路',31.266630,121.583805),(49,'博兴路菏泽路',31.268020,121.588933),(50,'菏泽路长岛路',31.265562,121.591402),(51,'台儿庄路长岛路',31.262258,121.587963),(52,'学校',31.321767,121.451105),(53,'水城路',31.203912,121.387162),(54,'淞虹路',31.206608,121.359372),(55,'建河路延安西路',31.191113,121.372367),(56,'总队医院',31.194752,121.384475),(57,'吴中路',31.185088,121.389728),(58,'天山西路',31.218402,121.372082),(59,'金沙江路',31.234560,121.376285),(60,'古浪路',31.273118,121.390148),(61,'试验站0',31.257773,121.611015),(62,'试验站1',31.250150,121.606245),(63,'试验站2',31.250995,121.593337),(64,'试验站3',31.258648,121.598955),(65,'试验站4',31.259465,121.605210),(66,'金港路宁桥路',31.253587,121.609648),(67,'金湘路桂桥路',31.245250,121.606957);
/*!40000 ALTER TABLE `bus_stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bus_vehicles`
--

DROP TABLE IF EXISTS `bus_vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bus_vehicles` (
  `Vehicle_ID` int(20) unsigned NOT NULL,
  `License_Number` varchar(32) CHARACTER SET utf8 DEFAULT NULL,
  `Device_ID` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `Route_Name` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`Vehicle_ID`),
  UNIQUE KEY `UK_bus_vehicles_Vehicle_ID` (`Vehicle_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=gb2312 AVG_ROW_LENGTH=3276;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bus_vehicles`
--

LOCK TABLES `bus_vehicles` WRITE;
/*!40000 ALTER TABLE `bus_vehicles` DISABLE KEYS */;
INSERT INTO `bus_vehicles` VALUES (1,'沪A-12345','SH234','85路'),(2,'沪F-23456','SH666','85路'),(3,'沪D-78787','SH333','783路'),(2000,'沪B-54321','SH654','校车专线1'),(2001,'沪B-54322','SH655','校车专线2'),(2002,'沪B-54323','SH656','校车专线3'),(3000,'沪L-65432','SH543','试验专线'),(4000,'沪J-78987','SH789','蒋的上班线路');
/*!40000 ALTER TABLE `bus_vehicles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_bus_position`
--

DROP TABLE IF EXISTS `daily_bus_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `daily_bus_position` (
  `Vehicle_ID` int(16) unsigned NOT NULL,
  `report_time` datetime NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  `loadlevel` int(11) DEFAULT NULL,
  `speed` double(9,6) NOT NULL,
  `heading` double(9,6) DEFAULT NULL,
  PRIMARY KEY (`Vehicle_ID`,`report_time`),
  UNIQUE KEY `UK_daily_bus_position` (`Vehicle_ID`,`report_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=82;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_bus_position`
--

LOCK TABLES `daily_bus_position` WRITE;
/*!40000 ALTER TABLE `daily_bus_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `daily_bus_position` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER after_insert_daily
	AFTER INSERT
	ON daily_bus_position
	FOR EACH ROW
BEGIN

declare var_in_bus_stop_distance double default 0.0005;
declare var_in_terminal_distance double default 0.0005;
declare var_in_checkpoint_distance double default 0.0008;
declare var_checkpoint_heading_range double default 0.174;
declare var_min_distance double default null;
declare var_record_count int default 0;
declare var_new_bus_stop varchar(64) default '';
declare var_route_name varchar(64) default '';
declare var_route_id int(16) default 0;
declare var_sequence_number int(16) default 0;
declare var_station_name varchar(64) default '';
declare var_min_distance_old double default null;
declare var_min_distance_new double default null;
declare var_nearest_stop varchar(64) default '';
declare var_next_stop varchar(64) default '';
declare var_bus_stop_id int default 0;
declare var_from_station_old varchar(64) default '';
declare var_to_station_old varchar(64) default '';
declare var_from_station_new varchar(64) default '';
declare var_to_station_new varchar(64) default '';
declare var_old_direction varchar(16) default '';
declare var_old_latitude double default null;
declare var_old_longitude double default null;
declare var_new_direction varchar(8) character set utf8 default '';
declare var_circle_direction varchar(8) character set utf8 default '';
declare var_in_station int default 0;
declare var_direction1_latitude double(9, 6) default null;
declare var_direction1_longitude double(9, 6) default null;
declare var_direction2_latitude double(9, 6) default null;
declare var_direction2_longitude double(9, 6) default null;

select Latitude, Longitude, Direction
into var_old_latitude, var_old_longitude, var_old_direction
from test.latest_bus_position
where Vehicle_ID = new.Vehicle_ID;

select Route_Name
into var_route_name
from test.bus_vehicles
where Vehicle_ID = new.Vehicle_ID;

if (var_old_latitude is not null) and (var_old_longitude is not null) then
    if var_old_direction <> '环线' then
        select (abs(var_old_latitude - Start_Station_Latitude) + abs(var_old_longitude - Start_Station_Longitude)), Direction
        into var_min_distance_old, var_new_direction
        from test.bus_route_detail
        where (abs(var_old_latitude - Start_Station_Latitude) + abs(var_old_longitude - Start_Station_Longitude)) =
            (
            select min(abs(var_old_latitude - Start_Station_Latitude) + abs(var_old_longitude - Start_Station_Longitude))
            from test.bus_route_detail where Route_Name = var_route_name
            )
        limit 1;

        if var_min_distance_old < var_in_terminal_distance then
            select (abs(new.Latitude - Start_Station_Latitude) + abs(new.Longitude - Start_Station_Longitude)), Direction
            into var_min_distance_new, var_new_direction
            from test.bus_route_detail
            where (abs(new.Latitude - Start_Station_Latitude) + abs(new.Longitude - Start_Station_Longitude)) =
                (
                select min(abs(new.Latitude - Start_Station_Latitude) + abs(new.Longitude - Start_Station_Longitude))
                from test.bus_route_detail where Route_Name = var_route_name
                )
            limit 1;

            if var_min_distance_new < var_in_terminal_distance then
                set var_new_direction = var_old_direction;
            end if;
        else
            set var_new_direction = var_old_direction;
        end if;
    else
        set var_new_direction = var_old_direction;
    end if;
else
    select Direction
    into var_circle_direction
    from test.bus_routes
    where Route_Name = var_route_name
    limit 1;

    if var_circle_direction <> '环线' then
        select Start_Station_Latitude, Start_Station_longitude
        into var_direction1_latitude, var_direction1_longitude
        from test.bus_route_detail
        where Route_Name = var_route_name and Direction = '上行';

        select Start_Station_Latitude, Start_Station_longitude
        into var_direction2_latitude, var_direction2_longitude
        from test.bus_route_detail
        where Route_Name = var_route_name and Direction = '下行';

        if var_direction1_latitude is null and var_direction2_latitude is null then
            set var_new_direction = '上行';
        elseif var_direction1_latitude is null and var_direction2_latitude is not null then
            set var_new_direction = '下行';
        elseif var_direction1_latitude is not null and var_direction2_latitude is null then
            set var_new_direction = '上行';
        else
            if (abs(new.Latitude - var_direction1_latitude) + abs(new.Longitude - var_direction1_longitude))
                < (abs(new.Latitude - var_direction2_latitude) + abs(new.Longitude - var_direction2_longitude)) then
                set var_new_direction = '上行';
            else
                set var_new_direction = '下行';
            end if;
        end if;
    else
        set var_new_direction = '环线';
    end if;
end if;

/* Delete all the check points related to a specific Vehicle_ID */
delete from test.latest_bus_checkpoints
where Vehicle_ID = new.Vehicle_ID;

/* Insert check points */
insert into test.latest_bus_checkpoints
select *, new.Vehicle_ID as Vehicle_ID, new.report_time as report_time
from test.bus_route_station_detail
where abs(new.Latitude - Checkpoint_Latitude) + abs(new.Longitude - Checkpoint_Longitude) < var_in_checkpoint_distance
    and abs(sin(radians((new.heading - Checkpoint_Heading) / 2))) <= var_checkpoint_heading_range
    and Direction = var_new_direction and Route_Name = (select Route_Name from test.bus_vehicles where Vehicle_ID = new.Vehicle_ID);

select abs(new.Latitude - Latitude) + abs(new.Longitude - Longitude), Route_ID, Sequence_Number, Station_Name
into var_min_distance, var_route_id, var_sequence_number, var_station_name
from test.bus_route_station_detail
where abs(new.Latitude - Latitude) + abs(new.Longitude - Longitude) =
    (
    select min(abs(new.Latitude - Latitude) + abs(new.Longitude - Longitude))
    from test.bus_route_station_detail
    where Direction = var_new_direction and Route_Name = (select Route_Name from test.bus_vehicles where Vehicle_ID = new.Vehicle_ID)
    )
limit 1;

if var_min_distance < var_in_bus_stop_distance then
    set var_from_station_new = var_station_name;
    set var_in_station = 1;

    select Station_Name
    into var_to_station_new
    from test.bus_route_station_detail
    where Route_ID = var_route_id and Sequence_Number = var_sequence_number + 1;

    if var_to_station_new is null then
        if var_new_direction <> '环线' then
            set var_to_station_new = var_from_station_new;
        else
            select Station_Name
            into var_to_station_new
            from test.bus_route_station_detail
            where Route_ID = var_route_id and Sequence_Number = 1;
        end if;
    end if;
else
    set var_in_station = 0;

    select from_station, to_station
    into var_from_station_new, var_to_station_new
    from test.latest_bus_position
    where Vehicle_ID = new.Vehicle_ID;
end if;

delete from test.latest_bus_position
where Vehicle_ID = new.Vehicle_ID;

INSERT INTO test.latest_bus_position
VALUES (NEW.Vehicle_ID, var_route_name, NEW.report_time, NEW.latitude, NEW.longitude, NEW.loadlevel, NEW.speed, var_new_direction,
    var_from_station_new, var_to_station_new, var_in_station);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `debug_latest_bus_checkpoints`
--

DROP TABLE IF EXISTS `debug_latest_bus_checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debug_latest_bus_checkpoints` (
  `Route_ID` int(16) NOT NULL,
  `Station_ID` int(16) NOT NULL,
  `Sequence_Number` int(16) NOT NULL,
  `Route_Name` varchar(64) NOT NULL,
  `Direction` varchar(16) NOT NULL,
  `Station_Name` varchar(64) NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  `Checkpoint_ID` int(16) NOT NULL,
  `Checkpoint_Latitude` double(9,6) NOT NULL,
  `Checkpoint_Longitude` double(9,6) NOT NULL,
  `Checkpoint_Heading` double(9,6) NOT NULL,
  `Vehicle_ID` int(20) NOT NULL,
  `report_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=528;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debug_latest_bus_checkpoints`
--

LOCK TABLES `debug_latest_bus_checkpoints` WRITE;
/*!40000 ALTER TABLE `debug_latest_bus_checkpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `debug_latest_bus_checkpoints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debug_latest_bus_position`
--

DROP TABLE IF EXISTS `debug_latest_bus_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debug_latest_bus_position` (
  `Vehicle_ID` int(16) unsigned NOT NULL,
  `Route_Name` varchar(64) DEFAULT NULL,
  `report_time` datetime NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  `loadlevel` int(11) DEFAULT NULL,
  `speed` double NOT NULL,
  `Direction` varchar(16) DEFAULT NULL,
  `from_station` varchar(64) DEFAULT NULL,
  `to_station` varchar(64) DEFAULT NULL,
  `is_in_station` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`Vehicle_ID`,`report_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=334;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debug_latest_bus_position`
--

LOCK TABLES `debug_latest_bus_position` WRITE;
/*!40000 ALTER TABLE `debug_latest_bus_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `debug_latest_bus_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latest_bus_checkpoints`
--

DROP TABLE IF EXISTS `latest_bus_checkpoints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_bus_checkpoints` (
  `Route_ID` int(16) NOT NULL,
  `Station_ID` int(16) NOT NULL,
  `Sequence_Number` int(16) NOT NULL,
  `Route_Name` varchar(64) NOT NULL,
  `Direction` varchar(16) NOT NULL,
  `Station_Name` varchar(64) NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  `Checkpoint_ID` int(16) NOT NULL,
  `Checkpoint_Latitude` double(9,6) NOT NULL,
  `Checkpoint_Longitude` double(9,6) NOT NULL,
  `Checkpoint_Heading` double(9,6) NOT NULL,
  `Vehicle_ID` int(20) NOT NULL,
  `report_time` datetime NOT NULL,
  PRIMARY KEY (`Checkpoint_ID`,`Vehicle_ID`),
  UNIQUE KEY `UK_latest_bus_checkpoints` (`Route_ID`,`Station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest_bus_checkpoints`
--

LOCK TABLES `latest_bus_checkpoints` WRITE;
/*!40000 ALTER TABLE `latest_bus_checkpoints` DISABLE KEYS */;
/*!40000 ALTER TABLE `latest_bus_checkpoints` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_debug_checkpoints
	AFTER INSERT
	ON latest_bus_checkpoints
	FOR EACH ROW
BEGIN

INSERT INTO test.debug_latest_bus_checkpoints
VALUES (NEW.Route_ID, new.Station_ID, NEW.Sequence_Number, NEW.Route_Name, NEW.Direction, NEW.Station_Name, NEW.Latitude, new.Longitude,
    new.Checkpoint_ID, new.Checkpoint_Latitude, new.Checkpoint_Longitude, new.Checkpoint_Heading, new.Vehicle_ID, new.report_time);

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `latest_bus_position`
--

DROP TABLE IF EXISTS `latest_bus_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latest_bus_position` (
  `Vehicle_ID` int(16) unsigned NOT NULL,
  `Route_Name` varchar(64) DEFAULT NULL,
  `report_time` datetime NOT NULL,
  `Latitude` double(9,6) NOT NULL,
  `Longitude` double(9,6) NOT NULL,
  `loadlevel` int(11) DEFAULT NULL,
  `speed` double NOT NULL,
  `Direction` varchar(16) DEFAULT NULL,
  `from_station` varchar(64) DEFAULT NULL,
  `to_station` varchar(64) DEFAULT NULL,
  `is_in_station` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`Vehicle_ID`),
  KEY `bus_id` (`Vehicle_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latest_bus_position`
--

LOCK TABLES `latest_bus_position` WRITE;
/*!40000 ALTER TABLE `latest_bus_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `latest_bus_position` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER trigger_debug_position
	AFTER INSERT
	ON latest_bus_position
	FOR EACH ROW
BEGIN

if new.is_in_station = 1 then
    INSERT INTO test.debug_latest_bus_position
    VALUES (NEW.Vehicle_ID, new.Route_Name, NEW.report_time, NEW.latitude, NEW.longitude, NEW.loadlevel, NEW.speed, new.Direction,
        new.from_station, new.to_station, new.is_in_station);
end if;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sms_notify`
--

DROP TABLE IF EXISTS `sms_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_notify` (
  `Customer_ID` varchar(32) NOT NULL,
  `phone_num` varchar(20) NOT NULL,
  `Route_Name` varchar(64) DEFAULT NULL,
  `Direction` varchar(16) DEFAULT NULL,
  `Station_Name` varchar(64) NOT NULL,
  `Register_time` datetime NOT NULL,
  `Expiration_time` datetime NOT NULL,
  `Enabled` int(2) unsigned NOT NULL,
  PRIMARY KEY (`phone_num`,`Station_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=237;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_notify`
--

LOCK TABLES `sms_notify` WRITE;
/*!40000 ALTER TABLE `sms_notify` DISABLE KEYS */;
INSERT INTO `sms_notify` VALUES ('A_Passenger10','13020154400','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger16','13482136652','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger05','13482423073','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger07','13524024707','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('JiangZiTian','13524677703','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','试验专线','环线','试验站1','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','试验专线','环线','试验站2','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','试验专线','环线','试验站3','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('JiangZiTian','13524677703','蒋的上班线路','上行','金湘路桂桥路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('A_Passenger18','13564692009','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ShuPengFei','13606601625','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','试验专线','环线','试验站1','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','试验专线','环线','试验站2','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','试验专线','环线','试验站3','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ShuPengFei','13606601625','蒋的上班线路','上行','金湘路桂桥路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('A_Passenger06','13611842765','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger02','13626502991','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('Jubit','13636394008','试验专线','环线','试验站1','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('Jubit','13636394008','试验专线','环线','试验站2','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('Jubit','13636394008','试验专线','环线','试验站3','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger08','13651894459','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger03','13671819993','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger15','13816768625','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('FangChen','13816980513','蒋的上班线路','上行','金湘路桂桥路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('A_Passenger11','13817232498','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger01','13817283066','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger20','13817976650','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger13','13818158363','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger12','13916233298','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger19','13917033236','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger09','13917233901','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger14','13918491963','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('A_Passenger21','13918940769','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiShiCheng','15216656707','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','试验专线','环线','试验站1','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','试验专线','环线','试验站2','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','试验专线','环线','试验站3','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('LiShiCheng','15216656707','蒋的上班线路','上行','金湘路桂桥路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('ZhengChao','15618745591','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('ZhengChao','15618745591','蒋的上班线路','上行','金湘路桂桥路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('A_Passenger17','15821237232','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','仙霞路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','古浪路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','吴中路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','总队医院','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','水城路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','淞虹路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','校车专线','环线','金沙江路','2012-10-13 11:21:18','2014-06-01 11:21:23',0),('LiYanChang','15821765327','蒋的上班线路','上行','金湘路桂桥路','2012-10-13 11:21:18','2014-06-01 11:21:23',1),('A_Passenger04','15900508940','校车专线','环线','建河路延安西路','2012-10-13 11:21:18','2014-06-01 11:21:23',0);
/*!40000 ALTER TABLE `sms_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sms_notify_backup`
--

DROP TABLE IF EXISTS `sms_notify_backup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_notify_backup` (
  `phone_num` varchar(20) NOT NULL,
  `Route_Name` varchar(64) DEFAULT NULL,
  `Direction` varchar(16) DEFAULT NULL,
  `Station_Name` varchar(64) NOT NULL,
  `Register_time` datetime NOT NULL,
  `Expiration_time` datetime NOT NULL,
  `Enabled` int(2) unsigned NOT NULL,
  PRIMARY KEY (`phone_num`,`Station_Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=224;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_notify_backup`
--

LOCK TABLES `sms_notify_backup` WRITE;
/*!40000 ALTER TABLE `sms_notify_backup` DISABLE KEYS */;
INSERT INTO `sms_notify_backup` VALUES ('13524677703','校车专线','环线','古浪路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','吴中路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','哈密路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','天山路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','总队医院','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','水城路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','淞虹路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','试验专线','环线','试验站1','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','试验专线','环线','试验站2','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','试验专线','环线','试验站3','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','试验专线','环线','试验站4','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13524677703','校车专线','环线','金沙江路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','古浪路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','吴中路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','哈密路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','天山路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','总队医院','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','水城路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','淞虹路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','试验专线','环线','试验站1','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','试验专线','环线','试验站2','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','试验专线','环线','试验站3','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','试验专线','环线','试验站4','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13606601625','校车专线','环线','金沙江路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','古浪路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','吴中路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','哈密路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','天山路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','总队医院','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','水城路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','淞虹路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','试验专线','环线','试验站1','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','试验专线','环线','试验站2','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','试验专线','环线','试验站3','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','试验专线','环线','试验站4','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('13816980513','校车专线','环线','金沙江路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','85路','上行','八号桥','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','古浪路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','吴中路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','哈密路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','天山路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','总队医院','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','水城路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','淞虹路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','试验专线','环线','试验站1','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','试验专线','环线','试验站2','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','试验专线','环线','试验站3','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','试验专线','环线','试验站4','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15216656707','校车专线','环线','金沙江路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','古浪路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','吴中路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','哈密路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','天山路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','总队医院','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','水城路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','淞虹路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','试验专线','环线','试验站1','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','试验专线','环线','试验站2','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','试验专线','环线','试验站3','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','试验专线','环线','试验站4','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15618745591','校车专线','环线','金沙江路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','古浪路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','吴中路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','哈密路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','天山路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','总队医院','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','水城路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','淞虹路','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','试验专线','环线','试验站1','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','试验专线','环线','试验站2','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','试验专线','环线','试验站3','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','试验专线','环线','试验站4','2012-10-13 11:21:18','2013-06-01 11:21:23',1),('15821765327','校车专线','环线','金沙江路','2012-10-13 11:21:18','2013-06-01 11:21:23',1);
/*!40000 ALTER TABLE `sms_notify_backup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'test'
--

--
-- Dumping routines for database 'test'
--

--
-- Final view structure for view `bus_route_detail`
--

/*!50001 DROP TABLE IF EXISTS `bus_route_detail`*/;
/*!50001 DROP VIEW IF EXISTS `bus_route_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bus_route_detail` AS select `a`.`Route_ID` AS `Route_ID`,`a`.`Route_Name` AS `Route_Name`,`a`.`Direction` AS `Direction`,`b`.`Station_ID` AS `Start_Station_ID`,`c`.`Station_Name` AS `Start_Station_Name`,`c`.`Latitude` AS `Start_Station_Latitude`,`c`.`Longitude` AS `Start_Station_Longitude`,`d`.`Station_ID` AS `End_Station_ID`,`e`.`Station_Name` AS `End_Station_Name`,`e`.`Latitude` AS `End_Station_Latitude`,`e`.`Longitude` AS `End_Station_Longitude` from ((((`bus_routes` `a` left join `bus_route_station` `b` on(((`a`.`Route_ID` = `b`.`Route_ID`) and (`b`.`Sequence_Number` = (select min(`t1`.`Sequence_Number`) from `bus_route_station` `t1` where (`t1`.`Route_ID` = `a`.`Route_ID`)))))) left join `bus_stations` `c` on((`b`.`Station_ID` = `c`.`Station_ID`))) left join `bus_route_station` `d` on(((`a`.`Route_ID` = `d`.`Route_ID`) and (`d`.`Sequence_Number` = (select max(`t2`.`Sequence_Number`) from `bus_route_station` `t2` where (`t2`.`Route_ID` = `a`.`Route_ID`)))))) left join `bus_stations` `e` on((`d`.`Station_ID` = `e`.`Station_ID`))) order by `a`.`Route_ID`,`a`.`Direction` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `bus_route_station_detail`
--

/*!50001 DROP TABLE IF EXISTS `bus_route_station_detail`*/;
/*!50001 DROP VIEW IF EXISTS `bus_route_station_detail`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bus_route_station_detail` AS select `a`.`Route_ID` AS `route_id`,`a`.`Station_ID` AS `station_id`,`a`.`Sequence_Number` AS `sequence_number`,`b`.`Route_Name` AS `route_name`,`b`.`Direction` AS `direction`,`c`.`Station_Name` AS `station_name`,`c`.`Latitude` AS `latitude`,`c`.`Longitude` AS `longitude`,`d`.`Checkpoint_ID` AS `checkpoint_id`,`d`.`Latitude` AS `checkpoint_latitude`,`d`.`Longitude` AS `checkpoint_longitude`,`d`.`Heading` AS `checkpoint_heading` from (((`bus_route_station` `a` left join `bus_routes` `b` on((`a`.`Route_ID` = `b`.`Route_ID`))) left join `bus_stations` `c` on((`a`.`Station_ID` = `c`.`Station_ID`))) left join `bus_checkpoints` `d` on(((`a`.`Station_ID` = `d`.`Station_ID`) and (`a`.`Route_ID` = `d`.`Route_ID`)))) order by `a`.`Route_ID`,`a`.`Sequence_Number` */;
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

-- Dump completed on 2014-03-01 19:23:01
