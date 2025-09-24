-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: localhost    Database: minecraft_db
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authme`
--

DROP TABLE IF EXISTS `authme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `lastlogin` bigint DEFAULT NULL,
  `x` double NOT NULL DEFAULT '0',
  `y` double NOT NULL DEFAULT '0',
  `z` double NOT NULL DEFAULT '0',
  `world` varchar(255) DEFAULT 'world',
  `regdate` bigint NOT NULL,
  `regip` varchar(40) DEFAULT NULL,
  `yaw` float DEFAULT NULL,
  `pitch` float DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isLogged` int DEFAULT '0',
  `hasSession` smallint NOT NULL DEFAULT '0',
  `totp` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `realname` (`realname`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_access_log`
--

DROP TABLE IF EXISTS `plan_access_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_access_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `time` bigint NOT NULL,
  `from_ip` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `request_method` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `request_uri` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `response_code` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_allowlist_bounce`
--

DROP TABLE IF EXISTS `plan_allowlist_bounce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_allowlist_bounce` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `server_id` int NOT NULL,
  `times` int NOT NULL DEFAULT '0',
  `last_bounce` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `plan_allowlist_bounce_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_cookies`
--

DROP TABLE IF EXISTS `plan_cookies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_cookies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `web_username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `expires` bigint NOT NULL,
  `cookie` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_groups`
--

DROP TABLE IF EXISTS `plan_extension_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provider_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `plan_extension_groups_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `plan_extension_providers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_icons`
--

DROP TABLE IF EXISTS `plan_extension_icons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_icons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'question',
  `family` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'SOLID',
  `color` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_plugins`
--

DROP TABLE IF EXISTS `plan_extension_plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_plugins` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_updated` bigint NOT NULL,
  `server_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `icon_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `icon_id` (`icon_id`),
  CONSTRAINT `plan_extension_plugins_ibfk_1` FOREIGN KEY (`icon_id`) REFERENCES `plan_extension_icons` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_providers`
--

DROP TABLE IF EXISTS `plan_extension_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_providers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `text` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `priority` int NOT NULL DEFAULT '0',
  `show_in_players_table` tinyint(1) NOT NULL DEFAULT '0',
  `groupable` tinyint(1) NOT NULL DEFAULT '0',
  `condition_name` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provided_condition` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `format_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `player_name` tinyint(1) NOT NULL DEFAULT '0',
  `plugin_id` int NOT NULL,
  `icon_id` int NOT NULL,
  `tab_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_id` (`plugin_id`),
  KEY `icon_id` (`icon_id`),
  KEY `tab_id` (`tab_id`),
  CONSTRAINT `plan_extension_providers_ibfk_1` FOREIGN KEY (`plugin_id`) REFERENCES `plan_extension_plugins` (`id`),
  CONSTRAINT `plan_extension_providers_ibfk_2` FOREIGN KEY (`icon_id`) REFERENCES `plan_extension_icons` (`id`),
  CONSTRAINT `plan_extension_providers_ibfk_3` FOREIGN KEY (`tab_id`) REFERENCES `plan_extension_tabs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_server_table_values`
--

