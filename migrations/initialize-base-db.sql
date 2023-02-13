CREATE DATABASE  IF NOT EXISTS `mk2s_hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mk2s_hotel`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mk2s_hotel
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `addons` (
  `addon_id` int unsigned NOT NULL,
  `addon_res_id` int unsigned NOT NULL,
  `addon_branch_id` int unsigned NOT NULL,
  `addon_name` varchar(50) NOT NULL,
  `addon_pricing` json NOT NULL,
  `addon_is_active` tinyint NOT NULL DEFAULT '1',
  `addon_is_available` tinyint NOT NULL DEFAULT '1',
  `addon_is_special` tinyint NOT NULL DEFAULT '0',
  `addon_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `addon_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `addon_created_by_id` int unsigned NOT NULL,
  `addon_created_by_name` varchar(50) NOT NULL,
  `addon_updated_by_id` int unsigned NOT NULL,
  `addon_updated_by_name` varchar(50) NOT NULL,
  `addon_is_deleted` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

LOCK TABLES `addons` WRITE;
/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adm_id` int unsigned NOT NULL AUTO_INCREMENT,
  `adm_username` varchar(12) NOT NULL,
  `adm_email` varchar(120) NOT NULL,
  `adm_phone` varchar(13) NOT NULL,
  `adm_password` varchar(255) NOT NULL,
  `adm_name` varchar(50) NOT NULL,
  `adm_gender` enum('Male','Female','Transgender') NOT NULL,
  `adm_dob` date NOT NULL,
  `adm_role` varchar(50) NOT NULL,
  `adm_doj` date NOT NULL,
  `adm_last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adm_last_login_ip` varchar(60) NOT NULL DEFAULT '0:0:0:0',
  `adm_address` varchar(50) NOT NULL,
  `adm_city` varchar(50) NOT NULL,
  `adm_state` varchar(50) NOT NULL,
  `adm_country` varchar(50) NOT NULL,
  `adm_zip_code` varchar(15) NOT NULL,
  `adm_added_by` int unsigned NOT NULL DEFAULT '1',
  `adm_added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `adm_updated_by` int unsigned NOT NULL DEFAULT '1',
  `adm_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `adm_active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`adm_id`),
  UNIQUE KEY `adm_email_UNIQUE` (`adm_email`),
  UNIQUE KEY `adm_phone_UNIQUE` (`adm_phone`),
  UNIQUE KEY `adm_username_UNIQUE` (`adm_username`),
  KEY `FK_ADM_CITY_idx` (`adm_city`),
  KEY `FK_ADM_STATE_idx` (`adm_state`),
  KEY `FK_ADM_COUNTRY_idx` (`adm_country`),
  CONSTRAINT `FK_ADM_CITY` FOREIGN KEY (`adm_city`) REFERENCES `city` (`city`) ON UPDATE CASCADE,
  CONSTRAINT `FK_ADM_COUNTRY` FOREIGN KEY (`adm_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_ADM_STATE` FOREIGN KEY (`adm_state`) REFERENCES `state` (`state`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This table contains details about the employees or admins under MK2S_LLC.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (29,'Admin','siva.kusi12@gmail.com','7842487859','$2a$10$5Kk.ltO6yGFohhiEA5BPNOTedkBJtpz505zQUBn7gQIxC3/afxDiu','Admin','Male','1998-05-21','Owner','2021-02-21','2022-10-06 17:25:20','0:0:0:0','10-15','Chittoor','Andhra Pradesh','India','517419',1,'2022-10-06 17:25:20',1,'2022-10-06 17:26:25',1);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branches`
--

DROP TABLE IF EXISTS `branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branches` (
  `br_id` int unsigned NOT NULL AUTO_INCREMENT,
  `br_res_id` int unsigned NOT NULL,
  `br_name` varchar(100) NOT NULL,
  `br_email` varchar(120) NOT NULL,
  `br_mobile` varchar(20) NOT NULL,
  `br_code` varchar(20) NOT NULL,
  `br_spoc_name` varchar(50) NOT NULL,
  `br_spoc_email` varchar(120) NOT NULL,
  `br_spoc_mobile` varchar(20) NOT NULL,
  `br_currency_code` varchar(50) NOT NULL,
  `br_is_open` tinyint NOT NULL DEFAULT '0',
  `br_res_type` varchar(100) NOT NULL DEFAULT 'Fine Dining',
  `br_timings` json NOT NULL,
  `br_address` varchar(250) NOT NULL,
  `br_city` varchar(50) NOT NULL,
  `br_state` varchar(50) NOT NULL,
  `br_country` varchar(50) NOT NULL,
  `br_zip_code` varchar(15) NOT NULL,
  `br_is_active` tinyint NOT NULL DEFAULT '1',
  `br_is_available_online` tinyint NOT NULL DEFAULT '1',
  `br_last_opened_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `br_last_closed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `br_timezone` varchar(40) NOT NULL,
  `br_created_by_id` int unsigned NOT NULL,
  `br_created_by_name` varchar(50) NOT NULL,
  `br_updated_by_id` int unsigned NOT NULL,
  `br_updated_by_name` varchar(50) NOT NULL,
  `br_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `br_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `br_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`br_id`),
  UNIQUE KEY `br_code_UNIQUE` (`br_res_id`,`br_code`),
  UNIQUE KEY `br_email_UNIQUE` (`br_res_id`,`br_email`),
  UNIQUE KEY `br_mobile_UNIQUE` (`br_res_id`,`br_mobile`),
  KEY `FK_BRANCH_CITY_idx` (`br_city`),
  KEY `FK_BRANCH_STATE_idx` (`br_state`),
  KEY `FK_BRANCH_COUNTRY_idx` (`br_country`),
  KEY `FK_BRANCH_RESTAURANT_idx` (`br_res_id`),
  KEY `FK_BRANCH_CREATED_ID_NAME_idx` (`br_created_by_id`,`br_created_by_name`),
  KEY `FK_BRANCH_UPDATED_BY_ID_idx` (`br_updated_by_id`,`br_updated_by_name`),
  KEY `FK_BRANCH_CURRENCY_CODE_idx` (`br_currency_code`),
  CONSTRAINT `FK_BRANCH_CITY` FOREIGN KEY (`br_city`) REFERENCES `city` (`city`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_BRANCH_COUNTRY` FOREIGN KEY (`br_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_BRANCH_CREATED_BY_ID` FOREIGN KEY (`br_created_by_id`, `br_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`),
  CONSTRAINT `FK_BRANCH_CURRENCY_CODE` FOREIGN KEY (`br_currency_code`) REFERENCES `currency_codes` (`cc_code`),
  CONSTRAINT `FK_BRANCH_RESTAURANT` FOREIGN KEY (`br_res_id`) REFERENCES `restaurants` (`res_id`),
  CONSTRAINT `FK_BRANCH_STATE` FOREIGN KEY (`br_state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_BRANCH_UPDATED_BY` FOREIGN KEY (`br_updated_by_id`, `br_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Branches of restaurant';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branches`
--

LOCK TABLES `branches` WRITE;
/*!40000 ALTER TABLE `branches` DISABLE KEYS */;
INSERT INTO `branches` VALUES (14,82,'MK2S','mk2s_hms@googlegroups.com','+918106302821','MK2S-1','Siva Kusi','sivakusi12@gmail.com','+918106302821','INR',0,'Fine Dining','{}','Test address','New York','New York','USA','458792',1,1,'2022-01-08 15:53:06','2022-01-08 15:53:06','Asia/Kolkata',26,'Siva Kusi',26,'Siva Kusi','2022-01-08 15:53:06','2022-01-08 15:53:06',0),(15,88,'MK2S','mk2s_hms@googlegroups.com','+918106302821','MK2S-1','Siva Kusi','sivakusi12@gmail.com','+918106302821','INR',0,'Fine Dining','{}','Test address','New York','New York','USA','458792',1,1,'2022-01-08 16:16:52','2022-01-08 16:16:52','Asia/Kolkata',27,'Kusumanajli Mainampati',27,'Kusumanajli Mainampati','2022-01-08 16:16:52','2022-01-08 16:16:52',0),(16,90,'MK2S','siva.kusi12@gmail.com','+918106302821','MK2S-1','Siva Kusi','sivakusi12@gmail.com','+918106302821','INR',0,'Fine Dining','{}','Test address','New York','New York','USA','458792',1,1,'2022-02-01 04:25:31','2022-02-01 04:25:31','Asia/Kolkata',28,'Siva Kusi',28,'Siva Kusi','2022-02-01 04:25:31','2022-02-01 04:25:31',0),(17,93,'DEFAULT BRANCH','s.iva.kusi.12@gmail.com','+919999999999','DEFAULT','DEFAULT SPOC','sivakusi12@gmail.com','+918106302821','INR',0,'Fine Dining','{}','Default','New York','New York','USA','000000',1,1,'2022-10-06 17:30:24','2022-10-06 17:30:24','Asia/Kolkata',46,'DEFAULT OWNER',46,'DEFAULT OWNER','2022-10-06 17:30:24','2022-10-06 17:30:24',0);
/*!40000 ALTER TABLE `branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_registers`
--

DROP TABLE IF EXISTS `cash_registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_registers` (
  `cr_id` int unsigned NOT NULL AUTO_INCREMENT,
  `cr_res_id` int unsigned NOT NULL,
  `cr_branch_id` int unsigned NOT NULL,
  `cr_floor_id` int unsigned DEFAULT NULL,
  `cr_type` enum('Online','Offline') NOT NULL,
  `cr_name` varchar(50) NOT NULL,
  `cr_opening_balance` decimal(17,2) NOT NULL DEFAULT '0.00',
  `cr_current_running_balance` decimal(17,2) NOT NULL DEFAULT '0.00',
  `cr_last_closing_balance` decimal(17,2) NOT NULL DEFAULT '0.00',
  `cr_last_opened_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cr_last_closed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cr_status` enum('New','Open','Closed') NOT NULL DEFAULT 'New',
  `cr_is_active` tinyint NOT NULL DEFAULT '1',
  `cr_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cr_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cr_created_by_id` int unsigned NOT NULL,
  `cr_created_by_name` varchar(50) NOT NULL,
  `cr_updated_by_id` int unsigned NOT NULL,
  `cr_updated_by_name` varchar(50) NOT NULL,
  `cr_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`cr_id`),
  KEY `CR_RES_ID_idx` (`cr_res_id`),
  KEY `CR_BRANCH_FK_idx` (`cr_branch_id`),
  KEY `CR_FLOOR_FK_idx` (`cr_floor_id`),
  KEY `CR_ADDED_BY_FK_idx` (`cr_created_by_id`,`cr_created_by_name`),
  KEY `CR_UPDATED_BY_FK_idx` (`cr_updated_by_id`,`cr_updated_by_name`),
  KEY `crh_cr_id_name_index` (`cr_id`,`cr_name`),
  CONSTRAINT `CR_ADDED_BY_FK` FOREIGN KEY (`cr_created_by_id`, `cr_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CR_BRANCH_FK` FOREIGN KEY (`cr_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CR_FLOOR_FK` FOREIGN KEY (`cr_floor_id`) REFERENCES `floors` (`flr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CR_RES_ID` FOREIGN KEY (`cr_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CR_UPDATED_BY_FK` FOREIGN KEY (`cr_updated_by_id`, `cr_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_registers`
--

LOCK TABLES `cash_registers` WRITE;
/*!40000 ALTER TABLE `cash_registers` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cash_registers_history`
--

DROP TABLE IF EXISTS `cash_registers_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cash_registers_history` (
  `crh_id` int unsigned NOT NULL AUTO_INCREMENT,
  `crh_res_id` int unsigned NOT NULL,
  `crh_branch_id` int unsigned NOT NULL,
  `crh_floor_id` int unsigned NOT NULL,
  `crh_cr_id` int unsigned NOT NULL,
  `crh_cr_name` varchar(50) NOT NULL,
  `crh_opening_timestamp` timestamp NOT NULL,
  `crh_closing_timestamp` timestamp NOT NULL,
  `crh_opening_balance` decimal(17,2) NOT NULL,
  `crh_closing_balance` decimal(17,2) NOT NULL,
  `crh_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `crh_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `crh_created_by_id` int unsigned NOT NULL,
  `crh_created_by_name` varchar(50) NOT NULL,
  `crh_updated_by_id` int unsigned NOT NULL,
  `crh_updated_by_name` varchar(50) NOT NULL,
  PRIMARY KEY (`crh_id`),
  KEY `crh_res_fk_idx` (`crh_res_id`),
  KEY `crh_branch_fk_idx` (`crh_branch_id`),
  KEY `crh_floor_fk_idx` (`crh_floor_id`),
  KEY `crh_cr_id_idx` (`crh_cr_id`),
  KEY `crh_cr_id_name_idx` (`crh_id`,`crh_cr_name`),
  KEY `crh_updated_by_fk_idx` (`crh_updated_by_id`,`crh_updated_by_name`),
  KEY `crh_created_by_fk` (`crh_created_by_id`,`crh_created_by_name`),
  CONSTRAINT `crh_branch_fk` FOREIGN KEY (`crh_branch_id`) REFERENCES `branches` (`br_id`),
  CONSTRAINT `crh_cr_id` FOREIGN KEY (`crh_cr_id`) REFERENCES `cash_registers` (`cr_id`),
  CONSTRAINT `crh_cr_id_name` FOREIGN KEY (`crh_id`, `crh_cr_name`) REFERENCES `cash_registers` (`cr_id`, `cr_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `crh_created_by_fk` FOREIGN KEY (`crh_created_by_id`, `crh_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `crh_floor_fk` FOREIGN KEY (`crh_floor_id`) REFERENCES `floors` (`flr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `crh_res_fk` FOREIGN KEY (`crh_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `crh_updated_by_fk` FOREIGN KEY (`crh_updated_by_id`, `crh_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cash_registers_history`
--

LOCK TABLES `cash_registers_history` WRITE;
/*!40000 ALTER TABLE `cash_registers_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `cash_registers_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`city`,`state`),
  KEY `FK_CITY_STATE_LINK_idx` (`state`),
  CONSTRAINT `FK_CITY_STATE_LINK` FOREIGN KEY (`state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES ('Chittoor','Andhra Pradesh'),('SriKalahasti','Andhra Pradesh'),('California','Los Angles'),('New York','New York');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(50) NOT NULL,
  `client_web_domain` varchar(120) NOT NULL,
  `client_official_email` varchar(120) NOT NULL,
  `client_official_contact` varchar(14) NOT NULL,
  `client_owner` varchar(120) NOT NULL,
  `client_owner_email` varchar(120) NOT NULL,
  `client_owner_phone` varchar(13) NOT NULL,
  `client_owner_address` varchar(100) NOT NULL,
  `client_owner_city` varchar(50) NOT NULL,
  `client_owner_state` varchar(50) NOT NULL,
  `client_owner_country` varchar(50) NOT NULL,
  `client_owner_zip` varchar(10) NOT NULL,
  `client_address` varchar(100) NOT NULL,
  `client_city` varchar(50) NOT NULL,
  `client_state` varchar(50) NOT NULL,
  `client_country` varchar(50) NOT NULL,
  `client_zip` varchar(10) NOT NULL,
  `client_spoc` varchar(50) NOT NULL,
  `client_spoc_email` varchar(50) NOT NULL,
  `client_spoc_phone` varchar(50) NOT NULL,
  `client_added_by` int unsigned NOT NULL,
  `client_updated_by` int unsigned NOT NULL,
  `client_added_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `client_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `client_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`client_id`),
  UNIQUE KEY `client_web_domain_UNIQUE` (`client_web_domain`),
  UNIQUE KEY `client_official_email_UNIQUE` (`client_official_email`),
  KEY `FK_CLIENT_CITY_LINK_idx` (`client_owner_city`,`client_city`),
  KEY `FK_CLIENT_STATE_LINK_idx` (`client_owner_state`),
  KEY `FK_CLIENT_COUNTRY_LINK_idx` (`client_owner_country`),
  KEY `FK_CLIENT_OWNER_CITY_LINK_idx` (`client_city`),
  KEY `FK_CLIENT_OWNER_STATE_LINK_idx` (`client_state`),
  KEY `FK_CLIENT_OWNER_COUNTRY_idx` (`client_country`),
  KEY `FK_CLIENT_ADMIN_ADDED_BY_idx` (`client_added_by`),
  KEY `FK_CLIENT_ADMIN_UPDATED_BY_idx` (`client_updated_by`),
  CONSTRAINT `FK_CLIENT_ADMIN_ADDED_BY` FOREIGN KEY (`client_added_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_ADMIN_UPDATED_BY` FOREIGN KEY (`client_updated_by`) REFERENCES `admin` (`adm_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_CITY_LINK` FOREIGN KEY (`client_owner_city`) REFERENCES `city` (`city`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_COUNTRY_LINK` FOREIGN KEY (`client_owner_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_OWNER_CITY_LINK` FOREIGN KEY (`client_city`) REFERENCES `city` (`city`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_OWNER_COUNTRY` FOREIGN KEY (`client_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_OWNER_STATE_LINK` FOREIGN KEY (`client_state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CLIENT_STATE_LINK` FOREIGN KEY (`client_owner_state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`country`),
  UNIQUE KEY `country_UNIQUE` (`country`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES ('India'),('USA');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `currency_codes`
--

DROP TABLE IF EXISTS `currency_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `currency_codes` (
  `cc_code` varchar(50) NOT NULL,
  `cc_country` varchar(50) NOT NULL,
  PRIMARY KEY (`cc_code`),
  KEY `cc_country_fk` (`cc_country`),
  CONSTRAINT `cc_country_fk` FOREIGN KEY (`cc_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_codes`
--

LOCK TABLES `currency_codes` WRITE;
/*!40000 ALTER TABLE `currency_codes` DISABLE KEYS */;
INSERT INTO `currency_codes` VALUES ('INR','India'),('USD','USA');
/*!40000 ALTER TABLE `currency_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_details`
--

DROP TABLE IF EXISTS `delivery_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_details` (
  `dd_id` int unsigned NOT NULL AUTO_INCREMENT,
  `dd_res_id` int unsigned NOT NULL,
  `dd_branch_id` int unsigned NOT NULL,
  `dd_distance` int NOT NULL,
  `dd_charges` decimal(17,2) NOT NULL,
  `dd_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dd_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dd_created_by_id` int unsigned NOT NULL,
  `dd_created_by_name` varchar(50) NOT NULL,
  `dd_updated_by_id` int unsigned NOT NULL,
  `dd_updated_by_name` varchar(50) NOT NULL,
  `dd_status` tinyint NOT NULL DEFAULT '1',
  `dd_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`dd_id`),
  KEY `DD_FK_RES_idx` (`dd_res_id`),
  KEY `DD_CREATED_BY_idx` (`dd_created_by_id`,`dd_created_by_name`),
  KEY `DD_UPDATED_BY_idx` (`dd_updated_by_id`,`dd_updated_by_name`),
  CONSTRAINT `DD_CREATED_BY` FOREIGN KEY (`dd_created_by_id`, `dd_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `DD_FK_RES` FOREIGN KEY (`dd_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `DD_UPDATED_BY` FOREIGN KEY (`dd_updated_by_id`, `dd_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_details`
--

LOCK TABLES `delivery_details` WRITE;
/*!40000 ALTER TABLE `delivery_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_branch_mapping`
--

DROP TABLE IF EXISTS `employee_branch_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_branch_mapping` (
  `ebm_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ebm_emp_id` int unsigned NOT NULL,
  `ebm_res_id` int unsigned NOT NULL,
  `ebm_branch_id` int unsigned NOT NULL,
  `ebm_floor_id` int unsigned NOT NULL,
  `ebm_is_active` tinyint DEFAULT '0',
  `ebm_created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `ebm_updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_created_by_id` int unsigned DEFAULT NULL,
  `ebm_created_by_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ebm_modified_by_id` int unsigned DEFAULT NULL,
  `ebm_modified_by_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ebm_id`),
  KEY `FK_EMP_MAPPING_EMP_idx` (`ebm_emp_id`),
  KEY `FK_EMP_MAPPING_BRANCH` (`ebm_branch_id`),
  KEY `FK_EMP_MAPPING_FLOOR` (`ebm_floor_id`),
  KEY `FK_EMP_MAPPING_RES` (`ebm_res_id`),
  CONSTRAINT `FK_EMP_MAPPING_BRANCH` FOREIGN KEY (`ebm_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_MAPPING_EMP` FOREIGN KEY (`ebm_emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_MAPPING_FLOOR` FOREIGN KEY (`ebm_floor_id`) REFERENCES `floors` (`flr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_MAPPING_RES` FOREIGN KEY (`ebm_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_branch_mapping`
--

LOCK TABLES `employee_branch_mapping` WRITE;
/*!40000 ALTER TABLE `employee_branch_mapping` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee_branch_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_role_permissions`
--

DROP TABLE IF EXISTS `employee_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_role_permissions` (
  `erp_id` int unsigned NOT NULL AUTO_INCREMENT,
  `erp_res_id` int unsigned NOT NULL,
  `erp_role` varchar(50) NOT NULL,
  `erp_res_mgmt` tinyint NOT NULL,
  `erp_admin_mgmt` tinyint NOT NULL,
  `erp_role_mgmt` tinyint NOT NULL,
  `erp_branch_mgmt` tinyint NOT NULL,
  `erp_emp_mgmt` tinyint NOT NULL,
  `erp_floor_mgmt` tinyint NOT NULL,
  `erp_menu_mgmt` tinyint NOT NULL,
  `erp_menu_status_mgmt` tinyint NOT NULL,
  `erp_category_mgmt` tinyint NOT NULL,
  `erp_kitchen_mgmt` tinyint NOT NULL,
  `erp_waiting_mgmt` tinyint NOT NULL,
  `erp_order_mgmt` tinyint NOT NULL,
  `erp_billing_mgmt` tinyint NOT NULL,
  `erp_delivery_mgmt` tinyint NOT NULL,
  `erp_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `erp_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `erp_created_by_id` int unsigned DEFAULT NULL,
  `erp_created_by_name` varchar(50) DEFAULT NULL,
  `erp_updated_by_id` int unsigned DEFAULT NULL,
  `erp_updated_by_name` varchar(50) DEFAULT NULL,
  `erp_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`erp_id`),
  UNIQUE KEY `UNIQUE` (`erp_res_id`,`erp_role`),
  KEY `ERP_ROLE_RES_idx` (`erp_res_id`),
  KEY `ERP_ROLE_idx` (`erp_role`),
  KEY `ERP_CREATED_BY_idx` (`erp_created_by_id`,`erp_created_by_name`),
  KEY `ERP_UPDATED_BY_idx` (`erp_updated_by_id`,`erp_updated_by_name`),
  CONSTRAINT `ERP_CREATED_BY` FOREIGN KEY (`erp_created_by_id`, `erp_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ERP_ROLE` FOREIGN KEY (`erp_role`) REFERENCES `employee_roles` (`emp_role`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ERP_ROLE_RES` FOREIGN KEY (`erp_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ERP_UPDATED_BY` FOREIGN KEY (`erp_updated_by_id`, `erp_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_role_permissions`
--

LOCK TABLES `employee_role_permissions` WRITE;
/*!40000 ALTER TABLE `employee_role_permissions` DISABLE KEYS */;
INSERT INTO `employee_role_permissions` VALUES (1,88,'Owner',1,1,1,1,1,1,1,1,1,1,1,0,0,0,'2022-01-08 16:16:52','2022-01-08 16:16:52',NULL,NULL,NULL,NULL,0),(2,82,'Owner',1,1,1,1,1,1,1,1,1,1,1,0,0,0,'2022-01-08 16:16:52','2022-01-08 16:16:52',NULL,NULL,NULL,NULL,0),(3,90,'Owner',2,4,4,4,4,4,4,4,4,4,4,3,3,4,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(4,90,'Admin',2,1,4,2,4,4,4,4,4,4,4,3,3,4,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(5,90,'Branch Manager',1,0,1,2,3,2,2,2,2,4,4,3,3,4,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(6,90,'Floor Manager',1,0,1,1,1,1,1,2,1,1,4,3,3,3,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(7,90,'Billing Manager',1,0,1,1,0,1,1,1,1,1,1,3,3,3,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(8,90,'Kitchen Manager',1,0,1,1,0,1,2,2,2,2,1,1,0,0,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(9,90,'Kitchen Staff',1,0,1,1,0,1,1,1,1,1,1,1,0,0,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(10,90,'Waiters',1,0,1,1,0,1,1,1,1,1,1,3,1,0,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(11,90,'Maintenance Staff',1,0,1,1,0,1,0,0,0,0,0,1,0,0,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(12,90,'Delivery Staff',1,0,1,1,0,1,0,0,0,0,0,1,0,2,'2022-02-01 04:25:31','2022-02-01 04:25:31',NULL,NULL,NULL,NULL,0),(13,93,'Owner',2,4,4,4,4,4,4,4,4,4,4,3,3,4,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(14,93,'Admin',2,1,4,2,4,4,4,4,4,4,4,3,3,4,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(15,93,'Branch Manager',1,0,1,2,3,2,2,2,2,4,4,3,3,4,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(16,93,'Floor Manager',1,0,1,1,1,1,1,2,1,1,4,3,3,3,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(17,93,'Billing Manager',1,0,1,1,0,1,1,1,1,1,1,3,3,3,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(18,93,'Kitchen Manager',1,0,1,1,0,1,2,2,2,2,1,1,0,0,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(19,93,'Kitchen Staff',1,0,1,1,0,1,1,1,1,1,1,1,0,0,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(20,93,'Waiters',1,0,1,1,0,1,1,1,1,1,1,3,1,0,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(21,93,'Maintenance Staff',1,0,1,1,0,1,0,0,0,0,0,1,0,0,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0),(22,93,'Delivery Staff',1,0,1,1,0,1,0,0,0,0,0,1,0,2,'2022-10-06 17:30:24','2022-10-06 17:30:24',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `employee_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_roles`
--

DROP TABLE IF EXISTS `employee_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_roles` (
  `emp_role_id` int unsigned NOT NULL AUTO_INCREMENT,
  `emp_role` varchar(50) NOT NULL,
  `emp_role_res_id` int unsigned NOT NULL,
  `emp_role_order` int unsigned NOT NULL,
  `emp_role_created_by_id` int unsigned DEFAULT NULL,
  `emp_role_created_by_name` varchar(50) DEFAULT NULL,
  `emp_role_updated_by_id` int unsigned DEFAULT NULL,
  `emp_role_updated_by_name` varchar(50) DEFAULT NULL,
  `emp_role_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emp_role_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_role_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_role_id`),
  UNIQUE KEY `emp_role_unique_res` (`emp_role`,`emp_role_res_id`),
  KEY `EMP_ROLE_RESTAURANT_idx` (`emp_role_res_id`),
  KEY `emp_role` (`emp_role`) /*!80000 INVISIBLE */,
  KEY `EMP_ROLE_CREATED_BY_FK_idx` (`emp_role_created_by_id`,`emp_role_created_by_name`),
  KEY `EMP_ROLE_UPDATED_BY_FK_idx` (`emp_role_updated_by_id`,`emp_role_updated_by_name`),
  KEY `emp_role_res_index` (`emp_role_res_id`,`emp_role`),
  KEY `EMP_ROLE_IX` (`emp_role`),
  CONSTRAINT `EMP_ROLE_CREATED_BY_FK` FOREIGN KEY (`emp_role_created_by_id`, `emp_role_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `EMP_ROLE_RESTAURANT` FOREIGN KEY (`emp_role_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `EMP_ROLE_UPDATED_BY_FK` FOREIGN KEY (`emp_role_updated_by_id`, `emp_role_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='This contain roles for the MK2S LLC Employees';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_roles`
--

LOCK TABLES `employee_roles` WRITE;
/*!40000 ALTER TABLE `employee_roles` DISABLE KEYS */;
INSERT INTO `employee_roles` VALUES (1,'Admin',1,2,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(2,'Billing Manager',1,5,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(3,'Branch Manager',1,3,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(4,'Floor manager',1,4,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(5,'Kitchen Manager',1,5,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(6,'Kitchen Staff',1,6,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(7,'Maintainance Staff',1,6,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(8,'Owner',1,1,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(9,'Waiting Staff',1,6,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00',0),(35,'Owner',82,1,NULL,NULL,NULL,NULL,'2022-01-08 15:53:05','2022-01-08 15:53:05',0),(37,'Owner',88,1,NULL,NULL,NULL,NULL,'2022-01-08 16:16:52','2022-01-08 16:16:52',0),(48,'Owner',90,1,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(49,'Admin',90,2,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(50,'Branch Manager',90,3,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(51,'Floor Manager',90,4,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(52,'Billing Manager',90,5,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(53,'Kitchen Manager',90,5,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(54,'Kitchen Staff',90,6,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(55,'Maintenance Staff',90,6,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(56,'Waiters',90,6,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(57,'Delivery Staff',90,7,NULL,NULL,NULL,NULL,'2022-02-01 04:25:31','2022-02-01 04:25:31',0),(58,'Owner',93,1,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(59,'Admin',93,2,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(60,'Branch Manager',93,3,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(61,'Floor Manager',93,4,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(62,'Billing Manager',93,5,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(63,'Kitchen Manager',93,5,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(64,'Kitchen Staff',93,6,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(65,'Maintenance Staff',93,6,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(66,'Waiters',93,6,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0),(67,'Delivery Staff',93,7,NULL,NULL,NULL,NULL,'2022-10-06 17:30:24','2022-10-06 17:30:24',0);
/*!40000 ALTER TABLE `employee_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `emp_id` int unsigned NOT NULL AUTO_INCREMENT,
  `emp_res_id` int unsigned NOT NULL,
  `emp_username` varchar(50) NOT NULL,
  `emp_code` varchar(50) NOT NULL,
  `emp_role` varchar(50) NOT NULL,
  `emp_name` varchar(100) NOT NULL,
  `emp_email` varchar(320) NOT NULL,
  `emp_mobile` varchar(15) NOT NULL,
  `emp_password` varchar(320) NOT NULL,
  `emp_lock_pin` varchar(320) DEFAULT NULL,
  `emp_address` varchar(200) NOT NULL,
  `emp_city` varchar(50) NOT NULL,
  `emp_state` varchar(50) NOT NULL,
  `emp_country` varchar(50) NOT NULL,
  `emp_zip_code` varchar(15) NOT NULL,
  `emp_dob` date NOT NULL,
  `emp_doj` date NOT NULL,
  `emp_is_active` tinyint NOT NULL DEFAULT '1',
  `emp_is_deleted` tinyint NOT NULL DEFAULT '0',
  `emp_added_by_id` int unsigned NOT NULL DEFAULT '0',
  `emp_added_by_name` varchar(50) NOT NULL DEFAULT 'MK2S',
  `emp_updated_by_id` int unsigned NOT NULL DEFAULT '0',
  `emp_updated_by_name` varchar(50) NOT NULL DEFAULT 'MK2S',
  `emp_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `emp_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `emp_first_login` tinyint DEFAULT '0',
  `emp_2FA_mandatory` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `emp_username_UNIQUE` (`emp_res_id`,`emp_username`),
  UNIQUE KEY `emp_mobile_UNIQUE` (`emp_res_id`,`emp_mobile`),
  UNIQUE KEY `emp_email_UNIQUE` (`emp_res_id`,`emp_email`),
  UNIQUE KEY `emp_code_UNIQUE` (`emp_res_id`,`emp_code`),
  KEY `FK_EMP_RES_LINK_idx` (`emp_res_id`),
  KEY `FK_EMP_CITY_idx` (`emp_city`),
  KEY `FK_EMP_STATE_idx` (`emp_state`),
  KEY `FK_EMP_COUNTRY_idx` (`emp_country`),
  KEY `FK_EMP_ID_NAME` (`emp_id`,`emp_name`),
  KEY `FK_EMP_NAME` (`emp_name`),
  KEY `FK_EMP_ROLES` (`emp_res_id`,`emp_role`),
  CONSTRAINT `FK_EMP_CITY` FOREIGN KEY (`emp_city`) REFERENCES `city` (`city`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_COUNTRY` FOREIGN KEY (`emp_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_RES_LINK` FOREIGN KEY (`emp_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_ROLES` FOREIGN KEY (`emp_res_id`, `emp_role`) REFERENCES `employee_roles` (`emp_role_res_id`, `emp_role`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_EMP_STATE` FOREIGN KEY (`emp_state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (26,82,'Siva.Kusi','M00001','Owner','Siva Kusi','sivakusi12@gmail.com','+918106302821','$2a$10$KJQCnBrO2RgZgmGOQ6RrkuowSBcdtIeXpj0oKAfRf0HnJx1plggO.',NULL,'Test address','New York','New York','USA','458792','1998-05-21','2021-01-06',1,0,0,'MK2S',0,'MK2S','2022-01-08 15:53:05','2022-01-08 15:53:05',0,0),(27,88,'Kusumanajli.Mainampati','M00001','Owner','Kusumanajli Mainampati','kusumanjali.55@gmail.com','+918500777641','$2a$10$o.TM9W.GxXKf5qnS22xKVO1PwhgtTZdbltZzSojc5Ahb7MM8KNEMC',NULL,'Test address','New York','New York','USA','458792','1998-05-21','2021-01-06',1,0,0,'MK2S',0,'MK2S','2022-01-08 16:16:52','2022-01-08 16:16:52',0,0),(28,90,'siva.kusi','M00001','Owner','Siva Kusi','sivakusi12@gmail.com','+918500777641','$2a$10$.tNTGV9xnzsw0/lCj8h8qeNOwhn0u574hDhbXO6N7.RV1XICHfU76','$2a$10$ou.PU.OIWXGipqP11GoNi.ZcP2rUOoUzSD9wu.Pg7OC.l01o14DtG','Test address','New York','New York','USA','458792','1998-05-21','2021-01-06',1,0,0,'MK2S',0,'MK2S','2022-02-01 04:25:31','2022-10-04 15:59:11',0,0),(32,90,'Test.User','M00002','Admin','Test User','siva.kusi12@gmail.com','+918106302821','$2a$10$CZSFEW1w68XWBVD16XY4UOwCQ6myZe88MSE7k6N.DSE37nwkxWZbG',NULL,'test address','New York','New York','USA','125456','1998-05-21','2022-01-21',1,0,28,'Siva Kusi',0,'MK2S','2022-02-03 05:08:11','2022-02-03 05:08:11',0,0),(33,90,'Test.User2','M00003','Admin','Test User','sivakusi.12@gmail.com','+917842487859','$2a$10$UURGSGeIc3IOMOcvq0HdK.bhOgfoEDkq5WhfS.d8sTf4nD8iJOKXq',NULL,'test address','New York','New York','USA','125456','1998-05-21','2022-01-21',1,0,28,'Siva Kusi',0,'MK2S','2022-02-03 17:01:26','2022-02-03 17:01:26',0,0),(39,90,'Test.User3','M00004','Admin','Test User','siva.kusi.12@gmail.com','+917382310149','$2a$10$vjTknH3W5jVTT2tl71fB8ucnYgXFxOmD/wxrQlzp.s8lc1DQcoMWi',NULL,'test address','New York','New York','USA','125456','1998-05-21','2022-01-21',1,0,28,'Siva Kusi',0,'MK2S','2022-02-03 17:34:01','2022-02-03 17:34:01',0,0),(40,90,'Test.User.1','M00005','Admin','Test User 1','s.iva.kusi.12@gmail.com','+919100248749','$2a$10$7e/W4TBkeMnoeMwQw/awqeTac5TymJz7YPhMgns098GRVpO./v9ly',NULL,'test address','New York','New York','USA','125456','1998-05-21','2022-01-21',1,0,28,'Siva Kusi',0,'MK2S','2022-02-03 17:34:36','2022-02-03 17:34:36',0,0),(44,90,'Test.User6','M00006','Admin','Test User','sivakusi123@gmail.com','+918106302822','$2a$10$.pB7J3FHZVQmjq1HkL2tQuxcFTpO185tUzs6XeDcir4om0J2TKiD.',NULL,'test address','New York','New York','USA','125456','1998-05-21','2022-01-21',1,0,28,'Siva Kusi',0,'MK2S','2022-02-04 06:31:24','2022-02-04 06:31:24',0,0),(46,93,'DEFAULT.OWNER','D00001','Owner','DEFAULT OWNER','sivakusi12@gmail.com','+919999999999','$2a$10$jQ4.cfdcQMr/79HLki0dPeFlRHCssYcgksRDZ3z1SQ8xgeZORL6KC',NULL,'DEFAULT','New York','New York','USA','00000','1998-05-21','2022-01-06',1,0,0,'MK2S',0,'MK2S','2022-10-06 17:30:24','2022-10-06 17:30:24',0,0);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `employees_BEFORE_INSERT` BEFORE INSERT ON `employees` FOR EACH ROW BEGIN

DECLARE res_name VARCHAR(20);
DECLARE emp_count INT;
DECLARE userName VARCHAR(100);


SELECT res_code INTO @res_name FROM restaurants WHERE res_id = NEW.emp_res_id;
SET @userName = CONCAT(REPLACE(NEW.emp_name, ' ', '.'));
SELECT count(*) INTO @emp_count FROM employees WHERE emp_res_id = NEW.emp_res_id;
SELECT IF( count(*) > 0, CONCAT(@userName, (count(*) + 1)) , @userName ) INTO @userName FROM employees WHERE emp_res_id = NEW.emp_res_id AND emp_name = NEW.emp_name;

SET NEW.emp_code = CONCAT(SUBSTR(@res_name, 1, 1), LPAD((@emp_count+1), 5, '0'));
SET NEW.emp_username = @userName;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `floors`
--

DROP TABLE IF EXISTS `floors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floors` (
  `flr_id` int unsigned NOT NULL AUTO_INCREMENT,
  `flr_res_id` int unsigned NOT NULL,
  `flr_branch_id` int unsigned NOT NULL,
  `flr_name` varchar(50) NOT NULL,
  `flr_code` varchar(20) NOT NULL,
  `flr_is_active` tinyint NOT NULL DEFAULT '1',
  `flr_is_deleted` tinyint NOT NULL DEFAULT '0',
  `flr_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `flr_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `flr_created_by_id` int unsigned NOT NULL,
  `flr_created_by_name` varchar(100) NOT NULL,
  `flr_updaetd_by_id` int unsigned NOT NULL,
  `flr_updated_by_name` varchar(100) NOT NULL,
  PRIMARY KEY (`flr_id`),
  UNIQUE KEY `FLOOR_BRANCH_UNIQUE` (`flr_branch_id`,`flr_name`),
  UNIQUE KEY `flr_code_UNIQUE` (`flr_code`),
  KEY `FK_FLR_RES_ID_idx` (`flr_res_id`),
  KEY `FK_CREATED_BY_ID_NAME_idx` (`flr_created_by_id`,`flr_created_by_name`),
  KEY `FK_UPDATED_BY_ID_NAME_idx` (`flr_updaetd_by_id`,`flr_updated_by_name`),
  CONSTRAINT `FK_CREATED_BY_ID_NAME` FOREIGN KEY (`flr_created_by_id`, `flr_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_FLR_BRANCH_ID` FOREIGN KEY (`flr_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_FLR_RES_ID` FOREIGN KEY (`flr_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_UPDATED_BY_ID_NAME` FOREIGN KEY (`flr_updaetd_by_id`, `flr_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floors`
--

LOCK TABLES `floors` WRITE;
/*!40000 ALTER TABLE `floors` DISABLE KEYS */;
/*!40000 ALTER TABLE `floors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_address`
--

DROP TABLE IF EXISTS `guest_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_address` (
  `ga_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ga_res_id` int unsigned NOT NULL,
  `ga_guest_id` int unsigned NOT NULL,
  `ga_guest_name` varchar(50) NOT NULL,
  `ga_type` enum('Home','Work','Other') DEFAULT NULL,
  `ga_address` varchar(200) DEFAULT NULL,
  `ga_city` varchar(50) DEFAULT NULL,
  `ga_state` varchar(50) DEFAULT NULL,
  `ga_country` varchar(50) DEFAULT NULL,
  `ga_pin` varchar(15) DEFAULT NULL,
  `ga_is_active` tinyint DEFAULT NULL,
  `ga_is_deleted` tinyint DEFAULT NULL,
  `ga_created_at` timestamp NULL DEFAULT NULL,
  `ga_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ga_id`),
  KEY `FK_GA_RES_idx` (`ga_res_id`),
  KEY `GA_GUEST_FK` (`ga_guest_id`,`ga_guest_name`),
  CONSTRAINT `FK_GA_RES` FOREIGN KEY (`ga_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `GA_GUEST_FK` FOREIGN KEY (`ga_guest_id`, `ga_guest_name`) REFERENCES `guests` (`guest_id`, `guest_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_address`
--

LOCK TABLES `guest_address` WRITE;
/*!40000 ALTER TABLE `guest_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guests` (
  `guest_id` int unsigned NOT NULL AUTO_INCREMENT,
  `guest_res_id` int unsigned NOT NULL,
  `guest_name` varchar(100) NOT NULL,
  `guest_email` varchar(320) DEFAULT NULL,
  `guest_mobile` varchar(20) DEFAULT NULL,
  `guest_password` varchar(512) NOT NULL,
  `guest_gender` enum('Male','Female','Others') DEFAULT NULL,
  `guest_dob` date DEFAULT NULL,
  `guest_address` varchar(150) DEFAULT NULL,
  `guest_city` varchar(50) DEFAULT NULL,
  `guest_state` varchar(50) DEFAULT NULL,
  `guest_country` varchar(50) DEFAULT NULL,
  `guest_pin` varchar(50) DEFAULT NULL,
  `guest_is_active` tinyint NOT NULL DEFAULT '1',
  `guest_is_deleted` tinyint NOT NULL DEFAULT '0',
  `guest_created_by_id` int unsigned DEFAULT NULL,
  `guest_created_by_name` varchar(50) DEFAULT NULL,
  `guest_updated_by_id` int unsigned DEFAULT NULL,
  `guest_updated_by_name` varchar(50) DEFAULT NULL,
  `guest_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `guest_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `guest_self_created` tinyint NOT NULL DEFAULT '1',
  `guest_self_updated` tinyint NOT NULL DEFAULT '1',
  `guest_contact_for_promotional` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`guest_id`),
  UNIQUE KEY `UNIQUE_EMAIL` (`guest_res_id`,`guest_email`) /*!80000 INVISIBLE */,
  UNIQUE KEY `UNIQUE_MOBILE_PER_RESTAURANT` (`guest_res_id`,`guest_mobile`),
  KEY `INDEX_ID_NAME_GUEST` (`guest_id`,`guest_name`),
  KEY `FK_GUEST_CREATED_BY_ID_NAME_idx` (`guest_created_by_id`,`guest_created_by_name`),
  KEY `FK_GUEST_UPDATED_BY_ID_NAME_idx` (`guest_updated_by_id`,`guest_updated_by_name`),
  CONSTRAINT `FK_GUEST_CREATED_BY_ID_NAME` FOREIGN KEY (`guest_created_by_id`, `guest_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_GUEST_RES` FOREIGN KEY (`guest_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_GUEST_UPDATED_BY_ID_NAME` FOREIGN KEY (`guest_updated_by_id`, `guest_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient_types`
--

DROP TABLE IF EXISTS `ingredient_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredient_types` (
  `ing_type_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ing_type_res_id` int unsigned NOT NULL,
  `ing_type_branch_id` int unsigned NOT NULL,
  `ing_type_type` varchar(50) NOT NULL,
  `ing_type_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ing_type_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ing_type_created_by_id` int unsigned NOT NULL,
  `ing_type_created_by_name` varchar(50) NOT NULL,
  `ing_type_updated_by_id` int unsigned NOT NULL,
  `ing_type_updated_by_name` varchar(50) NOT NULL,
  `ing_type_status` tinyint NOT NULL DEFAULT '1',
  `ing_type_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ing_type_id`),
  KEY `INDEX_ID_TYPE` (`ing_type_id`,`ing_type_type`),
  KEY `ING_TYPE_RES_FK_idx` (`ing_type_res_id`),
  KEY `ING_CREATED_BY_idx` (`ing_type_created_by_id`,`ing_type_created_by_name`),
  KEY `ING_UPDATED_BY_FK_idx` (`ing_type_updated_by_id`,`ing_type_updated_by_name`),
  KEY `ING_TYPE_BRANCH_FK` (`ing_type_branch_id`),
  CONSTRAINT `ING_CREATED_BY_FK` FOREIGN KEY (`ing_type_created_by_id`, `ing_type_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ING_TYPE_BRANCH_FK` FOREIGN KEY (`ing_type_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ING_TYPE_RES_FK` FOREIGN KEY (`ing_type_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ING_UPDATED_BY_FK` FOREIGN KEY (`ing_type_updated_by_id`, `ing_type_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient_types`
--

LOCK TABLES `ingredient_types` WRITE;
/*!40000 ALTER TABLE `ingredient_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredient_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingredients` (
  `ing_id` int unsigned NOT NULL AUTO_INCREMENT,
  `ing_res_id` int unsigned NOT NULL,
  `ing_branch_id` int unsigned NOT NULL,
  `ing_name` varchar(100) NOT NULL,
  `ing_measuring_units` varchar(20) NOT NULL,
  `ing_is_available` tinyint NOT NULL DEFAULT '1',
  `ing_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ing_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ing_created_by_id` int unsigned NOT NULL,
  `ing_created_by_name` varchar(50) NOT NULL,
  `ing_updated_by_id` int unsigned NOT NULL,
  `ing_updated_by_name` varchar(50) NOT NULL,
  `ing_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ing_id`),
  KEY `ING_RES_FK` (`ing_res_id`) /*!80000 INVISIBLE */,
  KEY `ING_CREATED_BY_ID_NAME_FK_idx` (`ing_created_by_id`,`ing_created_by_name`),
  KEY `ING_UPDATED_BY_ID_NAME_FK_idx` (`ing_updated_by_id`,`ing_updated_by_name`),
  KEY `ING_BRANCH_FK` (`ing_branch_id`),
  KEY `ING_ID_NAME` (`ing_id`,`ing_name`) /*!80000 INVISIBLE */,
  KEY `ING_ID_NAME_UNITS` (`ing_id`,`ing_name`,`ing_measuring_units`),
  CONSTRAINT `FK_ING_RES` FOREIGN KEY (`ing_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ING_BRANCH_FK` FOREIGN KEY (`ing_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ING_CREATED_BY_ID_NAME_FK` FOREIGN KEY (`ing_created_by_id`, `ing_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ING_UPDATED_BY_ID_NAME_FK` FOREIGN KEY (`ing_updated_by_id`, `ing_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inv_id` int unsigned NOT NULL AUTO_INCREMENT,
  `inv_res_id` int unsigned NOT NULL,
  `inv_branch_id` int unsigned NOT NULL,
  `inv_ing_id` int unsigned NOT NULL,
  `inv_ing_name` varchar(50) NOT NULL,
  `inv_available_quantity` decimal(17,2) NOT NULL,
  `inv_ing_measure_units` varchar(50) NOT NULL,
  `inv_status` tinyint NOT NULL DEFAULT '1',
  `inv_is_deleted` tinyint NOT NULL DEFAULT '0',
  `inv_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `inv_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `inv_created_by_id` int unsigned NOT NULL,
  `inv_created_by_name` varchar(50) NOT NULL,
  `inv_updated_by_id` int unsigned NOT NULL,
  `inv_updated_by_name` varchar(50) NOT NULL,
  PRIMARY KEY (`inv_id`),
  KEY `INV_RES_ID_idx` (`inv_res_id`),
  KEY `INV_ING_FK_idx` (`inv_ing_id`,`inv_ing_name`),
  KEY `INV_CREATED_BY_idx` (`inv_created_by_id`,`inv_created_by_name`),
  KEY `INV_UPDATED_BY_idx` (`inv_updated_by_id`,`inv_updated_by_name`),
  KEY `INV_BRANCH_FK` (`inv_branch_id`),
  CONSTRAINT `INV_BRANCH_FK` FOREIGN KEY (`inv_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `INV_CREATED_BY` FOREIGN KEY (`inv_created_by_id`, `inv_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `INV_ING_FK` FOREIGN KEY (`inv_ing_id`, `inv_ing_name`) REFERENCES `ingredients` (`ing_id`, `ing_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `INV_RES_FK` FOREIGN KEY (`inv_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `INV_UPDATED_BY` FOREIGN KEY (`inv_updated_by_id`, `inv_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `measuring_units`
--

DROP TABLE IF EXISTS `measuring_units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `measuring_units` (
  `mu_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mu_res_id` int unsigned NOT NULL,
  `mu_branch_id` int unsigned NOT NULL,
  `mu_is_base_unit` tinyint NOT NULL,
  `mu_unit_type` enum('Liquid','Solid') NOT NULL,
  `mu_unit_longhand` varchar(50) NOT NULL,
  `mu_unit_shorthand` varchar(20) NOT NULL,
  `mu_convertion_unit` varchar(50) NOT NULL,
  `mu_conversion_value` decimal(15,2) NOT NULL,
  `mu_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mu_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mu_created_by_id` int unsigned NOT NULL,
  `mu_created_by_name` varchar(50) NOT NULL,
  `mu_updated_by_id` int unsigned NOT NULL,
  `mu_updated_by_name` varchar(50) NOT NULL,
  `mu_is_available` tinyint NOT NULL DEFAULT '1',
  `mu_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`mu_id`),
  KEY `MU_RES_FK_idx` (`mu_res_id`),
  KEY `MU_UPDATED_BY_ID_NAME_idx` (`mu_updated_by_id`,`mu_updated_by_name`),
  KEY `MU_CREATED_BY_ID_NAME_FK_idx` (`mu_created_by_id`,`mu_created_by_name`),
  KEY `mu_BRANCH_FK` (`mu_branch_id`),
  CONSTRAINT `mu_BRANCH_FK` FOREIGN KEY (`mu_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MU_CREATED_BY_ID_NAME_FK` FOREIGN KEY (`mu_created_by_id`, `mu_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MU_RES_FK` FOREIGN KEY (`mu_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MU_UPDATED_BY_ID_NAME` FOREIGN KEY (`mu_updated_by_id`, `mu_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `measuring_units`
--

LOCK TABLES `measuring_units` WRITE;
/*!40000 ALTER TABLE `measuring_units` DISABLE KEYS */;
/*!40000 ALTER TABLE `measuring_units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_categories`
--

DROP TABLE IF EXISTS `menu_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_categories` (
  `mcat_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mcat_res_id` int unsigned NOT NULL,
  `mcat_branch_id` int unsigned NOT NULL,
  `mcat_name` varchar(50) NOT NULL,
  `mcat_tax` decimal(5,2) NOT NULL COMMENT 'Category Tax',
  `mcat_available_days` json NOT NULL,
  `mcat_available_time` json NOT NULL,
  `mcat_display_sort_order` int NOT NULL DEFAULT '0',
  `mcat_is_active` tinyint NOT NULL DEFAULT '1',
  `mcat_is_special` tinyint NOT NULL DEFAULT '0',
  `mcat_is_available_online` tinyint NOT NULL DEFAULT '1',
  `mcat_is_available` tinyint NOT NULL DEFAULT '1',
  `mcat_is_deleted` tinyint NOT NULL DEFAULT '0',
  `mcat_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mcat_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mcat_created_by_id` int unsigned NOT NULL,
  `mcat_created_by_name` varchar(100) NOT NULL,
  `mcat_updated_by_id` int unsigned DEFAULT NULL,
  `mcat_updated_by_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mcat_id`),
  UNIQUE KEY `UNIQUE_CAT_RES` (`mcat_res_id`,`mcat_name`) USING BTREE,
  KEY `FK_CAT_CREATED_BY_ID_NAME_idx` (`mcat_created_by_id`,`mcat_created_by_name`),
  KEY `FK_CAT_UPDATED_BY_ID_NAME_idx` (`mcat_updated_by_id`,`mcat_updated_by_name`),
  KEY `FK_CAT_BRANCH_ID_idx` (`mcat_branch_id`),
  KEY `INDEX_CAT_ID_NAME` (`mcat_id`,`mcat_name`),
  CONSTRAINT `FK_CAT_BRANCH_ID` FOREIGN KEY (`mcat_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_CREATED_BY_ID_NAME` FOREIGN KEY (`mcat_created_by_id`, `mcat_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_RES_ID` FOREIGN KEY (`mcat_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_CAT_UPDATED_BY_ID_NAME` FOREIGN KEY (`mcat_updated_by_id`, `mcat_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_categories`
--

LOCK TABLES `menu_categories` WRITE;
/*!40000 ALTER TABLE `menu_categories` DISABLE KEYS */;
INSERT INTO `menu_categories` VALUES (1,90,16,'Salads',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-29 08:30:07','2023-01-04 16:29:14',28,'Siva Kusi',28,'Siva Kusi'),(3,90,16,'Drinks',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,1,1,1,0,'2022-12-29 08:33:47','2022-12-30 19:14:19',28,'Siva Kusi',28,'Siva Kusi'),(5,90,16,'Soups',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-29 08:38:55','2022-12-30 19:15:34',28,'Siva Kusi',28,'Siva Kusi'),(7,90,16,'Sides',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,1,0,1,0,'2022-12-29 14:07:03','2022-12-30 19:37:55',28,'Siva Kusi',28,'Siva Kusi'),(8,90,16,'Appetizers',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-29 14:14:43','2022-12-30 19:13:12',28,'Siva Kusi',28,'Siva Kusi'),(9,90,16,'Specials',0.00,'[{\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,1,1,1,0,'2022-12-29 16:21:34','2022-12-30 19:15:42',28,'Siva Kusi',28,'Siva Kusi'),(10,90,16,'Entrees',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-29 16:29:29','2023-01-04 16:29:01',28,'Siva Kusi',28,'Siva Kusi'),(11,90,16,'Desserts',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-30 09:44:43','2022-12-30 19:14:05',28,'Siva Kusi',28,'Siva Kusi'),(12,90,16,'Biriyani\'s',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,1,1,1,0,'2022-12-30 16:03:58','2022-12-30 19:13:29',28,'Siva Kusi',28,'Siva Kusi'),(13,90,16,'Indian Breads',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-30 16:04:34','2023-01-04 16:29:08',28,'Siva Kusi',28,'Siva Kusi'),(14,90,16,'Break Fast menu',0.00,'[{\"key\": 0, \"label\": \"Monday\", \"value\": \"Monday\"}, {\"key\": 1, \"label\": \"Tuesday\", \"value\": \"Tuesday\"}, {\"key\": 2, \"label\": \"Wednesday\", \"value\": \"Wednesday\"}, {\"key\": 3, \"label\": \"Thursday\", \"value\": \"Thursday\"}, {\"key\": 4, \"label\": \"Friday\", \"value\": \"Friday\"}, {\"key\": 5, \"label\": \"Saturday\", \"value\": \"Saturday\"}, {\"key\": 6, \"label\": \"Sunday\", \"value\": \"Sunday\"}]','[2]',0,1,0,1,1,0,'2022-12-30 16:04:53','2022-12-30 19:13:49',28,'Siva Kusi',28,'Siva Kusi');
/*!40000 ALTER TABLE `menu_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_ingredients`
--

DROP TABLE IF EXISTS `menu_ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_ingredients` (
  `mi_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mi_res_id` int unsigned NOT NULL,
  `mi_branch_id` int unsigned NOT NULL,
  `mi_menu_id` int unsigned NOT NULL,
  `mi_menu_name` varchar(50) NOT NULL,
  `mi_ing_id` int unsigned NOT NULL,
  `mi_ing_name` varchar(50) NOT NULL,
  `mi_ing_units` varchar(50) NOT NULL,
  `mi_ing_required_qty` decimal(7,2) NOT NULL COMMENT 'Required quantity per plate or serving',
  `mi_status` tinyint NOT NULL DEFAULT '1',
  `mi_comments` varchar(200) NOT NULL,
  `mi_is_compulsory` tinyint NOT NULL DEFAULT '1',
  `mi_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mi_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mi_created_by_id` int unsigned NOT NULL,
  `mi_created_by_name` varchar(50) NOT NULL,
  `mi_updated_by_id` int unsigned NOT NULL,
  `mi_updated_by_name` varchar(50) NOT NULL,
  `mi_is_deleted` tinyint NOT NULL,
  PRIMARY KEY (`mi_id`),
  KEY `FK_MI_RES_idx` (`mi_res_id`),
  KEY `FK_MI_UPDATED_BY_idx` (`mi_updated_by_id`,`mi_updated_by_name`),
  KEY `MI_BRANCH_FK` (`mi_branch_id`),
  KEY `MI_MENU_FK` (`mi_menu_id`,`mi_menu_name`),
  KEY `MI_INGREDIENTS_FK` (`mi_ing_id`,`mi_ing_name`,`mi_ing_units`),
  KEY `FK_MI_CREATED_BY_idx` (`mi_created_by_id`,`mi_created_by_name`),
  CONSTRAINT `FK_MI_CREATED_BY` FOREIGN KEY (`mi_created_by_id`, `mi_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_MI_RES` FOREIGN KEY (`mi_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_MI_UPDATED_BY` FOREIGN KEY (`mi_updated_by_id`, `mi_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MI_BRANCH_FK` FOREIGN KEY (`mi_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MI_INGREDIENTS_FK` FOREIGN KEY (`mi_ing_id`, `mi_ing_name`, `mi_ing_units`) REFERENCES `ingredients` (`ing_id`, `ing_name`, `ing_measuring_units`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MI_MENU_FK` FOREIGN KEY (`mi_menu_id`, `mi_menu_name`) REFERENCES `menu_items` (`mi_id`, `mi_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_ingredients`
--

LOCK TABLES `menu_ingredients` WRITE;
/*!40000 ALTER TABLE `menu_ingredients` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item_categories`
--

DROP TABLE IF EXISTS `menu_item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_categories` (
  `mic_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mic_res_id` int unsigned NOT NULL,
  `mic_branch_id` int unsigned NOT NULL,
  `mic_item_id` int unsigned NOT NULL,
  `mic_category_id` int unsigned NOT NULL,
  PRIMARY KEY (`mic_id`),
  UNIQUE KEY `UNQ_ITEM_CATS` (`mic_item_id`,`mic_category_id`),
  KEY `FK_MIC_RES_idx` (`mic_res_id`),
  CONSTRAINT `FK_MIC_BRANCH` FOREIGN KEY (`mic_res_id`) REFERENCES `branches` (`br_id`),
  CONSTRAINT `FK_MIC_RES` FOREIGN KEY (`mic_res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item_categories`
--

LOCK TABLES `menu_item_categories` WRITE;
/*!40000 ALTER TABLE `menu_item_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_item_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item_types`
--

DROP TABLE IF EXISTS `menu_item_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_types` (
  `mit_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mit_res_id` int unsigned NOT NULL,
  `mit_branch_id` int unsigned NOT NULL,
  `mit_item_id` int unsigned NOT NULL,
  `mit_type_id` int unsigned NOT NULL,
  PRIMARY KEY (`mit_id`),
  UNIQUE KEY `unq_item_type` (`mit_item_id`,`mit_type_id`),
  KEY `mit_res_idx` (`mit_res_id`),
  KEY `MIT_BRANCH_FK` (`mit_branch_id`),
  CONSTRAINT `MIT_BRANCH_FK` FOREIGN KEY (`mit_branch_id`) REFERENCES `branches` (`br_id`),
  CONSTRAINT `MIT_RES_FK` FOREIGN KEY (`mit_res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item_types`
--

LOCK TABLES `menu_item_types` WRITE;
/*!40000 ALTER TABLE `menu_item_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_item_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_item_variants`
--

DROP TABLE IF EXISTS `menu_item_variants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_item_variants` (
  `miv_id` int unsigned NOT NULL AUTO_INCREMENT,
  `miv_res_id` int unsigned NOT NULL,
  `miv_branch_id` int unsigned NOT NULL,
  `miv_variant_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `miv_mi_id` int unsigned NOT NULL,
  `miv_order_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `miv_taxing` json NOT NULL,
  `miv_pricing` decimal(15,2) NOT NULL DEFAULT '0.00',
  `miv_is_special` tinyint NOT NULL DEFAULT '0',
  `miv_is_custom` tinyint NOT NULL DEFAULT '0',
  `miv_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `miv_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`miv_id`),
  KEY `FK_MIV_RES_ID_idx` (`miv_res_id`),
  KEY `FK_MIV_BR_ID` (`miv_branch_id`),
  KEY `FK_MIV_MENU_ITEM` (`miv_mi_id`),
  KEY `FK_MIV_ORDER_TYPE` (`miv_order_type`),
  CONSTRAINT `FK_MIV_BR_ID` FOREIGN KEY (`miv_branch_id`) REFERENCES `branches` (`br_id`),
  CONSTRAINT `FK_MIV_MENU_ITEM` FOREIGN KEY (`miv_mi_id`) REFERENCES `menu_items` (`mi_id`),
  CONSTRAINT `FK_MIV_ORDER_TYPE` FOREIGN KEY (`miv_order_type`) REFERENCES `order_types` (`order_type`),
  CONSTRAINT `FK_MIV_RES_ID` FOREIGN KEY (`miv_res_id`) REFERENCES `restaurants` (`res_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_item_variants`
--

LOCK TABLES `menu_item_variants` WRITE;
/*!40000 ALTER TABLE `menu_item_variants` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_item_variants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_items` (
  `mi_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mi_res_id` int unsigned NOT NULL,
  `mi_branch_id` int unsigned NOT NULL,
  `mi_name` varchar(50) NOT NULL,
  `mi_is_available` tinyint NOT NULL DEFAULT '1',
  `mi_discount_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `mi_is_online_available` tinyint NOT NULL,
  `mi_is_addon` tinyint NOT NULL DEFAULT '0',
  `mi_available_days` json NOT NULL COMMENT 'time table --> Availability days -> Sunday, monday, ...',
  `mi_available_time` json NOT NULL COMMENT 'Time Slots -> Breakfast, Brunch, Lunch, Dinner... ',
  `mi_is_special` tinyint NOT NULL DEFAULT '0' COMMENT 'Menu is special for today',
  `mi_is_deleted` tinyint NOT NULL DEFAULT '0',
  `mi_is_active` tinyint NOT NULL DEFAULT '1',
  `mi_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mi_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mi_created_by_id` int unsigned NOT NULL,
  `mi_created_by_name` varchar(100) NOT NULL,
  `mi_updated_by_id` int unsigned DEFAULT NULL,
  `mi_updated_by_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`mi_id`),
  KEY `FK_MENU_RES_idx` (`mi_res_id`),
  KEY `FK_MENU_CREATED_BY_ID_NAME_idx` (`mi_created_by_id`,`mi_created_by_name`),
  KEY `FK_MENU_UPDATED_BY_ID_NAME_idx` (`mi_updated_by_id`,`mi_updated_by_name`),
  KEY `FK_MENU_BRANCH_idx` (`mi_branch_id`),
  KEY `FK_MENU_ID_NAME` (`mi_id`,`mi_name`),
  KEY `FK_MENU_UNIQUE` (`mi_res_id`,`mi_branch_id`,`mi_name`),
  CONSTRAINT `FK_MENU_ITEM_BRANCH` FOREIGN KEY (`mi_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_MENU_ITEM_CREATED_BY_ID_NAME` FOREIGN KEY (`mi_created_by_id`, `mi_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_MENU_ITEM_RES` FOREIGN KEY (`mi_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_MENU_ITEM_UPDATED_BY_ID_NAME` FOREIGN KEY (`mi_updated_by_id`, `mi_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_types`
--

DROP TABLE IF EXISTS `menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_types` (
  `mt_id` int unsigned NOT NULL AUTO_INCREMENT,
  `mt_res_id` int unsigned NOT NULL,
  `mt_branch_id` int unsigned NOT NULL,
  `mt_type` varchar(50) NOT NULL,
  `mt_is_available` tinyint NOT NULL DEFAULT '1',
  `mt_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mt_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `mt_created_by_id` int unsigned NOT NULL,
  `mt_created_by_name` varchar(50) NOT NULL,
  `mt_updated_by_id` int unsigned DEFAULT NULL,
  `mt_updated_by_name` varchar(50) DEFAULT NULL,
  `mt_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`mt_id`),
  KEY `MT_RES_ID_idx` (`mt_res_id`),
  KEY `MT_BRANCH_FK_idx` (`mt_branch_id`),
  KEY `MT_CREATED_BY_ID_NAME_idx` (`mt_created_by_id`,`mt_created_by_name`),
  KEY `MT_UPDATED_BY_ID_NAME_idx` (`mt_updated_by_id`,`mt_updated_by_name`),
  KEY `MT_ID_TYPE` (`mt_id`,`mt_type`),
  CONSTRAINT `MT_BRANCH_FK` FOREIGN KEY (`mt_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MT_CREATED_BY` FOREIGN KEY (`mt_created_by_id`, `mt_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MT_RES_ID` FOREIGN KEY (`mt_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MT_UPDATED_BY` FOREIGN KEY (`mt_updated_by_id`, `mt_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_types`
--

LOCK TABLES `menu_types` WRITE;
/*!40000 ALTER TABLE `menu_types` DISABLE KEYS */;
INSERT INTO `menu_types` VALUES (1,90,16,'Veg',1,'2023-01-04 11:35:24','2023-01-04 13:22:22',28,'Siva Kusi',28,'Siva Kusi',0),(2,90,16,'Non Veg',1,'2023-01-04 13:22:36','2023-01-04 13:22:36',28,'Siva Kusi',NULL,NULL,0),(3,90,16,'Alcoholic',1,'2023-01-04 13:22:54','2023-01-04 13:22:54',28,'Siva Kusi',NULL,NULL,0),(4,90,16,'Vegan',1,'2023-01-04 13:23:01','2023-01-04 13:23:01',28,'Siva Kusi',NULL,NULL,0),(5,90,16,'Spicy',1,'2023-01-04 16:16:09','2023-01-04 16:17:17',28,'Siva Kusi',28,'Siva Kusi',0),(9,90,16,'Sweet',1,'2023-01-04 16:18:49','2023-01-04 16:18:49',28,'Siva Kusi',NULL,NULL,0),(10,90,16,'Salted',1,'2023-01-04 16:21:46','2023-01-04 16:21:46',28,'Siva Kusi',NULL,NULL,0),(11,90,16,'North Indian',1,'2023-01-04 16:24:14','2023-01-04 16:24:14',28,'Siva Kusi',NULL,NULL,0),(12,90,16,'South Indian',1,'2023-01-04 16:24:22','2023-01-04 16:24:22',28,'Siva Kusi',NULL,NULL,0),(13,90,16,'Chicken',1,'2023-01-05 10:49:19','2023-01-05 10:49:19',28,'Siva Kusi',NULL,NULL,0),(14,90,16,'Mutton',1,'2023-01-05 10:49:26','2023-01-05 10:49:26',28,'Siva Kusi',NULL,NULL,0),(15,90,16,'Fish',1,'2023-01-05 10:49:32','2023-01-05 10:49:32',28,'Siva Kusi',NULL,NULL,0);
/*!40000 ALTER TABLE `menu_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `run_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'/20210211104825-mk2s-hotel','2022-02-01 09:05:32'),(2,'data/20210211104837-mk2s-hotel','2022-02-01 09:05:33'),(3,'tests/20210211104847-mk2s-hotel','2022-02-01 09:05:34'),(4,'/20210211104825-mk2s-hotel','2022-02-01 17:41:23'),(5,'/20210211104825-mk2s-hotel','2022-02-08 09:38:53'),(6,'/20210211104825-mk2s-hotel','2022-06-28 19:34:01');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_res_id` int unsigned NOT NULL,
  `module_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_mode` enum('RESTAURANT','GUEST') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESTAURANT',
  `module_description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_route` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_is_sub_module` tinyint NOT NULL,
  `module_parent_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_access_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_access_perm_level` tinyint NOT NULL,
  `module_is_basic` tinyint NOT NULL DEFAULT '1',
  `module_is_pro` tinyint NOT NULL DEFAULT '0',
  `module_is_custom` tinyint NOT NULL DEFAULT '0',
  `module_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `module_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module_updated_by_id` int unsigned DEFAULT NULL,
  `module_updated_by_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_status` tinyint DEFAULT '1',
  PRIMARY KEY (`module_id`),
  KEY `MODULE_RES_FK_idx` (`module_res_id`),
  CONSTRAINT `MODULE_RES_FK` FOREIGN KEY (`module_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (11,93,'MODHME','HOME','Home','RESTAURANT','Application Home',NULL,'/home',0,'1','res',1,1,0,0,'2022-11-11 16:14:00','2022-11-11 16:14:00',NULL,NULL,NULL),(12,93,'MOD001','RESTAURANTS','Restaurant','RESTAURANT','Restaurant and Branch Details.',NULL,'/restaurant',0,'1','res',1,1,0,0,'2022-11-11 16:14:00','2022-11-11 16:14:00',NULL,NULL,NULL),(13,93,'MOD002','EMPLOYEES_LIST','Employees','RESTAURANT','Restaurant Employees list.',NULL,'/employees',0,'1','emp',1,1,0,0,'2022-11-11 16:14:00','2022-11-11 16:14:00',NULL,NULL,NULL),(14,93,'MOD003','EMPLOYEE_PROFILE','Profile','RESTAURANT','Restaurant Employee Profile.',NULL,'/employees/profile',0,'1','emp',1,1,0,0,'2022-11-11 16:14:00','2022-11-11 16:14:00',NULL,NULL,NULL),(15,93,'MOD004','EMPLOYEE_DETAILS','Profile','RESTAURANT','Restaurant Employee Profile.',NULL,'/employees/:id',1,'0','emp',1,1,0,0,'2022-11-11 16:14:00','2022-11-11 16:14:00',NULL,NULL,NULL),(16,93,'MOD005','EMPLOYEE_SIGNOUT','Signout','RESTAURANT','Restaurant Employee Profile.',NULL,'/signout',1,'0','emp',1,1,0,0,'2022-11-11 16:14:00','2022-11-11 16:14:00',NULL,NULL,NULL),(39,90,'MODHME','HOME','Home','RESTAURANT','Application Home',NULL,'/home',0,'1','res',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(40,90,'MOD001','RESTAURANTS','Restaurant','RESTAURANT','Restaurant and Branch Details.',NULL,'/restaurant',0,'1','res',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(41,90,'MOD002','EMPLOYEES_LIST','Employees','RESTAURANT','Restaurant Employees list.',NULL,'/employees',0,'1','emp',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(42,90,'MOD003','EMPLOYEE_PROFILE','Profile','RESTAURANT','Restaurant Employee Profile.',NULL,'/employees/profile',0,'1','emp',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(43,90,'MOD004','EMPLOYEE_DETAILS','Profile','RESTAURANT','Restaurant Employee Profile.',NULL,'/employees/:id',1,'0','emp',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(44,90,'MOD005','EMPLOYEE_SIGNOUT','Signout','RESTAURANT','Restaurant Employee Profile.',NULL,'/signout',0,'0','res',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(45,90,'MOD006','MENU_CATEGORIES','Menu Categories','RESTAURANT','Categories for the menu items.!',NULL,'/menu-categories',0,'1','category',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(46,90,'MOD007','MENU_TYPES','Menu Types','RESTAURANT','Type of menu item.!',NULL,'/menu-types',0,'1','menu',2,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1),(47,90,'MOD008','MENU_ITEMS','Menu Items','RESTAURANT','list of menu items.!',NULL,'/menu-items',0,'1','menu',1,1,0,0,'2023-01-04 10:54:17','2023-01-04 10:54:17',NULL,NULL,1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `oi_id` int unsigned NOT NULL AUTO_INCREMENT,
  `oi_res_id` int unsigned NOT NULL,
  `oi_branch_id` int unsigned NOT NULL,
  `oi_order_id` int unsigned NOT NULL,
  `oi_item_id` int unsigned NOT NULL,
  `oi_item_name` varchar(50) NOT NULL,
  `oi_quantity` decimal(7,2) NOT NULL,
  `oi_item_price` decimal(17,2) NOT NULL,
  `oi_discount` decimal(17,2) NOT NULL DEFAULT '0.00',
  `oi_applied_price` decimal(17,2) NOT NULL,
  `oi_addons` json DEFAULT NULL,
  `oi_customizations` json DEFAULT NULL,
  `oi_preparing_quantity` int NOT NULL,
  `oi_cancelled_quantity` int NOT NULL,
  `oi_yet_to_preapre_quantity` int NOT NULL,
  `oi_status` varchar(50) NOT NULL DEFAULT 'New',
  `oi_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `oi_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `oi_created_by_id` int NOT NULL,
  `oi_created_by_name` varchar(50) NOT NULL,
  `oi_created_by_type` enum('Guest','Employee') NOT NULL,
  `oi_updated_by_id` int NOT NULL,
  `oi_updated_by_name` varchar(50) NOT NULL,
  `oi_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`oi_id`),
  KEY `fk_res_oi_idx` (`oi_res_id`),
  KEY `ORDER_OI_FK_idx` (`oi_branch_id`),
  KEY `MENU_ID_NAME_OI_FK` (`oi_item_id`,`oi_item_name`),
  KEY `ORDER_OI_FK` (`oi_order_id`),
  CONSTRAINT `BRANCHES_OI_FK` FOREIGN KEY (`oi_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `MENU_ID_NAME_OI_FK` FOREIGN KEY (`oi_item_id`, `oi_item_name`) REFERENCES `menu_items` (`mi_id`, `mi_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ORDER_OI_FK` FOREIGN KEY (`oi_order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `RES_OI_FK` FOREIGN KEY (`oi_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `os_id` int unsigned NOT NULL AUTO_INCREMENT,
  `os_res_id` int unsigned NOT NULL,
  `os_branch_id` int unsigned NOT NULL,
  `os_status` varchar(50) NOT NULL,
  `os_code` varchar(10) NOT NULL,
  `os_sort_order` int unsigned NOT NULL,
  `os_created_by_id` int unsigned NOT NULL,
  `os_created_by_name` varchar(50) NOT NULL,
  `os_updated_by_id` int unsigned NOT NULL,
  `os_updated_by_name` varchar(50) NOT NULL,
  `os_is_deleted` tinyint NOT NULL DEFAULT '0',
  `os_is_active` tinyint NOT NULL DEFAULT '1',
  `os_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `os_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`os_id`),
  KEY `ORDER_STATUS_RES_idx` (`os_res_id`),
  KEY `ORDER_STATUS_CREATED_BY_idx` (`os_created_by_id`,`os_created_by_name`),
  KEY `ORDER_STATUS__idx` (`os_updated_by_id`,`os_updated_by_name`),
  CONSTRAINT `ORDER_STATUS_CREATED_BY` FOREIGN KEY (`os_created_by_id`, `os_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ORDER_STATUS_RES` FOREIGN KEY (`os_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ORDER_STATUS_UPDATED_AT` FOREIGN KEY (`os_updated_by_id`, `os_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_types`
--

DROP TABLE IF EXISTS `order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_types` (
  `order_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`order_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_types`
--

LOCK TABLES `order_types` WRITE;
/*!40000 ALTER TABLE `order_types` DISABLE KEYS */;
INSERT INTO `order_types` VALUES ('Delivery'),('Dine-In'),('Take-Away');
/*!40000 ALTER TABLE `order_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int unsigned NOT NULL AUTO_INCREMENT,
  `order_res_id` int unsigned NOT NULL,
  `order_branch_id` int unsigned NOT NULL,
  `order_floor_id` int unsigned DEFAULT NULL,
  `order_table_id` int unsigned DEFAULT NULL,
  `order_table_code` varchar(20) DEFAULT NULL,
  `order_guest_id` int unsigned DEFAULT NULL,
  `order_guest_name` varchar(100) DEFAULT NULL,
  `order_guest_mobile` varchar(20) DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `order_token_number` int DEFAULT NULL,
  `order_type` enum('Dine-In','Take Away','Delivery') NOT NULL,
  `order_mode` enum('Single Order','Split Order') NOT NULL,
  `order_status` varchar(50) NOT NULL,
  `order_amount` decimal(17,2) NOT NULL,
  `order_discount_amount` decimal(17,2) NOT NULL,
  `order_tax_amount` decimal(17,2) NOT NULL,
  `order_tax_details` json NOT NULL,
  `order_total_amount` decimal(17,2) NOT NULL,
  `order_item_count` int NOT NULL,
  `order_unique_item_count` int NOT NULL,
  `order_preparation_time` int DEFAULT NULL,
  `order_delivery_status` varchar(50) DEFAULT NULL,
  `order_delivery_time` int DEFAULT NULL,
  `order_delivery_charges` decimal(17,2) DEFAULT NULL,
  `order_is_voided` tinyint NOT NULL DEFAULT '0',
  `order_void_reason` varchar(100) DEFAULT NULL,
  `order_parent_order` int unsigned DEFAULT NULL,
  `order_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `order_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_created_by` enum('Guest','Employee') NOT NULL,
  `order_created_by_id` int unsigned DEFAULT NULL,
  `order_created_by_name` varchar(50) DEFAULT NULL,
  `order_updated_by_id` int unsigned DEFAULT NULL,
  `order_updated_by_name` varchar(50) DEFAULT NULL,
  `order_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_id`),
  UNIQUE KEY `ORDER_NUM_UNIQUE` (`order_id`,`order_res_id`,`order_branch_id`,`order_number`),
  KEY `ORDER_RES_idx` (`order_res_id`),
  KEY `ORDER_BRANCH_FK` (`order_branch_id`),
  KEY `ORDER_FLOOR_idx` (`order_floor_id`),
  KEY `OREDR_TABLE_idx` (`order_table_id`,`order_table_code`),
  KEY `ORDER_SPLIT_PARENT_ID_FK` (`order_parent_order`),
  KEY `ORDER_GUEST_FK` (`order_guest_id`,`order_guest_name`),
  CONSTRAINT `ORDER_BRANCH_FK` FOREIGN KEY (`order_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ORDER_GUEST_FK` FOREIGN KEY (`order_guest_id`, `order_guest_name`) REFERENCES `guests` (`guest_id`, `guest_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ORDER_RES` FOREIGN KEY (`order_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ORDER_SPLIT_PARENT_ID_FK` FOREIGN KEY (`order_parent_order`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `orders_BEFORE_INSERT` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN

SET NEW.order_date = CURRENT_DATE();
SET NEW.order_token_number = (SELECT COUNT(order_id) + 1 FROM orders WHERE order_res_id = NEW.order_res_id AND order_branch_id = NEW.order_res_id AND order_date = CURRENT_DATE());
SET NEW.order_number = (concat((SELECT res_order_code FROM restaurants WHERE res_id = NEW.order_res_id), UNIX_TIMESTAMP(CURRENT_TIMESTAMP), NEW.order_id, NEW.order_branch_id, NEW.order_token_number));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payment_modes`
--

DROP TABLE IF EXISTS `payment_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_modes` (
  `payment_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_mode_active` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_mode`),
  UNIQUE KEY `payment_mode_UNIQUE` (`payment_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_modes`
--

LOCK TABLES `payment_modes` WRITE;
/*!40000 ALTER TABLE `payment_modes` DISABLE KEYS */;
INSERT INTO `payment_modes` VALUES ('Card',1),('Cash',1),('Online',1),('Wallet',0);
/*!40000 ALTER TABLE `payment_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int unsigned NOT NULL AUTO_INCREMENT,
  `payment_res_id` int unsigned NOT NULL,
  `payment_branch_id` int unsigned NOT NULL,
  `payment_floor_id` int unsigned NOT NULL,
  `payment_order_id` int unsigned NOT NULL,
  `payment_mode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_transaction_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` decimal(15,2) NOT NULL,
  `payment_tax_amount` decimal(15,2) NOT NULL,
  `payment_total_amount` decimal(15,2) NOT NULL,
  `payment_tax_details` json NOT NULL,
  `payment_is_refunded` tinyint NOT NULL DEFAULT '0',
  `payment_is_processed` tinyint DEFAULT NULL,
  `payment_is_voided` tinyint NOT NULL DEFAULT '0',
  `payment_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_created_by_id` int unsigned NOT NULL,
  `payment_created_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_updated_by_id` int unsigned DEFAULT NULL,
  `payment_updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`payment_id`),
  UNIQUE KEY `payment_transaction_id_UNIQUE` (`payment_transaction_id`),
  KEY `PAYMENT_RES_FK_idx` (`payment_res_id`),
  KEY `PAYMENT_FLOOR_FK` (`payment_floor_id`),
  KEY `PAYMENT_BRANCH_FK` (`payment_branch_id`),
  KEY `PAYMENT_ORDER_FK` (`payment_order_id`),
  KEY `PAYMENT_MODE_FK` (`payment_mode`),
  CONSTRAINT `PAYMENT_BRANCH_FK` FOREIGN KEY (`payment_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PAYMENT_FLOOR_FK` FOREIGN KEY (`payment_floor_id`) REFERENCES `floors` (`flr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PAYMENT_MODE_FK` FOREIGN KEY (`payment_mode`) REFERENCES `payment_modes` (`payment_mode`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PAYMENT_ORDER_FK` FOREIGN KEY (`payment_order_id`) REFERENCES `orders` (`order_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `PAYMENT_RES_FK` FOREIGN KEY (`payment_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refunds`
--

DROP TABLE IF EXISTS `refunds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refunds` (
  `refund_id` int unsigned NOT NULL AUTO_INCREMENT,
  `refund_res_id` int unsigned NOT NULL,
  `refund_branch_id` int unsigned NOT NULL,
  `refund_payment_id` int unsigned NOT NULL,
  `refund_amount` decimal(15,2) NOT NULL,
  `refund_details` json DEFAULT NULL,
  `refund_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `refund_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `refund_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `refund_created_by_id` int(10) unsigned zerofill DEFAULT NULL,
  `refund_created_by_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_updated_by_id` int(10) unsigned zerofill DEFAULT NULL,
  `refund_updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_is_deleted` tinyint DEFAULT '0',
  PRIMARY KEY (`refund_id`),
  KEY `FK_RES_REFUNDS` (`refund_res_id`),
  KEY `FK_BRANCH_REFUNDS` (`refund_branch_id`),
  KEY `FK_PAYMENT_REFUNDS` (`refund_payment_id`),
  CONSTRAINT `FK_BRANCH_REFUNDS` FOREIGN KEY (`refund_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_PAYMENT_REFUNDS` FOREIGN KEY (`refund_payment_id`) REFERENCES `payments` (`payment_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_RES_REFUNDS` FOREIGN KEY (`refund_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refunds`
--

LOCK TABLES `refunds` WRITE;
/*!40000 ALTER TABLE `refunds` DISABLE KEYS */;
/*!40000 ALTER TABLE `refunds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_timings`
--

DROP TABLE IF EXISTS `restaurant_timings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_timings` (
  `rt_id` int unsigned NOT NULL AUTO_INCREMENT,
  `rt_res_id` int unsigned NOT NULL,
  `rt_br_id` int unsigned NOT NULL,
  `rt_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rt_type` enum('Restaurant','Category','Item') COLLATE utf8mb4_unicode_ci NOT NULL,
  `rt_starting_hours` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rt_ending_hours` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rt_specific_day` int NOT NULL DEFAULT '-1',
  `rt_is_special` tinyint NOT NULL DEFAULT '0',
  `rt_is_over_night` tinyint NOT NULL DEFAULT '0',
  `rt_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rt_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rt_id`),
  KEY `RT_RES_ID_idx` (`rt_res_id`),
  KEY `RT_BR_ID` (`rt_br_id`),
  CONSTRAINT `RT_BR_ID` FOREIGN KEY (`rt_br_id`) REFERENCES `branches` (`br_id`),
  CONSTRAINT `RT_RES_ID` FOREIGN KEY (`rt_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_timings`
--

LOCK TABLES `restaurant_timings` WRITE;
/*!40000 ALTER TABLE `restaurant_timings` DISABLE KEYS */;
INSERT INTO `restaurant_timings` VALUES (1,90,16,'All Day','Restaurant','00:00','23:59',-1,0,1,'2022-12-24 08:05:43','2022-12-24 08:05:43'),(2,90,16,'All Day','Category','00:00','23:59',-1,0,1,'2022-12-24 08:05:43','2022-12-24 08:05:43'),(3,90,16,'All Day','Item','00:00','23:59',-1,0,1,'2022-12-24 08:05:43','2022-12-24 08:05:43');
/*!40000 ALTER TABLE `restaurant_timings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_type_order_types`
--

DROP TABLE IF EXISTS `restaurant_type_order_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_type_order_types` (
  `rtot_id` int NOT NULL AUTO_INCREMENT,
  `rtot_res_id` int unsigned DEFAULT NULL,
  `rtot_br_id` int unsigned DEFAULT NULL,
  `rtot_res_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtot_order_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtot_has_floors` tinyint DEFAULT '1',
  `rtot_is_pre_payment` tinyint DEFAULT '0',
  `rtot_is_custom` tinyint DEFAULT '0',
  `rtot_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`rtot_id`),
  UNIQUE KEY `UNIQUE_INDEX_RES_TYPE_ORDER_TYPE_RES_UNIQUE` (`rtot_res_id`,`rtot_br_id`,`rtot_res_type`,`rtot_order_type`),
  KEY `FK_RTOT_RES_TYPE` (`rtot_res_type`),
  KEY `RK_RTOT_ORDER_TYPE` (`rtot_order_type`),
  KEY `FK_RTOT_BR` (`rtot_br_id`),
  CONSTRAINT `FK_RTOT_BR` FOREIGN KEY (`rtot_br_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_RTOT_RES` FOREIGN KEY (`rtot_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_RTOT_RES_TYPE` FOREIGN KEY (`rtot_res_type`) REFERENCES `restaurant_types` (`restaurant_type`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `RK_RTOT_ORDER_TYPE` FOREIGN KEY (`rtot_order_type`) REFERENCES `order_types` (`order_type`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_type_order_types`
--

LOCK TABLES `restaurant_type_order_types` WRITE;
/*!40000 ALTER TABLE `restaurant_type_order_types` DISABLE KEYS */;
INSERT INTO `restaurant_type_order_types` VALUES (1,NULL,NULL,'Bars','Dine-In',1,0,0,0),(2,NULL,NULL,'Bistro','Dine-In',1,0,0,0),(3,NULL,NULL,'Bistro','Take-Away',1,0,0,0),(4,NULL,NULL,'Buffets','Dine-In',1,0,0,0),(5,NULL,NULL,'Cafe','Dine-In',1,0,0,0),(6,NULL,NULL,'Cafeteria','Dine-In',1,0,0,0),(7,NULL,NULL,'Casual Dining','Delivery',1,1,0,0),(8,NULL,NULL,'Casual Dining','Dine-In',1,0,0,0),(9,NULL,NULL,'Casual Dining','Take-Away',1,0,0,0),(10,NULL,NULL,'Cloud Kitchens','Delivery',1,1,0,0),(11,NULL,NULL,'Diner','Delivery',1,1,0,0),(12,NULL,NULL,'Diner','Dine-In',1,0,0,0),(13,NULL,NULL,'Diner','Take-Away',1,0,0,0),(14,NULL,NULL,'Family-Style Restaurants','Delivery',1,1,0,0),(15,NULL,NULL,'Family-Style Restaurants','Dine-In',1,0,0,0),(16,NULL,NULL,'Family-Style Restaurants','Take-Away',1,0,0,0),(17,NULL,NULL,'Fast-Food Restaurants','Delivery',1,1,0,0),(18,NULL,NULL,'Fast-Food Restaurants','Dine-In',1,0,0,0),(19,NULL,NULL,'Fast-Food Restaurants','Take-Away',1,0,0,0),(20,NULL,NULL,'Fine Dining','Delivery',1,1,0,0),(21,NULL,NULL,'Fine Dining','Dine-In',1,0,0,0),(22,NULL,NULL,'Fine Dining','Take-Away',1,0,0,0),(23,NULL,NULL,'Food Trucks','Dine-In',1,0,0,0),(24,NULL,NULL,'Food Trucks','Take-Away',1,0,0,0),(25,NULL,NULL,'Ice cream parlor','Dine-In',1,0,0,0),(26,NULL,NULL,'Ice cream parlor','Take-Away',1,0,0,0),(27,NULL,NULL,'Pizzeria','Delivery',1,1,0,0),(28,NULL,NULL,'Pizzeria','Dine-In',1,0,0,0),(29,NULL,NULL,'Pizzeria','Take-Away',1,0,0,0),(30,NULL,NULL,'Pop-Up Restaurants','Delivery',1,1,0,0),(31,NULL,NULL,'Pop-Up Restaurants','Dine-In',1,0,0,0),(32,NULL,NULL,'Pop-Up Restaurants','Take-Away',1,0,0,0),(33,NULL,NULL,'Restro-Bars','Delivery',1,1,0,0),(34,NULL,NULL,'Restro-Bars','Dine-In',1,0,0,0),(35,NULL,NULL,'Restro-Bars','Take-Away',1,0,0,0),(36,NULL,NULL,'snack bar','Dine-In',1,0,0,0),(37,NULL,NULL,'snack bar','Take-Away',1,0,0,0),(38,NULL,NULL,'Steakhouse','Dine-In',1,0,0,0),(39,NULL,NULL,'Steakhouse','Take-Away',1,0,0,0),(40,NULL,NULL,'Steakhouse','Delivery',1,1,0,0);
/*!40000 ALTER TABLE `restaurant_type_order_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant_types`
--

DROP TABLE IF EXISTS `restaurant_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant_types` (
  `restaurant_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`restaurant_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_types`
--

LOCK TABLES `restaurant_types` WRITE;
/*!40000 ALTER TABLE `restaurant_types` DISABLE KEYS */;
INSERT INTO `restaurant_types` VALUES ('Bars'),('Bistro'),('Buffets'),('Cafe'),('Cafeteria'),('Casual Dining'),('Cloud Kitchens'),('Diner'),('Family-Style Restaurants'),('Fast-Food Restaurants'),('Fine Dining'),('Food Trucks'),('Ice cream parlor'),('Pizzeria'),('Pop-Up Restaurants'),('Restro-Bars'),('snack bar'),('Steakhouse');
/*!40000 ALTER TABLE `restaurant_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `res_id` int unsigned NOT NULL AUTO_INCREMENT,
  `res_name` varchar(100) NOT NULL,
  `res_short_name` varchar(20) NOT NULL,
  `res_code` varchar(20) NOT NULL,
  `res_email` varchar(120) NOT NULL,
  `res_mobile` varchar(20) NOT NULL,
  `res_address` varchar(150) NOT NULL,
  `res_city` varchar(50) NOT NULL,
  `res_state` varchar(50) NOT NULL,
  `res_country` varchar(50) NOT NULL,
  `res_zip_code` varchar(15) NOT NULL,
  `res_order_code` varchar(5) NOT NULL DEFAULT 'ORD',
  `res_created_by` varchar(50) NOT NULL DEFAULT 'MK2S',
  `res_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `res_updated_by_id` int NOT NULL DEFAULT '0',
  `res_updated_by_name` varchar(50) NOT NULL DEFAULT 'MK2S',
  `res_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `res_is_deleted` tinyint NOT NULL DEFAULT '0',
  `res_is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`res_id`),
  UNIQUE KEY `res_email_UNIQUE` (`res_email`),
  UNIQUE KEY `res_mobile_UNIQUE` (`res_mobile`),
  UNIQUE KEY `res_code_UNIQUE` (`res_code`),
  KEY `FK_RESTAURANT_CITY_idx` (`res_city`),
  KEY `FK_RESTAURANT_STATE_idx` (`res_state`),
  KEY `FK_RESTAURANT_COUNTRY_idx` (`res_country`),
  CONSTRAINT `FK_RESTAURANT_CITY` FOREIGN KEY (`res_city`) REFERENCES `city` (`city`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_RESTAURANT_COUNTRY` FOREIGN KEY (`res_country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_RESTAURANT_STATE` FOREIGN KEY (`res_state`) REFERENCES `state` (`state`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'HMS','HMS','HMS001','mk2s_hms@googlegroups.com','+917842487859','10-15, Settigaripalle, Diguvamasapalle','Chittoor','Andhra Pradesh','India','517419','ORD','1','2021-12-24 05:27:19',1,'MK2S','2022-02-26 05:48:03',0,1),(82,'MK2S TEST RESTAURANT 3','MK2S','MK2S2','sivakusi12@gmail.com','+918106302821','Test address','New York','New York','USA','458792','MKO','MK2S','2022-01-08 15:53:05',0,'MK2S','2022-02-26 05:48:04',0,1),(88,'MK2S TEST RESTAURANT','MK2S','MK2S','rockzzsiva1@gmail.com','+918500777641','Test address','New York','New York','USA','458792','MKO','MK2S','2022-01-08 16:16:52',0,'MK2S','2022-02-26 05:48:04',0,1),(90,'MK2S TEST RESTAURANT','MK2S','MK2S12','siva.kusi12@gmail.com','+917382310149','Test address','New York','New York','USA','458792','MKO','MK2S','2022-02-01 04:25:31',0,'MK2S','2022-02-26 05:48:04',0,1),(93,'DEFAULT RESTAURANT','DEFAULT','DEFAULT','s.iva.kusi.12@gmail.com','+919999999999','Default','New York','New York','USA','000000','DFT','MK2S','2022-10-06 17:30:24',0,'MK2S','2022-10-06 17:30:24',0,1);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  PRIMARY KEY (`country`,`state`),
  KEY `INDEX` (`state`),
  CONSTRAINT `FK_STATE_COUNTRY_LINK` FOREIGN KEY (`country`) REFERENCES `country` (`country`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('Andhra Pradesh','India'),('Goa','India'),('Karnataka','India'),('Los Angles','USA'),('New York','USA');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_details`
--

DROP TABLE IF EXISTS `table_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `table_details` (
  `tbl_id` int unsigned NOT NULL AUTO_INCREMENT,
  `tbl_res_id` int unsigned NOT NULL,
  `tbl_branch_id` int unsigned NOT NULL,
  `tbl_flr_id` int unsigned NOT NULL,
  `tbl_name` varchar(50) NOT NULL,
  `tbl_code` varchar(20) NOT NULL,
  `tbl_capacity` int NOT NULL,
  `tbl_is_active` tinyint NOT NULL DEFAULT '1',
  `tbl_is_deleted` tinyint NOT NULL DEFAULT '0',
  `tbl_added_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tbl_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `tbl_created_by_id` int unsigned NOT NULL,
  `tbl_created_by_name` varchar(100) NOT NULL,
  `tbl_updated_by_id` int unsigned NOT NULL,
  `tbl_updated_by_name` varchar(100) NOT NULL,
  PRIMARY KEY (`tbl_id`),
  UNIQUE KEY `TBL_FLOOR_TBL_UNIQUE_CODE` (`tbl_flr_id`,`tbl_code`) USING BTREE /*!80000 INVISIBLE */,
  KEY `FK_TBL_RES_ID_idx` (`tbl_res_id`),
  KEY `FK_TBL_BRANCH_ID_idx` (`tbl_branch_id`),
  KEY `FK_TBL_ADDED_BY_ID_NAME_idx` (`tbl_created_by_id`,`tbl_created_by_name`),
  KEY `FK_TBL_UPDATED_BY_ID_NAME_idx` (`tbl_updated_by_id`,`tbl_updated_by_name`),
  KEY `TBL_ID_CODE_INDEX` (`tbl_id`,`tbl_code`),
  CONSTRAINT `FK_TBL_ADDED_BY_ID_NAME` FOREIGN KEY (`tbl_created_by_id`, `tbl_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_TBL_BRANCH_ID` FOREIGN KEY (`tbl_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_TBL_FLR_ID` FOREIGN KEY (`tbl_flr_id`) REFERENCES `floors` (`flr_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_TBL_RES_ID` FOREIGN KEY (`tbl_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_TBL_UPDATED_BY_ID_NAME` FOREIGN KEY (`tbl_updated_by_id`, `tbl_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_details`
--

LOCK TABLES `table_details` WRITE;
/*!40000 ALTER TABLE `table_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `table_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tax_details`
--

DROP TABLE IF EXISTS `tax_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tax_details` (
  `td_id` int unsigned NOT NULL AUTO_INCREMENT,
  `td_res_id` int unsigned NOT NULL,
  `td_branch_id` int unsigned NOT NULL,
  `td_name` int NOT NULL,
  `td_percentage` decimal(5,2) NOT NULL,
  `td_mode` enum('Online','Offline') NOT NULL,
  `td_created_by_id` int unsigned NOT NULL,
  `td_updated_by_id` int unsigned NOT NULL,
  `td_created_by_name` varchar(50) NOT NULL,
  `td_updated_by_name` varchar(50) NOT NULL,
  `td_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `td_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `td_status` tinyint NOT NULL DEFAULT '1',
  `td_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`td_id`),
  KEY `FK_TD_RES_idx` (`td_res_id`),
  KEY `FK_TD_CREATED_BY_idx` (`td_created_by_id`,`td_created_by_name`),
  KEY `FK_TD_UPDATED_BY_idx` (`td_updated_by_id`,`td_updated_by_name`),
  KEY `TD_BRANCH_FK` (`td_branch_id`),
  CONSTRAINT `FK_TD_CREATED_BY` FOREIGN KEY (`td_created_by_id`, `td_created_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_TD_RES` FOREIGN KEY (`td_res_id`) REFERENCES `restaurants` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_TD_UPDATED_BY` FOREIGN KEY (`td_updated_by_id`, `td_updated_by_name`) REFERENCES `employees` (`emp_id`, `emp_name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `TD_BRANCH_FK` FOREIGN KEY (`td_branch_id`) REFERENCES `branches` (`br_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tax_details`
--

LOCK TABLES `tax_details` WRITE;
/*!40000 ALTER TABLE `tax_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `tax_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_sessions`
--

DROP TABLE IF EXISTS `user_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_sessions` (
  `uss_id` int NOT NULL AUTO_INCREMENT,
  `uss_session_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uss_token` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uss_login_request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uss_login_request_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uss_token_valid_till` timestamp NOT NULL,
  `uss_is_valid_session` tinyint NOT NULL DEFAULT '1',
  `uss_user_signout` tinyint NOT NULL DEFAULT '0',
  `uss_request_host` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uss_session_ip` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uss_session_details` json NOT NULL,
  `uss_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `uss_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uss_id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES (1,'5259af14-430d-11ed-8bc8-9829a634982f','test','2022-10-03 11:20:01','2022-10-03 11:20:01','2022-10-04 11:20:01',1,0,'test','','[{\"message\": \"Initiating session\"}]','2022-10-03 11:20:01','2022-10-04 14:30:37'),(2,'d938dd57-43d4-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4MTY5NywiZXhwIjoxNjY1MDU0NDk3fQ.jBh1MiyQcSjjgjJbKEU-Pu1eImOKHamUpW-pUXGIdlw','2022-10-04 11:08:17','2022-10-04 11:08:17','2022-10-05 11:08:17',1,0,'localhost','','[{\"message\": \"Initiating session\"}]','2022-10-04 11:08:17','2022-10-04 14:30:37'),(3,'4309170a-43d5-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4MTg3NSwiZXhwIjoxNjY1MDU0Njc1fQ.BzG3zeXA4n1gKX6hXj5ji7_Bamg7LUku1l2sSXLIsW8','2022-10-04 11:11:15','2022-10-04 11:11:15','2022-10-05 11:11:15',1,0,'localhost','','[{\"message\": \"Initiating session\"}]','2022-10-04 11:11:15','2022-10-04 14:30:37'),(4,'12348291-43e0-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NjUxNywiZXhwIjoxNjY1MDU5MzE3fQ.jrBSaIVVTK3koakE3z2HF4AhZQlbUlLwowDLAjRxKs4','2022-10-04 12:28:37','2022-10-04 12:28:37','2022-10-05 12:28:37',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:28:37','2022-10-04 14:30:37'),(5,'86b3c3c7-43e0-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NjcxMiwiZXhwIjoxNjY1MDU5NTEyfQ.rF4FWRuPmufylC3lUkZ1k8WZE6QwcmDVw7PWodMFTt4','2022-10-04 12:31:53','2022-10-04 12:31:53','2022-10-05 12:31:53',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:31:53','2022-10-04 14:30:37'),(6,'ce1b6abe-43e0-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NjgzMiwiZXhwIjoxNjY1MDU5NjMyfQ.1S4hE22_q9myjjl9-5mRg1bxeNR5fXbAkmZdtbC02vQ','2022-10-04 12:33:52','2022-10-04 12:33:52','2022-10-05 12:33:52',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:33:52','2022-10-04 14:30:37'),(7,'f3e7b1c4-43e0-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4Njg5NiwiZXhwIjoxNjY1MDU5Njk2fQ.ZUWOeBO8xRpg70SZky4m3qaH0wL7wFj-73CcBja8srA','2022-10-04 12:34:56','2022-10-04 12:34:56','2022-10-05 12:34:56',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:34:56','2022-10-04 14:30:37'),(8,'7a7b23c7-43e1-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NzEyMSwiZXhwIjoxNjY3NDc5MTIxfQ.-PmL54j6mTD95VzMHzWVSMmUIgSrUgHkwiasfzK_inQ','2022-10-04 12:38:41','2022-10-04 12:38:41','2022-11-03 12:38:42',1,0,'192.168.162.79','::ffff:192.168.162.239','[{\"message\": \"Initiating session\"}]','2022-10-04 12:38:41','2022-10-04 14:30:37'),(9,'a58a35d4-43e1-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NzE5NCwiZXhwIjoxNjY3NDc5MTk0fQ.GN8l05sF5PsXcbAmWV2Nte2_5jYXrYegONilXo6uDR8','2022-10-04 12:39:54','2022-10-04 12:39:54','2022-11-03 12:39:54',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:39:54','2022-10-04 14:30:37'),(10,'ac1bb31b-43e1-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NzIwNSwiZXhwIjoxNjY3NDc5MjA1fQ.McCr5VCgeUJzStP3DUpd8_HQ5OfS3fBfxHRO-gTl2ms','2022-10-04 12:40:05','2022-10-04 12:40:05','2022-11-03 12:40:05',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:40:05','2022-10-04 14:30:37'),(11,'bb4ed143-43e1-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NzIzMCwiZXhwIjoxNjY3NDc5MjMwfQ.8Wk_aIHT1UANJxgaPOyT7iDEv2awAoDcwXefe3EWK00','2022-10-04 12:40:30','2022-10-04 12:40:30','2022-11-03 12:40:31',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:40:30','2022-10-04 14:30:37'),(12,'b3d574b4-43e2-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4NzY0NywiZXhwIjoxNjY3NDc5NjQ3fQ.nx9cBOJFeHQXZEvDy6pKfxmHDPpgDadkeeODAm55Kbs','2022-10-04 12:47:27','2022-10-04 12:47:27','2022-11-03 12:47:28',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 12:47:27','2022-10-04 14:30:37'),(13,'ed84c5e4-43e4-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsInJvbGUiOiJPd25lciIsImlhdCI6MTY2NDg4ODYwMywiZXhwIjoxNjY3NDgwNjAzfQ.h4vtmb5YOSWVYceKQTIJLzlDSTcnQnl75hzzFERpdIU','2022-10-04 13:03:23','2022-10-04 13:03:23','2022-11-03 13:03:23',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 13:03:23','2022-10-04 14:30:37'),(14,'24499245-43ec-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY0ODk0NTQ3LCJleHAiOjE2Njc0ODY1NDd9.edaWog6zNQSyxAROP4d6uqoaSRclBL3JxIcRxtYNnuk','2022-10-04 13:55:01','2022-10-04 14:42:27','2022-11-03 14:42:27',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T14:42:27.213Z\"}]','2022-10-04 13:55:01','2022-10-04 14:42:27'),(15,'4a66351d-43ee-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk1MzkzLCJleHAiOjE2NjUwNjgxOTN9.U81WpRYbqjcNK7nC1gutVher3zA_COYdoYJw4zDtucg','2022-10-04 14:10:24','2022-10-04 14:56:34','2022-11-03 14:10:25',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T14:56:33.508Z\"}]','2022-10-04 14:10:24','2022-10-04 14:56:33'),(16,'1c682cff-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjQxMywiZXhwIjoxNjY3NDg4NDEzfQ.2gr6cDXX2pT8Bnfgbbr9rBM31lfpCjcdzHafxhbIWmo','2022-10-04 15:13:33','2022-10-04 15:13:33','2022-11-03 15:13:33',1,0,'192.168.162.79','::ffff:192.168.162.235','[{\"message\": \"Initiating session\"}]','2022-10-04 15:13:33','2022-10-04 15:13:33'),(17,'2320576c-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjQyNCwiZXhwIjoxNjY3NDg4NDI0fQ.W0fomHs0GSmWMKt8R0QBJVF4QJW1xpWfdC0rhZ2XX2w','2022-10-04 15:13:44','2022-10-04 15:13:44','2022-11-03 15:13:44',1,0,'192.168.162.79','::ffff:192.168.162.235','[{\"message\": \"Initiating session\"}]','2022-10-04 15:13:44','2022-10-04 15:13:44'),(18,'43e00434-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjQ3OSwiZXhwIjoxNjY3NDg4NDc5fQ.2nd3UdW-bp2SzVRGhOyEUnL0g_WzI-DcReCIMFidWd4','2022-10-04 15:14:39','2022-10-04 15:14:39','2022-11-03 15:14:39',1,0,'192.168.162.79','::ffff:192.168.162.235','[{\"message\": \"Initiating session\"}]','2022-10-04 15:14:39','2022-10-04 15:14:39'),(19,'47273ecc-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjQ4NCwiZXhwIjoxNjY1MDY5Mjg0fQ.Av8VmeGMKm63Dtyl5eoFlIZeoLFCk4YI_VzHq43N7cI','2022-10-04 15:14:44','2022-10-04 15:14:44','2022-10-05 15:14:44',1,0,'192.168.162.79','::ffff:192.168.162.235','[{\"message\": \"Initiating session\"}]','2022-10-04 15:14:44','2022-10-04 15:14:44'),(20,'53a994af-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjUwNSwiZXhwIjoxNjY3NDg4NTA1fQ.MCAPRy-0Q5ZApetn_hWtuUa_kGiBwiWtI371cKLeyLY','2022-10-04 15:15:05','2022-10-04 15:15:05','2022-11-03 15:15:06',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:15:05','2022-10-04 15:15:05'),(21,'5c9ccd5a-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjUyMCwiZXhwIjoxNjY3NDg4NTIwfQ.i8knjGG4qyz3EQxoudsNR0hP5axDttfZnFJEjM6O3IU','2022-10-04 15:15:20','2022-10-04 15:15:20','2022-11-03 15:15:21',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:15:20','2022-10-04 15:15:20'),(22,'e2026575-43f7-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5Njc0NCwiZXhwIjoxNjY3NDg4NzQ0fQ.QyXsnTnL7vTtoEyDKl6mX1TlV-m7ZbCD2MfcXQKneiE','2022-10-04 15:19:04','2022-10-04 15:19:04','2022-11-03 15:19:05',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:19:04','2022-10-04 15:19:04'),(23,'065e2691-43f8-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjgwNSwiZXhwIjoxNjY3NDg4ODA1fQ.R-5fldOUgNOnIVHwU7FNSwCcsq8jBFhLPasF7YKk5RA','2022-10-04 15:20:05','2022-10-04 15:20:05','2022-11-03 15:20:06',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:20:05','2022-10-04 15:20:05'),(24,'307542e5-43f8-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5Njg3NiwiZXhwIjoxNjY1MDY5Njc2fQ.F_Uruiys6fwvjWc0KMJC_f-ul_FrRhfYJCa6RxSlcRg','2022-10-04 15:21:16','2022-10-04 15:21:16','2022-10-05 15:21:16',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:21:16','2022-10-04 15:21:16'),(25,'4c4ab985-43f8-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NjkyMiwiZXhwIjoxNjY3NDg4OTIyfQ.rOWznA895qX4d3syGPj0WtAYgOkX0d5vPpvWF9huhHE','2022-10-04 15:22:02','2022-10-04 15:22:02','2022-11-03 15:22:03',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:22:02','2022-10-04 15:22:02'),(26,'6b41041e-43f8-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5Njk3NCwiZXhwIjoxNjY3NDg4OTc0fQ.Oi-9947iW3E5fBSglC3p0uhyGQjbZPHk90Vnth6Tt8A','2022-10-04 15:22:54','2022-10-04 15:22:54','2022-11-03 15:22:55',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:22:54','2022-10-04 15:22:54'),(27,'796a017a-43f8-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5Njk5OCwiZXhwIjoxNjY1MDY5Nzk4fQ.PjdDLvGsZHr36Uuw9Zo8sY033d-1AyqVYsQG3FtWs_E','2022-10-04 15:23:18','2022-10-04 15:23:18','2022-10-05 15:23:18',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:23:18','2022-10-04 15:23:18'),(28,'d0ae6034-43f8-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NzE0NSwiZXhwIjoxNjY1MDY5OTQ1fQ.zg6ik60rW8DrkXP3mxzH93fr63o0Qt2EUpeKcsNmXnU','2022-10-04 15:25:45','2022-10-04 15:25:45','2022-10-05 15:25:45',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:25:45','2022-10-04 15:25:45'),(29,'080ae438-43f9-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2NDg5NzIzNywiZXhwIjoxNjY3NDg5MjM3fQ.pmG_5Q5dEqiYezarsK989pBBqItJ70eLct2ZDwqq0nA','2022-10-04 15:27:17','2022-10-04 15:27:17','2022-11-03 15:27:18',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}]','2022-10-04 15:27:17','2022-10-04 15:27:17'),(30,'186a773c-43f9-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk3MjczLCJleHAiOjE2NjUwNzAwNzN9.IVH_zxl7awl62Ljo-pbzbITXBOnKWGzXqX0eRNGvx9s','2022-10-04 15:27:45','2022-10-04 15:27:53','2022-11-03 15:27:45',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:27:53.251Z\"}]','2022-10-04 15:27:45','2022-10-04 15:27:53'),(31,'27f07c58-43f9-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk3Mjk0LCJleHAiOjE2NjUwNzAwOTR9.NSuTg0Y7nnP8aEnm1cfvMXj_k_xW-FQ3XTmyvCGB-vo','2022-10-04 15:28:11','2022-10-04 15:28:15','2022-11-03 15:28:11',1,0,'192.168.162.79','::ffff:192.168.162.235','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:28:14.986Z\"}]','2022-10-04 15:28:11','2022-10-04 15:28:14'),(32,'b68d7876-43fa-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk3OTY0LCJleHAiOjE2NjUwNzA3NjR9.OBjHUw218vbR8glbFYgfnUs9bu3F68AXnbAjdO9Gqlo','2022-10-04 15:39:20','2022-10-04 15:39:24','2022-11-03 15:39:20',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:39:24.332Z\"}]','2022-10-04 15:39:20','2022-10-04 15:39:24'),(33,'c13df85c-43fa-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk4NDUzLCJleHAiOjE2NjUwNzEyNTN9.hGDbTtz-Db0SiUceufcQCZxGfj8unhoL4cA2Ch22qak','2022-10-04 15:39:38','2022-10-04 15:47:33','2022-11-03 15:39:38',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:39:47.588Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:40:22.739Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:44:55.918Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:45:05.900Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:47:33.183Z\"}]','2022-10-04 15:39:38','2022-10-04 15:47:33'),(34,'eb465b77-43fb-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk4NDgyLCJleHAiOjE2NjUwNzEyODJ9.MlLa6GM-Ojny0WWpiQ4PeEwG2K4mXrG-AGcMNltLf7Q','2022-10-04 15:47:58','2022-10-04 15:48:02','2022-11-03 15:47:58',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:48:02.181Z\"}]','2022-10-04 15:47:58','2022-10-04 15:48:02'),(35,'11f5c1de-43fc-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk4NTQ3LCJleHAiOjE2NjUwNzEzNDd9.bGfkrzz5U34z0X1FFpzXOqMVTyZl07G-qOvMEczlcfc','2022-10-04 15:49:03','2022-10-04 15:49:08','2022-11-03 15:49:03',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:49:07.950Z\"}]','2022-10-04 15:49:03','2022-10-04 15:49:07'),(36,'30473cd0-43fc-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY0ODk5MDk1LCJleHAiOjE2NjUwNzE4OTV9.YYNs3adwaIAmfIzMUbqEkyygrYldlTGaWhVsd1BllaU','2022-10-04 15:49:53','2022-10-04 15:58:15','2022-11-03 15:49:54',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:50:04.113Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T15:58:15.021Z\"}]','2022-10-04 15:49:53','2022-10-04 15:58:15'),(37,'b0a4ebab-43fe-11ed-8bc8-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY1MDc1MTQ1LCJleHAiOjE2NjUyNDc5NDV9.t4HN2PU8KHpcmpfYjifpTkSs5LjZwuhVxAYR0RcQuv0','2022-10-04 16:07:48','2022-10-06 16:52:26','2022-11-03 16:07:48',1,0,'192.168.162.79','::ffff:192.168.162.79','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T16:07:51.583Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-04T16:40:03.642Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-05T03:14:45.325Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-05T03:15:31.066Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-06T16:52:25.858Z\"}]','2022-10-04 16:07:48','2022-10-06 16:52:25'),(38,'02954c1b-48bc-11ed-9ec4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY1NDIwNzg4LCJleHAiOjE2NjU1OTM1ODh9.CGL4UzmkwTFqYvTAQKF5IWiD6hVmWf9jTR3zkt-fqTI','2022-10-10 16:53:05','2022-10-10 16:53:09','2022-11-09 16:53:05',1,0,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-10T16:53:08.754Z\"}]','2022-10-10 16:53:05','2022-10-10 16:53:08'),(39,'6c2483de-4d41-11ed-87fa-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY1OTIwNTk1LCJleHAiOjE2NjYwOTMzOTV9.rA1ZagJpxw9p3Tsl2ar0izUhSweqFxIPeoc4FFiGSIg','2022-10-16 10:58:10','2022-10-16 11:43:15','2022-11-15 10:58:10',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-16T11:01:30.012Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-16T11:43:15.057Z\"}]','2022-10-16 10:58:10','2022-10-16 11:43:15'),(40,'d86df5b0-4d47-11ed-87fa-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY1OTIwNjUxLCJleHAiOjE2NjYwOTM0NTF9.-xLgRGQW1PIEpYa5RDYXyVBhsS_cxFkS0xgp0XC207U','2022-10-16 11:44:08','2022-10-16 11:44:12','2022-11-15 11:44:09',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-16T11:44:11.859Z\"}]','2022-10-16 11:44:08','2022-10-16 11:44:11'),(41,'95838729-4f04-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MTExNjY1LCJleHAiOjE2NjYyODQ0NjV9.F0gp0Ft7C56DgN1kwx2cFkPcqEfKmYTKTOP7Fpzh9bA','2022-10-18 16:47:42','2022-10-18 16:47:46','2022-11-17 16:47:43',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-18T16:47:45.557Z\"}]','2022-10-18 16:47:42','2022-10-18 16:47:45'),(42,'2d208026-4f12-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MTE3NTAzLCJleHAiOjE2NjYyOTAzMDN9.CTLfUQs2pBdDS1jhgTnOVW-bFypqRe8i8X6rkMVv6oc','2022-10-18 18:25:00','2022-10-18 18:25:04','2022-11-17 18:25:00',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-18T18:25:03.752Z\"}]','2022-10-18 18:25:00','2022-10-18 18:25:03'),(43,'198fe0d2-4fda-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MjAzMzcwLCJleHAiOjE2NjYzNzYxNzB9.tr_RClFrUlwDYlcyJGy2qOIoOF0qZtY2lOU2jvUqc8k','2022-10-19 18:16:06','2022-10-19 18:16:10','2022-11-18 18:16:07',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-19T18:16:10.309Z\"}]','2022-10-19 18:16:06','2022-10-19 18:16:10'),(44,'39cfff5a-4fda-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MjAzNDI0LCJleHAiOjE2NjYzNzYyMjR9.xFJ3igzuu2OhV9riElDpovBxIgUaEANWxQsjC0TDUxM','2022-10-19 18:17:00','2022-10-19 18:17:04','2022-11-18 18:17:01',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-19T18:17:04.067Z\"}]','2022-10-19 18:17:00','2022-10-19 18:17:04'),(45,'8d6eea70-4fda-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MjAzNTY0LCJleHAiOjE2NjYzNzYzNjR9.om2dCQdjSguNRXAl2uauuAQKXgnKVlTBDe9fw9gZE3A','2022-10-19 18:19:21','2022-10-19 18:19:24','2022-11-18 18:19:21',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-19T18:19:24.276Z\"}]','2022-10-19 18:19:21','2022-10-19 18:19:24'),(46,'a6adc0c0-4fda-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MjAzNjA2LCJleHAiOjE2NjYzNzY0MDZ9.UIeQySZaLL270rGFaJ_ZHnQq2QIGTH7p6mHNUsmZ3Dk','2022-10-19 18:20:03','2022-10-19 18:20:07','2022-11-18 18:20:04',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-19T18:20:06.777Z\"}]','2022-10-19 18:20:03','2022-10-19 18:20:06'),(47,'f9b244ac-4fda-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MjAzNzQ1LCJleHAiOjE2NjYzNzY1NDV9.sAIGkAB-8XuGpNY9V2GVIPLIjYKmOToj-jgwGYo-I04','2022-10-19 18:22:22','2022-10-19 18:22:26','2022-11-18 18:22:23',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-19T18:22:25.566Z\"}]','2022-10-19 18:22:22','2022-10-19 18:22:25'),(48,'44180f3f-5022-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2Mjg4NjIyLCJleHAiOjE2NjY0NjE0MjJ9.66tQ-qxcA2f3w-pUvLgn49oMt-Q42bkC-f0GfAE48q0','2022-10-20 02:52:41','2022-10-20 17:57:03','2022-11-19 02:52:42',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-20T02:52:45.659Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-20T17:57:02.640Z\"}]','2022-10-20 02:52:41','2022-10-20 17:57:02'),(49,'b97db8fa-50ed-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MzIxNzUwLCJleHAiOjE2NjY0OTQ1NTB9.K3YGnGB5lrW9UwFpKLeR7QsX4Y4PJIcyL4-Z5WlVRDY','2022-10-21 03:09:06','2022-10-21 03:09:11','2022-11-20 03:09:07',1,0,'192.168.1.11','::ffff:192.168.1.11','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-21T03:09:10.842Z\"}]','2022-10-21 03:09:06','2022-10-21 03:09:10'),(50,'8d4fdeff-5137-11ed-b259-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2MzUzNDU5LCJleHAiOjE2NjY1MjYyNTl9.FEHA-cOOsC0Z3-mEIqmTSwQCV_0f6NrpBZSQsBjx2K0','2022-10-21 11:57:35','2022-10-21 11:57:39','2022-11-20 11:57:35',1,0,'192.168.1.4','::ffff:192.168.1.4','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-21T11:57:39.298Z\"}]','2022-10-21 11:57:35','2022-10-21 11:57:39'),(51,'a3d1590d-56b6-11ed-a1eb-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY2OTYxNzMzLCJleHAiOjE2NjcxMzQ1MzN9.5qR2VTC2yJwT0sq7atcFR3FfjRRVd-A-wJ0jPutIOQ8','2022-10-28 11:49:55','2022-10-28 12:55:33','2022-11-27 11:49:55',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-28T11:49:58.213Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-10-28T12:55:33.270Z\"}]','2022-10-28 11:49:55','2022-10-28 12:55:33'),(52,'ad197ef6-5de8-11ed-a060-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY3ODM5MjUxLCJleHAiOjE2NjgwMTIwNTF9.lEV1CwsTXDoMilCI7u4JEJC4B6SoNEKGJ3s9_fHp0r0','2022-11-06 15:35:43','2022-11-07 16:40:55','2022-12-06 15:35:44',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T15:35:49.563Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:00:44.467Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:00:56.206Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:01:44.286Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:02:09.031Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:04:18.984Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:39:10.609Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:40:50.226Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:40:56.128Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:41:11.694Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:41:28.177Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:41:34.275Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-06T17:41:41.374Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-07T16:40:51.494Z\"}, {\"message\": \"User signout\"}]','2022-11-06 15:35:43','2022-11-07 16:40:54'),(53,'4cc59250-5ebb-11ed-b437-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY3ODM5NTQ0LCJleHAiOjE2NjgwMTIzNDR9.nXZoqy_MqkPmKtTnhltbpbD_OO8AJmf1EIG7oOuGbEE','2022-11-07 16:43:25','2022-11-07 16:45:49','2022-12-07 16:43:26',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-07T16:43:28.974Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-07T16:44:38.319Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-07T16:44:43.314Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-07T16:45:44.347Z\"}, {\"message\": \"User signout\"}]','2022-11-07 16:43:25','2022-11-07 16:45:48'),(54,'83c887d9-5ebc-11ed-b437-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY3ODM5OTQwLCJleHAiOjE2NjgwMTI3NDB9.t35emJv2cwnQHk0GxSnbr8xOwU-wiyyuBv1qhTSB91E','2022-11-07 16:52:07','2022-11-07 16:52:21','2022-12-07 16:52:08',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-07T16:52:20.683Z\"}]','2022-11-07 16:52:07','2022-11-07 16:52:20'),(55,'77db1bbb-5f36-11ed-a6e1-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2Nzg5MjMwNiwiZXhwIjoxNjcwNDg0MzA2fQ.lGhzGnk33zm8R3x24S6rF-AczBYNZZUP4AK-29dysgw','2022-11-08 07:25:06','2022-11-08 07:25:06','2022-12-08 07:25:06',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-11-08 07:25:06','2022-11-08 07:25:06'),(56,'f227089c-5f36-11ed-a6e1-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2Nzg5MjUxMSwiZXhwIjoxNjcwNDg0NTExfQ.Iulxz6Ovjc_rhQhEdSbmi9bew8ify-j7GVq5VuOLmds','2022-11-08 07:28:31','2022-11-08 07:28:31','2022-12-08 07:28:31',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-11-08 07:28:31','2022-11-08 07:28:31'),(57,'9a13ae25-61df-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MTkwOTI2LCJleHAiOjE2NjgzNjM3MjZ9.ol7HY5o_RT4F7Elu30eVk4KfeDxIOWU393k8RY_5H0E','2022-11-11 16:40:50','2022-11-11 18:22:11','2022-12-11 16:40:51',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T16:41:01.851Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T16:44:36.258Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T16:56:26.344Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T17:08:19.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T17:09:17.578Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:03:54.308Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:05:35.696Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:08:37.816Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:17:40.820Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:17:50.694Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:18:10.350Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:18:20.955Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:18:53.350Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:19:04.426Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:19:07.335Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:19:37.149Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:20:15.941Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:20:46.430Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:22:06.566Z\"}, {\"message\": \"User signout\"}]','2022-11-11 16:40:50','2022-11-11 18:22:10'),(58,'11c6b450-61e9-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2ODE4ODkxNywiZXhwIjoxNjcwNzgwOTE3fQ.uEUiDGCPh-sV2MkslGwxqW1r3I_cTYrGIzHDnz9Anfc','2022-11-11 17:48:37','2022-11-11 17:48:37','2022-12-11 17:48:37',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-11-11 17:48:37','2022-11-11 17:48:37'),(59,'c4374473-61ed-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MTk1MDU1LCJleHAiOjE2NjgzNjc4NTV9.uFSmCoW4qO0C6RTPPonIldReGnt9HxX48-OD177uxF0','2022-11-11 18:22:14','2022-11-11 19:31:00','2022-12-11 18:22:15',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:22:17.110Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:28:43.893Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:28:52.475Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:31:10.928Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:33:15.021Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:33:45.956Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:36:05.355Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:37:18.542Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:37:28.360Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:40:46.003Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:44:49.271Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:49:39.362Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:53:05.848Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:53:53.467Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:56:07.390Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:58:47.371Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T18:59:10.363Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:02:54.374Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:04:00.569Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:04:12.711Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:05:13.133Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:06:49.320Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:09:12.737Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:09:31.625Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:10:10.044Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:19:13.745Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:20:27.553Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:21:26.798Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:23:13.380Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:23:27.374Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:23:37.448Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:23:46.881Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:23:59.378Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:27:55.042Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:30:44.518Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:30:55.594Z\"}, {\"message\": \"User signout\"}]','2022-11-11 18:22:14','2022-11-11 19:31:00'),(60,'e9b1934a-61f7-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MTk1Mjk2LCJleHAiOjE2NjgzNjgwOTZ9.cIg5Kd3M2EsgGiCyYzXiX94htDuWGs3-ba2icAdKSDs','2022-11-11 19:34:52','2022-11-11 19:35:04','2022-12-11 19:34:52',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:34:56.343Z\"}, {\"message\": \"User signout\"}]','2022-11-11 19:34:52','2022-11-11 19:35:03'),(61,'f2a2b2a5-61f7-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MTk1MzEwLCJleHAiOjE2NjgzNjgxMTB9.riKeZD3FE3kUAXOaxB8F71JCCvwZhgj4ES4ylslO1hA','2022-11-11 19:35:07','2022-11-11 19:35:15','2022-12-11 19:35:07',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:35:10.659Z\"}, {\"message\": \"User signout\"}]','2022-11-11 19:35:07','2022-11-11 19:35:15'),(62,'fa014193-61f7-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MTk1Mzg2LCJleHAiOjE2NjgzNjgxODZ9.aaC4OHHDao-3OvHm2GhdAiKV7uMH9YRpGQIArQEdpUM','2022-11-11 19:35:19','2022-11-11 19:36:28','2022-12-11 19:35:20',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:36:26.500Z\"}, {\"message\": \"User signout\"}]','2022-11-11 19:35:19','2022-11-11 19:36:28'),(63,'29b44332-61f8-11ed-9719-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MjU1MzE1LCJleHAiOjE2Njg0MjgxMTV9.9CP9UGNUfX2yMpFIrzdKdC_0dRvnVyFzCZQG6ohrurc','2022-11-11 19:36:39','2022-11-12 12:15:23','2022-12-11 19:36:40',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-11T19:36:43.233Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T12:15:15.422Z\"}, {\"message\": \"User signout\"}]','2022-11-11 19:36:39','2022-11-12 12:15:22'),(64,'bfcb86df-6283-11ed-975e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MjYzMTI0LCJleHAiOjE2Njg0MzU5MjR9.QVgnmqJxyomKWoRCC9b6mKULKOdsO-Tyl60vAlsCrc4','2022-11-12 12:15:51','2022-11-12 14:27:04','2022-12-12 12:15:52',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T12:16:08.272Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T12:20:10.635Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T12:46:39.481Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:25:24.377Z\"}, {\"message\": \"User signout\"}]','2022-11-12 12:15:51','2022-11-12 14:27:03'),(65,'1c54c75e-6296-11ed-975e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MzU3ODk4LCJleHAiOjE2Njg1MzA2OTh9.x3yMtAViVq0scMR1GnSPSX_2O0oZ4VTi8xKoj9UuzWk','2022-11-12 14:27:17','2022-11-13 16:44:59','2022-12-12 14:27:18',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:31:58.335Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:46:58.526Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:47:47.262Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:48:22.604Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:55:42.835Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T16:51:25.145Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T16:51:39.014Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T16:52:24.975Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T05:21:14.432Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T11:27:54.264Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:30:36.852Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:34:38.368Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:37:28.007Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:42:31.670Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:44:58.852Z\"}]','2022-11-12 14:27:17','2022-11-13 16:44:58'),(66,'25e2959d-6296-11ed-975e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4MzU4NTA2LCJleHAiOjE2Njg1MzEzMDZ9.TEQt2Qol3twUzKZO_A8noXj_Ubrg8irHXcV-MN-52JU','2022-11-12 14:27:33','2022-11-13 16:55:07','2022-12-12 14:27:34',1,0,'192.168.1.3','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:27:36.834Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:28:36.107Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T14:52:40.938Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T17:53:20.282Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:41:02.339Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:41:20.566Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:42:21.216Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:43:17.750Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:43:25.099Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:45:17.604Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-13T16:55:06.789Z\"}]','2022-11-12 14:27:33','2022-11-13 16:55:06'),(67,'a290c7f2-629f-11ed-975e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY4MjY3NDQyLCJleHAiOjE2NzA4NTk0NDJ9.XNch3_28DEZWIU63QQZD-ASeURr6HtlYX5kSQLoCS8I','2022-11-12 15:35:28','2022-11-12 15:37:22','2022-12-12 15:35:28',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-12T15:37:22.135Z\"}]','2022-11-12 15:35:28','2022-11-12 15:37:22'),(68,'26838210-63da-11ed-bc8c-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2ODQwMjQxMSwiZXhwIjoxNjcwOTk0NDExfQ.F5aF11UXyZI2nMYp5oPYLRwE4AuA1CYh1e8Um80Xk3U','2022-11-14 05:06:51','2022-11-14 05:06:51','2022-12-14 05:06:52',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-11-14 05:06:51','2022-11-14 05:06:51'),(69,'414c1c06-63da-11ed-bc8c-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4NDAzNDc5LCJleHAiOjE2Njg1NzYyNzl9.0gzYaSOQT4bScmipUvagWam8M3SbBDTzrfYOsnl0s7A','2022-11-14 05:07:36','2022-11-14 05:24:39','2022-12-14 05:07:37',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-14T05:07:39.294Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-14T05:24:39.258Z\"}]','2022-11-14 05:07:36','2022-11-14 05:24:39'),(70,'9a48185c-672a-11ed-9882-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY4ODcyMjI5LCJleHAiOjE2NjkwNDUwMjl9.e1OZHOKFOdDhAZf_LXedn42ZqPt0y68-mltZf_-dVUk','2022-11-18 10:20:19','2022-11-19 15:37:10','2022-12-18 10:20:19',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-18T10:20:22.827Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-19T14:33:18.145Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-19T14:34:39.884Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-19T14:35:47.034Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-19T14:37:26.539Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-19T15:37:09.956Z\"}]','2022-11-18 10:20:19','2022-11-19 15:37:09'),(71,'62aa9a1c-69b6-11ed-9882-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2OTA0Njc1NywiZXhwIjoxNjcxNjM4NzU3fQ.6LaAWFK4XSdLInEYoSb1o-my4-p8KWwZ4A8yFytqckQ','2022-11-21 16:05:57','2022-11-21 16:05:57','2022-12-21 16:05:58',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-11-21 16:05:57','2022-11-21 16:05:57'),(72,'7fa5729e-69b6-11ed-9882-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MDk2MzM3LCJleHAiOjE2NjkyNjkxMzd9.J2QmubvNt5zpwvtlKmI4sKTbAU0QbKj8ztIQq0A8Or4','2022-11-21 16:06:46','2022-11-22 05:52:19','2022-12-21 16:06:46',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-21T16:06:50.895Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T03:48:04.801Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:20:06.536Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:20:38.050Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:47:33.617Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:49:17.119Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:52:17.537Z\"}, {\"message\": \"User signout\"}]','2022-11-21 16:06:46','2022-11-22 05:52:19'),(73,'d7d70676-6a29-11ed-9882-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY5MzA5MjgxLCJleHAiOjE2Njk0ODIwODF9.XkMhPVM7jpAZCgP_1tjhYY2Ws_ILlJmWBbPK1NchAd4','2022-11-22 05:52:26','2022-11-24 17:01:25','2022-12-22 05:52:27',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:52:32.853Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:54:25.888Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T05:57:21.612Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-22T06:00:54.256Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T10:00:40.982Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T10:02:10.419Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:01:13.190Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:05:28.620Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:08:00.872Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:29:25.269Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:30:44.143Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:32:49.918Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-23T16:33:19.832Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:39:40.430Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:39:53.205Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:40:36.989Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:41:01.705Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:47:16.112Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:54:09.686Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:54:52.436Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:55:28.337Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:56:02.017Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:56:07.351Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:56:19.543Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:56:24.328Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:56:33.767Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:57:11.319Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:59:07.348Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T16:59:31.456Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:00:09.957Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:00:36.730Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:00:45.319Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:00:57.515Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:01:06.086Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:01:21.214Z\"}, {\"message\": \"User signout\"}]','2022-11-22 05:52:26','2022-11-24 17:01:24'),(74,'a68a1298-6c19-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY5MzEwMTIyLCJleHAiOjE2Njk0ODI5MjJ9.FJWPj94gm4AEGDv_bem8Qqmws7QSTk92ylgPXyCVgLk','2022-11-24 17:01:34','2022-11-24 17:16:02','2022-12-24 17:01:34',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:01:54.291Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:02:32.237Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:02:49.117Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:02:58.311Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:03:44.968Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:10:04.722Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:11:01.388Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:11:20.803Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:12:19.940Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:13:22.777Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:13:46.014Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:13:58.347Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:14:33.712Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:15:02.756Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:15:22.350Z\"}, {\"message\": \"User signout\"}]','2022-11-24 17:01:34','2022-11-24 17:16:02'),(75,'19fd5a91-6c1c-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY5MzE1NTIxLCJleHAiOjE2Njk0ODgzMjF9.c7yro8L_JCYmF6AbLDDG5ZzCAce0Welf9dW4DK1_oY4','2022-11-24 17:19:06','2022-11-24 18:46:06','2022-12-24 17:19:07',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T17:19:10.938Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:16:46.301Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:17:09.424Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:17:29.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:17:49.719Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:17:56.404Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:18:09.305Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:18:32.906Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:19:16.364Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:19:18.306Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:19:56.328Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:20:30.301Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:20:43.318Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:20:53.805Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:20:57.943Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:21:13.392Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:21:21.974Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:21:45.517Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:21:52.300Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:22:07.288Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:22:14.637Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:22:35.666Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:22:47.101Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:28:48.282Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:31:25.224Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:31:34.126Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:31:43.685Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:31:45.402Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:32:00.058Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:32:08.155Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:32:40.715Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:36:33.826Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:36:51.546Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:37:56.296Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:38:53.279Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:39:27.285Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:39:34.284Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:39:55.277Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:40:23.282Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:40:30.294Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:40:36.310Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:40:38.353Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:42:29.083Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:42:54.790Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:43:08.269Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:44:09.110Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:44:56.903Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:45:21.613Z\"}, {\"message\": \"User signout\"}]','2022-11-24 17:19:06','2022-11-24 18:46:06'),(76,'94eaf499-6c26-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzE2MTQxLCJleHAiOjE2Njk0ODg5NDF9.627jdOPp4aM7vVstT5BEwV4FbVg4DwMYFMfHY94KqO4','2022-11-24 18:34:08','2022-11-24 18:55:47','2022-12-24 18:34:08',1,1,'192.168.1.7','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:34:11.041Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:34:45.009Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:36:11.071Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:36:36.257Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:55:41.879Z\"}, {\"message\": \"User signout\"}]','2022-11-24 18:34:08','2022-11-24 18:55:47'),(77,'6979107b-6c28-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY5MzE1NjY4LCJleHAiOjE2Njk0ODg0Njh9.NU3P_Kb0zn8pyONF_PbJe6p27ox9W_l9fQI5AmcysYc','2022-11-24 18:47:14','2022-11-24 18:47:49','2022-12-24 18:47:14',1,0,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:47:17.769Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:47:48.901Z\"}]','2022-11-24 18:47:14','2022-11-24 18:47:48'),(78,'83eb6db1-6c28-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjY5MzIwOTUwLCJleHAiOjE2Njk0OTM3NTB9.ONJnNK6RqhKp-dq0yuFHinXQe2frc0RdHCSC59NkLKU','2022-11-24 18:47:58','2022-11-24 20:15:55','2022-12-24 18:47:59',1,1,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:48:06.951Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:48:34.659Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:48:39.572Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:48:44.971Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:49:07.298Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:49:16.807Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:49:35.283Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:49:40.351Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:51:42.517Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:51:50.987Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:52:24.229Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:55:14.433Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:03:01.278Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:03:38.289Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:04:04.298Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:06:09.277Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:08:22.732Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:08:55.100Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:09:21.294Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:09:34.629Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:09:46.531Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:09:54.307Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:10:28.668Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:11:14.141Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:11:29.664Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:11:36.616Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:11:56.353Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:13:17.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:13:29.309Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:13:37.054Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:14:02.044Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:14:07.828Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:14:29.839Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:15:47.311Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:16:25.544Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:16:38.985Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:18:22.918Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:19:16.814Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:28:40.194Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:28:48.090Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:31:27.977Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:31:48.363Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:38:02.438Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:38:35.310Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:39:07.394Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:40:17.303Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:41:01.348Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:41:22.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:42:35.300Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:43:09.750Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:43:18.322Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:44:21.003Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:44:45.194Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:44:52.811Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:45:15.518Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:45:25.833Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:46:14.238Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:46:48.312Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:46:57.442Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:47:11.873Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:47:37.529Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:48:26.430Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:48:43.285Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:57:32.269Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:58:19.081Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:58:29.886Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:58:35.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:58:37.337Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:58:47.291Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:59:21.304Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T19:59:52.617Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:00:56.283Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:01:16.295Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:02:02.010Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:02:34.299Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:02:38.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:02:45.300Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:04:39.991Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:04:55.753Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:05:10.986Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:05:39.140Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:05:56.614Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:06:12.298Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:06:17.336Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:06:28.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:06:54.312Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:08:11.515Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:08:44.328Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:09:08.321Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:09:22.323Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:09:44.202Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:10:28.338Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:10:51.781Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:11:17.309Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:11:45.333Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:12:53.305Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:13:21.334Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:13:38.288Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:15:08.303Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:15:51.000Z\"}, {\"message\": \"User signout\"}]','2022-11-24 18:47:58','2022-11-24 20:15:55'),(79,'a12a46c3-6c29-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzU3NDIwLCJleHAiOjE2Njk1MzAyMjB9.GqC7aqwz3FlmhaGu7GP1qkrDhx-N9Dzu8t5OYfaVZmk','2022-11-24 18:55:57','2022-11-25 06:23:44','2022-12-24 18:55:57',1,1,'192.168.1.7','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T18:56:00.890Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:33:48.448Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:35:46.424Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:36:51.370Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:04.331Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:25.254Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:28.287Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:50.288Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:52.252Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:26:05.483Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:03:20.864Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:07:58.886Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:10:00.668Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:11:09.726Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:11:37.489Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:12:59.497Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:14:54.271Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:15:18.095Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:15:54.334Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:16:21.320Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:20:14.233Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:21:51.814Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:22:35.903Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:23:15.137Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:23:40.343Z\"}, {\"message\": \"User signout\"}]','2022-11-24 18:55:57','2022-11-25 06:23:43'),(80,'cf26711b-6c34-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzU3NjIxLCJleHAiOjE2Njk1MzA0MjF9.YfQMJWVpL5_0Mb5myGIImew1z7e2B-riY7D2CYQfL8o','2022-11-24 20:15:58','2022-11-25 06:43:30','2022-12-24 20:15:59',1,1,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:16:02.210Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:17:00.313Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:17:05.201Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:17:25.300Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:17:57.112Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:18:37.299Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:19:08.343Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:19:36.801Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:20:34.125Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:20:45.883Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:21:33.411Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:25:49.152Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:26:57.302Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:27:20.407Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:28:25.292Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:29:00.598Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:29:40.906Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:30:52.574Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:31:56.663Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:32:12.334Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:32:44.776Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:33:20.642Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:35:45.440Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:36:51.308Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:04.308Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:25.357Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:27.327Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:50.356Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:37:51.290Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:39:03.423Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:39:46.716Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:42:30.034Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:46:00.492Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:49:29.352Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:53:10.265Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:57:51.172Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:59:27.129Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:00:45.116Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:02:29.320Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:02:56.872Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:03:25.238Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:03:59.296Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:04:28.538Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:05:42.850Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:05:56.424Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:08:27.031Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:10:00.035Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:10:31.174Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:10:50.938Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:11:05.397Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:11:19.788Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:13:47.487Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:17:03.622Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:18:22.547Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:21:10.769Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T21:23:51.524Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:41:20.838Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:42:33.021Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:44:03.144Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:44:20.396Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:44:32.601Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:44:36.816Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:54:09.893Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:54:33.459Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:55:30.268Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:56:15.053Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:57:03.498Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:57:46.780Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:57:59.622Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:58:31.890Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T05:59:00.641Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:06:10.491Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:06:22.832Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:10:06.052Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:11:09.265Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:11:37.257Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:12:56.268Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:16:29.184Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:17:34.931Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:17:58.613Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:18:25.489Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:18:37.253Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:19:02.848Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:19:20.974Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:19:45.103Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:20:02.720Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:27:01.366Z\"}, {\"message\": \"User signout\"}]','2022-11-24 20:15:58','2022-11-25 06:43:29'),(81,'ff4bca77-6c35-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzIxNDcxLCJleHAiOjE2Njk0OTQyNzF9.rG4Uan_8TvxmMqKb-5vTwLFvJsHzrMLh6Kl_05MGtgw','2022-11-24 20:24:29','2022-11-24 20:24:32','2022-12-24 20:24:29',1,0,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-24T20:24:31.820Z\"}]','2022-11-24 20:24:29','2022-11-24 20:24:31'),(82,'1350d648-6c87-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzcyNDY1LCJleHAiOjE2Njk1NDUyNjV9.E66ltjmAcXkTqh3gbHmWSW1RsfroBh23nsTBXU6ylss','2022-11-25 06:04:51','2022-11-25 10:34:26','2022-12-25 06:04:52',1,0,'192.168.1.7','::ffff:192.168.1.18','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:04:58.622Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:06:51.419Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:07:09.137Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:07:24.497Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T10:34:25.705Z\"}]','2022-11-25 06:04:51','2022-11-25 10:34:25'),(83,'bb13f3c0-6c89-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzU3NDM0LCJleHAiOjE2Njk1MzAyMzR9.bMD-AoYKJP6X5FyQMo0FtsPep-ws0KZ5iRllBMYpr0A','2022-11-25 06:23:52','2022-11-25 06:42:42','2022-12-25 06:23:52',1,1,'192.168.1.7','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:23:54.806Z\"}, {\"message\": \"User signout\"}]','2022-11-25 06:23:52','2022-11-25 06:42:42'),(84,'8da9a79c-6c8c-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzU4NjUxLCJleHAiOjE2Njk1MzE0NTF9.mBI5AhYjkS8ShJc2mYTb4Fb8vfwbiHqTcE_FJjdwww4','2022-11-25 06:44:04','2022-11-25 06:44:15','2022-12-25 06:44:05',1,1,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:44:11.026Z\"}, {\"message\": \"User signout\"}]','2022-11-25 06:44:04','2022-11-25 06:44:14'),(85,'95aa0c49-6c8c-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzU4NjYyLCJleHAiOjE2Njk1MzE0NjJ9.-nazBKgJoCMX6zOUFe55hFvhys9IPvgu6u8sydnG4Jg','2022-11-25 06:44:18','2022-11-25 06:44:22','2022-12-25 06:44:18',1,0,'192.168.1.7','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:44:22.025Z\"}]','2022-11-25 06:44:18','2022-11-25 06:44:22'),(86,'9cafa247-6c8c-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzU4Njc1LCJleHAiOjE2Njk1MzE0NzV9.-W6hPTpiP964yvQDSeNTTAGhNxfUxQQYHV6W8PA3InQ','2022-11-25 06:44:29','2022-11-25 06:44:36','2022-12-25 06:44:30',1,0,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T06:44:35.834Z\"}]','2022-11-25 06:44:29','2022-11-25 06:44:35'),(87,'96d4801e-6cc4-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzgyNzE1LCJleHAiOjE2Njk1NTU1MTV9.aZS-3Rf5CLJakV4mprwLUHHtkKBCDHesjpq_g4imiBM','2022-11-25 13:25:11','2022-11-25 13:25:15','2022-12-25 13:25:12',1,0,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T13:25:15.397Z\"}]','2022-11-25 13:25:11','2022-11-25 13:25:15'),(88,'3bfcc0fa-6cc5-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5MzgzMDEyLCJleHAiOjE2Njk1NTU4MTJ9.Vo6QEhbgn0SkNruDLJ4PtI3fKoDRT3SSiFPQa63jAEU','2022-11-25 13:29:48','2022-11-25 15:46:37','2022-12-25 13:29:49',1,1,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T13:29:52.893Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T13:30:12.163Z\"}, {\"message\": \"User signout\"}]','2022-11-25 13:29:48','2022-11-25 15:46:36'),(89,'5ac055f6-6cd8-11ed-b4ff-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5Mzk0MDY1LCJleHAiOjE2Njk1NjY4NjV9.fpuoujQEf2rQOfLAInV7GadHtnshFYY92RACNpVTjiY','2022-11-25 15:46:40','2022-11-25 16:43:32','2022-12-25 15:46:41',1,1,'192.168.1.7','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:46:44.254Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:47:49.086Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:49:39.818Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:50:58.591Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:52:37.011Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:55:29.416Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:57:27.785Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:58:23.158Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T15:59:02.170Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:00:02.179Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:00:22.072Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:00:51.408Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:06:47.055Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:07:02.208Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:07:13.884Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:11:52.572Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:13:22.621Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:13:47.173Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:34:25.205Z\"}, {\"message\": \"User signout\"}]','2022-11-25 15:46:40','2022-11-25 16:43:32'),(90,'49012bc1-6cdf-11ed-b6f9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NDAxNjIzLCJleHAiOjE2Njk1NzQ0MjN9.oTud3CQXJmWsMpb9woOf6-T7_R32iymaqFEoYSiZ0vI','2022-11-25 16:36:17','2022-11-25 18:40:27','2022-12-25 16:36:18',1,1,'192.168.1.8','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:36:25.163Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:36:44.698Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:44:48.583Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:02:36.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:03:13.443Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:40:23.425Z\"}, {\"message\": \"User signout\"}]','2022-11-25 16:36:17','2022-11-25 18:40:27'),(91,'5ad41a0b-6ce0-11ed-b6f9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5Mzk0NjQwLCJleHAiOjE2Njk1Njc0NDB9.jmMNt4YJ7M6mO6jVhyixRiHuoFeUTNVThSs4DPsG0z8','2022-11-25 16:43:57','2022-11-25 16:44:06','2022-12-25 16:43:57',1,1,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:44:00.696Z\"}, {\"message\": \"User signout\"}]','2022-11-25 16:43:57','2022-11-25 16:44:05'),(92,'643bbc68-6ce0-11ed-b6f9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5Mzk5ODg5LCJleHAiOjE2Njk1NzI2ODl9.zUOfs9KjJICMNr73UGKUdGA0f74Vh0W9RaKMENG4A9Q','2022-11-25 16:44:12','2022-11-25 18:12:47','2022-12-25 16:44:13',1,1,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:48:50.449Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T16:52:10.704Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:00:16.424Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:06:35.523Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:21:17.443Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:21:42.272Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:22:40.134Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:23:07.702Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:25:12.522Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:28:02.692Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:28:54.244Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:29:14.910Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:30:30.425Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:34:12.169Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:35:14.354Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:35:27.089Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:36:18.630Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:39:42.072Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:40:09.389Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:40:27.671Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:40:39.682Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:40:50.340Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:43:26.761Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:50:35.108Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:51:20.754Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:51:33.368Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:51:56.461Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:53:28.498Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:53:54.128Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:54:05.141Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:54:35.347Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:54:58.384Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:55:30.575Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:55:45.062Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:56:06.447Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:56:25.182Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:56:57.867Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:57:33.352Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T17:57:49.597Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:04:44.146Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:09:08.393Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:09:26.019Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:09:37.520Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:10:06.269Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:10:24.261Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:10:35.583Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:11:13.977Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:11:29.197Z\"}, {\"message\": \"User signout\"}]','2022-11-25 16:44:12','2022-11-25 18:12:46'),(93,'ca673f5c-6cec-11ed-b6f9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NDAxNTEyLCJleHAiOjE2Njk1NzQzMTJ9.adfibYXTQ_zCWk2sRDKUOn6U-SqQS_JOf6bgwZvb2oU','2022-11-25 18:12:58','2022-11-25 18:39:55','2022-12-25 18:12:58',1,1,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:13:01.037Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:17:08.106Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:18:02.435Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:18:21.177Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:18:55.225Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:34:13.218Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:34:34.233Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:34:45.950Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:34:55.314Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:36:08.714Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:36:29.105Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:36:41.634Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:36:56.400Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:37:44.795Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:38:08.219Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:38:21.373Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:38:32.471Z\"}, {\"message\": \"User signout\"}]','2022-11-25 18:12:58','2022-11-25 18:39:55'),(94,'bd86613a-6cf0-11ed-b6f9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NDAxODg2LCJleHAiOjE2Njk1NzQ2ODZ9.H2xOxDa2mRbIskfeXFXRhADejsR8kFRM6X7jmHKnwT8','2022-11-25 18:41:14','2022-11-25 18:44:46','2022-12-25 18:41:15',1,0,'192.168.1.8','::ffff:192.168.1.7','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:41:18.193Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-25T18:44:46.254Z\"}]','2022-11-25 18:41:14','2022-11-25 18:44:46'),(95,'54f327b7-6d60-11ed-b6f9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NTI4NTM3LCJleHAiOjE2Njk3MDEzMzd9.fQ1RWw5ffRZssF8XNYW1FpNz2DN7vvr4fC9oZRgaTC8','2022-11-26 08:00:02','2022-11-27 05:55:38','2022-12-26 08:00:03',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-26T08:00:06.589Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-26T10:03:28.956Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-27T05:49:37.790Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-27T05:55:22.368Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-27T05:55:37.574Z\"}]','2022-11-26 08:00:02','2022-11-27 05:55:37'),(96,'eb0cff5f-6fc7-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NzI4NjcxLCJleHAiOjE2Njk5MDE0NzF9.OOHttSWZx9jE1OIig6_PWP2n2MSsmRU6DOXvGto75C8','2022-11-29 09:26:35','2022-11-29 13:31:52','2022-12-29 09:26:35',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T09:36:57.707Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T09:40:49.432Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T09:42:05.438Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T09:43:01.405Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T10:29:56.767Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T10:33:26.923Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T10:54:37.515Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:00:36.490Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:00:51.701Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:01:58.002Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:02:44.978Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:03:19.035Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:03:55.264Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:06:34.980Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:22:22.863Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:22:33.507Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:24:15.868Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:25:05.876Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:25:34.867Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:25:47.163Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:26:12.784Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:26:22.161Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:26:46.225Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:26:58.225Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:27:50.905Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:29:10.876Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:29:21.911Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:30:12.877Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:30:42.506Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:31:11.863Z\"}, {\"message\": \"User signout\"}]','2022-11-29 09:26:35','2022-11-29 13:31:52'),(97,'3176f251-6fea-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NzMzOTg4LCJleHAiOjE2Njk5MDY3ODh9.kKASrEsVEjos1lzXYHOSE7xAohwQKVR_oxAP1ny8nTU','2022-11-29 13:31:56','2022-11-29 15:09:49','2022-12-29 13:31:56',1,1,'192.168.1.14','::ffff:192.168.1.14','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:31:59.138Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:33:01.825Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:33:13.895Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:34:03.869Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:34:30.855Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:34:53.433Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:35:28.062Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T13:36:37.155Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T14:42:44.407Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T14:53:53.114Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T14:58:54.394Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T14:59:48.034Z\"}, {\"message\": \"User signout\"}]','2022-11-29 13:31:56','2022-11-29 15:09:48'),(98,'16dc63d4-6ff8-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NzM0Njg3LCJleHAiOjE2Njk5MDc0ODd9.LbH2m4EsaxbhbSVnQPP5kg4ZTctNcvAtP7a_EwCtT-s','2022-11-29 15:11:24','2022-11-29 15:11:39','2022-12-29 15:11:24',1,1,'192.168.1.14','::ffff:192.168.1.14','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:11:27.747Z\"}, {\"message\": \"User signout\"}]','2022-11-29 15:11:24','2022-11-29 15:11:38'),(99,'2622d397-6ff8-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NzM1NjI3LCJleHAiOjE2Njk5MDg0Mjd9.xBBLOPwQnImeRv_JTbznpkd2QOv2ObxtLMxzc1GGq60','2022-11-29 15:11:50','2022-11-29 15:27:19','2022-12-29 15:11:50',1,1,'192.168.1.14','::ffff:192.168.1.14','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:11:55.526Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:12:50.265Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:12:54.208Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:12:57.491Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:26:44.746Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:27:07.024Z\"}, {\"message\": \"User signout\"}]','2022-11-29 15:11:50','2022-11-29 15:27:18'),(100,'e3456d6a-6ff9-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5NzM3MzYwLCJleHAiOjE2Njk5MTAxNjB9.yqysYM9EyhckI5_1EuoU4lgGJLh-wc-A2yypt-VvUrY','2022-11-29 15:24:16','2022-11-29 15:57:30','2022-12-29 15:24:17',1,1,'192.168.1.14','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:24:25.505Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:33:34.100Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:56:00.429Z\"}, {\"message\": \"User signout\"}]','2022-11-29 15:24:16','2022-11-29 15:57:30'),(101,'5181025e-6ffa-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5ODM0NTIzLCJleHAiOjE2NzAwMDczMjN9.Vg_I3vWLesqQpxX1QKd-MzRm9O_keHX7V-SCGOC_Znw','2022-11-29 15:27:21','2022-11-30 18:55:24','2022-12-29 15:27:22',1,0,'192.168.1.14','::ffff:192.168.1.14','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:27:25.300Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:28:11.181Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:29:16.744Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:29:31.701Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:31:10.056Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:32:29.992Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:32:59.367Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:33:20.548Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:34:08.108Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:35:03.532Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:36:02.098Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:36:22.843Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:37:08.457Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:37:36.313Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:37:51.286Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:38:13.002Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:39:55.305Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:42:44.217Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:45:15.174Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:48:57.327Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:57:16.863Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:01:24.222Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:01:42.860Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:01:50.156Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:02:07.933Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:02:13.256Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:03:37.871Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:04:05.204Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:04:29.670Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:04:48.038Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:06:30.059Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:07:24.872Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T20:15:10.441Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T20:15:50.356Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-30T18:55:23.797Z\"}]','2022-11-29 15:27:21','2022-11-30 18:55:23'),(102,'8ce4a3f5-6ffe-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY2OTczNzQ1OSwiZXhwIjoxNjcyMzI5NDU5fQ.DoVl58vQ7feSINe4DmoewwnPxz1UH9Ql37yJoAvcyec','2022-11-29 15:57:39','2022-11-29 15:57:39','2022-12-29 15:57:39',1,0,'192.168.1.14','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}]','2022-11-29 15:57:39','2022-11-29 15:57:39'),(103,'957cda03-6ffe-11ed-95c7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjY5ODIzMzMzLCJleHAiOjE2Njk5OTYxMzN9.g5bMNi5-CryXl9T2LssT4prhe5E9Z7g2qSNwHYoTVxU','2022-11-29 15:57:53','2022-11-30 15:48:54','2022-12-29 15:57:54',1,0,'192.168.1.14','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T15:57:57.224Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:05:11.765Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:05:12.554Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:05:17.137Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:06:30.244Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T16:07:25.322Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-29T20:26:55.093Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-30T08:22:01.598Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-11-30T15:48:53.948Z\"}]','2022-11-29 15:57:53','2022-11-30 15:48:54'),(104,'a9be0582-7702-11ed-999d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MDUwODg4MywiZXhwIjoxNjczMTAwODgzfQ.oKLqspHcSJclG48RgISaawE-Ls77P2MGnKBX7frYaAc','2022-12-08 14:14:43','2022-12-08 14:14:43','2023-01-07 14:14:44',1,0,'192.168.1.4','::ffff:192.168.1.4','[{\"message\": \"Initiating session\"}]','2022-12-08 14:14:43','2022-12-08 14:14:43'),(105,'ac4a84ff-7702-11ed-999d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MDUwODg4OCwiZXhwIjoxNjczMTAwODg4fQ.tEhxrg2Qfl7o5rJqlGstzf7HU617tHzeyPIUy2iX7es','2022-12-08 14:14:48','2022-12-08 14:14:48','2023-01-07 14:14:48',1,0,'192.168.1.4','::ffff:192.168.1.4','[{\"message\": \"Initiating session\"}]','2022-12-08 14:14:48','2022-12-08 14:14:48'),(106,'b4c70c00-7702-11ed-999d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MDUwODkwMiwiZXhwIjoxNjcwNjgxNzAyfQ.7aJOIB3SLT9w6ISTfEe3kwJVemot9mxOoeXPQC0LaY8','2022-12-08 14:15:02','2022-12-08 14:15:02','2022-12-09 14:15:02',1,0,'192.168.1.4','::ffff:192.168.1.4','[{\"message\": \"Initiating session\"}]','2022-12-08 14:15:02','2022-12-08 14:15:02'),(107,'d15ba2ca-7919-11ed-92c9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MDczODczMSwiZXhwIjoxNjczMzMwNzMxfQ.dSky_wqMW_Fa0Vi8ekifj5vU9xpXBNPBdvmj5_eZNq8','2022-12-11 06:05:31','2022-12-11 06:05:31','2023-01-10 06:05:31',1,0,'192.168.222.74','::ffff:192.168.222.74','[{\"message\": \"Initiating session\"}]','2022-12-11 06:05:31','2022-12-11 06:05:31'),(108,'d425fd3e-7919-11ed-92c9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MDczODczNSwiZXhwIjoxNjczMzMwNzM1fQ.St7C7PujF_gMrBLisgWtXXWSTpRzVU599tFctnUPX1o','2022-12-11 06:05:35','2022-12-11 06:05:35','2023-01-10 06:05:36',1,0,'192.168.222.74','::ffff:192.168.222.74','[{\"message\": \"Initiating session\"}]','2022-12-11 06:05:35','2022-12-11 06:05:35'),(109,'d75e1f3c-7919-11ed-92c9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MDczODc0MSwiZXhwIjoxNjczMzMwNzQxfQ.Md6xRb8f0jy8UMUeXuXbsJaw7to1Rg2DHyD63HqPrwY','2022-12-11 06:05:41','2022-12-11 06:05:41','2023-01-10 06:05:41',1,0,'192.168.222.74','::ffff:192.168.222.74','[{\"message\": \"Initiating session\"}]','2022-12-11 06:05:41','2022-12-11 06:05:41'),(110,'ea0d4ac8-7919-11ed-92c9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcwNzM4ODQ0LCJleHAiOjE2NzA5MTE2NDR9.L0o658eD8THEUycCfdPIZw9fLSHN8FeCUr_Da4zdjYM','2022-12-11 06:06:12','2022-12-11 06:07:25','2023-01-10 06:06:13',1,0,'192.168.222.74','::ffff:192.168.222.74','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-11T06:06:20.695Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-11T06:07:24.561Z\"}]','2022-12-11 06:06:12','2022-12-11 06:07:24'),(111,'6ddc6865-7957-11ed-92c9-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcwNzc5MzA2LCJleHAiOjE2NzA5NTIxMDZ9.gKLOq2ZZ8PsR3fKvT4REtWM2y49LZ3968RDTXsn5ULA','2022-12-11 13:26:33','2022-12-11 17:21:47','2023-01-10 13:26:33',1,0,'192.168.222.48','::ffff:192.168.222.48','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-11T13:26:36.059Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-11T17:21:46.579Z\"}]','2022-12-11 13:26:33','2022-12-11 17:21:46'),(112,'70a89e84-7b99-11ed-9e09-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTAxMzQ0NiwiZXhwIjoxNjczNjA1NDQ2fQ.gVLUpgHc_WEJXlYS0JTRUXcG3Y0eaczcd56KbgABLJA','2022-12-14 10:24:06','2022-12-14 10:24:06','2023-01-13 10:24:07',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-14 10:24:06','2022-12-14 10:24:06'),(113,'7294f21b-7b99-11ed-9e09-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTAxMzQ1MCwiZXhwIjoxNjczNjA1NDUwfQ.Idr1xD-SGAWotzm9f2fIU6oGqQRr5iLDerNwudniBZQ','2022-12-14 10:24:10','2022-12-14 10:24:10','2023-01-13 10:24:10',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-14 10:24:10','2022-12-14 10:24:10'),(114,'98d8eb5a-7b99-11ed-9e09-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxMDEzNTkyLCJleHAiOjE2NzExODYzOTJ9.y7xMzh7imY8CmMSDlZGYQuY5gXUsyIYKduA7UzHORkI','2022-12-14 10:25:14','2022-12-14 10:26:36','2022-12-15 10:25:14',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-14T10:26:32.110Z\"}, {\"message\": \"User signout\"}]','2022-12-14 10:25:14','2022-12-14 10:26:35'),(115,'cbe85b0e-7b99-11ed-9e09-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxMDQxMTA4LCJleHAiOjE2NzEyMTM5MDh9.LZny5r72SMo9Rx7DDsfCK0w0V5X0CmMJkc8NsnHZgPs','2022-12-14 10:26:39','2022-12-14 18:07:01','2023-01-13 10:26:40',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-14T10:26:51.063Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-14T18:04:53.045Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-14T18:05:08.963Z\"}, {\"message\": \"User signout\"}]','2022-12-14 10:26:39','2022-12-14 18:07:01'),(116,'a47b09f7-7bdb-11ed-9e09-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxMDQxODgzLCJleHAiOjE2NzEyMTQ2ODN9.ylLFZw4JIuXYkRCLFv0-iS1WvlyTD4iUVVdsDSa-QXo','2022-12-14 18:18:00','2022-12-14 18:18:29','2023-01-13 18:18:01',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-14T18:18:03.747Z\"}, {\"message\": \"User signout\"}]','2022-12-14 18:18:00','2022-12-14 18:18:29'),(117,'c1a9b0f7-7bdb-11ed-9e09-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxMzAwNDkyLCJleHAiOjE2NzE0NzMyOTJ9.zqCcb7l7n1dg21ceZwSGoDvxszl9z69vbmvkqxPKj9I','2022-12-14 18:18:49','2022-12-17 18:08:13','2023-01-13 18:18:49',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-14T18:18:55.041Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-16T08:42:44.538Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-17T18:08:12.509Z\"}]','2022-12-14 18:18:49','2022-12-17 18:08:12'),(118,'746d67f6-81c5-11ed-8768-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTY5MjA1OCwiZXhwIjoxNjc0Mjg0MDU4fQ.7lS8hM_4LwZpKp5W2mlQ41bySaf95xdoWr7zghqh_oc','2022-12-22 06:54:18','2022-12-22 06:54:18','2023-01-21 06:54:18',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-22 06:54:18','2022-12-22 06:54:18'),(119,'8477dd6c-81c5-11ed-8768-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxODc0MTQyLCJleHAiOjE2NzIwNDY5NDJ9.1XJzi_Cyi4hxaCa0U0hJDJVaFqQIeKGZ2so1VewjeaU','2022-12-22 06:54:44','2022-12-24 09:29:03','2023-01-21 06:54:45',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-22T06:54:50.063Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-23T10:22:22.419Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-23T10:27:06.586Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T08:54:31.413Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T08:54:54.552Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T08:55:22.808Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T08:55:58.602Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T09:19:04.225Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T09:26:57.478Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T09:28:42.074Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T09:29:02.679Z\"}]','2022-12-22 06:54:44','2022-12-24 09:29:02'),(120,'f90c03a3-8363-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcxODcwMDk3LCJleHAiOjE2NzQ0NjIwOTd9.zYzVp0D5PgeOZHM8MjTymZX1xPgLunik1Vn2PuN2lk8','2022-12-24 08:21:32','2022-12-24 08:21:38','2023-01-23 08:21:32',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T08:21:37.903Z\"}]','2022-12-24 08:21:32','2022-12-24 08:21:37'),(121,'1c30e4a3-8365-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcxODcwNTgyLCJleHAiOjE2NzQ0NjI1ODJ9.dESDPFsfWktVTvOfc3cDX4998J71KFfULAhoJqUGpUM','2022-12-24 08:29:40','2022-12-24 08:29:43','2023-01-23 08:29:41',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T08:29:42.999Z\"}]','2022-12-24 08:29:40','2022-12-24 08:29:43'),(122,'0b767a73-83a4-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTg5NzYxMCwiZXhwIjoxNjc0NDg5NjEwfQ.viJoFbvfgr53gg4T9UBvRNpuZneIUhPNJzF8mVglX6A','2022-12-24 16:00:10','2022-12-24 16:00:10','2023-01-23 16:00:11',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-24 16:00:10','2022-12-24 16:00:10'),(123,'204ce481-83a4-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxODk3OTA2LCJleHAiOjE2NzIwNzA3MDZ9.Qnb_Q5aDoTdTOU40-uywwlWz7bggFS4k4uNYB0CpWMk','2022-12-24 16:00:45','2022-12-24 16:18:32','2023-01-23 16:00:46',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T16:00:50.904Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T16:05:06.329Z\"}, {\"message\": \"User signout\"}]','2022-12-24 16:00:45','2022-12-24 16:18:32'),(124,'9e3684b8-83a6-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxOTA1MDI5LCJleHAiOjE2NzIwNzc4Mjl9.5kHgfw10in-NIgp_NFAORYrayF1PMdlcAUh1ovlJxoI','2022-12-24 16:18:36','2022-12-24 18:03:50','2022-12-25 16:18:36',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T16:18:43.267Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T16:20:34.542Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T16:21:44.398Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T18:03:38.512Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T18:03:49.831Z\"}]','2022-12-24 16:18:36','2022-12-24 18:03:49'),(125,'1931ab7e-83b6-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTkwNTM2NCwiZXhwIjoxNjc0NDk3MzY0fQ.8MZvN8-0vsKFDrpLrSNSYKsB6IMbJHceIrdbeNDmZ4k','2022-12-24 18:09:24','2022-12-24 18:09:24','2023-01-23 18:09:25',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-24 18:09:24','2022-12-24 18:09:24'),(126,'2f415994-83b6-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTkwNTQwMSwiZXhwIjoxNjc0NDk3NDAxfQ.Ti2Xd1ssQIQSY5jaUlGLAyK5SoOElWViFoZPtFkM-3Y','2022-12-24 18:10:01','2022-12-24 18:10:01','2023-01-23 18:10:02',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-24 18:10:01','2022-12-24 18:10:01'),(127,'cafd3edf-83b6-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTkwNTY2MywiZXhwIjoxNjc0NDk3NjYzfQ.ZqAEJIziAgJ3jwsvKlu15Hv0d8ZTdWvqI0wwDRXMgnw','2022-12-24 18:14:23','2022-12-24 18:14:23','2023-01-23 18:14:23',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-24 18:14:23','2022-12-24 18:14:23'),(128,'d34eadd1-83b6-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxOTA1Njc5LCJleHAiOjE2NzIwNzg0Nzl9.nYNrw9nJVTKehJitlLSJjPgY0T8fSW-mlX2v_Mtgc6Q','2022-12-24 18:14:37','2022-12-24 18:14:40','2023-01-23 18:14:37',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T18:14:39.952Z\"}]','2022-12-24 18:14:37','2022-12-24 18:14:40'),(129,'bb204fc3-83bc-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MTkwODIxMywiZXhwIjoxNjc0NTAwMjEzfQ.UAH7kZuDXprcjHmnZFNaMNedc31gFOjSyudFz3BubyM','2022-12-24 18:56:53','2022-12-24 18:56:53','2023-01-23 18:56:53',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-24 18:56:53','2022-12-24 18:56:53'),(130,'c293545f-83bc-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxOTA4MjMyLCJleHAiOjE2NzIwODEwMzJ9.sPy9SB6LzyLyTjTCmhEmgiuC10z3pPZXjmWmxjadHYQ','2022-12-24 18:57:05','2022-12-24 18:58:38','2023-01-23 18:57:06',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T18:57:12.225Z\"}, {\"message\": \"User signout\"}]','2022-12-24 18:57:05','2022-12-24 18:58:38'),(131,'fccf0a05-83bc-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoiIiwiaWF0IjoxNjcxOTY5ODM1LCJleHAiOjE2NzIxNDI2MzV9.lwt4QvK85WKoqcxAfNtYeygMaf4FruGad7zoMmNsoSU','2022-12-24 18:58:43','2022-12-25 12:03:55','2023-01-23 18:58:44',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T18:58:50.079Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:06:26.841Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:06:58.482Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:09:30.206Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:12:41.340Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:15:29.895Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:15:32.285Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:16:21.179Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:16:26.967Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:16:38.997Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:16:42.362Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:17:19.408Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:17:24.318Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:17:38.796Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:17:42.679Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:21:45.625Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:24:50.205Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:24:55.634Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:28:18.869Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-24T20:28:21.596Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:05:28.172Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:08:29.666Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:09:17.230Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:11:42.740Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:38:52.108Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:38:59.231Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:46:23.003Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:46:35.292Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:47:15.073Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:47:24.696Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:57:21.811Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T10:58:41.094Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:01:55.213Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:02:08.437Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:05:02.856Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:05:49.109Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:11:41.465Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:21:21.134Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T11:39:01.993Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T12:02:13.100Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T12:03:55.465Z\"}]','2022-12-24 18:58:43','2022-12-25 12:03:55'),(132,'3fb64ee5-8482-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcxOTkzODk3LCJleHAiOjE2NzIxNjY2OTd9.iHZD99HfKGxaiQcK2F-QTT1Qe8YHywmhHC578Xt5w50','2022-12-25 18:30:46','2022-12-25 18:44:57','2023-01-24 18:30:47',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:30:51.874Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:31:10.849Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:31:15.014Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:33:26.134Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:34:34.260Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:34:37.297Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:34:51.473Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:34:55.465Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:35:23.413Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:35:48.338Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:37:08.027Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:37:25.082Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:37:53.097Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:38:06.806Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:39:13.015Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:40:29.606Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:41:45.025Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:43:38.541Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:09.098Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:15.812Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.009Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.073Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.298Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.409Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.460Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.541Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.602Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.661Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.700Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.768Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.854Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.948Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:19.994Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.062Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.123Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.214Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.272Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.347Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.391Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.505Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.597Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.726Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.783Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.861Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.908Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:20.977Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:21.124Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:21.148Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:21.212Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:21.314Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:21.453Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:21.872Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:22.060Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:22.197Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:22.387Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:22.642Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:22.775Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:23.514Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:23.774Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:24.054Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:24.411Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:24.601Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:24.792Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:25.055Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:25.360Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:25.749Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:26.004Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:26.332Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:26.772Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:27.163Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:27.496Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:28.313Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:28.790Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:29.280Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:29.774Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:30.615Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.020Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.222Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.393Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.646Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.787Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.876Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:31.965Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.064Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.139Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.234Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.300Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.376Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.427Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.500Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.759Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.826Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:32.942Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.049Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.108Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.190Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.405Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.501Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.576Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.635Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.691Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.734Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.781Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.821Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.893Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:33.939Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.001Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.036Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.098Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.163Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.198Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.238Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.332Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.368Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.431Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.471Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.537Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.581Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.637Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.687Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.749Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.821Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.887Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.933Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:34.974Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.017Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.062Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.103Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.152Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.184Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.216Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.287Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.324Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.377Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.417Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.453Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.483Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.518Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.572Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.603Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.644Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.699Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.731Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.776Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.927Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.958Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:35.989Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.045Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.230Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.407Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.527Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.638Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.742Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.828Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.905Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:36.980Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.152Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.189Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.252Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.318Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.382Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.457Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.501Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.576Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.664Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.790Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.852Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:37.918Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.016Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.121Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.250Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.384Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.511Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.664Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:38.787Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:39.325Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:39.386Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:39.568Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:40.247Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:41.106Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:41.305Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:42.906Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:43.825Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:44.807Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:47.933Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:44:57.385Z\"}]','2022-12-25 18:30:46','2022-12-25 18:44:58'),(133,'42cfbd42-8484-11ed-9ad0-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMjM0NSwiZXhwIjoxNjcyMzg1MTQ1fQ.YQ6RKsG0K870XdXsu_kxvPOj1F4fcq5Psd6sUELUgcA','2022-12-25 18:45:10','2022-12-28 07:25:46','2023-01-24 18:45:11',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:45:17.124Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:45:50.993Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-25T18:46:18.303Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T16:03:46.967Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:14:09.784Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:14:51.090Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:15:05.831Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:15:18.641Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:15:43.466Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:16:11.881Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:20:23.914Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:26:56.192Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:31:09.351Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:35:29.986Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T18:50:34.923Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-27T19:05:06.167Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T05:46:46.028Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:06:07.728Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:08:10.143Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:11:07.115Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:15:59.795Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:18:34.373Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:19:54.925Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:22:58.973Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:24:24.910Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:25:01.094Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:25:11.282Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:25:28.751Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:25:38.376Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:25:45.584Z\"}]','2022-12-25 18:45:10','2022-12-28 07:25:45'),(134,'efbf14f8-8680-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMjM4NSwiZXhwIjoxNjcyMzg1MTg1fQ.362oHJB8BhpWVosGUY3Aro8Nf2hMBwTi3AguJlZopl8','2022-12-28 07:26:25','2022-12-28 07:26:25','2022-12-29 07:26:25',1,0,'localhost','::ffff:127.0.0.1','[{\"message\": \"Initiating session\"}]','2022-12-28 07:26:25','2022-12-28 07:26:25'),(135,'0060fd4a-8681-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMjQxMywiZXhwIjoxNjc0ODA0NDEzfQ.dRjebxYlyvuB1Hg1DBkDIoelN5DAyDSHYbpqTvBtxFI','2022-12-28 07:26:53','2022-12-28 07:26:53','2023-01-27 07:26:53',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 07:26:53','2022-12-28 07:26:53'),(136,'0320a0cb-8681-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMjQxNywiZXhwIjoxNjc0ODA0NDE3fQ.9SW33TuxFlvv45MKTUFpr03Pa0bC4zGVgaJrCeXzxP0','2022-12-28 07:26:57','2022-12-28 07:26:57','2023-01-27 07:26:58',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 07:26:57','2022-12-28 07:26:57'),(137,'13c7d810-8681-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMjQ1MSwiZXhwIjoxNjcyMzg1MjUxfQ.sCqvh5WOgmnFjV6UvXXiqa5szA7zOTYDEfEFr-E-qh8','2022-12-28 07:27:25','2022-12-28 07:27:32','2023-01-27 07:27:26',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:27:31.828Z\"}]','2022-12-28 07:27:25','2022-12-28 07:27:31'),(138,'20b06a05-8681-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMjQ3MywiZXhwIjoxNjcyMzg1MjczfQ.UqZD2ffTG3tLYcfwnSMUy2t_IERDN4kiKLdvXWvV2N0','2022-12-28 07:27:47','2022-12-28 07:27:53','2023-01-27 07:27:48',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:27:53.228Z\"}]','2022-12-28 07:27:47','2022-12-28 07:27:53'),(139,'ab5184d4-8682-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMzEyOSwiZXhwIjoxNjc0ODA1MTI5fQ.FPdCzO9Y_xq8_1g0WmK1RkIjqAPyGHuKCQThwXV5GE4','2022-12-28 07:38:49','2022-12-28 07:38:49','2023-01-27 07:38:50',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 07:38:49','2022-12-28 07:38:49'),(140,'f3b02fb4-8682-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIxMzI1MSwiZXhwIjoxNjc0ODA1MjUxfQ.IbD4FmrPLyKpnxyD_-dilaiCOeey8eafB6m0n258TbI','2022-12-28 07:40:51','2022-12-28 07:40:51','2023-01-27 07:40:51',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 07:40:51','2022-12-28 07:40:51'),(141,'318e2497-8683-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNDU4NywiZXhwIjoxNjcyMzk3Mzg3fQ.4EiZyaX4dJs03JLq85_UypP3GHSxUG3FOAAivehjsXc','2022-12-28 07:42:34','2022-12-28 10:49:47','2023-01-27 07:42:35',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:42:38.403Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T07:43:25.352Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:45:10.620Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:45:49.468Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:46:58.207Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:47:11.256Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:49:47.438Z\"}]','2022-12-28 07:42:34','2022-12-28 10:49:47'),(142,'92f8fcb6-869d-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNDY4OSwiZXhwIjoxNjcyMzk3NDg5fQ.AoXA5_fL0XahODdjkdowdcQPt9hUp43FUODG33B0h8c','2022-12-28 10:51:25','2022-12-28 10:51:30','2023-01-27 10:51:25',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:51:29.826Z\"}]','2022-12-28 10:51:25','2022-12-28 10:51:29'),(143,'ae2760b6-869d-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNDczNywiZXhwIjoxNjcyMzk3NTM3fQ.rkVIldK2_ODyRvXGvD8RIQqG-VzJ6gfoMzKTTSZ2Iro','2022-12-28 10:52:10','2022-12-28 10:52:17','2023-01-27 10:52:11',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T10:52:17.411Z\"}]','2022-12-28 10:52:10','2022-12-28 10:52:17'),(144,'946ab565-869e-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNTExNywiZXhwIjoxNjc0ODE3MTE3fQ.ZM6Em4bzHyw6beWGbyzztzGfPgK0friP8DFRuMv_ucs','2022-12-28 10:58:37','2022-12-28 10:58:37','2023-01-27 10:58:37',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 10:58:37','2022-12-28 10:58:37'),(145,'a7fcae34-869e-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNTE0OSwiZXhwIjoxNjc0ODE3MTQ5fQ.T8KEmh7MZjhG7kyeHi2aoUkHLchKRv_URC_17oJzPiQ','2022-12-28 10:59:09','2022-12-28 10:59:09','2023-01-27 10:59:10',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 10:59:09','2022-12-28 10:59:09'),(146,'d3b8fdc6-869e-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNTIyMywiZXhwIjoxNjc0ODE3MjIzfQ.dSz5zdyF0UyqwVDrPkWEwME6CixBKi2nTS9VxWbY7EY','2022-12-28 11:00:23','2022-12-28 11:00:23','2023-01-27 11:00:23',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 11:00:23','2022-12-28 11:00:23'),(147,'345d9fbb-869f-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNTM4NSwiZXhwIjoxNjc0ODE3Mzg1fQ.feOIv1sVqo6-aioNYjEDriWh-Io3aT2vWALZBhoF05E','2022-12-28 11:03:05','2022-12-28 11:03:05','2023-01-27 11:03:05',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 11:03:05','2022-12-28 11:03:05'),(148,'c34fcd1c-86a0-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNjEzNSwiZXhwIjoxNjcyMzk4OTM1fQ.PJsf916nSW8vhSN6rZy3Lvq1zin-ETwGBUl_FrMRi_o','2022-12-28 11:14:14','2022-12-28 11:15:35','2023-01-27 11:14:15',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T11:14:19.434Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T11:15:13.459Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T11:15:35.222Z\"}]','2022-12-28 11:14:14','2022-12-28 11:15:35'),(149,'0721e78b-86a1-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNjE2OCwiZXhwIjoxNjc0ODE4MTY4fQ.FZYVzphCstyvsXzmCpQEV-Tgh1-LaBjRlOYZzpiPrdM','2022-12-28 11:16:08','2022-12-28 11:16:08','2023-01-27 11:16:09',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 11:16:08','2022-12-28 11:16:08'),(150,'9676a9e6-86a1-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNjQwOSwiZXhwIjoxNjc0ODE4NDA5fQ.uPOV3QBZNeleFcMOxwEXtr00J_o0ofMJuvP2kQ5W0Gs','2022-12-28 11:20:09','2022-12-28 11:20:09','2023-01-27 11:20:09',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 11:20:09','2022-12-28 11:20:09'),(151,'a3fa6800-86a1-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIyNjQzMSwiZXhwIjoxNjc0ODE4NDMxfQ.gifvng9sGgXCybbY4a87UFNBp0fXLqqCTHy9S67WQSM','2022-12-28 11:20:31','2022-12-28 11:20:31','2023-01-27 11:20:32',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 11:20:31','2022-12-28 11:20:31'),(152,'399f7784-86b1-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzMzEyNSwiZXhwIjoxNjc0ODI1MTI1fQ.ayBI1iE0kmCT-_cksCbxhDw-juOr2uT1_C6RmSYXx-A','2022-12-28 13:12:05','2022-12-28 13:12:05','2023-01-27 13:12:05',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-28 13:12:05','2022-12-28 13:12:05'),(153,'9b748318-86b3-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzNDU2NCwiZXhwIjoxNjcyNDA3MzY0fQ.viGCy0OJYOoTb3c-bUBoEOv7aSXExm6Ax8sv-T7yBgU','2022-12-28 13:29:08','2022-12-28 13:36:04','2022-12-29 13:29:08',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:29:14.450Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:36:04.422Z\"}]','2022-12-28 13:29:08','2022-12-28 13:36:04'),(154,'b02c95fe-86b4-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzNDc0MywiZXhwIjoxNjcyNDA3NTQzfQ.VEMaCj9uawJmhmt7omNwBjG_PRa3vUkY1z_i-68BAYI','2022-12-28 13:36:52','2022-12-28 13:39:03','2023-01-27 13:36:53',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:37:57.575Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:38:21.639Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:39:02.414Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:39:03.313Z\"}]','2022-12-28 13:36:52','2022-12-28 13:39:03'),(155,'17980fcf-86b5-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzNDc5MSwiZXhwIjoxNjcyNDA3NTkxfQ.xfU8CPhzzj4sQLst5Q9ni3e5Zny-qEgfoRy5mx-FPgE','2022-12-28 13:39:46','2022-12-28 13:39:52','2022-12-29 13:39:46',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:39:51.644Z\"}]','2022-12-28 13:39:46','2022-12-28 13:39:51'),(156,'2f0bba29-86b5-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzNDgzNCwiZXhwIjoxNjcyNDA3NjM0fQ.S7jRdfHMtdoVuoGGyibHTeUsafD-SCSaKfhgcoF8ZL0','2022-12-28 13:40:25','2022-12-28 13:40:35','2023-01-27 13:40:25',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:40:34.769Z\"}]','2022-12-28 13:40:25','2022-12-28 13:40:34'),(157,'5e4a02f1-86b5-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzNDk4MiwiZXhwIjoxNjcyNDA3NzgyfQ.LwSikVtRqfvCZuYTTpwbXdbuORN7U9ctgwtHGVZ0q1U','2022-12-28 13:41:44','2022-12-28 13:43:02','2023-01-27 13:41:45',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:43:02.339Z\"}]','2022-12-28 13:41:44','2022-12-28 13:43:02'),(158,'b2387a41-86b5-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzODI2OSwiZXhwIjoxNjcyNDExMDY5fQ.-eb9IG7E6NfkKB16YUyhcfCHWJj18-V_bbZipaJVc4c','2022-12-28 13:44:05','2022-12-28 14:37:50','2023-01-27 13:44:06',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T13:44:08.773Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:31:45.594Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:32:15.021Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:37:49.996Z\"}]','2022-12-28 13:44:05','2022-12-28 14:37:50'),(159,'abd2e62f-86bd-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzODQ4MywiZXhwIjoxNjcyNDExMjgzfQ.n4Io9-CpyPhQAyfj1m4gws5Y7KZ366AYz5QDZbKpv0g','2022-12-28 14:41:10','2022-12-28 14:41:24','2023-01-27 14:41:11',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:41:23.601Z\"}]','2022-12-28 14:41:10','2022-12-28 14:41:23'),(160,'615f1e5c-86be-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjIzOTI5MCwiZXhwIjoxNjcyNDEyMDkwfQ.OgCUp3EB-aHFCKye1c3FkQx9DFqDPBUF-tq9vaQk8oI','2022-12-28 14:46:15','2022-12-28 14:54:51','2023-01-27 14:46:15',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:46:28.597Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:54:50.566Z\"}]','2022-12-28 14:46:15','2022-12-28 14:54:50'),(161,'a921d89f-86bf-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMjkxMzE4LCJleHAiOjE2NzI0NjQxMTh9.5CBByYXuJdcZdRowYVtXFWC4k2ddVqEzGXJw5eiEGgs','2022-12-28 14:55:25','2022-12-29 05:22:14','2023-01-27 14:55:25',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:55:47.752Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:57:54.387Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:58:29.059Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:58:40.768Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T14:59:15.031Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T15:32:22.265Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T15:44:06.531Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:07:58.428Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:08:24.467Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:09:33.008Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:09:41.367Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:10:18.218Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:20:09.224Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:27:27.487Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:43:08.483Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T16:50:45.484Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-28T17:27:36.793Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T04:14:20.502Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T05:00:16.664Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T05:12:17.516Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T05:21:29.424Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T05:21:58.604Z\"}, {\"message\": \"User signout\"}]','2022-12-28 14:55:25','2022-12-29 05:22:13'),(162,'cc0e67f1-8738-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNDI4NzYxLCJleHAiOjE2NzI2MDE1NjF9.BDRtn94JiYYtxN0CDQpT-O3QsR38aXyzU8SnuP0XjTI','2022-12-29 05:22:32','2022-12-30 19:32:42','2023-01-28 05:22:33',1,0,'192.168.1.8','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T05:22:35.431Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T16:53:22.050Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T17:57:12.866Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:53:01.776Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:06:29.032Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:20:29.432Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:22:03.817Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:52:16.692Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:08:42.662Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:17:13.738Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:37:28.495Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T19:16:13.512Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T19:31:11.437Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T19:32:41.809Z\"}]','2022-12-29 05:22:32','2022-12-30 19:32:41'),(163,'4db93c53-8739-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzAwNjkxLCJleHAiOjE2NzI0NzM0OTF9.Q4CURDzb9ZCxr-oOzJw01saeeXS35Omc68Tvf9SKN1Y','2022-12-29 05:26:10','2022-12-29 07:58:11','2022-12-30 05:26:10',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T05:26:13.434Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T07:49:45.738Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T07:57:17.638Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T07:58:11.396Z\"}]','2022-12-29 05:26:10','2022-12-29 07:58:11'),(164,'b436ec49-874f-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjMwMTE5MSwiZXhwIjoxNjc0ODkzMTkxfQ.WAPLTfEC7PQ7Q4jPFIokh4Ysh-HbOfCk1D5PGC-4uwg','2022-12-29 08:06:31','2022-12-29 08:06:31','2023-01-28 08:06:31',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}]','2022-12-29 08:06:31','2022-12-29 08:06:31'),(165,'dcd92a42-874f-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzAxMjY1LCJleHAiOjE2NzI0NzQwNjV9.MZe5mm_h1RwKALRgipKtW1tS1JzoG7sbg22pi5ipsfI','2022-12-29 08:07:39','2022-12-29 08:07:46','2023-01-28 08:07:40',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T08:07:45.880Z\"}]','2022-12-29 08:07:39','2022-12-29 08:07:45'),(166,'514dea10-8750-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzAxNDU4LCJleHAiOjE2NzI0NzQyNTh9.1wCLyzRmE4SdzjNs1VRzOqsWz0AqGd-bem130SmwIC8','2022-12-29 08:10:54','2022-12-29 08:10:58','2023-01-28 08:10:54',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T08:10:58.158Z\"}]','2022-12-29 08:10:54','2022-12-29 08:10:58'),(167,'a942c155-8751-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzAyMDM2LCJleHAiOjE2NzQ4OTQwMzZ9.ibkfKoE6mk7VOBroF31gVwpUcDAj6qs_ZYhg3B-RWvs','2022-12-29 08:20:32','2022-12-29 08:20:37','2023-01-28 08:20:32',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T08:20:36.572Z\"}]','2022-12-29 08:20:32','2022-12-29 08:20:36'),(168,'43ff9440-8753-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzAyNzI0LCJleHAiOjE2NzI0NzU1MjR9.qm0ZsV97yFtR02GwmacX1n3gG-c6Ed8B_w7WVfmQa3k','2022-12-29 08:32:01','2022-12-29 08:32:04','2023-01-28 08:32:01',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T08:32:04.475Z\"}]','2022-12-29 08:32:01','2022-12-29 08:32:04'),(169,'673bb8c8-8753-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzMwODMwLCJleHAiOjE2NzI1MDM2MzB9.8lYpxLYR_Fq42WRsFI_baMfxmQHr7ggi4hJ65FYVv8M','2022-12-29 08:33:00','2022-12-29 16:20:31','2023-01-28 08:33:00',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T08:33:04.004Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T10:06:41.590Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T13:53:47.999Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T16:15:18.529Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T16:20:30.745Z\"}]','2022-12-29 08:33:00','2022-12-29 16:20:30'),(170,'4d9ed9ea-8798-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyMzkxNDY4LCJleHAiOjE2NzI1NjQyNjh9.SFnUHaPy6CGjWnv4_LT669c2gZVla-lJNLAhiANHgX4','2022-12-29 16:46:12','2022-12-30 09:11:09','2023-01-28 16:46:13',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T16:46:16.551Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-29T17:09:03.620Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T09:11:08.566Z\"}]','2022-12-29 16:46:12','2022-12-30 09:11:08'),(171,'47b3ea39-8838-11ed-865d-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNDI4NTMzLCJleHAiOjE2NzI2MDEzMzN9.fhSVBQJ36HyosZgwdUBvAfqAu5sbJbtTsgIyOXojD0s','2022-12-30 11:51:22','2022-12-30 19:28:53','2023-01-29 11:51:22',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T11:51:34.169Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T11:52:56.786Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T12:03:59.299Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T15:53:24.841Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:15:25.782Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:18:52.952Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:19:14.047Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:20:20.491Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:20:34.773Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:26:52.768Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:27:26.702Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:29:52.229Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:30:24.494Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:39:26.256Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:49:36.005Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:49:48.352Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:50:29.038Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:51:43.544Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T16:52:00.881Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:01:01.325Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:11:01.401Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:12:47.548Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:13:16.902Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:13:37.847Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:14:34.684Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:14:59.656Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:15:20.743Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:15:43.315Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:16:36.277Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:17:46.182Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:58:58.258Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T17:59:16.347Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:01:30.748Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:06:15.213Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:12:51.911Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:16:58.742Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T18:37:14.204Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T19:01:17.698Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T19:11:33.482Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-30T19:28:53.219Z\"}]','2022-12-30 11:51:22','2022-12-30 19:28:53'),(172,'704a250d-88c0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNDU5NTY4LCJleHAiOjE2NzI2MzIzNjh9.LyWHZ8GWj4aD2yg7gLRNOz_KZzyF93NRrbgtqrPl67I','2022-12-31 04:06:01','2022-12-31 04:06:08','2023-01-30 04:06:01',1,0,'192.168.1.44','::ffff:192.168.1.44','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-31T04:06:08.336Z\"}]','2022-12-31 04:06:01','2022-12-31 04:06:08'),(173,'a87b9301-88c0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNDU5NjU4LCJleHAiOjE2NzI2MzI0NTh9.ogh1XGdqrPsZNir2JIdw35VP5z90wC45pitdiW7fgLA','2022-12-31 04:07:36','2022-12-31 04:07:39','2023-01-30 04:07:36',1,0,'192.168.1.44','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-31T04:07:38.647Z\"}]','2022-12-31 04:07:36','2022-12-31 04:07:38'),(174,'41c8a4bd-891c-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNDk5MTcwLCJleHAiOjE2NzI2NzE5NzB9.0kRTDvzUOI6o3Iq2ECiznJSIPiP1g-5SoSYF-wMsecI','2022-12-31 15:03:17','2022-12-31 15:06:11','2023-01-30 15:03:17',1,0,'192.168.1.45','::ffff:192.168.1.45','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2022-12-31T15:06:10.613Z\"}]','2022-12-31 15:03:17','2022-12-31 15:06:10'),(175,'3eddee85-891f-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjUwMDI4MCwiZXhwIjoxNjc1MDkyMjgwfQ.5tEe2s4BMBwGCtdyXUknxjB4nedxHqdsd_q6Pjuu-e0','2022-12-31 15:24:40','2022-12-31 15:24:40','2023-01-30 15:24:41',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-31 15:24:40','2022-12-31 15:24:40'),(176,'48455000-891f-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjUwMDI5NiwiZXhwIjoxNjc1MDkyMjk2fQ.bg28JJf7YdhjuTeqXvcd8vjhj2yKxr3Jo3xCXd5EXe0','2022-12-31 15:24:56','2022-12-31 15:24:56','2023-01-30 15:24:57',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-31 15:24:56','2022-12-31 15:24:56'),(177,'8c06ac8b-8921-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjUwMTI2OSwiZXhwIjoxNjc1MDkzMjY5fQ.8iJA5nxYtKKaF9JGg7zUPaqJKmLmbTPIgKErGkIrIww','2022-12-31 15:41:09','2022-12-31 15:41:09','2023-01-30 15:41:09',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-31 15:41:09','2022-12-31 15:41:09'),(178,'a4de7d35-8921-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjUwMTMxMSwiZXhwIjoxNjc1MDkzMzExfQ.oGodPoiq-s_VYmA7F2-wRIbO8-RYOlipV8cAZq2MB_I','2022-12-31 15:41:51','2022-12-31 15:41:51','2023-01-30 15:41:51',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-31 15:41:51','2022-12-31 15:41:51'),(179,'b4953f47-8921-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjUwMTMzNywiZXhwIjoxNjc1MDkzMzM3fQ.1GjQaUiRQzRjhP4kesO6SHD6UPBZf8Jf2kpQgVnUwSs','2022-12-31 15:42:17','2022-12-31 15:42:17','2023-01-30 15:42:17',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-31 15:42:17','2022-12-31 15:42:17'),(180,'df8fd32d-8921-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjUwMTQwOSwiZXhwIjoxNjc1MDkzNDA5fQ.1GUJ5zAJQTwGI7lnofjB38pUBB7JmbSaY_YBnPJ_rxE','2022-12-31 15:43:29','2022-12-31 15:43:29','2023-01-30 15:43:30',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2022-12-31 15:43:29','2022-12-31 15:43:29'),(181,'06014d7e-898e-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNTQ3ODY1LCJleHAiOjE2NzI3MjA2NjV9.XGJS5TLpdy6bLkSPaab_2at3mnihERSZcWdNnI_MVzQ','2023-01-01 04:37:39','2023-01-01 04:37:46','2023-01-31 04:37:40',1,0,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-01T04:37:45.773Z\"}]','2023-01-01 04:37:39','2023-01-01 04:37:45'),(182,'1b28ab54-898e-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNTQ3OTgyLCJleHAiOjE2NzI3MjA3ODJ9.TrwGMkUsc_CLvsmd2Zrqv4LbBtT5z0PTz-griLokW04','2023-01-01 04:38:15','2023-01-01 04:40:12','2023-01-31 04:38:15',1,1,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-01T04:38:44.042Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-01T04:39:42.504Z\"}, {\"message\": \"User signout\"}]','2023-01-01 04:38:15','2023-01-01 04:40:11'),(183,'62ff6fd1-898e-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNTQ4MDE5LCJleHAiOjE2NzI3MjA4MTl9.tXlCKhOp9BB3mk441Nh2O8WSeiVT0EOZ4q3_wh2gGPk','2023-01-01 04:40:15','2023-01-01 04:41:48','2023-01-31 04:40:16',1,1,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-01T04:40:19.977Z\"}, {\"message\": \"User signout\"}]','2023-01-01 04:40:15','2023-01-01 04:41:48'),(184,'9d73a510-898e-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNTQ4MTIxLCJleHAiOjE2NzI3MjA5MjF9.PHSQJxvwVv8z2OiiHsEHU_VmtEE9YCKvocGodKGA_7E','2023-01-01 04:41:53','2023-01-01 04:43:37','2023-01-31 04:41:54',1,1,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-01T04:42:01.123Z\"}, {\"message\": \"User signout\"}]','2023-01-01 04:41:53','2023-01-01 04:43:37'),(185,'dd711c2a-898e-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNTQ4MjI3LCJleHAiOjE2NzI3MjEwMjd9.v6ck8HdF2CJqsQVKhgqvwcm1CppPNusTo94RDKOVYkk','2023-01-01 04:43:41','2023-01-01 04:43:48','2023-01-31 04:43:41',1,0,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-01T04:43:47.961Z\"}]','2023-01-01 04:43:41','2023-01-01 04:43:47'),(186,'bf7ca93d-8adc-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MTYyMiwiZXhwIjoxNjc1MjgzNjIyfQ.oFP0dwEPl3IBndJV-me0I-pQ0POYT822XTvyqfbkdAg','2023-01-02 20:33:42','2023-01-02 20:33:42','2023-02-01 20:33:43',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 20:33:42','2023-01-02 20:33:42'),(187,'08d7f6a9-8add-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MTc0NSwiZXhwIjoxNjc1MjgzNzQ1fQ.YIPSzv0JybrEURkigON2YU2OANixKVbAXidmeLPZ2wM','2023-01-02 20:35:45','2023-01-02 20:35:45','2023-02-01 20:35:46',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 20:35:45','2023-01-02 20:35:45'),(188,'179a1989-8add-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNjkxODg2LCJleHAiOjE2NzI4NjQ2ODZ9.pEZrk3k57CB8Cy1vo4djIq99OFlUeO0bng0AFqUxpAY','2023-01-02 20:36:10','2023-01-02 20:38:06','2023-02-01 20:36:11',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-02T20:38:06.277Z\"}]','2023-01-02 20:36:10','2023-01-02 20:38:06'),(189,'a598001d-8add-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNjkyMDE1LCJleHAiOjE2NzI4NjQ4MTV9.wMjb31l5nWlWLOIJHoK9md70mnjHwOVqg9GJZog3-y8','2023-01-02 20:40:08','2023-01-02 20:40:16','2023-02-01 20:40:09',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-02T20:40:15.933Z\"}]','2023-01-02 20:40:08','2023-01-02 20:40:15'),(190,'e3b96cc6-8add-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MjExMywiZXhwIjoxNjc1Mjg0MTEzfQ.Vo1dIB7WDxMF4xBQADrSIEpovIBdoyWs_8KMKDMUuqY','2023-01-02 20:41:53','2023-01-02 20:45:14','2023-02-01 20:41:53',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-01-02 20:41:53','2023-01-02 20:45:14'),(191,'5d65d76a-8ade-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyOTE1NzQ3LCJleHAiOjE2NzMwODg1NDd9.8wC4c_D7KUNJQ6T7OW_C_74bWyk6b8e6UF6HDNmri5A','2023-01-02 20:45:17','2023-01-05 10:49:07','2023-02-01 20:45:17',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-02T20:45:23.649Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T12:39:08.329Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T13:04:27.777Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T13:59:37.454Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T14:00:06.015Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T15:41:28.902Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T15:55:21.854Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T15:55:34.256Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T17:48:26.326Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T10:55:14.613Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T11:24:01.905Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T11:28:26.023Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T11:36:40.153Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T13:21:00.614Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T16:16:04.095Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T16:16:51.554Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-04T16:18:53.853Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-05T10:49:07.207Z\"}]','2023-01-02 20:45:17','2023-01-05 10:49:07'),(192,'17c21273-8ae0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MzA1OSwiZXhwIjoxNjc1Mjg1MDU5fQ.VMPLQLxpqHG3hWNYktEHcc0duV5HWFCh4N9ufHR--YU','2023-01-02 20:57:39','2023-01-02 20:57:39','2023-02-01 20:57:39',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 20:57:39','2023-01-02 20:57:39'),(193,'887f7848-8ae0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MzI0OCwiZXhwIjoxNjc1Mjg1MjQ4fQ.9moKwxCptRdu-qcVDE3GIo7q-0tka0mB6-rZ-ddAvIg','2023-01-02 21:00:48','2023-01-02 21:00:48','2023-02-01 21:00:48',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 21:00:48','2023-01-02 21:00:48'),(194,'8995aacd-8ae0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MzI1MCwiZXhwIjoxNjc1Mjg1MjUwfQ.fp8oUTCEGmSiDZHSCbHigvo-5qlx_mgYDa1I0mNdpCI','2023-01-02 21:00:50','2023-01-02 21:00:50','2023-02-01 21:00:50',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 21:00:50','2023-01-02 21:00:50'),(195,'9ffed286-8ae0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MzI4NywiZXhwIjoxNjc1Mjg1Mjg3fQ.ANQx8djqFF_8Navmsz3FJElcjsNpF6PB9CNhtfv5WS4','2023-01-02 21:01:27','2023-01-02 21:01:27','2023-02-01 21:01:28',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 21:01:27','2023-01-02 21:01:27'),(196,'bdf1d059-8ae0-11ed-b3d4-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjY5MzMzOCwiZXhwIjoxNjc1Mjg1MzM4fQ.Fqpy7Jz3uW4p14Z5teBFax2u8Ebe0fQy8tgb7YijYy8','2023-01-02 21:02:18','2023-01-02 21:02:18','2023-02-01 21:02:18',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-02 21:02:18','2023-01-02 21:02:18'),(197,'f9eba048-8b63-11ed-936e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjcyNzQ5NzA0LCJleHAiOjE2NzI5MjI1MDR9.kS9kBw2HCxQpvRa9m6WpQUrI0EhiIeyC4V1TK8cbRYg','2023-01-03 12:41:42','2023-01-03 12:41:45','2023-02-02 12:41:43',1,0,'192.168.1.8','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-03T12:41:44.913Z\"}]','2023-01-03 12:41:42','2023-01-03 12:41:44'),(198,'df0d2a37-8c1d-11ed-936e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3MjgyOTU0NCwiZXhwIjoxNjc1NDIxNTQ0fQ.gX8ZgdkwYcxjen6kn7T-7AlrdsRNDESfYDCRMFMnSNA','2023-01-04 10:52:24','2023-01-04 10:52:24','2023-02-03 10:52:24',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-01-04 10:52:24','2023-01-04 10:52:24'),(199,'f8024d9b-997d-11ed-b985-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NDMwMDE4MiwiZXhwIjoxNjc2ODkyMTgyfQ.quFwDlTYZXO1PCxPDPu6ldubw2GEsVmLKvwT36leb2I','2023-01-21 11:23:02','2023-01-21 11:23:02','2023-02-20 11:23:03',1,0,'192.168.1.50','::ffff:192.168.1.50','[{\"message\": \"Initiating session\"}]','2023-01-21 11:23:02','2023-01-21 11:23:02'),(200,'09790c56-997e-11ed-b985-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjc0MzAwMjE1LCJleHAiOjE2NzQ0NzMwMTV9.BvfT7FQITGEgnV97UlgG7IQW1uk8VI7eg8O1Tj46HKs','2023-01-21 11:23:32','2023-01-21 11:23:35','2023-02-20 11:23:32',1,0,'192.168.1.50','::ffff:192.168.1.50','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-21T11:23:35.288Z\"}]','2023-01-21 11:23:32','2023-01-21 11:23:35'),(201,'2d33dddf-9a20-11ed-9ecd-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjc0MzcwMzUwLCJleHAiOjE2NzQ1NDMxNTB9.kDtumSdmdoz8-De7sp2Hqq_1tguQDvcVc7mDxqgAtFg','2023-01-22 06:44:10','2023-01-22 06:52:30','2023-02-21 06:44:11',1,0,'192.168.1.63','::ffff:192.168.1.63','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-22T06:44:13.196Z\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-22T06:52:30.351Z\"}]','2023-01-22 06:44:10','2023-01-22 06:52:30'),(202,'e5b6927a-9c03-11ed-9658-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NDU3NzYwNiwiZXhwIjoxNjc3MTY5NjA2fQ.F_hojHSY7fSjSwpqqgZzJIwPp4XHc5OTCjEOmMD_QBE','2023-01-24 16:26:47','2023-01-24 16:26:47','2023-02-23 16:26:47',1,0,'192.168.93.74','::ffff:192.168.93.74','[{\"message\": \"Initiating session\"}]','2023-01-24 16:26:47','2023-01-24 16:26:47'),(203,'f719bd4b-9c03-11ed-9658-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjgsInJlc0lkIjo5MCwidG9rZW5fdHlwZSI6ImVtcCIsImJyIjoxNiwiaWF0IjoxNjc0NTc3NjM5LCJleHAiOjE2NzQ3NTA0Mzl9.89hUyCyZ1i346wzR_Ggxz3GWyd5AQVHESjUBEwwPsos','2023-01-24 16:27:16','2023-01-24 16:27:19','2023-02-23 16:27:16',1,0,'192.168.93.74','::ffff:192.168.93.74','[{\"message\": \"Initiating session\"}, {\"message\": \"Refreshed Branch id in token to change branch\", \"timestamp\": \"2023-01-24T16:27:19.436Z\"}]','2023-01-24 16:27:16','2023-01-24 16:27:19');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_sessions_BEFORE_INSERT` BEFORE INSERT ON `user_sessions` FOR EACH ROW BEGIN

SET NEW.uss_session_id = uuid();

IF (NEW.uss_token_valid_till is null) THEN 
	SET NEW.uss_token_valid_till = TIMESTAMP(CURRENT_TIMESTAMP, '24:00:00') ;
END IF;

IF (NEW.uss_session_details is null) THEN 
	SET NEW.uss_session_details = '[{"message": "Initiating session"}]';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'mk2s_hotel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-26 10:47:38
