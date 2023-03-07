-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: mk2s_fms
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Current Database: `mk2s_fms`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `mk2s_fms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `mk2s_fms`;

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
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
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
INSERT INTO `country` VALUES ('Argentina'),('Australia'),('Brazil'),('Canada'),('Chile'),('China'),('Egypt'),('France'),('Germany'),('Green Land'),('Hong Kong'),('IceLand'),('India'),('Indonesia'),('Ireland'),('Italy'),('Japan'),('Mexico'),('Morrocco'),('Netherlands'),('Nigeria'),('Paraguay'),('Poland'),('Portugal'),('Qatar'),('Russia'),('Spain'),('Turkey'),('Uganda'),('Ukraine'),('United Arab Emirites'),('United Kingdom'),('United States Of America'),('Uruguay');
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
INSERT INTO `currency_codes` VALUES ('INR','India');
/*!40000 ALTER TABLE `currency_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ledgers`
--

DROP TABLE IF EXISTS `ledgers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ledgers` (
  `led_id` int unsigned NOT NULL AUTO_INCREMENT,
  `led_user_id` int unsigned NOT NULL,
  `led_name` varchar(100) NOT NULL,
  `led_details` varchar(250) NOT NULL,
  `led_purpose` varchar(500) NOT NULL,
  `led_categories` json DEFAULT NULL,
  `led_status` tinyint NOT NULL DEFAULT '1',
  `led_total_debits` decimal(20,2) NOT NULL DEFAULT '0.00',
  `led_total_credits` decimal(20,2) NOT NULL DEFAULT '0.00',
  `led_is_deleted` tinyint NOT NULL DEFAULT '0',
  `led_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `led_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`led_id`),
  KEY `FK_LED_USER_idx` (`led_user_id`),
  CONSTRAINT `FK_LED_USER` FOREIGN KEY (`led_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ledgers`
--

LOCK TABLES `ledgers` WRITE;
/*!40000 ALTER TABLE `ledgers` DISABLE KEYS */;
INSERT INTO `ledgers` VALUES (1,8,'Testing','Testing transaction','Testing transaction','[\"Mobile\"]',1,0.00,0.00,0,'2023-02-15 06:46:29','2023-02-15 06:46:29'),(2,8,'Testing','Testing transaction','Testing transaction','[\"Mobile\"]',1,0.00,0.00,0,'2023-02-15 07:22:49','2023-02-15 07:22:49');
/*!40000 ALTER TABLE `ledgers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lendings`
--

DROP TABLE IF EXISTS `lendings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lendings` (
  `lend_id` int unsigned NOT NULL AUTO_INCREMENT,
  `lend_user_id` int unsigned NOT NULL,
  `lend_ledger_id` int unsigned DEFAULT NULL,
  `lend_purpose` text NOT NULL,
  `lend_details` text NOT NULL,
  `lend_category` varchar(50) NOT NULL,
  `lend_to_name` varchar(100) NOT NULL,
  `lend_to_email` varchar(120) DEFAULT NULL,
  `lend_to_phone` varchar(20) DEFAULT NULL,
  `lend_currency` varchar(50) NOT NULL,
  `lend_amount` decimal(20,2) NOT NULL,
  `lend_on_date` date NOT NULL,
  `lend_is_borrowed` tinyint NOT NULL,
  `lend_is_settled` tinyint NOT NULL DEFAULT '0',
  `lend_is_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lend_is_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `lend_notifications` tinyint NOT NULL DEFAULT '0',
  `lend_is_deleted` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`lend_id`),
  KEY `FK_LEND_USER_idx` (`lend_user_id`),
  KEY `FK_LEND_USER_TRANSACTION_idx` (`lend_user_id`),
  KEY `FK_LEND_LEDGER` (`lend_ledger_id`),
  CONSTRAINT `FK_LEND_LEDGER` FOREIGN KEY (`lend_ledger_id`) REFERENCES `ledgers` (`led_id`),
  CONSTRAINT `FK_LEND_USER` FOREIGN KEY (`lend_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `FK_LEND_USER_TRANSACTION` FOREIGN KEY (`lend_user_id`) REFERENCES `transactions` (`trans_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lendings`
--

LOCK TABLES `lendings` WRITE;
/*!40000 ALTER TABLE `lendings` DISABLE KEYS */;
INSERT INTO `lendings` VALUES (4,8,NULL,'Testing lends','Ledning details','Mobile','Lender/Lendee Name','sivakusi.12@gmail.com','+918106302821','INR',1000.00,'2023-02-14',1,0,'2023-02-16 13:25:12','2023-02-16 13:25:12',0,0);
/*!40000 ALTER TABLE `lendings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `module_id` int unsigned NOT NULL AUTO_INCREMENT,
  `module_user_id` int unsigned DEFAULT NULL,
  `module_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_description` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_sort_order` int NOT NULL,
  `module_icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_route` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_is_sub_module` tinyint NOT NULL,
  `module_parent_module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_access_role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_access_perm_level` tinyint NOT NULL,
  `module_require_auth` tinyint NOT NULL DEFAULT '0',
  `module_is_basic` tinyint NOT NULL DEFAULT '1',
  `module_is_pro` tinyint NOT NULL DEFAULT '0',
  `module_is_custom` tinyint NOT NULL DEFAULT '0',
  `module_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `module_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `module_updated_by_id` int unsigned DEFAULT NULL,
  `module_updated_by_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`module_id`),
  KEY `MODULE_USER_FK_idx` (`module_user_id`),
  CONSTRAINT `MODULE_USER_FK` FOREIGN KEY (`module_user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (50,NULL,'MODHME','HOME','Home','Application Home',0,NULL,'/home',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(51,NULL,'MODREG','REGISTRATION','REGISTER','USER REGISTRATION',1,NULL,'/register',0,'1','user',1,0,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(52,NULL,'MODSIG','SIGNIN','SIGN-IN','USER LOGIN',2,NULL,'/signin',0,'1','user',1,0,1,0,0,'2023-02-05 06:05:39','2023-02-05 12:59:46',NULL,NULL,1),(53,NULL,'MODTRN','TRANSACTIONS','TRANSACTIONS','USER TRANSACTIONS',4,NULL,'/transactions',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(54,NULL,'MODLED','LEDGERS','LEDGERS','USER LEDGERS',5,NULL,'/ledgers',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(55,NULL,'MODDBD','DASHBOARD','DASHBOARD','USER DASHBOARD',3,NULL,'/dashboard',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(56,NULL,'MODLGT','SIGNOUT','SIGNOUT','SIGN OUT',999,NULL,'/signout',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(57,NULL,'MODPRF','PROFILE','PROFILE','USER PROFILE',6,NULL,'/profile',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(58,NULL,'MODPYM','PAYMENT METHODS','PAYMENT METHODS','PAYMENT METHODS',4,NULL,'/payment-methods',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1),(59,NULL,'MODLEN','LENDINGS','LENDINGS','LENDINGS',5,NULL,'/lendings',0,'1','user',1,1,1,0,0,'2023-02-05 06:05:39','2023-02-05 06:16:58',NULL,NULL,1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `pm_id` int unsigned NOT NULL AUTO_INCREMENT,
  `pm_user_id` int unsigned NOT NULL,
  `pm_type` enum('CREDIT CARD','DEBIT CARD','BANK ACCOUNT','WALLET','GROCERY CARD','FOOD CARD') NOT NULL,
  `pm_name` varchar(50) NOT NULL,
  `pm_last_4_digits` varchar(4) NOT NULL,
  `pm_is_deleted` tinyint NOT NULL DEFAULT '0',
  `pm_created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pm_updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pm_is_active` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`pm_id`),
  KEY `FK_PM_USER_idx` (`pm_user_id`),
  CONSTRAINT `FK_PM_USER` FOREIGN KEY (`pm_user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,8,'CREDIT CARD','HDFC','7432',0,'2023-02-26 09:27:57','2023-02-27 18:46:23',1),(2,8,'CREDIT CARD','AMEX','1005',0,'2023-02-26 09:27:58','2023-02-27 18:48:20',1),(3,12,'DEBIT CARD','test','test',0,'2023-02-26 17:15:06','2023-02-26 17:15:06',1),(4,12,'DEBIT CARD','test','test',0,'2023-02-26 17:15:06','2023-02-26 17:15:06',1),(5,12,'CREDIT CARD','testinmg','wfv2',0,'2023-02-26 17:15:31','2023-02-26 17:15:31',1),(6,12,'CREDIT CARD','testinmg','wfv2',0,'2023-02-26 17:15:31','2023-02-26 17:15:31',1),(7,12,'WALLET','3werv','ervf',0,'2023-02-26 17:15:50','2023-02-26 17:15:50',1),(8,12,'WALLET','3werv','ervf',0,'2023-02-26 17:15:50','2023-02-26 17:15:50',1),(9,12,'DEBIT CARD','werv','1234',0,'2023-02-26 17:16:57','2023-02-26 17:16:57',1),(10,8,'CREDIT CARD','SBI','7149',0,'2023-02-27 18:49:58','2023-02-27 19:05:05',1),(11,8,'CREDIT CARD','ICICI','9005',0,'2023-02-27 20:09:16','2023-02-27 20:09:16',1),(12,8,'CREDIT CARD','ICICI','5002',0,'2023-02-27 20:09:35','2023-02-27 20:09:35',1);
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_categories`
--

DROP TABLE IF EXISTS `transaction_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_categories` (
  `trans_category` varchar(100) NOT NULL,
  PRIMARY KEY (`trans_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_categories`
--

LOCK TABLES `transaction_categories` WRITE;
/*!40000 ALTER TABLE `transaction_categories` DISABLE KEYS */;
INSERT INTO `transaction_categories` VALUES ('Alcohol'),('Education'),('Emergency Funds'),('Entertainment'),('Food'),('Furniture'),('Gaming'),('Gifts'),('Groceries'),('Insurance'),('Internet'),('Investments-ELSS'),('Investments-MF'),('Investments-Savings'),('Investments-Stocks'),('Lending'),('Loans'),('Medical/Health Care'),('Misc'),('Mobile'),('Parties'),('Personal'),('Pharma'),('Shopping'),('Subscriptions'),('Transportation'),('Travel'),('Utilities'),('Vacations');
/*!40000 ALTER TABLE `transaction_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_modes`
--

DROP TABLE IF EXISTS `transaction_modes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_modes` (
  `transaction_mode` varchar(50) NOT NULL,
  PRIMARY KEY (`transaction_mode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_modes`
--

LOCK TABLES `transaction_modes` WRITE;
/*!40000 ALTER TABLE `transaction_modes` DISABLE KEYS */;
INSERT INTO `transaction_modes` VALUES ('CASH'),('CHEQUE'),('CREDIT CARD'),('DEBIT CARD'),('IMPS'),('NEFT'),('ONLINE'),('RTGS'),('UPI'),('WALLETS'),('WIRE-TRANSFER');
/*!40000 ALTER TABLE `transaction_modes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `trans_id` int unsigned NOT NULL AUTO_INCREMENT,
  `trans_user_id` int unsigned NOT NULL,
  `trans_ledger_id` int unsigned DEFAULT NULL,
  `trans_lending_id` int unsigned DEFAULT NULL,
  `trans_parent_trans_id` int unsigned DEFAULT NULL,
  `trans_purpose` varchar(500) NOT NULL,
  `trans_description` text NOT NULL,
  `trans_category` varchar(50) NOT NULL,
  `trans_currency_code` varchar(50) NOT NULL,
  `trans_type` enum('CREDIT','DEBIT','CASHBACK','IN-VALID','REFUND') NOT NULL,
  `trans_value` decimal(20,3) NOT NULL,
  `trans_mode` varchar(50) NOT NULL,
  `trans_payment_method` int unsigned DEFAULT NULL,
  `trans_ref_number` varchar(100) NOT NULL,
  `trans_made_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_is_deleted` tinyint NOT NULL DEFAULT '0',
  `trans_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trans_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trans_updated` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`trans_id`),
  KEY `FK_TRANSACTION_LEDGERS_idx` (`trans_ledger_id`),
  KEY `FK_TRANS_USER_idx` (`trans_user_id`),
  KEY `FK_TRANS_CURRENCY_CODE_idx` (`trans_currency_code`),
  KEY `FK_TRANS_MODE_idx` (`trans_mode`),
  KEY `FK_TRANS_PARENT_TRANSACTIONS_idx` (`trans_parent_trans_id`),
  KEY `FK_TRANS_CATEGORY_idx` (`trans_category`),
  KEY `FK_LENDING_TRANS_idx` (`trans_lending_id`,`trans_user_id`),
  KEY `FK_TRANS_PAYMENT_METHOD_idx` (`trans_payment_method`),
  CONSTRAINT `FK_LENDING_TRANS_LINK` FOREIGN KEY (`trans_lending_id`) REFERENCES `lendings` (`lend_id`),
  CONSTRAINT `FK_TRANS_CATEGORY` FOREIGN KEY (`trans_category`) REFERENCES `transaction_categories` (`trans_category`),
  CONSTRAINT `FK_TRANS_CURRENCY_CODE` FOREIGN KEY (`trans_currency_code`) REFERENCES `currency_codes` (`cc_code`),
  CONSTRAINT `FK_TRANS_MODE` FOREIGN KEY (`trans_mode`) REFERENCES `transaction_modes` (`transaction_mode`),
  CONSTRAINT `FK_TRANS_PARENT_TRANSACTIONS` FOREIGN KEY (`trans_parent_trans_id`) REFERENCES `transactions` (`trans_id`),
  CONSTRAINT `FK_TRANS_USER` FOREIGN KEY (`trans_user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `FK_TRANSACTION_LEDGERS` FOREIGN KEY (`trans_ledger_id`) REFERENCES `ledgers` (`led_id`),
  CONSTRAINT `FK_TRANSACTION_PAYMENT_METHOD` FOREIGN KEY (`trans_payment_method`) REFERENCES `payment_methods` (`pm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,8,NULL,NULL,NULL,'Testing transaction','Testing transaction','Mobile','INR','CREDIT',1000.000,'UPI',NULL,'','2023-02-14 00:00:00',0,'2023-02-13 19:39:49','2023-02-23 10:00:21',0),(2,8,NULL,NULL,NULL,'Testing transaction','Testing transaction','Mobile','INR','CREDIT',1000.000,'UPI',NULL,'','2023-02-14 00:00:00',0,'2023-02-13 19:40:21','2023-02-23 10:00:21',0),(3,8,1,NULL,NULL,'Testing transaction','Testing transaction','Mobile','INR','DEBIT',1000.000,'UPI',NULL,'','2023-02-14 00:00:00',0,'2023-02-15 18:50:11','2023-02-23 10:00:21',0),(6,8,NULL,4,NULL,'Testing lends','Ledning details','Mobile','INR','CREDIT',1000.000,'UPI',NULL,'','2023-02-14 00:00:00',0,'2023-02-16 13:25:13','2023-02-23 10:00:21',0),(7,8,NULL,4,NULL,'Testing transaction','Testing transaction','Mobile','INR','DEBIT',1000.000,'UPI',NULL,'','2023-02-14 00:00:00',0,'2023-02-16 13:30:36','2023-02-23 10:00:21',0);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_sessions`
--

LOCK TABLES `user_sessions` WRITE;
/*!40000 ALTER TABLE `user_sessions` DISABLE KEYS */;
INSERT INTO `user_sessions` VALUES (206,'7e8e77a1-a33d-11ed-a5f7-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTM3MjAwMiwiZXhwIjoxNjc1NTQ0ODAyfQ.SNgtyxapk7Kyas6Tcmw6DbwsYA0dZxnc2V_UxvDH7dU','2023-02-02 21:06:42','2023-02-02 21:06:42','2023-03-01 21:06:43',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-02 21:06:42','2023-02-02 21:06:42'),(207,'d3b102ca-a535-11ed-8f28-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU4ODYxMSwiZXhwIjoxNjc1NzYxNDExfQ.I595i4ueQJzZNwzojSpcFRWLoeGP9rOT5PW30m4xFBk','2023-02-05 09:16:52','2023-02-05 09:16:52','2023-03-02 09:16:52',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 09:16:52','2023-02-05 09:16:52'),(208,'1e213e91-a536-11ed-8f28-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU4ODczNywiZXhwIjoxNjc1NzYxNTM3fQ.Q5Q3fR8m3aHGZqI8Ix5Z54lJxK9GTPFFnpfVfcInXQo','2023-02-05 09:18:57','2023-02-05 09:18:57','2023-03-02 09:18:57',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 09:18:57','2023-02-05 09:18:57'),(209,'26783060-a536-11ed-8f28-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU4ODc1MSwiZXhwIjoxNjc1NzYxNTUxfQ.vbwilFg0vIck9EFN6CgNatjBzFzvB68EDNgOOqk1xx8','2023-02-05 09:19:11','2023-02-05 09:19:11','2023-03-02 09:19:11',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 09:19:11','2023-02-05 09:19:11'),(210,'35d15623-a536-11ed-8f28-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU4ODc3NiwiZXhwIjoxNjc1NzYxNTc2fQ.YCWZEYUj-yZbuvwrsbgpfbB_fwHg2yQaWSM8S94fhiw','2023-02-05 09:19:36','2023-02-05 09:19:36','2023-03-02 09:19:37',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 09:19:36','2023-02-05 09:19:36'),(211,'962d2c49-a544-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU5NDk1MSwiZXhwIjoxNjc4MTg2OTUxfQ.sYwAQuCC6Sguih3PEdKHcCAPDy8C3_9F-Y9fvrJR4BM','2023-02-05 11:02:31','2023-02-05 11:02:31','2023-03-02 11:02:31',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 11:02:31','2023-02-05 11:02:31'),(212,'3a3f9032-a54f-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU5OTUyMSwiZXhwIjoxNjc4MTkxNTIxfQ.UyBgxvQR5pQN_ks9XuteWpEK-Tu-kbBnZfbjWD_kX4Y','2023-02-05 12:18:41','2023-02-05 12:18:41','2023-03-02 12:18:42',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 12:18:41','2023-02-05 12:18:41'),(213,'379aab22-a550-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTU5OTk0NiwiZXhwIjoxNjc4MTkxOTQ2fQ.oHVy6BtjgpOd_db60VyQapYFSXd2SjJY49oWNJ5GKuo','2023-02-05 12:25:46','2023-02-05 12:25:46','2023-03-02 12:25:47',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 12:25:46','2023-02-05 12:25:46'),(214,'1c4f66c4-a555-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTYwMjA0OCwiZXhwIjoxNjc1Nzc0ODQ4fQ.qQjAH9zRaEw81bGUST1Q2KD1Z4xS2BTVX-4Uo4oYVgA','2023-02-05 13:00:48','2023-02-05 13:00:48','2023-03-02 13:00:48',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 13:00:48','2023-02-05 13:00:48'),(215,'2c912f30-a555-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTYwMjA3NSwiZXhwIjoxNjc4MTk0MDc1fQ.qFCQfx54ZBXsUMUzx_v3EGOVigACnpB6C3ht1YwXMf0','2023-02-05 13:01:15','2023-02-05 13:01:15','2023-03-02 13:01:16',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 13:01:15','2023-02-05 13:01:15'),(216,'5bd6752c-a555-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTYwMjE1NCwiZXhwIjoxNjc4MTk0MTU0fQ.c-IRpd8ywhNAX0BwyqDKTCPQCk_b5Qif6moPItuvzso','2023-02-05 13:02:34','2023-02-05 13:02:34','2023-03-02 13:02:35',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-05 13:02:34','2023-02-05 13:02:34'),(217,'4f9318a7-a6ad-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTc0OTg4MSwiZXhwIjoxNjc4MzQxODgxfQ.dSWdIHlR-XroB_3AnvYCmZfqJWusXmSdgQT1a59wKoM','2023-02-07 06:04:41','2023-02-08 10:45:47','2023-03-02 06:04:41',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-07 06:04:41','2023-02-08 10:45:47'),(218,'c5cc5891-a781-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTg0MTEzMiwiZXhwIjoxNjc2MDEzOTMyfQ.8l_V_HYdbeFniDIO3XHTWrWVrm-Jg7FciyWv26l_css','2023-02-08 07:25:32','2023-02-08 07:25:32','2023-03-02 07:25:33',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-08 07:25:32','2023-02-08 07:25:32'),(219,'c8db7c83-a79d-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTg1MzE2MywiZXhwIjoxNjc4NDQ1MTYzfQ.o3J9Nu_gHONfLE8PGfllBi6BB5zuf9USG-M6znc8JBE','2023-02-08 10:46:03','2023-02-08 10:46:20','2023-03-02 10:46:04',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-08 10:46:03','2023-02-08 10:46:19'),(220,'e7a3a40e-a79d-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTg1MzIxNSwiZXhwIjoxNjc4NDQ1MjE1fQ.xVgDX1v2H5ugcArf3YxVrhKIZW_lHQ8vX1iKUNkI9fo','2023-02-08 10:46:55','2023-02-08 10:47:01','2023-03-02 10:46:56',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-08 10:46:55','2023-02-08 10:47:00'),(221,'d76297f3-a7bc-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTg2NjUwMiwiZXhwIjoxNjc4NDU4NTAyfQ.R2LnazCO3DJTaGczvNzmzaJQLcA_fiLLQ8zLf9jriE8','2023-02-08 14:28:22','2023-02-08 14:32:47','2023-03-02 14:28:23',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-08 14:28:22','2023-02-08 14:32:46'),(222,'784599ce-a7bd-11ed-bfe6-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NTg2Njc3MiwiZXhwIjoxNjc4NDU4NzcyfQ.WBEfThi0Ucb9Mdw8ZwWcAFUXbZe06TOvmUOxI6FnDJo','2023-02-08 14:32:52','2023-02-08 14:32:52','2023-03-02 14:32:53',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-08 14:32:52','2023-02-08 14:32:52'),(223,'ce9c8998-abd4-11ed-ba72-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjMxNjU5OCwiZXhwIjoxNjc2NDg5Mzk4fQ.nTYMCs7XcwddSl1Ex66-owUk-nOh0XAqnGy3Kmw2jBM','2023-02-13 19:29:58','2023-02-13 19:29:58','2023-03-01 19:29:58',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-13 19:29:58','2023-02-13 19:29:58'),(224,'6a7fadb2-abd8-11ed-ba72-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjMxODE1MCwiZXhwIjoxNjc4OTEwMTUwfQ.Gh_e49z9fZqoNBuRH4w_uriQWND71VpPWGGnv5YNaXM','2023-02-13 19:55:50','2023-02-19 10:02:09','2023-03-01 19:55:51',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-13 19:55:50','2023-02-19 10:02:09'),(225,'76835240-abdf-11ed-ba72-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjMyMTE3NywiZXhwIjoxNjc4OTEzMTc3fQ.jlj44V15DN1-Fval5ExfmKPyL91KcShCEQKV4gmAvwQ','2023-02-13 20:46:17','2023-02-14 05:30:59','2023-03-01 20:46:17',1,1,'localhost','::1','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-13 20:46:17','2023-02-14 05:30:59'),(226,'c84793a8-ac28-11ed-ba72-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjM1MjY2NywiZXhwIjoxNjc4OTQ0NjY3fQ.c6V9rVv7wpTviBJudYrS4L17SQ8Sx8m1ke6XpXoxhok','2023-02-14 05:31:07','2023-02-14 05:31:07','2023-03-02 05:31:08',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-14 05:31:07','2023-02-14 05:31:07'),(227,'1fb022d3-ac51-11ed-ba72-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjM2OTk5NCwiZXhwIjoxNjc2NTQyNzk0fQ.9VBVW2sQqCKy7FDTjHODKnKAPumPp6oMdflkAqCO57E','2023-02-14 10:19:54','2023-02-14 10:19:54','2023-03-02 10:19:54',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-14 10:19:54','2023-02-14 10:19:54'),(228,'8ccf8d44-adec-11ed-ba72-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjU0NjcwMCwiZXhwIjoxNjc2NzE5NTAwfQ.iTosypK6IBNyqZi9Il85AcTVTpMmfDtCWFL20rndx3c','2023-02-16 11:25:00','2023-02-16 11:25:00','2023-03-02 11:25:00',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-16 11:25:00','2023-02-16 11:25:00'),(229,'7f366bb2-b035-11ed-8ed3-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3Njc5NzkzMiwiZXhwIjoxNjc5Mzg5OTMyfQ.pn6KsK-14W3mxNX9rjc3dcEUTULGTsQG2kYoX0UDggM','2023-02-19 09:12:12','2023-02-19 09:12:12','2023-03-02 09:12:12',1,0,'192.168.242.226','::ffff:192.168.242.144','[{\"message\": \"Initiating session\"}]','2023-02-19 09:12:12','2023-02-19 09:12:12'),(230,'05dc6758-b03b-11ed-8ed3-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjgwMDMwNiwiZXhwIjoxNjc2OTczMTA2fQ.KqVe-hm9Qz9Laxh6JRBwIhbErCpgT4FfbSpaOYTVXZc','2023-02-19 09:51:46','2023-02-19 09:51:46','2023-03-02 09:51:47',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-19 09:51:46','2023-02-19 09:51:46'),(231,'8132f0fd-b03c-11ed-8ed3-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjgwMDk0MywiZXhwIjoxNjc5MzkyOTQzfQ.5HD7wGluEL-trfoPE2bCLqCSZO3g-Vir-wimsWLvyY4','2023-02-19 10:02:23','2023-02-19 10:02:23','2023-03-02 10:02:23',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-19 10:02:23','2023-02-19 10:02:23'),(232,'15a701d9-b041-11ed-8ed3-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjgwMjkwOSwiZXhwIjoxNjc2OTc1NzA5fQ.gpZmgW4vU-hO5ez6DnWUNjsJpiVv8CxRuUVTSxrI6bE','2023-02-19 10:35:10','2023-02-19 10:35:10','2023-03-02 10:35:10',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-19 10:35:10','2023-02-19 10:35:10'),(233,'17b48ada-b042-11ed-8ed3-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NjgwMzM0MywiZXhwIjoxNjc5Mzk1MzQzfQ.RsVsOdxxMR6Knfz0uJIQXo_y6GN6L9v3mDEV6xOK2s8','2023-02-19 10:42:23','2023-02-19 10:42:23','2023-03-02 10:42:23',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-19 10:42:23','2023-02-19 10:42:23'),(234,'6f1056ed-b2b8-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzA3NDA3MiwiZXhwIjoxNjc3MjQ2ODcyfQ.t4rWYKG-Ma9pCN0QlGJMtkaFjkzUSZWb80zRGKZl73M','2023-02-22 13:54:32','2023-02-22 13:54:32','2023-03-02 13:54:32',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-22 13:54:32','2023-02-22 13:54:32'),(235,'c4676d5f-b2c1-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzA3ODA4MSwiZXhwIjoxNjc5NjcwMDgxfQ.49k6rWTPFdVFPlZv8B8QgD8jvAgcLa_4E6RhwL8QGQw','2023-02-22 15:01:21','2023-02-22 15:01:21','2023-03-02 15:01:21',1,0,'192.168.1.13','::ffff:192.168.1.4','[{\"message\": \"Initiating session\"}]','2023-02-22 15:01:21','2023-02-22 15:01:21'),(236,'24fade99-b2c4-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzA3OTEwMiwiZXhwIjoxNjc5NjcxMTAyfQ.3Fh3DJnVdzbMmgiVHBWAoGhR7ufXM63AlQRysE7VJ_c','2023-02-22 15:18:22','2023-02-22 15:18:22','2023-03-02 15:18:22',1,0,'192.168.1.13','::ffff:192.168.1.13','[{\"message\": \"Initiating session\"}]','2023-02-22 15:18:22','2023-02-22 15:18:22'),(237,'6eafe624-b2dd-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzA4OTk2MywiZXhwIjoxNjc5NjgxOTYzfQ.jU5wpDE2KTt-bMtHFg3ha5bL9XdW6gAm8fMMmpOLHYc','2023-02-22 18:19:23','2023-02-22 18:19:23','2023-03-02 18:19:23',1,0,'192.168.1.2','::ffff:192.168.1.4','[{\"message\": \"Initiating session\"}]','2023-02-22 18:19:23','2023-02-22 18:19:23'),(238,'aff1a748-b341-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzEzMzAyMiwiZXhwIjoxNjc5NzI1MDIyfQ.OA1utyezt2CPTwzL_cTqgd62GR0Q08o6uVMhHbQ2BRY','2023-02-23 06:17:02','2023-02-23 06:17:02','2023-03-02 06:17:02',1,0,'localhost','::1','[{\"message\": \"Initiating session\"}]','2023-02-23 06:17:02','2023-02-23 06:17:02'),(239,'582cf709-b34f-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzEzODg4OCwiZXhwIjoxNjc5NzMwODg4fQ.TKAC_ur82poRSznp9QqvZfRZCg1PsJ60VNKMh93gS48','2023-02-23 07:54:48','2023-02-23 09:01:07','2023-03-02 07:54:48',1,1,'192.168.1.2','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-23 07:54:48','2023-02-23 09:01:06'),(240,'40282819-b35f-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzE0NTcxOSwiZXhwIjoxNjc5NzM3NzE5fQ.ez8j39Rlz5spqilOt1IFzHESHZtRyYJzwKa6wtr-EIU','2023-02-23 09:48:39','2023-02-23 09:48:39','2023-03-02 09:48:40',1,0,'192.168.1.2','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}]','2023-02-23 09:48:39','2023-02-23 09:48:39'),(241,'2849ac2a-b36a-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzE1MDQwNCwiZXhwIjoxNjc5NzQyNDA0fQ.fg6ZuhnZvnQc1XdqKXTubEDEqarJaacuyPrfvPfwUTg','2023-02-23 11:06:44','2023-02-23 11:06:44','2023-03-02 11:06:44',1,0,'192.168.1.2','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}]','2023-02-23 11:06:44','2023-02-23 11:06:44'),(242,'b9ad7bd6-b3f3-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzIwOTQ4OSwiZXhwIjoxNjc5ODAxNDg5fQ.jVfraZ1dCmNl1B3LmO422AY7fXb9czTzCURyT3okP0w','2023-02-24 03:31:29','2023-02-24 03:31:38','2023-03-02 03:31:29',1,1,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-24 03:31:29','2023-02-24 03:31:37'),(243,'b586f8a7-b3f6-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzIxMDc3MCwiZXhwIjoxNjc5ODAyNzcwfQ.0hbp0E79BGsSLJlp2wRuWehPtMhqaEpXEusUeukuXRg','2023-02-24 03:52:50','2023-02-24 03:52:50','2023-03-02 03:52:51',1,0,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}]','2023-02-24 03:52:50','2023-02-24 03:52:50'),(244,'885e23e8-b3f9-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzIxMTk4MywiZXhwIjoxNjc5ODAzOTgzfQ.9qhgkX8EVWGMmmp9K0WhmK3xovWVZ4pnIjby4q6T9Wc','2023-02-24 04:13:03','2023-02-24 04:13:03','2023-03-02 04:13:03',1,0,'192.168.1.3','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}]','2023-02-24 04:13:03','2023-02-24 04:13:03'),(245,'7ef6d292-b45b-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzI1NDA1OCwiZXhwIjoxNjc5ODQ2MDU4fQ.lafVpOKDhSVnqDGiRthKbrLOkU2AhVIA7E03-cNlmBw','2023-02-24 15:54:18','2023-02-24 15:54:18','2023-03-02 15:54:18',1,0,'192.168.1.5','::ffff:192.168.1.5','[{\"message\": \"Initiating session\"}]','2023-02-24 15:54:18','2023-02-24 15:54:18'),(246,'d46e25c5-b4cd-11ed-8f2e-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzMwMzE2NCwiZXhwIjoxNjc5ODk1MTY0fQ.VfL21El1F2lMuUdLCFv6w-PNBjxIk2P8VSNYiXrz82A','2023-02-25 05:32:44','2023-02-26 07:35:49','2023-03-02 05:32:44',1,1,'192.168.1.5','::ffff:192.168.1.5','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-25 05:32:44','2023-02-26 07:35:48'),(247,'330b5bd5-b5a8-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzM5Njk1MywiZXhwIjoxNjc5OTg4OTUzfQ.h20VwQKOdPm4zsdPk9-ULi9D1C4sNsQc_YVFPdE-q04','2023-02-26 07:35:53','2023-02-26 17:07:25','2023-03-02 07:35:53',1,1,'192.168.1.5','::ffff:192.168.1.5','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-26 07:35:53','2023-02-26 17:07:25'),(248,'17cfb67b-b5f9-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInRva2VuX3R5cGUiOiJlbXAiLCJpYXQiOjE2Nzc0MzE2OTYsImV4cCI6MTY4MDAyMzY5Nn0.X9tJ5IKdAvvoWNsQrTvc_O994aogMhz8K8vTalqUriw','2023-02-26 17:14:56','2023-02-27 08:05:30','2023-03-02 17:14:57',1,1,'192.168.1.5','::ffff:192.168.1.5','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-26 17:14:56','2023-02-27 08:05:30'),(249,'843bf979-b675-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTIsInRva2VuX3R5cGUiOiJlbXAiLCJpYXQiOjE2Nzc0ODUxMzYsImV4cCI6MTY4MDA3NzEzNn0.yGGv_0OkCxTQ_jzZlShL7git_dLfl0OeBykeWjWYkV8','2023-02-27 08:05:36','2023-02-27 08:09:16','2023-03-02 08:05:36',1,1,'192.168.1.5','::ffff:192.168.1.5','[{\"message\": \"Initiating session\"}, {\"message\": \"User signout\"}]','2023-02-27 08:05:36','2023-02-27 08:09:15'),(250,'fd5974df-b6ce-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzUyMzU2NCwiZXhwIjoxNjgwMTE1NTY0fQ.7sa_YALM7UOCkyf-0y4rPFs-WTiWEPwKw8LmprGdLOU','2023-02-27 18:46:04','2023-02-27 18:46:04','2023-03-01 18:46:05',1,0,'192.168.1.5','::ffff:192.168.1.5','[{\"message\": \"Initiating session\"}]','2023-02-27 18:46:04','2023-02-27 18:46:04'),(251,'9ed7cbb8-b6d1-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzUyNDY5NCwiZXhwIjoxNjgwMTE2Njk0fQ.ve2ogZ0rmMs_xmgMfouRKhvLUuSnHeBNBq6SESnxojg','2023-02-27 19:04:54','2023-02-27 19:04:54','2023-03-01 19:04:55',1,0,'192.168.1.5','::ffff:192.168.1.2','[{\"message\": \"Initiating session\"}]','2023-02-27 19:04:54','2023-02-27 19:04:54'),(252,'70c88d12-b85d-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzY5NDY5NywiZXhwIjoxNjc3ODY3NDk3fQ.BNudiDMKRiYgTjb_QLouz-HspONeFzmEiq8lD7T8pd8','2023-03-01 18:18:18','2023-03-01 18:18:18','2023-03-30 18:18:18',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}]','2023-03-01 18:18:18','2023-03-01 18:18:18'),(253,'0e32f129-b85e-11ed-837b-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3NzY5NDk2MiwiZXhwIjoxNjgwMjg2OTYyfQ.eusx5RB27_Ifg5Qy4uxqoZhJmCS0pHagN2zshbo0kEY','2023-03-01 18:22:42','2023-03-01 18:22:42','2023-03-30 18:22:42',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}]','2023-03-01 18:22:42','2023-03-01 18:22:42'),(254,'12289990-b937-11ed-a24c-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3Nzc4ODE2OCwiZXhwIjoxNjgwMzgwMTY4fQ.PdzHIAPBXfRjmr-mhRVIj1ZcCzp0-vbLRoBmn5Sf2js','2023-03-02 20:16:09','2023-03-02 20:16:09','2023-03-29 20:16:09',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}]','2023-03-02 20:16:09','2023-03-02 20:16:09'),(255,'1ead0d8e-b937-11ed-a24c-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3Nzc4ODE5MCwiZXhwIjoxNjgwMzgwMTkwfQ.QyR6xx6yyTnE6YK1yJ5ffBARhofSoqmTK7h6K9Oo_UA','2023-03-02 20:16:30','2023-03-02 20:16:30','2023-03-29 20:16:31',1,0,'192.168.1.8','::ffff:192.168.1.8','[{\"message\": \"Initiating session\"}]','2023-03-02 20:16:30','2023-03-02 20:16:30'),(256,'f8418273-bc36-11ed-8579-9829a634982f','eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwidG9rZW5fdHlwZSI6ImVtcCIsImlhdCI6MTY3ODExNzk3OSwiZXhwIjoxNjgwNzA5OTc5fQ.RGs53mWEQbJqIFDnv_yJh5R-BhvVtFj18rz25Ps8D8Y','2023-03-06 15:52:59','2023-03-06 15:52:59','2023-03-30 15:52:59',1,0,'192.168.1.3','::ffff:192.168.1.3','[{\"message\": \"Initiating session\"}]','2023-03-06 15:52:59','2023-03-06 15:52:59');
/*!40000 ALTER TABLE `user_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(320) NOT NULL,
  `user_mobile` varchar(15) NOT NULL,
  `user_code` varchar(15) NOT NULL,
  `user_password` varchar(120) NOT NULL,
  `user_email_verified` tinyint NOT NULL DEFAULT '0',
  `user_is_verified` tinyint NOT NULL DEFAULT '0',
  `user_is_deleted` tinyint NOT NULL DEFAULT '0',
  `user_is_active` tinyint NOT NULL DEFAULT '1',
  `user_created_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email_UNIQUE` (`user_email`),
  UNIQUE KEY `user_mobile_UNIQUE` (`user_mobile`),
  UNIQUE KEY `user_code_UNIQUE` (`user_code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Siva Kusi','sivakusi12@gmail.com','+918106302821','mk2s','$2a$10$UhdDcxl5S66IN2VbbbSAC.8kcWi2nNNC.VYxytJBRt3QGT/DRvJqi',0,0,0,1,'2023-02-02 20:41:04','2023-02-05 13:13:44'),(8,'Siva Kusi','sivakusi.12@gmail.com','8106302821','siva.kusi','$2a$10$3IylRzz.ONMYKbh3B9Jk2u9iaTXCa3CZRmQXWAdPOQCQyelGPxaxq',0,0,0,1,'2023-02-07 06:00:12','2023-02-07 06:00:12'),(11,'Siva Kusi','siva.kusi12@gmail.com','7842487859','sivakusi','$2a$10$.9rtAawxwHocG44CLJLkLe8lpi7Cwla/3s2qEv1Sh6lw1Xd8eNxCG',0,0,0,1,'2023-02-07 06:04:36','2023-02-07 06:04:36'),(12,'siva','test@mk2s.tk','7777777777','sivakusi12','$2a$10$5duNnpPrl4Lskyk7CiMYWuhrli/.ljAiZ6GL6.ydbgEqtTOSCY7dm',0,0,0,1,'2023-02-26 17:14:51','2023-02-26 17:14:51');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-07 11:06:34