DROP TABLE IF EXISTS `plan_extension_server_table_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_server_table_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_row` int NOT NULL DEFAULT '0',
  `col_1_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_2_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_3_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_4_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_5_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `plan_extension_server_table_values_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `plan_extension_tables` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_server_values`
--

DROP TABLE IF EXISTS `plan_extension_server_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_server_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `double_value` double DEFAULT NULL,
  `percentage_value` double DEFAULT NULL,
  `long_value` bigint DEFAULT NULL,
  `string_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `component_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `provider_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `plan_extension_server_values_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `plan_extension_providers` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_tables`
--

DROP TABLE IF EXISTS `plan_extension_tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_tables` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `color` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'NONE',
  `values_for` int DEFAULT '0',
  `condition_name` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_1_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_2_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_3_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_4_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_5_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `plugin_id` int NOT NULL,
  `icon_1_id` int DEFAULT NULL,
  `icon_2_id` int DEFAULT NULL,
  `icon_3_id` int DEFAULT NULL,
  `icon_4_id` int DEFAULT NULL,
  `icon_5_id` int DEFAULT NULL,
  `format_1` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `format_2` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `format_3` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `format_4` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `format_5` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tab_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_id` (`plugin_id`),
  KEY `icon_1_id` (`icon_1_id`),
  KEY `icon_2_id` (`icon_2_id`),
  KEY `icon_3_id` (`icon_3_id`),
  KEY `icon_4_id` (`icon_4_id`),
  KEY `icon_5_id` (`icon_5_id`),
  KEY `tab_id` (`tab_id`),
  CONSTRAINT `plan_extension_tables_ibfk_1` FOREIGN KEY (`plugin_id`) REFERENCES `plan_extension_plugins` (`id`),
  CONSTRAINT `plan_extension_tables_ibfk_2` FOREIGN KEY (`icon_1_id`) REFERENCES `plan_extension_icons` (`id`),
  CONSTRAINT `plan_extension_tables_ibfk_3` FOREIGN KEY (`icon_2_id`) REFERENCES `plan_extension_icons` (`id`),
  CONSTRAINT `plan_extension_tables_ibfk_4` FOREIGN KEY (`icon_3_id`) REFERENCES `plan_extension_icons` (`id`),
  CONSTRAINT `plan_extension_tables_ibfk_5` FOREIGN KEY (`icon_4_id`) REFERENCES `plan_extension_icons` (`id`),
  CONSTRAINT `plan_extension_tables_ibfk_6` FOREIGN KEY (`icon_5_id`) REFERENCES `plan_extension_icons` (`id`),
  CONSTRAINT `plan_extension_tables_ibfk_7` FOREIGN KEY (`tab_id`) REFERENCES `plan_extension_tabs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_tabs`
--

DROP TABLE IF EXISTS `plan_extension_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_tabs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `element_order` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'VALUES,GRAPH,TABLE',
  `tab_priority` int NOT NULL,
  `plugin_id` int NOT NULL,
  `icon_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `plugin_id` (`plugin_id`),
  KEY `icon_id` (`icon_id`),
  CONSTRAINT `plan_extension_tabs_ibfk_1` FOREIGN KEY (`plugin_id`) REFERENCES `plan_extension_plugins` (`id`),
  CONSTRAINT `plan_extension_tabs_ibfk_2` FOREIGN KEY (`icon_id`) REFERENCES `plan_extension_icons` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_user_table_values`
--

DROP TABLE IF EXISTS `plan_extension_user_table_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_user_table_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `table_row` int NOT NULL DEFAULT '0',
  `col_1_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_2_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_3_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `col_4_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `table_id` (`table_id`),
  CONSTRAINT `plan_extension_user_table_values_ibfk_1` FOREIGN KEY (`table_id`) REFERENCES `plan_extension_tables` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_extension_user_values`
--

DROP TABLE IF EXISTS `plan_extension_user_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_extension_user_values` (
  `id` int NOT NULL AUTO_INCREMENT,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `double_value` double DEFAULT NULL,
  `percentage_value` double DEFAULT NULL,
  `long_value` bigint DEFAULT NULL,
  `string_value` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `component_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `group_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `provider_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `plan_extension_user_values_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `plan_extension_providers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_geolocations`
--

DROP TABLE IF EXISTS `plan_geolocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_geolocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `geolocation` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_used` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `plan_geolocations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `plan_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_join_address`
--

DROP TABLE IF EXISTS `plan_join_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_join_address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `join_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `join_address` (`join_address`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_kills`
--

DROP TABLE IF EXISTS `plan_kills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_kills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `killer_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `victim_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `server_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `weapon` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date` bigint NOT NULL,
  `session_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `session_id` (`session_id`),
  KEY `plan_kills_uuid_index` (`killer_uuid`,`victim_uuid`,`server_uuid`),
  KEY `plan_kills_date_index` (`date`),
  CONSTRAINT `plan_kills_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `plan_sessions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_nicknames`
--

DROP TABLE IF EXISTS `plan_nicknames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_nicknames` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `server_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_used` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_ping`
--

DROP TABLE IF EXISTS `plan_ping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_ping` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `server_id` int NOT NULL,
  `date` bigint NOT NULL,
  `max_ping` int NOT NULL,
  `min_ping` int NOT NULL,
  `avg_ping` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `server_id` (`server_id`),
  KEY `plan_ping_date_index` (`date`),
  CONSTRAINT `plan_ping_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `plan_users` (`id`),
  CONSTRAINT `plan_ping_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_plugin_versions`
--

DROP TABLE IF EXISTS `plan_plugin_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_plugin_versions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NOT NULL,
  `plugin_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modified` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `plan_plugin_versions_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_security`
--

DROP TABLE IF EXISTS `plan_security`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_security` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `linked_to_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '',
  `salted_pass_hash` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `salted_pass_hash` (`salted_pass_hash`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `plan_security_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `plan_web_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_servers`
--

DROP TABLE IF EXISTS `plan_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_servers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `web_address` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_installed` tinyint(1) NOT NULL DEFAULT '1',
  `is_proxy` tinyint(1) NOT NULL DEFAULT '0',
  `plan_version` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_sessions`
--

DROP TABLE IF EXISTS `plan_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_sessions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `server_id` int NOT NULL,
  `session_start` bigint NOT NULL,
  `session_end` bigint NOT NULL,
  `mob_kills` int NOT NULL,
  `deaths` int NOT NULL,
  `afk_time` bigint NOT NULL,
  `join_address_id` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `server_id` (`server_id`),
  KEY `plan_sessions_date_index` (`session_start`),
  KEY `plan_session_join_address_index` (`join_address_id`),
  CONSTRAINT `plan_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `plan_users` (`id`),
  CONSTRAINT `plan_sessions_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_settings`
--

DROP TABLE IF EXISTS `plan_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_uuid` varchar(39) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated` bigint NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `server_uuid` (`server_uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_tps`
--

DROP TABLE IF EXISTS `plan_tps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_tps` (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NOT NULL,
  `date` bigint NOT NULL,
  `tps` double NOT NULL,
  `players_online` int NOT NULL,
  `cpu_usage` double NOT NULL,
  `ram_usage` bigint NOT NULL,
  `entities` int NOT NULL,
  `chunks_loaded` int NOT NULL,
  `free_disk_space` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `server_id` (`server_id`),
  KEY `plan_tps_date_index` (`date`),
  CONSTRAINT `plan_tps_ibfk_1` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7014 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_user_info`
--

DROP TABLE IF EXISTS `plan_user_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_user_info` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `server_id` int NOT NULL,
  `join_address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `registered` bigint NOT NULL,
  `opped` tinyint(1) NOT NULL DEFAULT '0',
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `plan_user_info_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `plan_users` (`id`),
  CONSTRAINT `plan_user_info_ibfk_2` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_users`
--

DROP TABLE IF EXISTS `plan_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `registered` bigint NOT NULL,
  `name` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `times_kicked` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `plan_users_uuid_index` (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_web_group`
--

DROP TABLE IF EXISTS `plan_web_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_web_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_web_group_to_permission`
--

DROP TABLE IF EXISTS `plan_web_group_to_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_web_group_to_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `group_id` (`group_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `plan_web_group_to_permission_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `plan_web_group` (`id`),
  CONSTRAINT `plan_web_group_to_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `plan_web_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_web_permission`
--

DROP TABLE IF EXISTS `plan_web_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_web_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permission` (`permission`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_web_user_preferences`
--

DROP TABLE IF EXISTS `plan_web_user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_web_user_preferences` (
  `id` int NOT NULL AUTO_INCREMENT,
  `preferences` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `web_user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_user_id` (`web_user_id`),
  CONSTRAINT `plan_web_user_preferences_ibfk_1` FOREIGN KEY (`web_user_id`) REFERENCES `plan_security` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_world_times`
--

DROP TABLE IF EXISTS `plan_world_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_world_times` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `world_id` int NOT NULL,
  `server_id` int NOT NULL,
  `session_id` int NOT NULL,
  `survival_time` bigint NOT NULL DEFAULT '0',
  `creative_time` bigint NOT NULL DEFAULT '0',
  `adventure_time` bigint NOT NULL DEFAULT '0',
  `spectator_time` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `world_id` (`world_id`),
  KEY `session_id` (`session_id`),
  KEY `user_id` (`user_id`),
  KEY `server_id` (`server_id`),
  CONSTRAINT `plan_world_times_ibfk_1` FOREIGN KEY (`world_id`) REFERENCES `plan_worlds` (`id`),
  CONSTRAINT `plan_world_times_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `plan_sessions` (`id`),
  CONSTRAINT `plan_world_times_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `plan_users` (`id`),
  CONSTRAINT `plan_world_times_ibfk_4` FOREIGN KEY (`server_id`) REFERENCES `plan_servers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plan_worlds`
--

DROP TABLE IF EXISTS `plan_worlds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `plan_worlds` (
  `id` int NOT NULL AUTO_INCREMENT,
  `world_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `server_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-24 13:11:56
