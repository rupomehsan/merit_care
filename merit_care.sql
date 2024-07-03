-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: meritxacademy_coaching
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `account_categories`
--

DROP TABLE IF EXISTS `account_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `is_visible` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_categories`
--

LOCK TABLES `account_categories` WRITE;
/*!40000 ALTER TABLE `account_categories` DISABLE KEYS */;
INSERT INTO `account_categories` VALUES (1,'Checking','Category description',1,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(2,'Savings','Category description',1,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(3,'purchase','Category description',1,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(4,'Accounts Receivable','Category description',1,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(5,'Inventory','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(6,'Prepaid Expenses','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(7,'monthly fee','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(8,'Equipment','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(9,'Land','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(10,'Buildings','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(11,'Furniture','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(12,'Vehicles','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(13,'Other long-term assets','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(14,'Intellectual property','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(15,'Goodwill','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(16,'Long-term investments','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(17,'Accounts Payable','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(18,'Sales Tax Payable','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(19,'Income Tax Payable','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(20,'Wages Payable','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(21,'Unearned Revenue','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(22,'Long-term debt','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(23,'Owners Capital','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(24,'Withdrawals','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(25,'Revenue','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(26,'Sales Revenue','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(27,'Service Revenue','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(28,'Salaries and Wages','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(29,'Rent','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(30,'Insurance','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(31,'Taxes','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(32,'Other expense','Category description',1,'2024-01-21 07:07:37','2024-01-21 07:07:37');
/*!40000 ALTER TABLE `account_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_details`
--

DROP TABLE IF EXISTS `account_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint NOT NULL,
  `branch_id` bigint NOT NULL,
  `account_no` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_mobile_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_details`
--

LOCK TABLES `account_details` WRITE;
/*!40000 ALTER TABLE `account_details` DISABLE KEYS */;
INSERT INTO `account_details` VALUES (1,1,1,'CITY2015851','01757867854','farmgate_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(2,2,2,'ISLAMI2155514','017578678456','mirpur_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(3,3,3,'EXIMI2155514','017578678489','uttara_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(4,4,1,NULL,'01757867854','farmgate_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(5,5,2,NULL,'01757867854','mirpur_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(6,6,3,NULL,'017578678489','uttara_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(7,7,1,NULL,NULL,'farmgate_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(8,8,2,NULL,NULL,'mirpur_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(9,9,3,NULL,NULL,'uttara_branch@gmail.com','2024-01-21 07:07:37','2024-01-21 07:07:37'),(10,10,11,'1515391408','01727232824','saifullahmansur1515@gmail.com','2024-03-23 04:58:18','2024-03-23 04:58:18'),(11,11,11,'1500934121','01605705466','muradpc128@gmail.com','2024-03-23 04:59:26','2024-03-23 04:59:26');
/*!40000 ALTER TABLE `account_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_categories`
--

DROP TABLE IF EXISTS `asset_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_categories`
--

LOCK TABLES `asset_categories` WRITE;
/*!40000 ALTER TABLE `asset_categories` DISABLE KEYS */;
INSERT INTO `asset_categories` VALUES (1,'Connectivity',0,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(2,'Internet & modem',1,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(3,'Router',1,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(4,'Computer & Accessories',0,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(5,'PC',4,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(6,'Motherboard',4,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(7,'Processor',4,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(8,'Funriture',0,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(9,'Chair',8,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(10,'Table',8,'2024-01-21 07:07:36','2024-01-21 07:07:36'),(11,'Bench',8,'2024-01-21 07:07:36','2024-01-21 07:07:36');
/*!40000 ALTER TABLE `asset_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_shop_branch_asset`
--

DROP TABLE IF EXISTS `asset_shop_branch_asset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_shop_branch_asset` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_asset_id` bigint unsigned NOT NULL,
  `asset_shop_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_shop_branch_asset`
--

LOCK TABLES `asset_shop_branch_asset` WRITE;
/*!40000 ALTER TABLE `asset_shop_branch_asset` DISABLE KEYS */;
INSERT INTO `asset_shop_branch_asset` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,1),(5,2,3),(6,3,1),(7,3,2),(8,4,2),(9,4,3),(10,5,1),(11,5,3),(12,1,1),(13,1,2),(14,1,3),(15,2,1),(16,2,3),(17,3,1),(18,3,2),(19,4,2),(20,4,3),(21,5,1),(22,5,3);
/*!40000 ALTER TABLE `asset_shop_branch_asset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asset_shops`
--

DROP TABLE IF EXISTS `asset_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asset_shops` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asset_shops`
--

LOCK TABLES `asset_shops` WRITE;
/*!40000 ALTER TABLE `asset_shops` DISABLE KEYS */;
INSERT INTO `asset_shops` VALUES (1,'Farmgate Branch','Green road, Farmgate','0178945448','2024-01-21 07:07:36','2024-01-21 07:07:36'),(2,'Uttora Branch','road 11, section 7, uttora','0178945444','2024-01-21 07:07:36','2024-01-21 07:07:36'),(3,'Mirpur Branch','road 11, section 1, mipur','0178945446','2024-01-21 07:07:36','2024-01-21 07:07:36');
/*!40000 ALTER TABLE `asset_shops` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendences`
--

DROP TABLE IF EXISTS `attendences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint DEFAULT NULL,
  `table` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_id` bigint NOT NULL,
  `class_id` bigint DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `date` date NOT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `present` tinyint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendences`
--

LOCK TABLES `attendences` WRITE;
/*!40000 ALTER TABLE `attendences` DISABLE KEYS */;
INSERT INTO `attendences` VALUES (1,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(2,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(3,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(4,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(5,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(6,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(7,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(8,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(9,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(10,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(11,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-08','09:37:00','18:37:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(12,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(13,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(14,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(15,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(16,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(17,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(18,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(19,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(20,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(21,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(22,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-07','09:36:00','18:36:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(23,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(24,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(25,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(26,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(27,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(28,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(29,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(30,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(31,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(32,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(33,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-06','09:35:00','18:35:00',1,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(34,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(35,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(36,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(37,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(38,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(39,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(40,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(41,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(42,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(43,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(44,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-05','09:34:00','18:34:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(45,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(46,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(47,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(48,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(49,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(50,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(51,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(52,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(53,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(54,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(55,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-04','09:33:00','18:33:00',1,'2023-12-31 12:01:57','2023-12-31 12:01:57'),(56,2,'employee','teacher',24,NULL,NULL,NULL,'2023-12-31','10:04:00','18:04:00',1,'2023-12-31 12:04:05','2023-12-31 12:04:12'),(58,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(59,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(60,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(61,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(62,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(63,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(64,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(65,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(66,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(67,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(68,2,'employee','teacher',23,NULL,NULL,NULL,'2023-11-28','09:37:00','18:37:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(69,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(70,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(71,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(72,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(73,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(74,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(75,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(76,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(77,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(78,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(79,2,'employee','teacher',24,NULL,NULL,NULL,'2023-11-27','09:36:00','18:36:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(80,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(81,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(82,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(83,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(84,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(85,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(86,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(87,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(88,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(89,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(90,2,'employee','teacher',25,NULL,NULL,NULL,'2023-11-26','09:35:00','18:35:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(91,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(92,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(93,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(94,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(95,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(96,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(97,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(98,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(99,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(100,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(101,2,'employee','teacher',26,NULL,NULL,NULL,'2023-11-25','09:34:00','18:34:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(102,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(103,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(104,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(105,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(106,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(107,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(108,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(109,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(110,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(111,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(112,2,'employee','teacher',27,NULL,NULL,NULL,'2023-11-24','09:33:00','18:33:00',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(118,NULL,'users',NULL,67,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-21 09:39:40','2024-03-21 09:39:40'),(126,11,'employee','teacher',108,NULL,NULL,NULL,'2024-03-23','15:00:00','15:30:00',1,'2024-03-23 04:27:45','2024-03-23 04:28:02'),(127,11,'employee','teacher',106,NULL,NULL,NULL,'2024-03-21','15:30:00','16:30:00',1,'2024-03-23 04:28:31','2024-03-23 04:28:39'),(128,11,'employee','teacher',108,NULL,NULL,NULL,'2024-03-21','15:28:00','16:00:00',1,'2024-03-23 04:28:57','2024-03-23 04:29:32'),(129,11,'employee','teacher',108,NULL,NULL,NULL,'2024-03-19','15:30:00','16:30:00',1,'2024-03-23 04:29:55','2024-03-23 04:30:02'),(131,11,'employee','teacher',107,NULL,NULL,NULL,'2024-03-19','15:30:00','16:31:00',1,'2024-03-23 04:31:06','2024-03-23 04:31:28'),(132,NULL,'users',NULL,64,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:33','2024-03-23 04:32:33'),(133,NULL,'users',NULL,65,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:34','2024-03-23 04:32:34'),(134,NULL,'users',NULL,66,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:34','2024-03-23 04:32:34'),(135,NULL,'users',NULL,68,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:35','2024-03-23 04:32:35'),(136,NULL,'users',NULL,69,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:36','2024-03-23 04:32:36'),(137,NULL,'users',NULL,70,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:37','2024-03-23 04:32:37'),(138,NULL,'users',NULL,71,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:37','2024-03-23 04:32:37'),(140,NULL,'users',NULL,63,9,4,9,'2024-03-21',NULL,NULL,1,'2024-03-23 04:32:45','2024-03-23 04:32:45'),(141,NULL,'users',NULL,72,9,8,10,'2024-03-23',NULL,NULL,1,'2024-03-23 04:33:47','2024-03-23 04:33:47'),(142,NULL,'users',NULL,73,9,8,10,'2024-03-23',NULL,NULL,1,'2024-03-23 04:33:48','2024-03-23 04:33:48'),(143,NULL,'users',NULL,74,9,8,10,'2024-03-23',NULL,NULL,1,'2024-03-23 04:33:48','2024-03-23 04:33:48'),(144,NULL,'users',NULL,75,9,8,10,'2024-03-23',NULL,NULL,1,'2024-03-23 04:33:49','2024-03-23 04:33:49'),(145,11,'employee','teacher',45,NULL,NULL,NULL,'2024-03-23','17:14:00','19:15:00',1,'2024-03-23 08:11:38','2024-03-23 08:11:45'),(146,11,'employee','employee',28,NULL,NULL,NULL,'2024-03-23','08:15:00','17:15:00',1,'2024-03-23 08:11:57','2024-03-23 08:12:24'),(147,11,'employee','teacher',45,NULL,NULL,NULL,'2024-03-20','17:12:00','18:12:00',1,'2024-03-23 08:12:47','2024-03-23 08:13:00'),(148,11,'employee','teacher',23,NULL,NULL,NULL,'2024-04-18','12:41:00','17:46:00',1,'2024-04-18 17:40:09','2024-04-18 17:40:17'),(149,11,'employee','teacher',25,NULL,NULL,NULL,'2024-04-18','01:42:00','15:43:00',1,'2024-04-18 17:40:30','2024-04-18 17:40:42'),(150,11,'employee','teacher',24,NULL,NULL,NULL,'2024-04-18','11:42:00','13:43:00',1,'2024-04-18 17:42:08','2024-04-18 17:42:19'),(151,NULL,'users',NULL,54,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(152,NULL,'users',NULL,63,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(153,NULL,'users',NULL,64,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(154,NULL,'users',NULL,65,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(155,NULL,'users',NULL,66,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(156,NULL,'users',NULL,67,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(157,NULL,'users',NULL,68,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(158,NULL,'users',NULL,69,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(159,NULL,'users',NULL,70,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(160,NULL,'users',NULL,71,7,4,9,'2024-04-18',NULL,NULL,1,'2024-04-18 17:48:28','2024-04-18 17:48:28'),(161,NULL,'users',NULL,54,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(162,NULL,'users',NULL,63,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(163,NULL,'users',NULL,64,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(164,NULL,'users',NULL,65,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(165,NULL,'users',NULL,66,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(166,NULL,'users',NULL,67,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(167,NULL,'users',NULL,68,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(168,NULL,'users',NULL,69,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(169,NULL,'users',NULL,70,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(170,NULL,'users',NULL,71,7,4,9,'2024-05-01',NULL,NULL,1,'2024-05-14 21:43:28','2024-05-14 21:43:28'),(171,NULL,'users',NULL,72,7,10,10,'2024-05-01',NULL,NULL,1,'2024-05-14 21:44:01','2024-05-14 21:44:01'),(172,NULL,'users',NULL,73,7,10,10,'2024-05-01',NULL,NULL,1,'2024-05-14 21:44:01','2024-05-14 21:44:01'),(173,NULL,'users',NULL,74,7,10,10,'2024-05-01',NULL,NULL,1,'2024-05-14 21:44:01','2024-05-14 21:44:01'),(174,NULL,'users',NULL,75,7,10,10,'2024-05-01',NULL,NULL,1,'2024-05-14 21:44:01','2024-05-14 21:44:01'),(175,NULL,'users',NULL,76,7,10,10,'2024-05-01',NULL,NULL,1,'2024-05-14 21:44:01','2024-05-14 21:44:01');
/*!40000 ALTER TABLE `attendences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banners`
--

DROP TABLE IF EXISTS `banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci,
  `title_highlight` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paragraph` text COLLATE utf8mb4_unicode_ci,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `button_text` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banners`
--

LOCK TABLES `banners` WRITE;
/*!40000 ALTER TABLE `banners` DISABLE KEYS */;
INSERT INTO `banners` VALUES (8,'gg',NULL,'gg','gg','gg','gg','2024-01-23 08:28:32','2024-01-23 08:28:32'),(9,'Web Designer',NULL,'Design','WebGet stands as a premier digital IT solutions provider, specializing in conceptualizing and delivering comprehensive digital consulting and services. Our expertise spans from crafting dynamic websites, innovative web applications, and top-notch video editing to producing captivating graphics products and executing strategic digital marketing campaigns. With a client-centric approach, we translate visions into reality, ensuring our clients receive tailored solutions that meet their unique needs. From cutting-edge websites to powerful digital marketing, we are committed to elevating your digital presence and driving success in the ever-evolving landscape of the digital world.','https://webget.org/','Submit','2024-01-24 04:32:28','2024-01-24 04:32:28');
/*!40000 ALTER TABLE `banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_account_logs`
--

DROP TABLE IF EXISTS `branch_account_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_account_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint DEFAULT NULL,
  `account_category_id` bigint DEFAULT NULL,
  `account_id` bigint DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `type` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `is_income` tinyint NOT NULL DEFAULT '0',
  `is_expense` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_account_logs`
--

LOCK TABLES `branch_account_logs` WRITE;
/*!40000 ALTER TABLE `branch_account_logs` DISABLE KEYS */;
INSERT INTO `branch_account_logs` VALUES (1,1,1,2,15000,'debit','monthly office rent','2023-12-21',0,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(2,1,2,1,1500,'debit','monthly office current bill','2023-11-21',0,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(3,2,1,5,15000,'debit','monthly office rent','2023-10-21',0,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(4,2,2,5,15000,'debit','monthly office current bill','2023-09-21',0,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(5,3,1,6,15000,'debit','monthly office rent','2023-08-21',0,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(6,3,2,5,15000,'debit','monthly office current bill','2023-07-21',0,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(7,2,7,7,550,'credit',NULL,'2024-01-20',1,0,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(8,2,7,7,450,'credit',NULL,'2024-01-20',1,0,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(9,2,7,7,1050,'credit',NULL,'2024-01-18',1,0,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(10,2,7,7,950,'credit',NULL,'2024-01-17',1,0,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(11,2,7,7,950,'credit',NULL,'2024-01-16',1,0,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(12,11,28,NULL,20000,'debit','Salary of the employees',NULL,0,1,'2024-03-23 04:38:53','2024-03-23 04:38:53'),(13,11,28,NULL,25000,'debit','Salary of the employees',NULL,0,1,'2024-03-23 04:39:48','2024-03-23 04:39:48'),(14,11,28,NULL,20000,'debit','Salary of the employees',NULL,0,1,'2024-03-23 04:40:02','2024-03-23 04:40:02'),(15,11,28,NULL,10000,'debit','Salary of the employees',NULL,0,1,'2024-03-23 04:40:27','2024-03-23 04:40:27'),(16,11,6,10,1000000,'credit','Starting balance',NULL,1,0,'2024-03-23 04:58:18','2024-03-23 04:58:18'),(17,11,6,11,1000000,'credit','Starting balance',NULL,1,0,'2024-03-23 04:59:26','2024-03-23 04:59:26'),(18,11,32,10,10000,'debit','Balance transfer',NULL,0,1,'2024-03-23 04:59:42','2024-03-23 04:59:42'),(19,11,32,11,10000,'credit','Balance received from another account',NULL,1,0,'2024-03-23 04:59:42','2024-03-23 04:59:42'),(20,11,32,10,100000,'debit','Balance transfer',NULL,0,1,'2024-03-23 05:00:09','2024-03-23 05:00:09'),(21,11,32,11,100000,'credit','Balance received from another account',NULL,1,0,'2024-03-23 05:00:09','2024-03-23 05:00:09'),(22,11,32,11,10000,'debit','Balance transfer',NULL,0,1,'2024-03-23 05:00:35','2024-03-23 05:00:35'),(23,11,32,10,10000,'credit','Balance received from another account',NULL,1,0,'2024-03-23 05:00:35','2024-03-23 05:00:35'),(24,11,32,10,10000,'debit','Balance transfer',NULL,0,1,'2024-03-23 05:01:06','2024-03-23 05:01:06'),(25,11,32,11,10000,'credit','Balance received from another account',NULL,1,0,'2024-03-23 05:01:06','2024-03-23 05:01:06'),(26,11,32,10,1000,'debit','Balance transfer',NULL,0,1,'2024-03-23 05:01:43','2024-03-23 05:01:43'),(27,11,32,11,1000,'credit','Balance received from another account',NULL,1,0,'2024-03-23 05:01:43','2024-03-23 05:01:43'),(28,11,28,NULL,500,'debit','Salary of the employees',NULL,0,1,'2024-04-18 18:06:27','2024-04-18 18:06:27'),(29,11,3,10,400,'credit','asdf','2024-04-18',1,0,'2024-04-18 18:22:17','2024-04-18 18:22:17'),(30,11,2,10,400,'debit','dfasd',NULL,0,1,'2024-04-18 18:26:12','2024-04-18 18:26:12'),(31,11,7,12,500,'credit','Monthly student fee','2024-05-14',1,0,'2024-05-14 17:28:11','2024-05-14 17:28:11'),(32,11,7,12,400,'credit','Monthly student fee','2024-05-26',1,0,'2024-05-26 07:50:51','2024-05-26 07:50:51'),(33,11,7,12,150,'credit','Monthly student fee','2024-05-26',1,0,'2024-05-26 07:51:04','2024-05-26 07:51:04'),(34,11,7,12,1500,'credit','Monthly student fee','2024-05-26',1,0,'2024-05-26 09:49:03','2024-05-26 09:49:03'),(35,11,7,12,400,'credit','Monthly student fee','2024-05-26',1,0,'2024-05-26 13:36:22','2024-05-26 13:36:22'),(36,11,7,12,5000,'credit','Monthly student fee','2024-05-26',1,0,'2024-05-26 13:36:30','2024-05-26 13:36:30'),(37,11,7,12,50,'credit','Monthly student fee','2024-05-27',1,0,'2024-05-27 06:47:33','2024-05-27 06:47:33'),(38,11,7,12,200,'credit','Monthly student fee','2024-05-27',1,0,'2024-05-27 07:23:05','2024-05-27 07:23:05'),(39,11,7,12,150,'credit','Monthly student fee','2024-05-27',1,0,'2024-05-27 07:26:47','2024-05-27 07:26:47'),(40,11,7,12,20,'credit','Monthly student fee','2024-05-27',1,0,'2024-05-27 07:27:17','2024-05-27 07:27:17'),(41,11,7,12,300,'credit','Monthly student fee','2024-05-27',1,0,'2024-05-27 07:29:00','2024-05-27 07:29:00'),(42,11,7,12,500,'credit','Monthly student fee','2024-05-27',1,0,'2024-05-27 07:32:18','2024-05-27 07:32:18');
/*!40000 ALTER TABLE `branch_account_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_accounts`
--

DROP TABLE IF EXISTS `branch_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint DEFAULT NULL,
  `is_cash` tinyint NOT NULL DEFAULT '0',
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `total_income` int DEFAULT NULL,
  `total_expense` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_accounts`
--

LOCK TABLES `branch_accounts` WRITE;
/*!40000 ALTER TABLE `branch_accounts` DISABLE KEYS */;
INSERT INTO `branch_accounts` VALUES (1,1,0,'Bank account','Bank account of the admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(2,2,0,'Bank account','Bank account of branch admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(3,3,0,'Bank account','Bank account of branch admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(4,1,0,'Bkash','bkash merchant account of admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(5,2,0,'Bkash','bkash merchant account of branch admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(6,3,0,'Bkash','bkash merchant account of branch admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(7,1,1,'cash','cash account of admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(8,2,1,'cash','cash account of branch admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(9,3,1,'cash','cash account of branch admin',NULL,NULL,'2024-01-21 07:07:37','2024-01-21 07:07:37'),(10,11,1,'Saifullah Mansur','Owner',NULL,NULL,'2024-03-23 04:58:18','2024-03-23 04:58:18'),(11,11,1,'Murad Hossain','Co Founder',NULL,NULL,'2024-03-23 04:59:26','2024-03-23 04:59:26'),(12,11,1,'cash',NULL,NULL,NULL,'2024-05-14 17:28:11','2024-05-14 17:28:11');
/*!40000 ALTER TABLE `branch_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branch_assets`
--

DROP TABLE IF EXISTS `branch_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `branch_assets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint DEFAULT NULL,
  `asset_category_id` bigint DEFAULT NULL,
  `purchase_price` double(8,2) DEFAULT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci,
  `depreciation_price` double(8,2) DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `buying_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branch_assets`
--

LOCK TABLES `branch_assets` WRITE;
/*!40000 ALTER TABLE `branch_assets` DISABLE KEYS */;
INSERT INTO `branch_assets` VALUES (1,1,2,25000.00,'Computer',5.00,'Vivamus suscipit tortor eget felis porttitor volutpat. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Proin eget tortor risus.',NULL,'2022-12-19 23:00:30','2022-12-19 23:00:30'),(2,2,3,35000.00,'Laptop',5.00,'Vivamus suscipit tortor eget felis porttitor volutpat. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Proin eget tortor risus.',NULL,'2022-12-19 23:00:30','2022-12-19 23:00:30'),(3,3,1,5000.00,'Internet Modem',5.00,'Vivamus suscipit tortor eget felis porttitor volutpat. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Proin eget tortor risus.',NULL,'2022-12-19 23:00:30','2022-12-19 23:00:30'),(4,3,4,5000.00,'Chair',5.00,'Vivamus suscipit tortor eget felis porttitor volutpat. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Proin eget tortor risus.',NULL,'2022-12-19 23:00:30','2022-12-19 23:00:30'),(5,3,5,5000.00,'Stand fan',5.00,'Vivamus suscipit tortor eget felis porttitor volutpat. Nulla quis lorem ut libero malesuada feugiat. Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Proin eget tortor risus. Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Vivamus suscipit tortor eget felis porttitor volutpat. Donec sollicitudin molestie malesuada. Proin eget tortor risus.',NULL,'2022-12-19 23:00:30','2022-12-19 23:00:30');
/*!40000 ALTER TABLE `branch_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breaking_news`
--

DROP TABLE IF EXISTS `breaking_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breaking_news` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breaking_news`
--

LOCK TABLES `breaking_news` WRITE;
/*!40000 ALTER TABLE `breaking_news` DISABLE KEYS */;
INSERT INTO `breaking_news` VALUES (1,'Hello World','Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.Lorem Ipsum is simply dummy text of the printing and typesetting industry. \r\n        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\r\n         It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. \r\n         It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, \r\n        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','2024-01-21 07:07:50','2024-01-23 08:19:21');
/*!40000 ALTER TABLE `breaking_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_messages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `creator` tinyint DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `seen` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_messages`
--

LOCK TABLES `contact_messages` WRITE;
/*!40000 ALTER TABLE `contact_messages` DISABLE KEYS */;
INSERT INTO `contact_messages` VALUES (1,'Justen','hailey.treutel@example.com','Beatae qui et.','Consequatur doloribus libero non deleniti.',NULL,'51318',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(2,'Lenny','cathryn36@example.net','Neque.','Illo occaecati quas voluptatibus dicta.',NULL,'19912',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(3,'Kaya','berniece97@example.net','Magnam ab sit.','Atque saepe ea dolorem voluptatum.',NULL,'43348',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(4,'Braeden','mireille.yost@example.net','Dolores eum.','Molestiae explicabo optio qui quos.',NULL,'40304',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(5,'Dena','lfadel@example.org','Dignissimos.','Expedita odit possimus quaerat nam autem soluta.',NULL,'54699',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(6,'Isabelle','xparisian@example.org','Quae enim quae.','Itaque odit ut repudiandae laborum sed.',NULL,'49431',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(7,'Theo','vauer@example.org','Et nesciunt.','Suscipit sapiente velit totam molestiae.',NULL,'25136',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(8,'Emilie','quitzon.gregg@example.net','Rerum quidem.','Quidem voluptate aut eos autem porro consequatur.',NULL,'24197',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(9,'Chanel','vhowell@example.org','Est accusamus.','Occaecati dolore nesciunt et qui.',NULL,'10099',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(10,'Corbin','nelda.schoen@example.net','Tenetur vel.','Expedita laboriosam ut alias architecto.',NULL,'43188',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(11,'Catalina','nannie.wehner@example.com','Deserunt.','Hic animi voluptatem qui velit.',NULL,'21854',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(12,'Kobe','paris54@example.com','Animi.','Eaque expedita et ipsam quis velit.',NULL,'15816',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(13,'Jaeden','mandy32@example.net','Odio et.','Sed facilis neque deleniti.',NULL,'47345',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(14,'Opal','dyost@example.org','Voluptas.','Odio molestiae rerum minima porro asperiores.',NULL,'22441',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(15,'Scot','kcrooks@example.com','Exercitationem.','Molestias ducimus dolorum illo.',NULL,'21266',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(16,'Barrett','robbie73@example.com','Laboriosam est.','Facere quo repellat minus minus qui non quaerat.',NULL,'23610',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(17,'Leila','btowne@example.com','Dicta nulla.','Expedita qui aut sit reiciendis.',NULL,'49189',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(18,'Elwin','tromp.taya@example.org','Sed odio.','Enim amet accusantium similique.',NULL,'33607',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(19,'Madeline','jacquelyn88@example.net','Aut.','Sed quo odio rerum qui.',NULL,'50823',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(20,'Emory','fern.hettinger@example.net','Officia.','Qui architecto et dignissimos ut molestiae ipsum.',NULL,'41975',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(21,'Devante','ilene.ernser@example.net','Omnis dolorum.','Officia fuga error eveniet ut illum ipsum.',NULL,'28736',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(22,'Ashlee','elliot.connelly@example.com','Tempore amet.','Qui dolore rem commodi deleniti.',NULL,'28276',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(23,'Gina','zmuller@example.net','Ut officiis.','Rerum qui deserunt libero dignissimos amet.',NULL,'39796',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(24,'June','abelardo.dooley@example.com','Totam.','Perferendis voluptas esse ut amet.',NULL,'38299',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(25,'Rhea','chester49@example.net','Officiis.','Quam enim nesciunt odit nam.',NULL,'51624',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(26,'Ova','msporer@example.com','Nostrum quod.','Dolorem ut repellat consequatur pariatur ipsam.',NULL,'34596',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(27,'Dustin','virginie.kozey@example.com','Fugit aliquid.','Laudantium itaque excepturi ea mollitia sequi.',NULL,'54531',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(28,'Sylvia','bernhard.adriana@example.org','Dolores.','Excepturi vitae est ipsa omnis sunt.',NULL,'20388',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(29,'Ola','lang.monty@example.com','Est doloremque.','Perspiciatis dolores qui autem quis repudiandae.',NULL,'10690',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(30,'Wyman','cummings.rupert@example.org','Perferendis.','Totam velit quaerat a nihil.',NULL,'27575',1,0,'2024-01-21 07:07:35','2024-01-21 07:07:35'),(31,'murad','muradhossain.web@gmail.com',NULL,'What is Lorem Ipsum?\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',NULL,NULL,1,1,'2024-03-21 04:38:11','2024-03-21 04:41:13');
/*!40000 ALTER TABLE `contact_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_call_histories`
--

DROP TABLE IF EXISTS `crm_call_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_call_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `feedback` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_call_histories`
--

LOCK TABLES `crm_call_histories` WRITE;
/*!40000 ALTER TABLE `crm_call_histories` DISABLE KEYS */;
INSERT INTO `crm_call_histories` VALUES (1,1,1,'positive','2024-01-21 07:07:39','2024-01-21 07:07:39'),(2,2,2,'confirm','2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,3,3,'improve the classroom facility','2024-01-21 07:07:39','2024-01-21 07:07:39'),(4,4,4,'Satisfied','2024-01-21 07:07:40','2024-01-21 07:07:40');
/*!40000 ALTER TABLE `crm_call_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_communicatoin_topics`
--

DROP TABLE IF EXISTS `crm_communicatoin_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_communicatoin_topics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_communicatoin_topics`
--

LOCK TABLES `crm_communicatoin_topics` WRITE;
/*!40000 ALTER TABLE `crm_communicatoin_topics` DISABLE KEYS */;
INSERT INTO `crm_communicatoin_topics` VALUES (1,'Admission','2024-01-21 07:07:40','2024-01-21 07:07:40'),(2,'Monthly fee','2024-01-21 07:07:40','2024-01-21 07:07:40'),(3,'Feedback','2024-01-21 07:07:40','2024-01-21 07:07:40'),(4,'Customer support','2024-01-21 07:07:40','2024-01-21 07:07:40'),(5,'Result','2024-01-21 07:07:40','2024-01-21 07:07:40');
/*!40000 ALTER TABLE `crm_communicatoin_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_sms_histories`
--

DROP TABLE IF EXISTS `crm_sms_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_sms_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `topic_id` bigint DEFAULT NULL,
  `customer_id` bigint DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_sms_histories`
--

LOCK TABLES `crm_sms_histories` WRITE;
/*!40000 ALTER TABLE `crm_sms_histories` DISABLE KEYS */;
INSERT INTO `crm_sms_histories` VALUES (1,1,1,'Dear student, Improve your English by admit into our interactive english course. click the link below, to get started','2024-01-21 07:07:40','2024-01-21 07:07:40'),(2,2,2,'Dear student, Please pay your monthly due for your ssc batch','2024-01-21 07:07:40','2024-01-21 07:07:40'),(3,3,3,'Dear student, Please let us know how we can improve our service','2024-01-21 07:07:40','2024-01-21 07:07:40'),(4,4,4,'Dear student, Your result for the daily model test is: ','2024-01-21 07:07:40','2024-01-21 07:07:40');
/*!40000 ALTER TABLE `crm_sms_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `crm_sms_templates`
--

DROP TABLE IF EXISTS `crm_sms_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `crm_sms_templates` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `schema` text COLLATE utf8mb4_unicode_ci,
  `branch_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `crm_sms_templates`
--

LOCK TABLES `crm_sms_templates` WRITE;
/*!40000 ALTER TABLE `crm_sms_templates` DISABLE KEYS */;
INSERT INTO `crm_sms_templates` VALUES (1,'Dear student, Improve your English by admit into our interactive english course. click the link below, to get started',1,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(2,'Dear student, Please pay your monthly due for your ssc batch',1,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(3,'Dear student, Please let us know how we can improve our service',2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(4,'Dear student, Your result for the daily model test is: ',3,'2024-01-21 07:07:40','2024-01-21 07:07:40');
/*!40000 ALTER TABLE `crm_sms_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` text COLLATE utf8mb4_unicode_ci,
  `address` text COLLATE utf8mb4_unicode_ci,
  `branch_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Abdullah al jaber','Road no 7, Mirpur 10, 1206, Dhaka',1,'2024-01-21 07:07:48','2024-01-21 07:07:48'),(2,'Samin al jabir','Road no 7, Mirpur 10, 1205, Dhaka',1,'2024-01-21 07:07:48','2024-01-21 07:07:48'),(3,'Asma yasir','Road no 7, Mirpur 10, 1204, Dhaka',1,'2024-01-21 07:07:48','2024-01-21 07:07:48'),(4,'Shefatullah masum','Road no 5, Sector 10, Uttora, Dhaka',2,'2024-01-21 07:07:48','2024-01-21 07:07:48'),(5,'Lutfur rahman','Road no 6, Sector 7, Uttora, Dhaka',2,'2024-01-21 07:07:48','2024-01-21 07:07:48'),(6,'Emon ahmed','Road no 6, Sector 5, Uttora, Dhaka',2,'2024-01-21 07:07:48','2024-01-21 07:07:48'),(7,'Omar faruk','Road no 5, Green road, Farmgate, Dhaka',3,'2024-01-21 07:07:49','2024-01-21 07:07:49'),(8,'Rakibul Islam','Road no 4, Green road, Farmgate, Dhaka',3,'2024-01-21 07:07:49','2024-01-21 07:07:49'),(9,'Nakibul islam','Road no 4, Green road, Farmgate, Dhaka',3,'2024-01-21 07:07:49','2024-01-21 07:07:49');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `districts`
--

DROP TABLE IF EXISTS `districts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `districts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `division_id` text COLLATE utf8mb4_unicode_ci,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` text COLLATE utf8mb4_unicode_ci,
  `lat` text COLLATE utf8mb4_unicode_ci,
  `lon` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `districts`
--

LOCK TABLES `districts` WRITE;
/*!40000 ALTER TABLE `districts` DISABLE KEYS */;
INSERT INTO `districts` VALUES (1,'1','Comilla','কুমিল্লা','23.4682747','91.1788135','www.comilla.gov.bd',NULL,NULL),(2,'1','Feni','ফেনী','23.023231','91.3840844','www.feni.gov.bd',NULL,NULL),(3,'1','Brahmanbaria','ব্রাহ্মণবাড়িয়া','23.9570904','91.1119286','www.brahmanbaria.gov.bd',NULL,NULL),(4,'1','Rangamati','রাঙ্গামাটি','22.65561018','92.17541121','www.rangamati.gov.bd',NULL,NULL),(5,'1','Noakhali','নোয়াখালী','22.869563','91.099398','www.noakhali.gov.bd',NULL,NULL),(6,'1','Chandpur','চাঁদপুর','23.2332585','90.6712912','www.chandpur.gov.bd',NULL,NULL),(7,'1','Lakshmipur','লক্ষ্মীপুর','22.942477','90.841184','www.lakshmipur.gov.bd',NULL,NULL),(8,'1','Chattogram','চট্টগ্রাম','22.335109','91.834073','www.chittagong.gov.bd',NULL,NULL),(9,'1','Coxsbazar','কক্সবাজার','21.44315751','91.97381741','www.coxsbazar.gov.bd',NULL,NULL),(10,'1','Khagrachhari','খাগড়াছড়ি','23.119285','91.984663','www.khagrachhari.gov.bd',NULL,NULL),(11,'1','Bandarban','বান্দরবান','22.1953275','92.2183773','www.bandarban.gov.bd',NULL,NULL),(12,'2','Sirajganj','সিরাজগঞ্জ','24.4533978','89.7006815','www.sirajganj.gov.bd',NULL,NULL),(13,'2','Pabna','পাবনা','23.998524','89.233645','www.pabna.gov.bd',NULL,NULL),(14,'2','Bogura','বগুড়া','24.8465228','89.377755','www.bogra.gov.bd',NULL,NULL),(15,'2','Rajshahi','রাজশাহী','24.37230298','88.56307623','www.rajshahi.gov.bd',NULL,NULL),(16,'2','Natore','নাটোর','24.420556','89.000282','www.natore.gov.bd',NULL,NULL),(17,'2','Joypurhat','জয়পুরহাট','25.09636876','89.04004280','www.joypurhat.gov.bd',NULL,NULL),(18,'2','Chapainawabganj','চাঁপাইনবাবগঞ্জ','24.5965034','88.2775122','www.chapainawabganj.gov.bd',NULL,NULL),(19,'2','Naogaon','নওগাঁ','24.83256191','88.92485205','www.naogaon.gov.bd',NULL,NULL),(20,'3','Jashore','যশোর','23.16643','89.2081126','www.jessore.gov.bd',NULL,NULL),(21,'3','Satkhira','সাতক্ষীরা','22.7180905','89.0687033','www.satkhira.gov.bd',NULL,NULL),(22,'3','Meherpur','মেহেরপুর','23.762213','88.631821','www.meherpur.gov.bd',NULL,NULL),(23,'3','Narail','নড়াইল','23.172534','89.512672','www.narail.gov.bd',NULL,NULL),(24,'3','Chuadanga','চুয়াডাঙ্গা','23.6401961','88.841841','www.chuadanga.gov.bd',NULL,NULL),(25,'3','Kushtia','কুষ্টিয়া','23.901258','89.120482','www.kushtia.gov.bd',NULL,NULL),(26,'3','Magura','মাগুরা','23.487337','89.419956','www.magura.gov.bd',NULL,NULL),(27,'3','Khulna','খুলনা','22.815774','89.568679','www.khulna.gov.bd',NULL,NULL),(28,'3','Bagerhat','বাগেরহাট','22.651568','89.785938','www.bagerhat.gov.bd',NULL,NULL),(29,'3','Jhenaidah','ঝিনাইদহ','23.5448176','89.1539213','www.jhenaidah.gov.bd',NULL,NULL),(30,'4','Jhalakathi','ঝালকাঠি','22.6422689','90.2003932','www.jhalakathi.gov.bd',NULL,NULL),(31,'4','Patuakhali','পটুয়াখালী','22.3596316','90.3298712','www.patuakhali.gov.bd',NULL,NULL),(32,'4','Pirojpur','পিরোজপুর','22.5781398','89.9983909','www.pirojpur.gov.bd',NULL,NULL),(33,'4','Barisal','বরিশাল','22.7004179','90.3731568','www.barisal.gov.bd',NULL,NULL),(34,'4','Bhola','ভোলা','22.685923','90.648179','www.bhola.gov.bd',NULL,NULL),(35,'4','Barguna','বরগুনা','22.159182','90.125581','www.barguna.gov.bd',NULL,NULL),(36,'5','Sylhet','সিলেট','24.8897956','91.8697894','www.sylhet.gov.bd',NULL,NULL),(37,'5','Moulvibazar','মৌলভীবাজার','24.482934','91.777417','www.moulvibazar.gov.bd',NULL,NULL),(38,'5','Habiganj','হবিগঞ্জ','24.374945','91.41553','www.habiganj.gov.bd',NULL,NULL),(39,'5','Sunamganj','সুনামগঞ্জ','25.0658042','91.3950115','www.sunamganj.gov.bd',NULL,NULL),(40,'6','Narsingdi','নরসিংদী','23.932233','90.71541','www.narsingdi.gov.bd',NULL,NULL),(41,'6','Gazipur','গাজীপুর','24.0022858','90.4264283','www.gazipur.gov.bd',NULL,NULL),(42,'6','Shariatpur','শরীয়তপুর','23.2060195','90.3477725','www.shariatpur.gov.bd',NULL,NULL),(43,'6','Narayanganj','নারায়ণগঞ্জ','23.63366','90.496482','www.narayanganj.gov.bd',NULL,NULL),(44,'6','Tangail','টাঙ্গাইল','24.264145','89.918029','www.tangail.gov.bd',NULL,NULL),(45,'6','Kishoreganj','কিশোরগঞ্জ','24.444937','90.776575','www.kishoreganj.gov.bd',NULL,NULL),(46,'6','Manikganj','মানিকগঞ্জ','23.8602262','90.0018293','www.manikganj.gov.bd',NULL,NULL),(47,'6','Dhaka','ঢাকা','23.7115253','90.4111451','www.dhaka.gov.bd',NULL,NULL),(48,'6','Munshiganj','মুন্সিগঞ্জ','23.5435742','90.5354327','www.munshiganj.gov.bd',NULL,NULL),(49,'6','Rajbari','রাজবাড়ী','23.7574305','89.6444665','www.rajbari.gov.bd',NULL,NULL),(50,'6','Madaripur','মাদারীপুর','23.164102','90.1896805','www.madaripur.gov.bd',NULL,NULL),(51,'6','Gopalganj','গোপালগঞ্জ','23.0050857','89.8266059','www.gopalganj.gov.bd',NULL,NULL),(52,'6','Faridpur','ফরিদপুর','23.6070822','89.8429406','www.faridpur.gov.bd',NULL,NULL),(53,'7','Panchagarh','পঞ্চগড়','26.3411','88.5541606','www.panchagarh.gov.bd',NULL,NULL),(54,'7','Dinajpur','দিনাজপুর','25.6217061','88.6354504','www.dinajpur.gov.bd',NULL,NULL),(55,'7','Lalmonirhat','লালমনিরহাট','25.9165451','89.4532409','www.lalmonirhat.gov.bd',NULL,NULL),(56,'7','Nilphamari','নীলফামারী','25.931794','88.856006','www.nilphamari.gov.bd',NULL,NULL),(57,'7','Gaibandha','গাইবান্ধা','25.328751','89.528088','www.gaibandha.gov.bd',NULL,NULL),(58,'7','Thakurgaon','ঠাকুরগাঁও','26.0336945','88.4616834','www.thakurgaon.gov.bd',NULL,NULL),(59,'7','Rangpur','রংপুর','25.7558096','89.244462','www.rangpur.gov.bd',NULL,NULL),(60,'7','Kurigram','কুড়িগ্রাম','25.805445','89.636174','www.kurigram.gov.bd',NULL,NULL),(61,'8','Sherpur','শেরপুর','25.0204933','90.0152966','www.sherpur.gov.bd',NULL,NULL),(62,'8','Mymensingh','ময়মনসিংহ','24.7465670','90.4072093','www.mymensingh.gov.bd',NULL,NULL),(63,'8','Jamalpur','জামালপুর','24.937533','89.937775','www.jamalpur.gov.bd',NULL,NULL),(64,'8','Netrokona','নেত্রকোণা','24.870955','90.727887','www.netrokona.gov.bd',NULL,NULL);
/*!40000 ALTER TABLE `districts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `divisions`
--

DROP TABLE IF EXISTS `divisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `divisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8mb4_unicode_ci,
  `bn_name` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `divisions`
--

LOCK TABLES `divisions` WRITE;
/*!40000 ALTER TABLE `divisions` DISABLE KEYS */;
INSERT INTO `divisions` VALUES (1,'Chattagram','চট্টগ্রাম','www.chittagongdiv.gov.bd',NULL,NULL),(2,'Rajshahi','রাজশাহী','www.rajshahidiv.gov.bd',NULL,NULL),(3,'Khulna','খুলনা','www.khulnadiv.gov.bd',NULL,NULL),(4,'Barisal','বরিশাল','www.barisaldiv.gov.bd',NULL,NULL),(5,'Sylhet','সিলেট','www.sylhetdiv.gov.bd',NULL,NULL),(6,'Dhaka','ঢাকা','www.dhakadiv.gov.bd',NULL,NULL),(7,'Rangpur','রংপুর','www.rangpurdiv.gov.bd',NULL,NULL),(8,'Mymensingh','ময়মনসিংহ','www.mymensinghdiv.gov.bd',NULL,NULL);
/*!40000 ALTER TABLE `divisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_branch_admin`
--

DROP TABLE IF EXISTS `institute_branch_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_branch_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institue_branch_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_branch_admin`
--

LOCK TABLES `institute_branch_admin` WRITE;
/*!40000 ALTER TABLE `institute_branch_admin` DISABLE KEYS */;
INSERT INTO `institute_branch_admin` VALUES (1,2,2),(2,1,3),(3,6,29),(4,7,30),(5,11,31),(6,13,44);
/*!40000 ALTER TABLE `institute_branch_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_branch_contacts`
--

DROP TABLE IF EXISTS `institute_branch_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_branch_contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `intstitue_branch_id` bigint unsigned DEFAULT NULL,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` bigint unsigned DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_branch_contacts`
--

LOCK TABLES `institute_branch_contacts` WRITE;
/*!40000 ALTER TABLE `institute_branch_contacts` DISABLE KEYS */;
INSERT INTO `institute_branch_contacts` VALUES (1,1,'Mr','Admin 0','branch_admin0@gmail.com','01754841540',2,NULL,1,'2024-01-21 07:07:28','2024-01-21 07:07:28'),(2,2,'Mr','Admin 1','branch_admin1@gmail.com','01754841541',2,NULL,1,'2024-01-21 07:07:28','2024-01-21 07:07:28'),(3,6,'MD Murad','Hossain','muradhossain.web@gmail.com','01783711740',NULL,NULL,1,'2024-01-24 04:43:19','2024-01-24 04:43:19');
/*!40000 ALTER TABLE `institute_branch_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_branch_institute_student`
--

DROP TABLE IF EXISTS `institute_branch_institute_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_branch_institute_student` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_branch_id` bigint unsigned DEFAULT NULL,
  `institute_student_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_branch_institute_student`
--

LOCK TABLES `institute_branch_institute_student` WRITE;
/*!40000 ALTER TABLE `institute_branch_institute_student` DISABLE KEYS */;
INSERT INTO `institute_branch_institute_student` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,2,6),(7,2,7),(8,2,8),(9,2,9),(10,2,10),(11,2,11),(12,2,12),(13,2,13),(14,2,14),(15,2,15),(16,2,16),(17,11,17),(18,11,18),(19,11,19),(20,11,20),(21,11,21),(22,11,22),(23,11,23),(24,11,24),(25,11,25),(26,11,26),(27,11,27),(28,11,28),(29,11,29),(30,11,30),(31,11,31),(32,11,32),(33,11,33),(34,11,34),(35,11,35),(36,11,36),(37,11,37),(38,11,38),(39,11,39),(40,11,40),(41,11,41),(42,11,42),(43,11,43),(44,11,44),(45,11,45),(46,11,46),(47,11,47),(48,11,48),(49,11,49),(50,11,50),(51,11,51),(52,11,52),(53,11,53),(54,11,54),(55,11,55),(56,11,56),(57,11,57),(58,11,58),(59,11,59),(60,11,60),(61,11,61),(62,11,62),(63,11,63);
/*!40000 ALTER TABLE `institute_branch_institute_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_branch_institute_teacher`
--

DROP TABLE IF EXISTS `institute_branch_institute_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_branch_institute_teacher` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_branch_id` bigint unsigned DEFAULT NULL,
  `institute_teacher_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_branch_institute_teacher`
--

LOCK TABLES `institute_branch_institute_teacher` WRITE;
/*!40000 ALTER TABLE `institute_branch_institute_teacher` DISABLE KEYS */;
INSERT INTO `institute_branch_institute_teacher` VALUES (1,2,1),(2,2,2),(3,2,3),(4,2,4),(5,2,5),(6,11,6),(7,11,7),(8,11,8),(9,11,9);
/*!40000 ALTER TABLE `institute_branch_institute_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_branch_user`
--

DROP TABLE IF EXISTS `institute_branch_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_branch_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_branch_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_branch_user`
--

LOCK TABLES `institute_branch_user` WRITE;
/*!40000 ALTER TABLE `institute_branch_user` DISABLE KEYS */;
INSERT INTO `institute_branch_user` VALUES (1,2,2,NULL,NULL),(2,2,3,NULL,NULL),(3,2,4,NULL,NULL),(4,2,5,NULL,NULL),(5,2,6,NULL,NULL),(6,2,7,NULL,NULL),(7,2,8,NULL,NULL),(8,2,9,NULL,NULL),(9,2,10,NULL,NULL),(10,2,11,NULL,NULL),(11,2,12,NULL,NULL),(12,2,13,NULL,NULL),(13,2,14,NULL,NULL),(14,2,15,NULL,NULL),(15,2,16,NULL,NULL),(16,2,17,NULL,NULL),(17,2,18,NULL,NULL),(18,2,19,NULL,NULL),(19,2,20,NULL,NULL),(20,2,21,NULL,NULL),(21,2,22,NULL,NULL),(22,2,23,NULL,NULL),(23,2,24,NULL,NULL),(24,2,25,NULL,NULL),(25,2,26,NULL,NULL),(26,2,27,NULL,NULL),(27,3,28,NULL,NULL),(28,6,29,NULL,NULL),(29,7,30,NULL,NULL),(30,11,31,NULL,NULL),(31,11,32,NULL,NULL),(32,13,44,NULL,NULL),(33,11,46,NULL,NULL),(34,11,53,NULL,NULL),(35,11,54,NULL,NULL),(36,11,63,NULL,NULL),(37,11,64,NULL,NULL),(38,11,65,NULL,NULL),(39,11,66,NULL,NULL),(40,11,67,NULL,NULL),(41,11,68,NULL,NULL),(42,11,69,NULL,NULL),(43,11,70,NULL,NULL),(44,11,71,NULL,NULL),(45,11,72,NULL,NULL),(46,11,73,NULL,NULL),(47,11,74,NULL,NULL),(48,11,75,NULL,NULL),(49,11,76,NULL,NULL),(50,11,77,NULL,NULL),(51,11,78,NULL,NULL),(52,11,79,NULL,NULL),(53,11,80,NULL,NULL),(54,11,81,NULL,NULL),(55,11,82,NULL,NULL),(56,11,83,NULL,NULL),(57,11,84,NULL,NULL),(58,11,85,NULL,NULL),(59,11,86,NULL,NULL),(60,11,87,NULL,NULL),(61,11,88,NULL,NULL),(62,11,89,NULL,NULL),(63,11,90,NULL,NULL),(64,11,91,NULL,NULL),(65,11,92,NULL,NULL),(66,11,93,NULL,NULL),(67,11,94,NULL,NULL),(68,11,95,NULL,NULL),(69,11,96,NULL,NULL),(70,11,97,NULL,NULL),(71,11,98,NULL,NULL),(72,11,99,NULL,NULL),(73,11,100,NULL,NULL),(74,11,101,NULL,NULL),(75,11,102,NULL,NULL),(76,11,103,NULL,NULL),(77,11,104,NULL,NULL),(78,11,105,NULL,NULL),(79,11,106,NULL,NULL),(80,11,107,NULL,NULL),(81,11,108,NULL,NULL),(82,11,109,NULL,NULL),(83,11,110,NULL,NULL),(84,11,111,NULL,NULL),(85,11,112,NULL,NULL),(86,11,113,NULL,NULL),(87,11,114,NULL,NULL),(88,11,115,NULL,NULL),(89,11,116,NULL,NULL);
/*!40000 ALTER TABLE `institute_branch_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_branches`
--

DROP TABLE IF EXISTS `institute_branches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_branches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coaching_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district_id` bigint DEFAULT NULL,
  `division_id` bigint DEFAULT NULL,
  `upozila_id` bigint DEFAULT NULL,
  `branch_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `street` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `district` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `division` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_address` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_mobile_number` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `map_link` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `creator` bigint DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `is_central` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_branches`
--

LOCK TABLES `institute_branches` WRITE;
/*!40000 ALTER TABLE `institute_branches` DISABLE KEYS */;
INSERT INTO `institute_branches` VALUES (3,'Central','meritcare',NULL,NULL,NULL,'retina-cp','mirpur 1','Dhaka','Dhaka, Bangladesh','1216','Bangladesh',NULL,NULL,'Retina, Mirpur','Mirpur, Dhaka','retina_mimrpur@gmail.com','0175484154',NULL,'uploads/users/branch-37032.png',1,'central',1,1,'2024-01-21 07:07:28','2024-03-21 04:47:23'),(11,'Khulna','Hamming Bird',27,3,207,'KH-01','Mujgonni','Khulna','Khulna','9000','Bangladesh',NULL,NULL,'Hamming Bird','Khulna','hammingbird@gmail.com','01783711740',NULL,'uploads/users/branch-112417.jpg',1,'khulna',1,0,'2024-03-19 03:16:57','2024-03-19 03:16:57'),(13,'Khulna','Falcon',27,3,207,'KH - 02','New Market','Khulna','Khulna','9000','Bangladesh',NULL,NULL,'KH - 02 Falcon','New Market, Khulna','falcon@gmail.com','01727232424',NULL,NULL,1,'khulna',1,0,'2024-03-19 04:06:19','2024-03-19 04:06:19'),(14,'Khulna','Education',27,3,207,'KH-02','Mujgonni','Khulna',NULL,'9000','Bangladesh',NULL,NULL,'Education','Sat Rasta','abc@gmail.com','01727232854','<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3685.785469175344!2d89.11887057590151!3d22.5122308351791!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x39ff9b11fa7ff6e7%3A0xb1004aac9eb00212!2sMurad%20Gain!5e0!3m2!1sen!2sbd!4v1710994758970!5m2!1sen!2sbd\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>','home/meritxacademy/public_html/public/uploads/users/branch/5k2tAUU5LVjtGXmnaxmebB08kzcIICcWeRcsIpIg.jpg',1,'khulna',1,0,'2024-03-21 04:19:32','2024-03-21 04:49:19');
/*!40000 ALTER TABLE `institute_branches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_exam_marks`
--

DROP TABLE IF EXISTS `institute_class_batch_exam_marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_exam_marks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `batch_id` bigint DEFAULT NULL,
  `batch_class_id` bigint DEFAULT NULL,
  `institute_class_batch_exam_id` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `mark` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_exam_marks`
--

LOCK TABLES `institute_class_batch_exam_marks` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_exam_marks` DISABLE KEYS */;
INSERT INTO `institute_class_batch_exam_marks` VALUES (1,4,1,1,1,'2024-01-20',80.00,'2024-01-21 07:07:47','2024-01-21 07:07:47'),(2,5,1,1,1,'2024-01-20',80.00,'2024-01-21 07:07:47','2024-01-21 07:07:47'),(3,6,1,1,1,'2024-01-20',80.00,'2024-01-21 07:07:47','2024-01-21 07:07:47'),(4,7,1,1,1,'2024-01-20',80.00,'2024-01-21 07:07:47','2024-01-21 07:07:47'),(5,8,1,1,1,'2024-01-20',80.00,'2024-01-21 07:07:47','2024-01-21 07:07:47'),(6,65,9,7,7,'2024-03-23',50.00,'2024-03-23 04:47:42','2024-03-23 04:47:42'),(7,66,9,7,7,'2024-03-23',20.00,'2024-03-23 04:47:45','2024-03-23 04:47:47'),(8,67,9,7,7,'2024-03-23',30.00,'2024-03-23 04:47:50','2024-03-23 04:47:50'),(9,68,9,7,7,'2024-03-23',50.00,'2024-03-23 04:47:52','2024-03-23 04:47:52'),(10,69,9,7,7,'2024-03-23',50.00,'2024-03-23 04:47:54','2024-03-23 04:47:54'),(11,70,9,7,7,'2024-03-23',10.00,'2024-03-23 04:47:56','2024-03-23 04:47:56'),(12,71,9,7,7,'2024-03-23',50.00,'2024-03-23 04:47:59','2024-03-23 04:47:59');
/*!40000 ALTER TABLE `institute_class_batch_exam_marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_exams`
--

DROP TABLE IF EXISTS `institute_class_batch_exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_exams` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_class_batch_id` bigint unsigned NOT NULL,
  `subject_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `exam_title` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_exams`
--

LOCK TABLES `institute_class_batch_exams` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_exams` DISABLE KEYS */;
INSERT INTO `institute_class_batch_exams` VALUES (1,1,1,NULL,'Daily Model Test','2024-01-21 07:07:47','2024-01-21 07:07:47'),(2,2,2,NULL,'Daily Model Test','2024-01-21 07:07:47','2024-01-21 07:07:47'),(3,3,1,NULL,'Monthly Model Test','2024-01-21 07:07:47','2024-01-21 07:07:47'),(4,4,2,NULL,'Monthly Model Test','2024-01-21 07:07:47','2024-01-21 07:07:47'),(5,4,1,NULL,'Final Model Test','2024-01-21 07:07:47','2024-01-21 07:07:47'),(6,5,2,NULL,'Final Model Test','2024-01-21 07:07:47','2024-01-21 07:07:47'),(7,9,4,11,'Class test','2024-03-23 04:46:00','2024-03-23 04:46:00');
/*!40000 ALTER TABLE `institute_class_batch_exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_institute_class_batch_time_schedule`
--

DROP TABLE IF EXISTS `institute_class_batch_institute_class_batch_time_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_institute_class_batch_time_schedule` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_class_batch_id` bigint unsigned NOT NULL,
  `institute_class_batch_time_schedule_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_institute_class_batch_time_schedule`
--

LOCK TABLES `institute_class_batch_institute_class_batch_time_schedule` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_institute_class_batch_time_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `institute_class_batch_institute_class_batch_time_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_institute_class_subject`
--

DROP TABLE IF EXISTS `institute_class_batch_institute_class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_institute_class_subject` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_class_batch_id` bigint unsigned NOT NULL,
  `institute_class_subject_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_institute_class_subject`
--

LOCK TABLES `institute_class_batch_institute_class_subject` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_institute_class_subject` DISABLE KEYS */;
INSERT INTO `institute_class_batch_institute_class_subject` VALUES (9,9,1),(19,9,1),(21,1,3),(22,2,3),(23,3,3),(24,4,3),(25,5,3),(26,6,3),(32,9,4),(39,9,5),(41,10,6),(42,10,7),(43,10,8),(44,10,9),(45,10,10),(46,11,11),(47,11,12),(48,11,13),(49,11,14),(50,11,15),(51,11,16),(52,11,17),(53,12,18),(54,12,19),(55,12,20),(56,12,21),(57,13,22),(58,13,23),(59,13,24),(60,13,25),(61,13,26),(62,14,27),(63,14,28),(64,14,29),(65,14,30),(66,14,31),(67,14,32),(68,14,33),(69,15,34),(70,15,35),(71,15,36),(72,15,37),(73,16,38),(74,16,39),(75,16,40),(76,16,41),(77,16,42),(78,17,43),(79,17,44),(80,17,45),(81,17,46),(82,17,47),(83,17,48),(84,18,49),(85,18,50),(86,18,51),(87,18,52),(88,9,53),(89,19,54),(90,19,55),(91,19,56),(92,19,57),(93,19,58),(94,16,59);
/*!40000 ALTER TABLE `institute_class_batch_institute_class_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_institute_student`
--

DROP TABLE IF EXISTS `institute_class_batch_institute_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_institute_student` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_class_batch_id` bigint unsigned DEFAULT NULL,
  `institute_student_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_institute_student`
--

LOCK TABLES `institute_class_batch_institute_student` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_institute_student` DISABLE KEYS */;
INSERT INTO `institute_class_batch_institute_student` VALUES (1,1,1),(2,8,2),(3,1,3),(4,2,4),(5,8,5),(6,2,6),(7,1,7),(8,8,8),(9,1,9),(10,6,10),(11,5,11),(12,6,12),(13,4,13),(14,5,14),(15,3,15),(16,1,16),(17,9,17),(18,9,18),(19,9,19),(20,9,20),(21,9,21),(22,9,22),(23,9,23),(24,9,24),(25,9,25),(26,9,26),(27,10,27),(28,10,28),(29,10,29),(30,10,30),(31,10,31),(32,11,32),(33,11,33),(34,11,34),(35,11,35),(36,11,36),(37,12,37),(38,12,38),(39,12,39),(40,12,40),(41,13,41),(42,13,42),(43,13,43),(44,13,44),(45,14,45),(46,14,46),(47,14,47),(48,14,48),(49,14,49),(50,15,50),(51,15,51),(52,15,52),(53,15,53),(54,15,54),(55,16,55),(56,16,56),(57,16,57),(58,16,58),(59,16,59),(60,18,60),(61,16,63);
/*!40000 ALTER TABLE `institute_class_batch_institute_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_institute_teacher`
--

DROP TABLE IF EXISTS `institute_class_batch_institute_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_institute_teacher` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_class_batch_id` bigint unsigned DEFAULT NULL,
  `institute_teacher_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_institute_teacher`
--

LOCK TABLES `institute_class_batch_institute_teacher` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_institute_teacher` DISABLE KEYS */;
INSERT INTO `institute_class_batch_institute_teacher` VALUES (1,7,1),(2,7,2),(3,7,3),(4,7,4),(5,7,5);
/*!40000 ALTER TABLE `institute_class_batch_institute_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batch_time_schedules`
--

DROP TABLE IF EXISTS `institute_class_batch_time_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batch_time_schedules` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `room` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `institute_class_id` bigint unsigned DEFAULT NULL,
  `institute_class_batch_id` bigint unsigned DEFAULT NULL,
  `institute_class_teacher_id` bigint unsigned DEFAULT NULL,
  `institute_class_subject_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batch_time_schedules`
--

LOCK TABLES `institute_class_batch_time_schedules` WRITE;
/*!40000 ALTER TABLE `institute_class_batch_time_schedules` DISABLE KEYS */;
INSERT INTO `institute_class_batch_time_schedules` VALUES (1,'saturday','15:30:00','17:00:00','507',11,7,9,6,4,'2024-05-14 20:50:22','2024-05-14 20:54:44'),(2,'saturday','15:30:00','17:00:00','507',11,7,9,6,4,'2024-05-14 21:18:38','2024-05-14 21:18:38'),(3,'monday','14:30:00','15:30:00','607',11,7,9,6,4,'2024-05-14 21:18:38','2024-05-14 21:18:38'),(4,'sunday','14:30:00','15:30:00','602',11,7,9,7,5,'2024-05-14 21:18:38','2024-05-14 21:18:38'),(5,'wednesday','09:00:00','10:30:00','702',11,7,9,8,5,'2024-05-14 21:18:38','2024-05-14 21:18:38'),(6,'saturday','22:20:00','00:20:00','401',11,7,9,7,53,'2024-05-14 21:18:38','2024-05-14 21:18:38'),(7,'saturday','10:02:00','11:00:00','101',11,7,10,8,8,'2024-05-14 21:22:42','2024-05-14 21:22:42'),(8,'monday','12:00:00','22:00:00','202',11,7,10,6,8,'2024-05-14 21:22:42','2024-05-14 21:22:42'),(9,'tuesday','15:00:00','16:00:00','505',11,7,10,8,9,'2024-05-14 21:22:42','2024-05-14 21:22:42'),(10,'tuesday','07:02:00','08:03:00','705',11,7,10,7,10,'2024-05-14 21:22:42','2024-05-14 21:22:42');
/*!40000 ALTER TABLE `institute_class_batch_time_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_batches`
--

DROP TABLE IF EXISTS `institute_class_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_batches` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fee` float DEFAULT NULL,
  `institute_class_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_batches`
--

LOCK TABLES `institute_class_batches` WRITE;
/*!40000 ALTER TABLE `institute_class_batches` DISABLE KEYS */;
INSERT INTO `institute_class_batches` VALUES (1,'Shapla',550,1,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(2,'Beli',550,2,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(3,'Morning',550,3,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(4,'Evening',550,4,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(5,'Morning',550,5,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(6,'Evening',550,5,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(7,'Morning',550,6,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(8,'Evening',550,6,2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(9,'Allama Iqbal',550,7,11,'2024-03-19 03:24:05','2024-03-19 03:24:05'),(10,'Ibn Taymiyyah',550,7,11,'2024-03-19 03:29:08','2024-03-19 03:29:08'),(11,'Ibn Sina',550,8,11,'2024-03-19 03:29:43','2024-03-19 03:29:43'),(12,'Al Khawarizmi',550,8,11,'2024-03-19 03:31:05','2024-03-19 03:31:05'),(13,'Ibn Khaldun',550,8,11,'2024-03-19 03:31:45','2024-03-19 03:31:45'),(14,'Ibn Battuta',550,9,11,'2024-03-19 03:32:21','2024-03-19 03:32:21'),(15,'Abu Rayhan Biruni',550,9,11,'2024-03-19 03:34:06','2024-03-19 03:34:06'),(16,'Al Ghazali',550,9,11,'2024-03-19 03:35:17','2024-03-19 03:35:17'),(17,'Ibn Yunus',550,10,11,'2024-03-19 03:38:25','2024-03-19 03:38:25'),(18,'Al Masudi',550,10,11,'2024-03-19 03:39:02','2024-03-19 03:39:02'),(19,'Abu Yusuf',550,10,11,'2024-03-19 03:42:30','2024-03-19 03:42:30'),(20,'class 8 new batch',550,7,11,'2024-05-26 19:50:40','2024-05-26 19:50:56');
/*!40000 ALTER TABLE `institute_class_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_institute_class_subject`
--

DROP TABLE IF EXISTS `institute_class_institute_class_subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_institute_class_subject` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `institute_class_id` bigint unsigned NOT NULL,
  `institute_class_subject_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_institute_class_subject`
--

LOCK TABLES `institute_class_institute_class_subject` WRITE;
/*!40000 ALTER TABLE `institute_class_institute_class_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `institute_class_institute_class_subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_class_subjects`
--

DROP TABLE IF EXISTS `institute_class_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_class_subjects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `branch_id` bigint DEFAULT NULL,
  `subject_id` bigint DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_class_subjects`
--

LOCK TABLES `institute_class_subjects` WRITE;
/*!40000 ALTER TABLE `institute_class_subjects` DISABLE KEYS */;
INSERT INTO `institute_class_subjects` VALUES (2,2,2,'Math','2024-01-21 07:07:48','2024-01-21 07:07:48'),(3,2,3,'Bangla','2024-01-21 07:07:48','2024-01-21 07:07:48'),(4,11,4,'Science','2024-01-21 07:07:48','2024-03-21 08:26:33'),(5,11,5,'Math','2024-01-21 07:07:48','2024-03-21 08:38:41'),(8,11,8,'English 2nd','2024-03-21 08:27:58','2024-03-21 08:27:58'),(9,11,9,'Science','2024-03-21 08:27:58','2024-03-21 08:27:58'),(10,11,10,'Math','2024-03-21 08:27:58','2024-03-21 08:39:06'),(11,11,11,'English 2nd','2024-03-21 08:29:39','2024-03-21 08:29:39'),(12,11,12,'Physics','2024-03-21 08:29:39','2024-03-21 08:29:39'),(13,11,13,'Chamistry','2024-03-21 08:29:39','2024-03-21 08:29:39'),(14,11,14,'Higher Math','2024-03-21 08:29:39','2024-03-21 08:29:39'),(15,11,15,'Biology','2024-03-21 08:29:39','2024-03-21 08:29:39'),(16,11,16,'General Math','2024-03-21 08:29:39','2024-03-21 08:29:39'),(17,11,17,'Bangla 2nd','2024-03-21 08:29:39','2024-03-21 08:29:39'),(18,11,18,'English 2nd','2024-03-21 08:30:47','2024-03-21 08:30:47'),(19,11,19,'Math','2024-03-21 08:30:47','2024-03-21 08:30:47'),(20,11,20,'Bangla 2nd','2024-03-21 08:30:47','2024-03-21 08:30:47'),(21,11,21,'Economics','2024-03-21 08:30:47','2024-03-21 08:30:47'),(22,11,22,'English 2nd','2024-03-21 08:31:59','2024-03-21 08:31:59'),(23,11,23,'Math','2024-03-21 08:31:59','2024-03-21 08:31:59'),(24,11,24,'Bangla 2nd','2024-03-21 08:31:59','2024-03-21 08:31:59'),(25,11,25,'Accounting','2024-03-21 08:31:59','2024-03-21 08:31:59'),(26,11,26,'Management','2024-03-21 08:32:00','2024-03-21 08:32:00'),(27,11,27,'English 2nd','2024-03-21 08:33:19','2024-03-21 08:33:19'),(28,11,28,'Bangla 2nd','2024-03-21 08:33:19','2024-03-21 08:33:19'),(29,11,29,'General Math','2024-03-21 08:33:19','2024-03-21 08:33:19'),(30,11,30,'Physics','2024-03-21 08:33:19','2024-03-21 08:33:19'),(31,11,31,'Chamistry','2024-03-21 08:33:19','2024-03-21 08:33:19'),(32,11,32,'Biology','2024-03-21 08:33:19','2024-03-21 08:33:19'),(33,11,33,'Higher Math','2024-03-21 08:33:19','2024-03-21 08:33:19'),(34,11,34,'English 2nd','2024-03-21 08:34:10','2024-03-21 08:34:10'),(35,11,35,'Bangla 2nd','2024-03-21 08:34:10','2024-03-21 08:34:10'),(36,11,36,'Math','2024-03-21 08:34:10','2024-03-21 08:34:10'),(37,11,37,'Economics','2024-03-21 08:34:10','2024-03-21 08:34:10'),(38,11,38,'English 2nd ','2024-03-21 08:34:57','2024-03-21 08:34:57'),(39,11,39,'Bangla 2nd','2024-03-21 08:34:57','2024-03-21 08:34:57'),(40,11,40,'Math','2024-03-21 08:34:57','2024-03-21 08:34:57'),(41,11,41,'Acounting','2024-03-21 08:34:57','2024-03-21 08:34:57'),(42,11,42,'Management','2024-03-21 08:34:57','2024-03-21 08:34:57'),(43,11,43,'English 2nd','2024-03-21 08:36:07','2024-03-21 08:36:07'),(44,11,44,'Bangla 2nd','2024-03-21 08:36:07','2024-03-21 08:36:07'),(45,11,45,'General Math','2024-03-21 08:36:07','2024-03-21 08:36:07'),(46,11,46,'Physics','2024-03-21 08:36:07','2024-03-21 08:36:07'),(47,11,47,'Chamistry','2024-03-21 08:36:07','2024-03-21 08:36:07'),(48,11,48,'Higher Math','2024-03-21 08:36:07','2024-03-21 08:36:07'),(49,11,49,'English 2nd','2024-03-21 08:37:04','2024-03-21 08:37:04'),(50,11,50,'Bangla 2nd','2024-03-21 08:37:04','2024-03-21 08:37:04'),(51,11,51,'Math','2024-03-21 08:37:04','2024-03-21 08:37:04'),(52,11,52,'Economics','2024-03-21 08:37:04','2024-03-21 08:37:04'),(53,11,53,'English 2nd','2024-03-21 08:38:41','2024-03-21 08:38:41'),(54,11,54,'English 2nd','2024-03-23 03:51:05','2024-03-23 03:51:05'),(55,11,55,'Bangla 2nd','2024-03-23 03:51:05','2024-03-23 03:51:05'),(56,11,56,'General Math','2024-03-23 03:51:05','2024-03-23 03:51:05'),(57,11,57,'Accounting','2024-03-23 03:51:05','2024-03-23 03:51:05'),(58,11,58,'Mangement','2024-03-23 03:51:05','2024-03-23 03:51:05'),(59,11,59,'new subject','2024-05-14 19:20:49','2024-05-14 19:20:49');
/*!40000 ALTER TABLE `institute_class_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_classes`
--

DROP TABLE IF EXISTS `institute_classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_id` bigint NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_classes`
--

LOCK TABLES `institute_classes` WRITE;
/*!40000 ALTER TABLE `institute_classes` DISABLE KEYS */;
INSERT INTO `institute_classes` VALUES (1,'Class Five',2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(2,'Class Six',2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(3,'Class Seven',2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(4,'Class Eight',2,'2024-01-21 07:07:40','2024-01-21 07:07:40'),(5,'Class Nine',2,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(6,'Class Ten',2,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(7,'Class - 8',11,'2024-03-19 03:21:25','2024-03-19 03:21:25'),(8,'Class - 9',11,'2024-03-19 03:21:37','2024-03-19 03:21:37'),(9,'Class - 10',11,'2024-03-19 03:21:46','2024-03-19 03:21:46'),(10,'SSC Examinee 2025',11,'2024-03-19 03:23:08','2024-03-19 03:23:08');
/*!40000 ALTER TABLE `institute_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_contacts`
--

DROP TABLE IF EXISTS `institute_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_contacts`
--

LOCK TABLES `institute_contacts` WRITE;
/*!40000 ALTER TABLE `institute_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `institute_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_student_payments`
--

DROP TABLE IF EXISTS `institute_student_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_student_payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `account_log_id` bigint DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `for_month` date DEFAULT NULL,
  `institute_student_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_student_payments`
--

LOCK TABLES `institute_student_payments` WRITE;
/*!40000 ALTER TABLE `institute_student_payments` DISABLE KEYS */;
INSERT INTO `institute_student_payments` VALUES (1,4,2,7,550.00,'2024-01-20','2024-01-20',1,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(2,4,2,8,450.00,'2024-01-20','2024-01-20',1,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(3,6,2,9,1050.00,'2024-01-18','2024-01-18',3,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(4,7,2,10,950.00,'2024-01-17','2024-01-17',4,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(5,8,2,11,950.00,'2024-01-16','2024-01-16',5,'2024-01-21 07:07:41','2024-01-21 07:07:41'),(6,66,11,31,500.00,'2024-05-01','2024-05-01',21,'2024-05-14 17:28:11','2024-05-14 17:28:11'),(7,69,11,32,400.00,'2024-05-01','2024-05-01',24,'2024-05-26 07:50:51','2024-05-26 07:50:51'),(8,70,11,33,150.00,'2024-02-01','2024-02-01',25,'2024-05-26 07:51:04','2024-05-26 07:51:04'),(9,115,11,34,1500.00,'2024-05-01','2024-05-01',60,'2024-05-26 09:49:03','2024-05-26 09:49:03'),(10,116,11,35,400.00,'2024-05-01','2024-05-01',63,'2024-05-26 13:36:22','2024-05-26 13:36:22'),(11,116,11,36,1700.00,'2024-02-01','2024-02-01',63,'2024-05-26 13:36:30','2024-05-26 13:36:30'),(12,116,11,37,50.00,'2024-05-27','2024-03-01',63,'2024-05-27 06:47:33','2024-05-27 06:47:33'),(13,116,11,38,200.00,'2024-05-15','2024-04-01',63,'2024-05-27 07:23:05','2024-05-27 07:23:05'),(14,116,11,39,150.00,'2024-05-27','2024-07-01',63,'2024-05-27 07:26:47','2024-05-27 07:26:47'),(15,116,11,40,20.00,'2024-05-15','2024-07-01',63,'2024-05-27 07:27:17','2024-05-27 07:27:17'),(16,116,11,41,300.00,'2024-05-16','2024-07-01',63,'2024-05-27 07:29:00','2024-05-27 07:29:00'),(17,116,11,42,500.00,'2024-05-21','2024-07-01',63,'2024-05-27 07:32:18','2024-05-27 07:32:18');
/*!40000 ALTER TABLE `institute_student_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_students`
--

DROP TABLE IF EXISTS `institute_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `admission_date` date DEFAULT NULL,
  `monthly_fee` double DEFAULT NULL,
  `fee_start_from` date DEFAULT NULL,
  `creator` bigint unsigned DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_students`
--

LOCK TABLES `institute_students` WRITE;
/*!40000 ALTER TABLE `institute_students` DISABLE KEYS */;
INSERT INTO `institute_students` VALUES (1,7,'2024-01-20',500,'2024-02-04',1,'giU6UPLPvC',1,'male','2024-01-21 07:07:41','2024-05-26 18:57:53'),(2,8,'2024-01-20',500,'2024-02-04',1,'uPldDXGXHL',1,'male','2024-01-21 07:07:41','2024-05-26 18:57:53'),(3,9,'2024-01-20',500,'2024-02-04',1,'FpGE8At1sp',1,'female','2024-01-21 07:07:42','2024-05-26 18:57:53'),(4,10,'2024-01-20',500,'2024-02-04',1,'iygdaK1ikE',1,'female','2024-01-21 07:07:42','2024-05-26 18:57:53'),(5,11,'2024-01-20',500,'2024-02-04',1,'5suIy6bXXS',1,'male','2024-01-21 07:07:42','2024-05-26 18:57:53'),(6,12,'2024-01-20',500,'2024-02-04',1,'UKQLnU2V2X',1,'male','2024-01-21 07:07:42','2024-05-26 18:57:53'),(7,13,'2024-01-20',500,'2024-02-04',1,'Dh9hBiuGKC',1,'female','2024-01-21 07:07:42','2024-05-26 18:57:53'),(8,14,'2024-01-20',500,'2024-02-04',1,'xxsUUHV8Zj',1,'female','2024-01-21 07:07:42','2024-05-26 18:57:53'),(9,15,'2024-01-20',500,'2024-02-04',1,'ybImGgn5sY',1,'male','2024-01-21 07:07:42','2024-05-26 18:57:53'),(10,16,'2024-01-20',500,'2024-02-04',1,'m2L5KNYNzU',1,'female','2024-01-21 07:07:42','2024-05-26 18:57:53'),(11,17,'2024-01-20',500,'2024-02-04',1,'BGdXJBCgAW',1,'female','2024-01-21 07:07:42','2024-05-26 18:57:53'),(12,18,'2024-01-20',500,'2024-02-04',1,'UrCylt4k2N',1,'male','2024-01-21 07:07:42','2024-05-26 18:57:53'),(13,19,'2024-01-20',500,'2024-02-04',1,'Ch4p1IeIMa',1,'female','2024-01-21 07:07:43','2024-05-26 18:57:53'),(14,20,'2024-01-20',500,'2024-02-04',1,'TDdg7ChP39',1,'male','2024-01-21 07:07:43','2024-05-26 18:57:53'),(15,21,'2024-01-20',500,'2024-02-04',1,'8k6HydnujF',1,'male','2024-01-21 07:07:43','2024-05-26 18:57:53'),(16,22,'2024-01-20',500,'2024-02-04',1,'1tplOdJbR8',1,'female','2024-01-21 07:07:43','2024-05-26 18:57:53'),(17,54,'2024-03-20',NULL,'2024-04-04',31,'NetKlGSZ',0,'male','2024-03-21 05:03:52','2024-05-26 18:57:53'),(18,63,'2024-03-22',800,'2024-04-06',31,'xN5m0CzL',0,'male','2024-03-21 05:13:13','2024-05-26 18:57:53'),(19,64,'2024-03-12',NULL,'2024-03-27',31,'rKvfSvfW',0,'male','2024-03-21 05:13:24','2024-05-26 18:57:53'),(20,65,'2024-03-21',500,'2024-04-05',31,'XYKAYkvn',0,'male','2024-03-21 05:23:54','2024-05-26 18:57:53'),(21,66,'2024-03-21',500,'2024-04-05',31,'k19TVYgU',1,'male','2024-03-21 05:56:56','2024-05-26 18:57:53'),(22,67,'2024-03-21',500,'2024-04-05',31,'4tMmAtAg',1,'male','2024-03-21 05:58:29','2024-05-26 18:57:53'),(23,68,'2024-03-21',500,'2024-04-05',31,'o5TdJmeK',1,'male','2024-03-21 05:59:42','2024-05-26 18:57:53'),(24,69,'2024-03-21',500,'2024-04-05',31,'Cz1qdZQX',1,'male','2024-03-21 06:01:12','2024-05-26 18:57:53'),(25,70,'2024-03-21',500,'2024-04-05',31,'M5V5DTb1',1,'male','2024-03-21 06:02:03','2024-05-26 18:57:53'),(26,71,'2024-03-21',500,'2024-04-05',31,'TmjAZuuv',1,'male','2024-03-21 06:03:24','2024-05-26 18:57:53'),(27,72,'2024-03-21',500,'2024-04-05',31,'9tTcCe7E',1,'male','2024-03-21 06:09:05','2024-05-26 18:57:53'),(28,73,'2024-03-21',500,'2024-04-05',31,'R9W393Br',1,'male','2024-03-21 06:10:00','2024-05-26 18:57:53'),(29,74,'2024-03-21',500,'2024-04-05',31,'6ueMMaIn',1,'male','2024-03-21 06:13:40','2024-05-26 18:57:53'),(30,75,'2024-03-21',500,'2024-04-05',31,'2ISs3J5d',1,'male','2024-03-21 06:15:23','2024-05-26 18:57:53'),(31,76,'2024-03-01',500,'2024-03-16',31,'l9M4Z3ud',1,'male','2024-03-21 06:16:57','2024-05-26 18:57:53'),(32,77,'2024-03-21',700,'2024-04-05',31,'SgpJEJfM',1,'male','2024-03-21 06:28:25','2024-05-26 18:57:53'),(33,78,'2024-03-02',700,'2024-03-17',31,'kJpLxtox',1,'male','2024-03-21 06:33:55','2024-05-26 18:57:53'),(34,79,'2024-03-09',700,'2024-03-24',31,'sesqkTxw',1,'male','2024-03-21 06:35:34','2024-05-26 18:57:53'),(35,80,'2024-03-10',700,'2024-03-25',31,'yLv6Js6n',1,'male','2024-03-21 06:36:30','2024-05-26 18:57:53'),(36,81,'2024-03-09',700,'2024-03-24',31,'DkeeMlZZ',1,'male','2024-03-21 06:37:58','2024-05-26 18:57:53'),(37,82,'2024-03-08',500,'2024-03-23',31,'hFQ9k8q0',1,'male','2024-03-21 06:39:00','2024-05-26 18:57:53'),(38,83,'2024-03-06',500,'2024-03-21',31,'GUnxjQB9',1,'male','2024-03-21 06:40:04','2024-05-26 18:57:53'),(39,84,'2024-03-16',500,'2024-03-31',31,'40vsx4kd',1,'male','2024-03-21 06:41:01','2024-05-26 18:57:53'),(40,85,'2024-03-23',500,'2024-04-07',31,'1YCoFDqp',1,'male','2024-03-21 06:41:48','2024-05-26 18:57:53'),(41,86,'2024-03-21',500,'2024-04-05',31,'iKbrGyJs',1,'male','2024-03-21 06:46:11','2024-05-26 18:57:53'),(42,87,'2024-03-21',500,'2024-04-05',31,'wUoY3NRh',1,'male','2024-03-21 06:47:12','2024-05-26 18:57:53'),(43,88,'2024-03-20',500,'2024-04-04',31,'6OkbZS3r',1,'male','2024-03-21 06:48:50','2024-05-26 18:57:53'),(44,89,'2024-03-21',500,'2024-04-05',31,'Qu2KIu0M',1,'male','2024-03-21 06:49:50','2024-05-26 18:57:53'),(45,90,'2024-03-21',500,'2024-04-05',31,'diXj9gkW',1,'male','2024-03-21 06:51:21','2024-05-26 18:57:53'),(46,91,'2024-03-21',500,'2024-04-05',31,'AwcpaYgt',1,'male','2024-03-21 06:52:08','2024-05-26 18:57:53'),(47,92,'2024-03-21',500,'2024-04-05',31,'LVyNBx8H',1,'male','2024-03-21 06:54:11','2024-05-26 18:57:53'),(48,93,'2024-03-21',500,'2024-04-05',31,'fgU3EE4o',1,'male','2024-03-21 06:57:44','2024-05-26 18:57:53'),(49,94,'2024-03-21',500,'2024-04-05',31,'6HF3iZkv',1,'male','2024-03-21 06:58:52','2024-05-26 18:57:53'),(50,95,'2024-01-01',500,'2024-01-16',31,'rjKxvT8A',1,'male','2024-03-21 07:00:34','2024-05-26 18:57:53'),(51,96,'2024-01-01',500,'2024-01-16',31,'ZxyfKDfN',1,'male','2024-03-21 07:01:34','2024-05-26 18:57:53'),(52,97,'2024-01-02',500,'2024-01-17',31,'jpmlo0DY',1,'male','2024-03-21 07:03:22','2024-05-26 18:57:53'),(53,98,'2024-01-01',500,'2024-01-16',31,'KHRdNJHD',1,'male','2024-03-21 07:05:56','2024-05-26 18:57:53'),(54,99,'2024-01-01',500,'2024-01-16',31,'A2nmLYmx',1,'male','2024-03-21 07:07:19','2024-05-26 18:57:53'),(55,100,'2024-01-02',500,'2024-01-17',31,'rkVhxMp2',1,'male','2024-03-21 07:08:08','2024-05-26 18:57:53'),(56,101,'2024-01-02',500,'2024-01-17',31,'W0Idckbl',1,'male','2024-03-21 07:09:10','2024-05-26 18:57:53'),(57,102,'2024-01-02',500,'2024-01-17',31,'i5JMYTOC',1,'male','2024-03-21 07:10:04','2024-05-26 18:57:53'),(58,103,'2024-01-02',500,'2024-01-17',31,'GsExOd3S',1,'male','2024-03-21 07:10:48','2024-05-26 18:57:53'),(59,104,'2024-01-02',500,'2024-01-17',31,'ISzup1pl',1,'male','2024-03-21 07:11:33','2024-05-26 18:57:53'),(60,115,'2024-05-26',500,'2024-06-10',31,'LejaBzcx',1,'female','2024-05-26 09:00:00','2024-05-26 18:57:53'),(61,114,'2024-05-26',350,'2024-06-10',31,'LejaBzcx',1,'female','2024-05-26 09:00:00','2024-05-26 18:57:53'),(62,113,'2024-05-26',400,'2024-06-10',31,'LejaBzcx',1,'female','2024-05-26 09:00:00','2024-05-26 18:57:53'),(63,116,'2023-01-01',800,'2023-01-16',31,'LcyFkJv1',1,'male','2024-05-26 18:46:20','2024-05-26 18:57:53');
/*!40000 ALTER TABLE `institute_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `institute_teachers`
--

DROP TABLE IF EXISTS `institute_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `institute_teachers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `education` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `linkedin_link` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `creator` bigint unsigned DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_teachers`
--

LOCK TABLES `institute_teachers` WRITE;
/*!40000 ALTER TABLE `institute_teachers` DISABLE KEYS */;
INSERT INTO `institute_teachers` VALUES (1,23,'BSC',NULL,NULL,NULL,NULL,'2022-03-21',1,'EWbHq',1,'2024-01-21 07:07:43','2024-01-21 07:07:43'),(2,24,'BSC',NULL,NULL,NULL,NULL,'2022-02-21',1,'jKY6X',1,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(3,25,'BSC',NULL,NULL,NULL,NULL,'2022-01-21',1,'ZpGOK',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(4,26,'BSC',NULL,NULL,NULL,NULL,'2021-12-21',1,'Y9adG',1,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(5,27,'BSC',NULL,NULL,NULL,NULL,'2021-11-21',1,'idHOK',1,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(6,105,'Diploma Engineer','https://www.facebook.com/saifullah.mansur.79219?mibextid=ZbWKwL','saifullahmansur1515@gmail.com','https://x.com/SaifullahM82613?t=tjz5SXA5KmEFoDCEBSZ7RA&s=08',NULL,'2024-01-01',31,'P1hPJz9T',1,'2024-03-21 08:12:35','2024-03-21 08:12:35'),(7,107,'Alim',NULL,NULL,NULL,NULL,'2024-03-01',31,'U1vN1pzv',1,'2024-03-21 08:45:11','2024-03-21 08:45:11'),(8,108,'Honors',NULL,'harunkhan@gmail.com',NULL,NULL,'2024-03-01',31,'sqpdm2h2',1,'2024-03-21 08:46:52','2024-03-21 08:46:52'),(9,110,NULL,NULL,NULL,NULL,NULL,'2024-04-16',31,'2A9SMdQD',1,'2024-04-17 07:43:32','2024-04-17 07:43:32');
/*!40000 ALTER TABLE `institute_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_applications`
--

DROP TABLE IF EXISTS `leave_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_applications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `duration` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_applications`
--

LOCK TABLES `leave_applications` WRITE;
/*!40000 ALTER TABLE `leave_applications` DISABLE KEYS */;
INSERT INTO `leave_applications` VALUES (1,12,2,'Reason for taking a leave 12','2023-02-21','2023-03-05','12','2','pending','2024-01-21 07:07:50','2024-01-21 07:07:50'),(2,13,2,'Reason for taking a leave 13','2023-01-21','2023-02-03','13','2','pending','2024-01-21 07:07:50','2024-01-21 07:07:50'),(3,14,2,'Reason for taking a leave 14','2022-12-21','2023-01-04','14','2','pending','2024-01-21 07:07:50','2024-01-21 07:07:50'),(4,15,2,'Reason for taking a leave 15','2022-11-21','2022-12-06','15','2','pending','2024-01-21 07:07:50','2024-01-21 07:07:50'),(5,16,2,'Reason for taking a leave 16','2022-10-21','2022-11-06','16','2','pending','2024-01-21 07:07:50','2024-01-21 07:07:50'),(6,105,11,'Seek Leave','2024-03-23','2024-03-25','3','31','accepted','2024-03-23 04:24:52','2024-03-23 04:24:52'),(7,106,11,'Seek Leave','2024-03-23','2024-03-25','3','31','accepted','2024-03-23 04:25:25','2024-03-23 04:25:34');
/*!40000 ALTER TABLE `leave_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(6,'2016_06_01_000004_create_oauth_clients_table',1),(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(8,'2019_08_19_000000_create_failed_jobs_table',1),(9,'2022_11_23_044055_create_user_roles_table',1),(10,'2022_11_23_063518_create_user_permissions_table',1),(11,'2023_02_13_225810_create_contact_messages_table',1),(12,'2023_03_05_125232_create_asset_categories_table',1),(13,'2023_03_05_130843_create_asset_shops_table',1),(14,'2023_03_05_132358_create_institute_contacts_table',1),(15,'2023_03_05_1678017871_create_product_order_details_table',1),(16,'2023_03_05_1678019753_create_product_orders_table',1),(17,'2023_03_05_1678020437_create_branch_assets_table',1),(18,'2023_03_06_095741_create_institute_branch_contacts_table',1),(19,'2023_03_06_100607_create_institute_teachers_table',1),(20,'2023_03_06_100937_create_institute_classes_table',1),(21,'2023_03_06_101710_create_institute_class_batches_table',1),(22,'2023_03_06_102208_create_institute_students_table',1),(23,'2023_03_06_102434_create_institute_student_payments_table',1),(24,'2023_03_06_102839_create_institute_class_batch_exams_table',1),(25,'2023_03_06_102957_create_institute_class_batch_exam_marks_table',1),(26,'2023_03_06_103228_create_institute_class_subjects_table',1),(27,'2023_03_06_103719_create_institute_class_batch_time_schedules_table',1),(28,'2023_03_06_110446_create_customers_table',1),(29,'2023_03_06_114645_create_crm_call_histories_table',1),(30,'2023_03_06_114828_create_crm_sms_histories_table',1),(31,'2023_03_06_115231_create_crm_communicatoin_topics_table',1),(32,'2023_03_06_115405_create_crm_sms_templates_table',1),(33,'2023_03_06_120009_create_user_salary_statements_table',1),(34,'2023_03_06_120344_create_user_attendences_table',1),(35,'2023_03_06_120445_create_user_reviews_table',1),(36,'2023_03_06_120654_create_notification_users_table',1),(37,'2023_03_06_120844_create_notifications_table',1),(38,'2023_03_06_130851_create_branch_accounts_table',1),(39,'2023_03_06_131001_create_branch_account_logs_table',1),(40,'2023_03_06_131240_create_account_categories_table',1),(41,'2023_03_06_131401_create_subscribers_table',1),(42,'2023_03_06_131544_create_settings_table',1),(43,'2023_03_06_134448_create_products_table',1),(44,'2023_03_06_134551_create_product_stocks_table',1),(45,'2023_03_06_134643_create_product_stock_logs_table',1),(46,'2023_03_06_134728_create_product_suppliers_table',1),(47,'2023_03_11_105838_create_institute_branches_table',1),(48,'2023_03_25_092627_create_product_discounts_table',1),(49,'2023_05_13_070040_create_attendences_table',1),(50,'2023_05_27_052831_create_account_details_table',1),(51,'2023_06_21_210700_create_banners_table',1),(52,'2023_06_21_220411_create_news_events_table',1),(53,'2023_06_21_220435_create_notices_table',1),(54,'2023_08_03_105048_create_leave_applications_table',1),(55,'2023_08_07_161801_create_breaking_news_table',1),(56,'2023_08_22_154912_create_user_salaries_table',1),(57,'2023_09_17_093221_create_salary_categories_table',1),(58,'2023_12_11_171604_create_divisions_table',1),(59,'2023_12_11_171629_create_districts_table',1),(60,'2023_12_11_171709_create_upozilas_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_events`
--

DROP TABLE IF EXISTS `news_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_events` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` tinytext COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_events`
--

LOCK TABLES `news_events` WRITE;
/*!40000 ALTER TABLE `news_events` DISABLE KEYS */;
/*!40000 ALTER TABLE `news_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notices`
--

DROP TABLE IF EXISTS `notices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` tinytext COLLATE utf8mb4_unicode_ci,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification_users`
--

DROP TABLE IF EXISTS `notification_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification_users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `notification_id` bigint unsigned NOT NULL,
  `seen` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification_users`
--

LOCK TABLES `notification_users` WRITE;
/*!40000 ALTER TABLE `notification_users` DISABLE KEYS */;
INSERT INTO `notification_users` VALUES (1,3,1,0,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(2,4,2,0,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(3,4,3,0,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(4,5,4,0,'2024-01-21 07:07:38','2024-01-21 07:07:38');
/*!40000 ALTER TABLE `notification_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,'A new student is added','A new student is added to the class 9 regular batch','2024-01-20 07:07:38','2024-01-21 07:07:38','2024-01-21 07:07:38'),(2,'A student course payment fullfiled','A student payment added for this month','2024-01-19 07:07:38','2024-01-21 07:07:38','2024-01-21 07:07:38'),(3,'A student course payment fullfiled','A student payment added for this month','2024-01-18 07:07:38','2024-01-21 07:07:38','2024-01-21 07:07:38'),(4,'A new batch is started','A new batch is started','2024-01-17 07:07:38','2024-01-21 07:07:38','2024-01-21 07:07:38');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` VALUES ('08e79a8ad1af69d809d4a13f83a9dd2f5232ecdeb8fb5bfe20987e0a4d9c5393d8fa43f24c9dfc87',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2023-12-31 12:04:36','2023-12-31 12:04:36','2024-12-31 18:04:36'),('0b6874bc20cb53bf0badf96ba11b2f0df9e024c4b0a7546a8121dbedc602b5923cc6510d26bb7dea',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 05:26:25','2024-03-21 05:26:25','2025-03-21 11:26:25'),('0c5ea03522f2b635d4c7e9a1113e609f16e763b868baecc83c1a6c7010de9eb5759a773e5b0e95ee',29,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-24 05:00:35','2024-01-24 05:00:35','2025-01-24 11:00:35'),('0f71c4a8f9a566c9f9d0612449abf612abe060cc1a50e1cf20ca789fdfaceabd132a4cbd8dd9bb8f',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-26 16:36:44','2024-05-26 16:36:44','2025-05-26 22:36:44'),('15210a1f9df936272406d8e5041a0496e63e5e5dc12e285a90aef688cb3dc9b380b4601427f3456c',29,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-24 04:46:30','2024-01-24 04:46:30','2025-01-24 10:46:30'),('1f85a6d6ae928c314aab2e545f0d6cff3555d75adcd5039726ae8887bcd31f4b642b951d3c72f81e',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-04-18 16:47:05','2024-04-18 16:47:05','2025-04-18 22:47:05'),('27307872c97f31846dcd03878e71e1d7f6792eaa2a4d5ed4e8e83c171956d8f45b50a78c45783d2e',2,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',1,'2024-04-17 06:39:41','2024-04-17 06:39:41','2025-04-17 12:39:41'),('283425a30e1564d493aab976dcecd35749bbe570b68e617e64a3532ed3fb3190112be842f226ced5',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-23 06:55:47','2024-01-23 06:55:47','2025-01-23 12:55:47'),('29beadf77ace4a7a08d2e2f163c7fcad69f1454b64acdfdbc5b541ee4aa6ff276f5c7c81347ba0e2',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-19 03:55:39','2024-03-19 03:55:39','2025-03-19 09:55:39'),('2ccd59a919f6fb685ba03eb43a70010ce0588ef92f52664e535bcc8c05d53eda4bcbc983c73bed9c',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-15 10:02:03','2024-03-15 10:02:03','2025-03-15 16:02:03'),('3807eadef597e7381d90a825972e29a8ccf5f801d5e23b517b6005e3a159dec424bfbca9ba460eb1',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-21 06:35:11','2024-01-21 06:35:11','2025-01-21 12:35:11'),('3aa2dda8d73675fa2cb39618f1a47c36c752f856d016756a3d33f12d811ebeab2617965209082d2d',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-19 04:05:24','2024-03-19 04:05:24','2025-03-19 10:05:24'),('421317a84caff42f76ef9556dd37b42065be19c55c6ee7c84b769408cef25d03caa907d6257f7469',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-23 07:59:06','2024-01-23 07:59:06','2025-01-23 13:59:06'),('486152ab12e12839422c7b459241de73bc4fb0734579de25558bd30ff25b5afe4430b3f513dc6624',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-03-21 04:25:54','2024-03-21 04:25:54','2025-03-21 10:25:54'),('49d837df22a605cc17769e8a2f34ab000d8d47a71c2645d773cbb3d908ceb3ce814b3910c575676f',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-04-18 09:51:42','2024-04-18 09:51:42','2025-04-18 15:51:42'),('4ae26f0777fdd156836e5d950e3b4ac6bcea0b2a49010fcd3a8b9ccb7eb18828cf19eb6d65d29b53',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-14 21:39:12','2024-05-14 21:39:12','2025-05-15 03:39:12'),('5451d2f11d1470c4ea5c58aa50c424411725613fa1ea0d8a01b7f2e4fc95c97a28e95bf5b7de2e05',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-27 07:18:58','2024-05-27 07:18:58','2025-05-27 13:18:58'),('55af31acb1c805c847b2e5146defa8834afe14395a71761b5eadde4c788338137fb17555a6bbb644',2,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2023-12-31 12:03:39','2023-12-31 12:03:39','2024-12-31 18:03:39'),('57e8b60a061947d2c967a646d65e845e47e2dfa3d214d88cbac1c18141a7d9cc421633a8def061a7',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-27 06:45:33','2024-05-27 06:45:33','2025-05-27 12:45:33'),('5a25d5e65bc3883d7740da8f2169d0b25b5d8c8ccbd57ec0c723cb45473c3ba4c0a5f81eacc4c7ba',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-27 09:36:25','2024-05-27 09:36:25','2025-05-27 15:36:25'),('5e3f03d1a260bd0f1f1914196a3f3bfd4f7b639aa9d1efe0d2c1201551ddb962ecc768967c9854f8',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 09:47:46','2024-03-21 09:47:46','2025-03-21 15:47:46'),('5e844a6c26d0cd004cb85da9e3ef5c4b5bc521fb58bafe28cc4d0cebe531e33a8d83ca308e065524',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-21 06:21:52','2024-01-21 06:21:52','2025-01-21 12:21:52'),('65e2ce84b949a2deaad09f2a39e5b2e5df3a2b6b8493371b5dd9e832fcaefe3c8843aa5463f2a0d5',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-04-09 17:54:48','2024-04-09 17:54:48','2025-04-09 23:54:48'),('69d14f0a1d1cd68d827a805eb1ee5665452259ad0516695611d4d31bc3f97015d1ca9aa0778caa9f',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-19 03:19:55','2024-03-19 03:19:55','2025-03-19 09:19:55'),('74c91a30e17a9cdb4c27eb76e74e2ca84ef2cf64125cd711412f8d20cbd293e673cd98025d18b49c',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-21 06:55:49','2024-01-21 06:55:49','2025-01-21 12:55:49'),('76a4d55997f56a7f78da973a414361317419674fd08ee64eac1e5f5add206cf32237aab3090ae936',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-03-21 04:17:07','2024-03-21 04:17:07','2025-03-21 10:17:07'),('77c965b171602925cdd7c093171b83f706d5cba917eb111af62df4a736d403eb7655907d2afc458e',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 09:37:27','2024-03-21 09:37:27','2025-03-21 15:37:27'),('7d35a68118f8030ef78fcc2209a07fda663b2272a8c8a90041088a2b7e72cac1bf9c730771ea5831',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-03-21 04:26:22','2024-03-21 04:26:22','2025-03-21 10:26:22'),('7ea66c3a2e82def7297af74204e7713642a2df087d5aced20e539b18fd61ddd734b366bd5a55a2c0',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 04:58:05','2024-03-21 04:58:05','2025-03-21 10:58:05'),('80a1c7dec147923d11a8ad0940ad4e383b529695990f061710d2b53a5f420d5e586d0904d0b89f9e',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 04:58:08','2024-03-21 04:58:08','2025-03-21 10:58:08'),('81a02195f844658881893eabaeca4d5c4f6e2b8297b3f02181a19fbf9df9585de53179b21b4dd3db',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-24 04:23:51','2024-01-24 04:23:51','2025-01-24 10:23:51'),('8abc175c9e678de8449a595dca55ad4994728f30e645287842dd824ff3310dccc535b3a301981e2c',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-04-09 17:53:40','2024-04-09 17:53:40','2025-04-09 23:53:40'),('92b1557b253d3e564f13e81d42cb93336c2d7f962eb2b256cad0af203cd16fc4fcf4011cd1cdadc5',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-21 11:12:54','2024-01-21 11:12:54','2025-01-21 17:12:54'),('92f41ef8d84303217a528d88881dd8ce22eb321823136d19315105c344e1adb22c947a1b1571ebba',3,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-03-21 04:25:23','2024-03-21 04:25:23','2025-03-21 10:25:23'),('988ac43dc7a7e253dadbc10f78cbf7cd721c1f680fc40c417b504fcaee90bb934cf57376c8724818',2,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-21 06:52:38','2024-01-21 06:52:38','2025-01-21 12:52:38'),('99c082cce968da7958e927ecbb9c52792787c102b83bfc8a995a91153549c9f2b7acfec703d798c0',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',1,'2024-05-14 17:06:22','2024-05-14 17:06:22','2025-05-14 23:06:22'),('9c03784071c18c76563ca61b23fa67745d115f45c19b2839750c85a3c27b7d95bee47dea988cbfd1',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 05:03:35','2024-03-21 05:03:35','2025-03-21 11:03:35'),('a0f8c304873d4cd4e7ddff95dc2ce4d313b0a441e5d1144af75123f481b9bf16f662dec85122063f',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-21 10:24:20','2024-01-21 10:24:20','2025-01-21 16:24:20'),('a6f2037fd8c71e869b335182538b4ffd055d2d0b6ea5a06754554e4c890fd5020e1aba075a4e6aa6',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 05:35:40','2024-03-21 05:35:40','2025-03-21 11:35:40'),('a7acd79b6280d6aeece2199fa35d47b47bc37ef06ae88840ef34340940ac7e7358eaf0c6428074cc',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 07:32:43','2024-03-21 07:32:43','2025-03-21 13:32:43'),('a86d02b46f37e110acac919af75f24fc5b1f882c9775e2e7164e8ea25a3b3b76d5f73d5ca8fdde6a',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-23 08:12:27','2024-03-23 08:12:27','2025-03-23 14:12:27'),('b29fabcd761e2a8a07a9991ab1d57a2b1a5beaac2a8472fb51f93ebbc1b37501c14107449e3b11aa',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 08:10:11','2024-03-21 08:10:11','2025-03-21 14:10:11'),('b52ddf0033f3d06872e67285726c4800c6a5b427ca9ce1022e48681d57e5b0678c43309f5f028913',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-04-17 07:11:32','2024-04-17 07:11:32','2025-04-17 13:11:32'),('b6fb3e7f401a43545ba316a61fb23e12476c21ad974a56981b5f67fb55dc35b9bde205219471b4f4',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 04:26:17','2024-03-21 04:26:17','2025-03-21 10:26:17'),('bc1cb0f6d09962b3d130aa40e0327adb423215a67057adf825969040d913e61074579a2603d5e1cb',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-02-25 21:01:37','2024-02-25 21:01:37','2025-02-26 03:01:37'),('bce6f99a8c1fccc1b1d21aa79bed8c07c9b226d8df010b7a105e3c1168ad796e4ed14b5e88e665ec',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-21 06:05:58','2024-01-21 06:05:58','2025-01-21 12:05:58'),('bf56e16085ef680ab20f744037aa015d3baf58642fcab1540b14bd10fce18ec18f5c5aedc1b13022',2,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-21 06:21:05','2024-01-21 06:21:05','2025-01-21 12:21:05'),('bfa6f1d084580e108ac13dcc4fb4f73323a7f67ea0ad02c9f96bbcf4bec8d0d3a64e45dc8d9b688c',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-23 09:32:43','2024-03-23 09:32:43','2025-03-23 15:32:43'),('c0c4a05f410f24873efa32dc85f1a5de362ca18f2c832fa27f6790aa108c953449d1edba40181896',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-19 03:20:27','2024-03-19 03:20:27','2025-03-19 09:20:27'),('c5eb111807e549b69fa9a69afca50220b2554d24a7141fb6cc552b3b0767677ed63c6124ab5d0d96',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-19 03:10:52','2024-03-19 03:10:52','2025-03-19 09:10:52'),('c64766e67fbba11753f3b9a6e4bbe5eb663b749f0a717ad1646fd7f12b51fa8a1a39a3229c0efbf2',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-04-18 11:56:25','2024-04-18 11:56:25','2025-04-18 17:56:25'),('c6d3cee258a7d07560654f546aea4f728fe12b5208e770a2c0904972e245d3b524fd4b83a040b542',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 06:28:21','2024-03-21 06:28:21','2025-03-21 12:28:21'),('c6f0933139355fc0a1ac1d27e59a3718856a650bfe4b1715498b6c3bd6cf92f579b5f3f0be123946',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-04-18 16:47:08','2024-04-18 16:47:08','2025-04-18 22:47:08'),('cb7bc4a3f2d5fb421b6fa0693047bc8fac8ed3e5f0416d0b5d8cc4bcc11ed5bc7b77c3015e215275',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-04-09 17:54:14','2024-04-09 17:54:14','2025-04-09 23:54:14'),('d095c8fe5fd2ae3e008e55596f9979c0b83609c492a30fed2e8c4f1cc280ea7c61fa6de049fbb57a',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 06:38:32','2024-03-21 06:38:32','2025-03-21 12:38:32'),('d1c1f5b4ee03b48ba5bf252f6f20ac4e9306c3fb8c0006bd367176f72747acd145a397d6e60d110d',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-21 05:54:25','2024-03-21 05:54:25','2025-03-21 11:54:25'),('d4ba10afcedebc15864ff03f706f6f053f08786c4efa518966266bd5fa86abac56ed231299a0f10b',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-27 09:19:59','2024-05-27 09:19:59','2025-05-27 15:19:59'),('d79e08f0576b41c1bc1e3beb75905170d60a00ac200aacea1b4a818cfdf4b7dae25825fb95e7ddce',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-26 07:44:47','2024-05-26 07:44:47','2025-05-26 13:44:47'),('d9e83cc99b53ba4f8fadfd088065733edce1ac61490b5d190b364b12168e819affcf2fe5caca3cec',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-14 21:39:14','2024-05-14 21:39:14','2025-05-15 03:39:14'),('dcd2c67fa03f1d24d67c11dc4ab739663391d0e64ed98486380d32525ed36f2ec50d65c6e0870d50',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-21 13:24:45','2024-01-21 13:24:45','2025-01-21 19:24:45'),('e0678ef1bf6103bd60cd6fb2c492999f1a43642a1c03d6b8f78efffe27738e9f957b4dfedc49a852',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-05-26 16:55:01','2024-05-26 16:55:01','2025-05-26 22:55:01'),('e7dc85bc44c3de5812cf5d2a7161914e98d8c9401a70cdbe12acf58859f84997726bb5ee6290a6fc',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-01 16:22:16','2024-03-01 16:22:16','2025-03-01 22:22:16'),('eb0e3a4e40cbd1e4322e8b1af316bc6e6869e2477e1c40dea8283f858cf5ae5b1df666685e3d28c5',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-21 05:40:35','2024-01-21 05:40:35','2025-01-21 11:40:35'),('f3c5e3b56a2147b5c901371a80f066c731f6388e6bec7f7ece691d69425182a55e3ddc3724386dcc',1,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-01-21 10:32:38','2024-01-21 10:32:38','2025-01-21 16:32:38'),('f6b9ae94db03084d497c6cd433baa65708afe17a41208e0c743f468ac94525ca7191959c8c798850',31,'9bd3b313-436f-4865-9041-fcfdcb211f0d','accessToken','[]',0,'2024-04-18 08:46:06','2024-04-18 08:46:06','2025-04-18 14:46:06'),('f9dd90740256cbb39a2f8f388ffceeb258cf58207290344e4989ce903425421c3504dd7cd832f3b7',2,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',1,'2024-01-21 05:40:14','2024-01-21 05:40:14','2025-01-21 11:40:14'),('fa4ac27d5c66786e91130bab5d8d5f65b2e7f080731c2c5633d8615af31c70cd1775bd1caf999e8d',31,'9afae7c6-3a50-4461-acf9-7941e5509191','accessToken','[]',0,'2024-03-23 03:47:50','2024-03-23 03:47:50','2025-03-23 09:47:50');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` VALUES ('9afae7c6-3a50-4461-acf9-7941e5509191',NULL,'Meritcare Academy Personal Access Client','lW2t8b8TTQ5q4GXj4CscB9eVWunZ7tjrpXxm9LDO',NULL,'http://localhost',1,0,0,'2023-12-31 12:03:30','2023-12-31 12:03:30'),('9afae7c6-bc33-496c-b230-5680a2fea2f2',NULL,'Meritcare Academy Password Grant Client','Fat20Le5eSxPxyyryANtURawMbHONxsPXju8Vnfx','users','http://localhost',0,1,0,'2023-12-31 12:03:30','2023-12-31 12:03:30'),('9bd3b313-436f-4865-9041-fcfdcb211f0d',NULL,'Coaching management system Personal Access Client','kWVUBQRFvg656WxK4xtLRqqJ6IChU8sF1VAdmHaI',NULL,'http://localhost',1,0,0,'2024-04-17 06:30:48','2024-04-17 06:30:48'),('9bd3b314-887c-42a5-bd1a-d397c55e7b52',NULL,'Coaching management system Password Grant Client','ppnNS59DJ58O9KgWgyPfijotoSh5tlorKFbcCqRY','users','http://localhost',0,1,0,'2024-04-17 06:30:48','2024-04-17 06:30:48');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `client_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` VALUES (1,'9afae7c6-3a50-4461-acf9-7941e5509191','2023-12-31 12:03:30','2023-12-31 12:03:30'),(2,'9bd3b313-436f-4865-9041-fcfdcb211f0d','2024-04-17 06:30:48','2024-04-17 06:30:48');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_discounts`
--

DROP TABLE IF EXISTS `product_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_discounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `discount_type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_percent` int DEFAULT NULL,
  `amount` double(8,2) DEFAULT NULL,
  `last_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_discounts`
--

LOCK TABLES `product_discounts` WRITE;
/*!40000 ALTER TABLE `product_discounts` DISABLE KEYS */;
INSERT INTO `product_discounts` VALUES (1,1,'flat',NULL,10.00,'2025-01-21','2024-01-21 07:07:38','2024-01-21 07:07:38'),(2,2,'percent',5,7.00,'2025-01-21','2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,3,'percent',2,3.00,'2025-01-21','2024-01-21 07:07:39','2024-01-21 07:07:39');
/*!40000 ALTER TABLE `product_discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order_details`
--

DROP TABLE IF EXISTS `product_order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_order_details` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `order_id` bigint DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount` double(8,2) DEFAULT NULL,
  `total` double(8,2) DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order_details`
--

LOCK TABLES `product_order_details` WRITE;
/*!40000 ALTER TABLE `product_order_details` DISABLE KEYS */;
INSERT INTO `product_order_details` VALUES (1,1,1,5,150,0.00,750.00,NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(2,2,2,7,150,0.00,1050.00,NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,3,3,4,150,0.00,450.00,NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(4,1,4,5,150,0.00,750.00,NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(5,3,4,5,150,0.00,750.00,NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(6,2,5,50,150,NULL,7500.00,NULL,NULL,1,'2024-03-23 04:49:18','2024-03-23 04:49:18'),(7,3,6,20,150,NULL,3000.00,NULL,NULL,1,'2024-03-23 04:49:26','2024-03-23 04:49:26'),(8,1,7,10,150,NULL,1500.00,NULL,NULL,1,'2024-03-23 04:49:39','2024-03-23 04:49:39');
/*!40000 ALTER TABLE `product_order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_orders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `total_amount` double(8,2) DEFAULT NULL,
  `paid_amount` double(8,2) DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `account_log_id` bigint unsigned DEFAULT NULL,
  `creator` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (1,'65acc2bb9b6ed',740.00,740.00,'pending','pending',3,NULL,NULL,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(2,'65acc2bba356e',1030.00,1030.00,'pending','pending',3,NULL,NULL,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,'65acc2bbb3bb2',450.00,450.00,'pending','pending',3,NULL,NULL,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(4,'65acc2bbbbc6e',1500.00,1500.00,'pending','pending',3,NULL,NULL,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(5,'65fe5f4ecc04c',7500.00,NULL,'pending','pending',31,NULL,NULL,'2024-03-23 04:49:18','2024-03-23 04:49:18'),(6,'65fe5f561bb15',3000.00,NULL,'pending','pending',31,NULL,NULL,'2024-03-23 04:49:26','2024-03-23 04:49:26'),(7,'65fe5f63be69c',1500.00,NULL,'pending','pending',31,NULL,NULL,'2024-03-23 04:49:39','2024-03-23 04:49:39');
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stock_logs`
--

DROP TABLE IF EXISTS `product_stock_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_stock_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `qty` bigint DEFAULT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `creator` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stock_logs`
--

LOCK TABLES `product_stock_logs` WRITE;
/*!40000 ALTER TABLE `product_stock_logs` DISABLE KEYS */;
INSERT INTO `product_stock_logs` VALUES (1,1,10,'initial','2024-01-20 18:00:00',1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(2,2,12,'initial','2024-01-20 18:00:00',1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,3,5,'initial','2024-01-20 18:00:00',1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(4,2,50,'sell',NULL,NULL,'2024-03-23 04:49:18','2024-03-23 04:49:18'),(5,3,20,'sell',NULL,NULL,'2024-03-23 04:49:26','2024-03-23 04:49:26'),(6,1,10,'sell',NULL,NULL,'2024-03-23 04:49:39','2024-03-23 04:49:39');
/*!40000 ALTER TABLE `product_stock_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_stocks`
--

DROP TABLE IF EXISTS `product_stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_stocks` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product_id` bigint DEFAULT NULL,
  `qty` bigint DEFAULT NULL,
  `date` timestamp NULL DEFAULT NULL,
  `supplier_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_stocks`
--

LOCK TABLES `product_stocks` WRITE;
/*!40000 ALTER TABLE `product_stocks` DISABLE KEYS */;
INSERT INTO `product_stocks` VALUES (1,1,10,'2024-01-20 18:00:00',1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(2,2,12,'2024-01-20 18:00:00',2,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,3,5,'2024-01-20 18:00:00',2,'2024-01-21 07:07:39','2024-01-21 07:07:39');
/*!40000 ALTER TABLE `product_stocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_suppliers`
--

DROP TABLE IF EXISTS `product_suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_suppliers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `full_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_number` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_suppliers`
--

LOCK TABLES `product_suppliers` WRITE;
/*!40000 ALTER TABLE `product_suppliers` DISABLE KEYS */;
INSERT INTO `product_suppliers` VALUES (1,'omuk prokashoni','0179874856','31/A, road 4, Banglamotor, Dhaka','2024-01-21 07:07:39','2024-01-21 07:07:39'),(2,'tomuk prokashoni','0179874855','41/A, road 4, Banglamotor, Dhaka','2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,'Kono Ek prokashoni','0179874853','51/A, road 4, Banglamotor, Dhaka','2024-01-21 07:07:39','2024-01-21 07:07:39');
/*!40000 ALTER TABLE `product_suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(8,2) DEFAULT NULL,
  `image` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_order_details_product_orders_id` bigint DEFAULT NULL,
  `product_order_details_product_orders_users_id` bigint unsigned DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'SSC Note English 1st paper',150.00,'test/english.jpeg',NULL,NULL,1,'2024-01-21 07:07:38','2024-01-21 07:07:38'),(2,'HSC math note book',150.00,'test/math.jpg',NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39'),(3,'HSC Chemistry note book',150.00,'test/chemistry.png',NULL,NULL,1,'2024-01-21 07:07:39','2024-01-21 07:07:39');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salary_categories`
--

DROP TABLE IF EXISTS `salary_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salary_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salary_categories`
--

LOCK TABLES `salary_categories` WRITE;
/*!40000 ALTER TABLE `salary_categories` DISABLE KEYS */;
INSERT INTO `salary_categories` VALUES (1,'Regular',1,1,'2024-01-21 07:07:51','2024-01-21 07:07:51'),(2,'Due',1,1,'2024-01-21 07:07:51','2024-01-21 07:07:51'),(3,'Overtime',1,1,'2024-01-21 07:07:51','2024-01-21 07:07:51'),(4,'Bonus',1,1,'2024-01-21 07:07:51','2024-01-21 07:07:51'),(5,'Special',1,1,'2024-01-21 07:07:51','2024-01-21 07:07:51');
/*!40000 ALTER TABLE `salary_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'invoice_name','Central',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(2,'invoice_address','Bangla motor, Dhaka',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(3,'invoice_email','central@gmail.com',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(4,'invoice_mobile_number','01234567890',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(5,'site_mobile_number','01234567890',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(6,'site_email','abc@gmail.com',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(7,'site_logo','uploads/site/logo-78706.png',1,'2024-01-21 07:07:50','2024-01-23 08:10:23'),(8,'site_primary_color','#431c46',0,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(9,'site_secondary_color','#8cc63f',0,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(10,'facebook_link','https://www.facebook.com',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(11,'twitter_link','https://twitter.com',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(12,'mail_link','https://mail.google.com/',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(13,'linkedin_link','https://www.linkedin.com',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(14,'youtube_link','https://www.youtube.com',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(15,'about_us_footer','Welcome to MeritCare Academy – your all-in-one solution for streamlined coaching management. Elevate your institute\'s efficiency with our user-friendly platform, covering student, teacher, schedule, branch, exam, and employee management. Your journey to academic excellence starts here!',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(16,'main_address','Road # 10, House # 2, Blog # A Mirpur-1, Dhaka-1212, Bangladesh',1,'2024-01-21 07:07:50','2024-01-21 07:07:50'),(17,'about_us','Welcome to MeritCare Academy, where excellence meets education!\r\n\r\n        At MeritCare Academy, we take pride in providing a comprehensive coaching management system that seamlessly integrates student, teacher, class schedule, branch, exam, and employee management. Our user-friendly web application is designed to streamline administrative tasks, allowing you to focus on what truly matters – nurturing the educational journey of your students.\r\n        \r\n        With a commitment to excellence, MeritCare Academy empowers educational institutions to efficiently organize and manage their operations. Our robust features ensure smooth student enrollment, effective teacher administration, accurate class scheduling, seamless branch coordination, precise exam management, and efficient employee handling.\r\n        \r\n        Join us on the path to educational success, where MeritCare Academy becomes your trusted partner in achieving academic excellence. Elevate your coaching institute\'s management experience with our powerful and intuitive platform.\r\n        \r\n        Thank you for choosing MeritCare Academy – where every keystroke counts towards a brighter educational future.',1,'2024-01-21 07:07:50','2024-01-21 07:07:50');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscribers`
--

DROP TABLE IF EXISTS `subscribers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscribers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscribers`
--

LOCK TABLES `subscribers` WRITE;
/*!40000 ALTER TABLE `subscribers` DISABLE KEYS */;
INSERT INTO `subscribers` VALUES (1,'muradhossain.web@gmail.com','2024-01-23 08:21:57','2024-01-23 08:21:57');
/*!40000 ALTER TABLE `subscribers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upozilas`
--

DROP TABLE IF EXISTS `upozilas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upozilas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `district_id` text COLLATE utf8mb4_unicode_ci,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bn_name` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=495 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upozilas`
--

LOCK TABLES `upozilas` WRITE;
/*!40000 ALTER TABLE `upozilas` DISABLE KEYS */;
INSERT INTO `upozilas` VALUES (1,'1','Debidwar','দেবিদ্বার','debidwar.comilla.gov.bd',NULL,NULL),(2,'1','Barura','বরুড়া','barura.comilla.gov.bd',NULL,NULL),(3,'1','Brahmanpara','ব্রাহ্মণপাড়া','brahmanpara.comilla.gov.bd',NULL,NULL),(4,'1','Chandina','চান্দিনা','chandina.comilla.gov.bd',NULL,NULL),(5,'1','Chauddagram','চৌদ্দগ্রাম','chauddagram.comilla.gov.bd',NULL,NULL),(6,'1','Daudkandi','দাউদকান্দি','daudkandi.comilla.gov.bd',NULL,NULL),(7,'1','Homna','হোমনা','homna.comilla.gov.bd',NULL,NULL),(8,'1','Laksam','লাকসাম','laksam.comilla.gov.bd',NULL,NULL),(9,'1','Muradnagar','মুরাদনগর','muradnagar.comilla.gov.bd',NULL,NULL),(10,'1','Nangalkot','নাঙ্গলকোট','nangalkot.comilla.gov.bd',NULL,NULL),(11,'1','Comilla Sadar','কুমিল্লা সদর','comillasadar.comilla.gov.bd',NULL,NULL),(12,'1','Meghna','মেঘনা','meghna.comilla.gov.bd',NULL,NULL),(13,'1','Monohargonj','মনোহরগঞ্জ','monohargonj.comilla.gov.bd',NULL,NULL),(14,'1','Sadarsouth','সদর দক্ষিণ','sadarsouth.comilla.gov.bd',NULL,NULL),(15,'1','Titas','তিতাস','titas.comilla.gov.bd',NULL,NULL),(16,'1','Burichang','বুড়িচং','burichang.comilla.gov.bd',NULL,NULL),(17,'1','Lalmai','লালমাই','lalmai.comilla.gov.bd',NULL,NULL),(18,'2','Chhagalnaiya','ছাগলনাইয়া','chhagalnaiya.feni.gov.bd',NULL,NULL),(19,'2','Feni Sadar','ফেনী সদর','sadar.feni.gov.bd',NULL,NULL),(20,'2','Sonagazi','সোনাগাজী','sonagazi.feni.gov.bd',NULL,NULL),(21,'2','Fulgazi','ফুলগাজী','fulgazi.feni.gov.bd',NULL,NULL),(22,'2','Parshuram','পরশুরাম','parshuram.feni.gov.bd',NULL,NULL),(23,'2','Daganbhuiyan','দাগনভূঞা','daganbhuiyan.feni.gov.bd',NULL,NULL),(24,'3','Brahmanbaria Sadar','ব্রাহ্মণবাড়িয়া সদর','sadar.brahmanbaria.gov.bd',NULL,NULL),(25,'3','Kasba','কসবা','kasba.brahmanbaria.gov.bd',NULL,NULL),(26,'3','Nasirnagar','নাসিরনগর','nasirnagar.brahmanbaria.gov.bd',NULL,NULL),(27,'3','Sarail','সরাইল','sarail.brahmanbaria.gov.bd',NULL,NULL),(28,'3','Ashuganj','আশুগঞ্জ','ashuganj.brahmanbaria.gov.bd',NULL,NULL),(29,'3','Akhaura','আখাউড়া','akhaura.brahmanbaria.gov.bd',NULL,NULL),(30,'3','Nabinagar','নবীনগর','nabinagar.brahmanbaria.gov.bd',NULL,NULL),(31,'3','Bancharampur','বাঞ্ছারামপুর','bancharampur.brahmanbaria.gov.bd',NULL,NULL),(32,'3','Bijoynagar','বিজয়নগর','bijoynagar.brahmanbaria.gov.bd',NULL,NULL),(33,'4','Rangamati Sadar','রাঙ্গামাটি সদর','sadar.rangamati.gov.bd',NULL,NULL),(34,'4','Kaptai','কাপ্তাই','kaptai.rangamati.gov.bd',NULL,NULL),(35,'4','Kawkhali','কাউখালী','kawkhali.rangamati.gov.bd',NULL,NULL),(36,'4','Baghaichari','বাঘাইছড়ি','baghaichari.rangamati.gov.bd',NULL,NULL),(37,'4','Barkal','বরকল','barkal.rangamati.gov.bd',NULL,NULL),(38,'4','Langadu','লংগদু','langadu.rangamati.gov.bd',NULL,NULL),(39,'4','Rajasthali','রাজস্থলী','rajasthali.rangamati.gov.bd',NULL,NULL),(40,'4','Belaichari','বিলাইছড়ি','belaichari.rangamati.gov.bd',NULL,NULL),(41,'4','Juraichari','জুরাছড়ি','juraichari.rangamati.gov.bd',NULL,NULL),(42,'4','Naniarchar','নানিয়ারচর','naniarchar.rangamati.gov.bd',NULL,NULL),(43,'5','Noakhali Sadar','নোয়াখালী সদর','sadar.noakhali.gov.bd',NULL,NULL),(44,'5','Companiganj','কোম্পানীগঞ্জ','companiganj.noakhali.gov.bd',NULL,NULL),(45,'5','Begumganj','বেগমগঞ্জ','begumganj.noakhali.gov.bd',NULL,NULL),(46,'5','Hatia','হাতিয়া','hatia.noakhali.gov.bd',NULL,NULL),(47,'5','Subarnachar','সুবর্ণচর','subarnachar.noakhali.gov.bd',NULL,NULL),(48,'5','Kabirhat','কবিরহাট','kabirhat.noakhali.gov.bd',NULL,NULL),(49,'5','Senbug','সেনবাগ','senbug.noakhali.gov.bd',NULL,NULL),(50,'5','Chatkhil','চাটখিল','chatkhil.noakhali.gov.bd',NULL,NULL),(51,'5','Sonaimori','সোনাইমুড়ী','sonaimori.noakhali.gov.bd',NULL,NULL),(52,'6','Haimchar','হাইমচর','haimchar.chandpur.gov.bd',NULL,NULL),(53,'6','Kachua','কচুয়া','kachua.chandpur.gov.bd',NULL,NULL),(54,'6','Shahrasti','শাহরাস্তি','shahrasti.chandpur.gov.bd',NULL,NULL),(55,'6','Chandpur Sadar','চাঁদপুর সদর','sadar.chandpur.gov.bd',NULL,NULL),(56,'6','Matlab South','মতলব দক্ষিণ','matlabsouth.chandpur.gov.bd',NULL,NULL),(57,'6','Hajiganj','হাজীগঞ্জ','hajiganj.chandpur.gov.bd',NULL,NULL),(58,'6','Matlab North','মতলব উত্তর','matlabnorth.chandpur.gov.bd',NULL,NULL),(59,'6','Faridgonj','ফরিদগঞ্জ','faridgonj.chandpur.gov.bd',NULL,NULL),(60,'7','Lakshmipur Sadar','লক্ষ্মীপুর সদর','sadar.lakshmipur.gov.bd',NULL,NULL),(61,'7','Kamalnagar','কমলনগর','kamalnagar.lakshmipur.gov.bd',NULL,NULL),(62,'7','Raipur','রায়পুর','raipur.lakshmipur.gov.bd',NULL,NULL),(63,'7','Ramgati','রামগতি','ramgati.lakshmipur.gov.bd',NULL,NULL),(64,'7','Ramganj','রামগঞ্জ','ramganj.lakshmipur.gov.bd',NULL,NULL),(65,'8','Rangunia','রাঙ্গুনিয়া','rangunia.chittagong.gov.bd',NULL,NULL),(66,'8','Sitakunda','সীতাকুন্ড','sitakunda.chittagong.gov.bd',NULL,NULL),(67,'8','Mirsharai','মীরসরাই','mirsharai.chittagong.gov.bd',NULL,NULL),(68,'8','Patiya','পটিয়া','patiya.chittagong.gov.bd',NULL,NULL),(69,'8','Sandwip','সন্দ্বীপ','sandwip.chittagong.gov.bd',NULL,NULL),(70,'8','Banshkhali','বাঁশখালী','banshkhali.chittagong.gov.bd',NULL,NULL),(71,'8','Boalkhali','বোয়ালখালী','boalkhali.chittagong.gov.bd',NULL,NULL),(72,'8','Anwara','আনোয়ারা','anwara.chittagong.gov.bd',NULL,NULL),(73,'8','Chandanaish','চন্দনাইশ','chandanaish.chittagong.gov.bd',NULL,NULL),(74,'8','Satkania','সাতকানিয়া','satkania.chittagong.gov.bd',NULL,NULL),(75,'8','Lohagara','লোহাগাড়া','lohagara.chittagong.gov.bd',NULL,NULL),(76,'8','Hathazari','হাটহাজারী','hathazari.chittagong.gov.bd',NULL,NULL),(77,'8','Fatikchhari','ফটিকছড়ি','fatikchhari.chittagong.gov.bd',NULL,NULL),(78,'8','Raozan','রাউজান','raozan.chittagong.gov.bd',NULL,NULL),(79,'8','Karnafuli','কর্ণফুলী','karnafuli.chittagong.gov.bd',NULL,NULL),(80,'9','Coxsbazar Sadar','কক্সবাজার সদর','sadar.coxsbazar.gov.bd',NULL,NULL),(81,'9','Chakaria','চকরিয়া','chakaria.coxsbazar.gov.bd',NULL,NULL),(82,'9','Kutubdia','কুতুবদিয়া','kutubdia.coxsbazar.gov.bd',NULL,NULL),(83,'9','Ukhiya','উখিয়া','ukhiya.coxsbazar.gov.bd',NULL,NULL),(84,'9','Moheshkhali','মহেশখালী','moheshkhali.coxsbazar.gov.bd',NULL,NULL),(85,'9','Pekua','পেকুয়া','pekua.coxsbazar.gov.bd',NULL,NULL),(86,'9','Ramu','রামু','ramu.coxsbazar.gov.bd',NULL,NULL),(87,'9','Teknaf','টেকনাফ','teknaf.coxsbazar.gov.bd',NULL,NULL),(88,'10','Khagrachhari Sadar','খাগড়াছড়ি সদর','sadar.khagrachhari.gov.bd',NULL,NULL),(89,'10','Dighinala','দিঘীনালা','dighinala.khagrachhari.gov.bd',NULL,NULL),(90,'10','Panchari','পানছড়ি','panchari.khagrachhari.gov.bd',NULL,NULL),(91,'10','Laxmichhari','লক্ষীছড়ি','laxmichhari.khagrachhari.gov.bd',NULL,NULL),(92,'10','Mohalchari','মহালছড়ি','mohalchari.khagrachhari.gov.bd',NULL,NULL),(93,'10','Manikchari','মানিকছড়ি','manikchari.khagrachhari.gov.bd',NULL,NULL),(94,'10','Ramgarh','রামগড়','ramgarh.khagrachhari.gov.bd',NULL,NULL),(95,'10','Matiranga','মাটিরাঙ্গা','matiranga.khagrachhari.gov.bd',NULL,NULL),(96,'10','Guimara','গুইমারা','guimara.khagrachhari.gov.bd',NULL,NULL),(97,'11','Bandarban Sadar','বান্দরবান সদর','sadar.bandarban.gov.bd',NULL,NULL),(98,'11','Alikadam','আলীকদম','alikadam.bandarban.gov.bd',NULL,NULL),(99,'11','Naikhongchhari','নাইক্ষ্যংছড়ি','naikhongchhari.bandarban.gov.bd',NULL,NULL),(100,'11','Rowangchhari','রোয়াংছড়ি','rowangchhari.bandarban.gov.bd',NULL,NULL),(101,'11','Lama','লামা','lama.bandarban.gov.bd',NULL,NULL),(102,'11','Ruma','রুমা','ruma.bandarban.gov.bd',NULL,NULL),(103,'11','Thanchi','থানচি','thanchi.bandarban.gov.bd',NULL,NULL),(104,'12','Belkuchi','বেলকুচি','belkuchi.sirajganj.gov.bd',NULL,NULL),(105,'12','Chauhali','চৌহালি','chauhali.sirajganj.gov.bd',NULL,NULL),(106,'12','Kamarkhand','কামারখন্দ','kamarkhand.sirajganj.gov.bd',NULL,NULL),(107,'12','Kazipur','কাজীপুর','kazipur.sirajganj.gov.bd',NULL,NULL),(108,'12','Raigonj','রায়গঞ্জ','raigonj.sirajganj.gov.bd',NULL,NULL),(109,'12','Shahjadpur','শাহজাদপুর','shahjadpur.sirajganj.gov.bd',NULL,NULL),(110,'12','Sirajganj Sadar','সিরাজগঞ্জ সদর','sirajganjsadar.sirajganj.gov.bd',NULL,NULL),(111,'12','Tarash','তাড়াশ','tarash.sirajganj.gov.bd',NULL,NULL),(112,'12','Ullapara','উল্লাপাড়া','ullapara.sirajganj.gov.bd',NULL,NULL),(113,'13','Sujanagar','সুজানগর','sujanagar.pabna.gov.bd',NULL,NULL),(114,'13','Ishurdi','ঈশ্বরদী','ishurdi.pabna.gov.bd',NULL,NULL),(115,'13','Bhangura','ভাঙ্গুড়া','bhangura.pabna.gov.bd',NULL,NULL),(116,'13','Pabna Sadar','পাবনা সদর','pabnasadar.pabna.gov.bd',NULL,NULL),(117,'13','Bera','বেড়া','bera.pabna.gov.bd',NULL,NULL),(118,'13','Atghoria','আটঘরিয়া','atghoria.pabna.gov.bd',NULL,NULL),(119,'13','Chatmohar','চাটমোহর','chatmohar.pabna.gov.bd',NULL,NULL),(120,'13','Santhia','সাঁথিয়া','santhia.pabna.gov.bd',NULL,NULL),(121,'13','Faridpur','ফরিদপুর','faridpur.pabna.gov.bd',NULL,NULL),(122,'14','Kahaloo','কাহালু','kahaloo.bogra.gov.bd',NULL,NULL),(123,'14','Bogra Sadar','বগুড়া সদর','sadar.bogra.gov.bd',NULL,NULL),(124,'14','Shariakandi','সারিয়াকান্দি','shariakandi.bogra.gov.bd',NULL,NULL),(125,'14','Shajahanpur','শাজাহানপুর','shajahanpur.bogra.gov.bd',NULL,NULL),(126,'14','Dupchanchia','দুপচাচিঁয়া','dupchanchia.bogra.gov.bd',NULL,NULL),(127,'14','Adamdighi','আদমদিঘি','adamdighi.bogra.gov.bd',NULL,NULL),(128,'14','Nondigram','নন্দিগ্রাম','nondigram.bogra.gov.bd',NULL,NULL),(129,'14','Sonatala','সোনাতলা','sonatala.bogra.gov.bd',NULL,NULL),(130,'14','Dhunot','ধুনট','dhunot.bogra.gov.bd',NULL,NULL),(131,'14','Gabtali','গাবতলী','gabtali.bogra.gov.bd',NULL,NULL),(132,'14','Sherpur','শেরপুর','sherpur.bogra.gov.bd',NULL,NULL),(133,'14','Shibganj','শিবগঞ্জ','shibganj.bogra.gov.bd',NULL,NULL),(134,'15','Paba','পবা','paba.rajshahi.gov.bd',NULL,NULL),(135,'15','Durgapur','দুর্গাপুর','durgapur.rajshahi.gov.bd',NULL,NULL),(136,'15','Mohonpur','মোহনপুর','mohonpur.rajshahi.gov.bd',NULL,NULL),(137,'15','Charghat','চারঘাট','charghat.rajshahi.gov.bd',NULL,NULL),(138,'15','Puthia','পুঠিয়া','puthia.rajshahi.gov.bd',NULL,NULL),(139,'15','Bagha','বাঘা','bagha.rajshahi.gov.bd',NULL,NULL),(140,'15','Godagari','গোদাগাড়ী','godagari.rajshahi.gov.bd',NULL,NULL),(141,'15','Tanore','তানোর','tanore.rajshahi.gov.bd',NULL,NULL),(142,'15','Bagmara','বাগমারা','bagmara.rajshahi.gov.bd',NULL,NULL),(143,'16','Natore Sadar','নাটোর সদর','natoresadar.natore.gov.bd',NULL,NULL),(144,'16','Singra','সিংড়া','singra.natore.gov.bd',NULL,NULL),(145,'16','Baraigram','বড়াইগ্রাম','baraigram.natore.gov.bd',NULL,NULL),(146,'16','Bagatipara','বাগাতিপাড়া','bagatipara.natore.gov.bd',NULL,NULL),(147,'16','Lalpur','লালপুর','lalpur.natore.gov.bd',NULL,NULL),(148,'16','Gurudaspur','গুরুদাসপুর','gurudaspur.natore.gov.bd',NULL,NULL),(149,'16','Naldanga','নলডাঙ্গা','naldanga.natore.gov.bd',NULL,NULL),(150,'17','Akkelpur','আক্কেলপুর','akkelpur.joypurhat.gov.bd',NULL,NULL),(151,'17','Kalai','কালাই','kalai.joypurhat.gov.bd',NULL,NULL),(152,'17','Khetlal','ক্ষেতলাল','khetlal.joypurhat.gov.bd',NULL,NULL),(153,'17','Panchbibi','পাঁচবিবি','panchbibi.joypurhat.gov.bd',NULL,NULL),(154,'17','Joypurhat Sadar','জয়পুরহাট সদর','joypurhatsadar.joypurhat.gov.bd',NULL,NULL),(155,'18','Chapainawabganj Sadar','চাঁপাইনবাবগঞ্জ সদর','chapainawabganjsadar.chapainawabganj.gov.bd',NULL,NULL),(156,'18','Gomostapur','গোমস্তাপুর','gomostapur.chapainawabganj.gov.bd',NULL,NULL),(157,'18','Nachol','নাচোল','nachol.chapainawabganj.gov.bd',NULL,NULL),(158,'18','Bholahat','ভোলাহাট','bholahat.chapainawabganj.gov.bd',NULL,NULL),(159,'18','Shibganj','শিবগঞ্জ','shibganj.chapainawabganj.gov.bd',NULL,NULL),(160,'19','Mohadevpur','মহাদেবপুর','mohadevpur.naogaon.gov.bd',NULL,NULL),(161,'19','Badalgachi','বদলগাছী','badalgachi.naogaon.gov.bd',NULL,NULL),(162,'19','Patnitala','পত্নিতলা','patnitala.naogaon.gov.bd',NULL,NULL),(163,'19','Dhamoirhat','ধামইরহাট','dhamoirhat.naogaon.gov.bd',NULL,NULL),(164,'19','Niamatpur','নিয়ামতপুর','niamatpur.naogaon.gov.bd',NULL,NULL),(165,'19','Manda','মান্দা','manda.naogaon.gov.bd',NULL,NULL),(166,'19','Atrai','আত্রাই','atrai.naogaon.gov.bd',NULL,NULL),(167,'19','Raninagar','রাণীনগর','raninagar.naogaon.gov.bd',NULL,NULL),(168,'19','Naogaon Sadar','নওগাঁ সদর','naogaonsadar.naogaon.gov.bd',NULL,NULL),(169,'19','Porsha','পোরশা','porsha.naogaon.gov.bd',NULL,NULL),(170,'19','Sapahar','সাপাহার','sapahar.naogaon.gov.bd',NULL,NULL),(171,'20','Manirampur','মণিরামপুর','manirampur.jessore.gov.bd',NULL,NULL),(172,'20','Abhaynagar','অভয়নগর','abhaynagar.jessore.gov.bd',NULL,NULL),(173,'20','Bagherpara','বাঘারপাড়া','bagherpara.jessore.gov.bd',NULL,NULL),(174,'20','Chougachha','চৌগাছা','chougachha.jessore.gov.bd',NULL,NULL),(175,'20','Jhikargacha','ঝিকরগাছা','jhikargacha.jessore.gov.bd',NULL,NULL),(176,'20','Keshabpur','কেশবপুর','keshabpur.jessore.gov.bd',NULL,NULL),(177,'20','Jessore Sadar','যশোর সদর','sadar.jessore.gov.bd',NULL,NULL),(178,'20','Sharsha','শার্শা','sharsha.jessore.gov.bd',NULL,NULL),(179,'21','Assasuni','আশাশুনি','assasuni.satkhira.gov.bd',NULL,NULL),(180,'21','Debhata','দেবহাটা','debhata.satkhira.gov.bd',NULL,NULL),(181,'21','Kalaroa','কলারোয়া','kalaroa.satkhira.gov.bd',NULL,NULL),(182,'21','Satkhira Sadar','সাতক্ষীরা সদর','satkhirasadar.satkhira.gov.bd',NULL,NULL),(183,'21','Shyamnagar','শ্যামনগর','shyamnagar.satkhira.gov.bd',NULL,NULL),(184,'21','Tala','তালা','tala.satkhira.gov.bd',NULL,NULL),(185,'21','Kaliganj','কালিগঞ্জ','kaliganj.satkhira.gov.bd',NULL,NULL),(186,'22','Mujibnagar','মুজিবনগর','mujibnagar.meherpur.gov.bd',NULL,NULL),(187,'22','Meherpur Sadar','মেহেরপুর সদর','meherpursadar.meherpur.gov.bd',NULL,NULL),(188,'22','Gangni','গাংনী','gangni.meherpur.gov.bd',NULL,NULL),(189,'23','Narail Sadar','নড়াইল সদর','narailsadar.narail.gov.bd',NULL,NULL),(190,'23','Lohagara','লোহাগড়া','lohagara.narail.gov.bd',NULL,NULL),(191,'23','Kalia','কালিয়া','kalia.narail.gov.bd',NULL,NULL),(192,'24','Chuadanga Sadar','চুয়াডাঙ্গা সদর','chuadangasadar.chuadanga.gov.bd',NULL,NULL),(193,'24','Alamdanga','আলমডাঙ্গা','alamdanga.chuadanga.gov.bd',NULL,NULL),(194,'24','Damurhuda','দামুড়হুদা','damurhuda.chuadanga.gov.bd',NULL,NULL),(195,'24','Jibannagar','জীবননগর','jibannagar.chuadanga.gov.bd',NULL,NULL),(196,'25','Kushtia Sadar','কুষ্টিয়া সদর','kushtiasadar.kushtia.gov.bd',NULL,NULL),(197,'25','Kumarkhali','কুমারখালী','kumarkhali.kushtia.gov.bd',NULL,NULL),(198,'25','Khoksa','খোকসা','khoksa.kushtia.gov.bd',NULL,NULL),(199,'25','Mirpur','মিরপুর','mirpurkushtia.kushtia.gov.bd',NULL,NULL),(200,'25','Daulatpur','দৌলতপুর','daulatpur.kushtia.gov.bd',NULL,NULL),(201,'25','Bheramara','ভেড়ামারা','bheramara.kushtia.gov.bd',NULL,NULL),(202,'26','Shalikha','শালিখা','shalikha.magura.gov.bd',NULL,NULL),(203,'26','Sreepur','শ্রীপুর','sreepur.magura.gov.bd',NULL,NULL),(204,'26','Magura Sadar','মাগুরা সদর','magurasadar.magura.gov.bd',NULL,NULL),(205,'26','Mohammadpur','মহম্মদপুর','mohammadpur.magura.gov.bd',NULL,NULL),(206,'27','Paikgasa','পাইকগাছা','paikgasa.khulna.gov.bd',NULL,NULL),(207,'27','Fultola','ফুলতলা','fultola.khulna.gov.bd',NULL,NULL),(208,'27','Digholia','দিঘলিয়া','digholia.khulna.gov.bd',NULL,NULL),(209,'27','Rupsha','রূপসা','rupsha.khulna.gov.bd',NULL,NULL),(210,'27','Terokhada','তেরখাদা','terokhada.khulna.gov.bd',NULL,NULL),(211,'27','Dumuria','ডুমুরিয়া','dumuria.khulna.gov.bd',NULL,NULL),(212,'27','Botiaghata','বটিয়াঘাটা','botiaghata.khulna.gov.bd',NULL,NULL),(213,'27','Dakop','দাকোপ','dakop.khulna.gov.bd',NULL,NULL),(214,'27','Koyra','কয়রা','koyra.khulna.gov.bd',NULL,NULL),(215,'28','Fakirhat','ফকিরহাট','fakirhat.bagerhat.gov.bd',NULL,NULL),(216,'28','Bagerhat Sadar','বাগেরহাট সদর','sadar.bagerhat.gov.bd',NULL,NULL),(217,'28','Mollahat','মোল্লাহাট','mollahat.bagerhat.gov.bd',NULL,NULL),(218,'28','Sarankhola','শরণখোলা','sarankhola.bagerhat.gov.bd',NULL,NULL),(219,'28','Rampal','রামপাল','rampal.bagerhat.gov.bd',NULL,NULL),(220,'28','Morrelganj','মোড়েলগঞ্জ','morrelganj.bagerhat.gov.bd',NULL,NULL),(221,'28','Kachua','কচুয়া','kachua.bagerhat.gov.bd',NULL,NULL),(222,'28','Mongla','মোংলা','mongla.bagerhat.gov.bd',NULL,NULL),(223,'28','Chitalmari','চিতলমারী','chitalmari.bagerhat.gov.bd',NULL,NULL),(224,'29','Jhenaidah Sadar','ঝিনাইদহ সদর','sadar.jhenaidah.gov.bd',NULL,NULL),(225,'29','Shailkupa','শৈলকুপা','shailkupa.jhenaidah.gov.bd',NULL,NULL),(226,'29','Harinakundu','হরিণাকুন্ডু','harinakundu.jhenaidah.gov.bd',NULL,NULL),(227,'29','Kaliganj','কালীগঞ্জ','kaliganj.jhenaidah.gov.bd',NULL,NULL),(228,'29','Kotchandpur','কোটচাঁদপুর','kotchandpur.jhenaidah.gov.bd',NULL,NULL),(229,'29','Moheshpur','মহেশপুর','moheshpur.jhenaidah.gov.bd',NULL,NULL),(230,'30','Jhalakathi Sadar','ঝালকাঠি সদর','sadar.jhalakathi.gov.bd',NULL,NULL),(231,'30','Kathalia','কাঠালিয়া','kathalia.jhalakathi.gov.bd',NULL,NULL),(232,'30','Nalchity','নলছিটি','nalchity.jhalakathi.gov.bd',NULL,NULL),(233,'30','Rajapur','রাজাপুর','rajapur.jhalakathi.gov.bd',NULL,NULL),(234,'31','Bauphal','বাউফল','bauphal.patuakhali.gov.bd',NULL,NULL),(235,'31','Patuakhali Sadar','পটুয়াখালী সদর','sadar.patuakhali.gov.bd',NULL,NULL),(236,'31','Dumki','দুমকি','dumki.patuakhali.gov.bd',NULL,NULL),(237,'31','Dashmina','দশমিনা','dashmina.patuakhali.gov.bd',NULL,NULL),(238,'31','Kalapara','কলাপাড়া','kalapara.patuakhali.gov.bd',NULL,NULL),(239,'31','Mirzaganj','মির্জাগঞ্জ','mirzaganj.patuakhali.gov.bd',NULL,NULL),(240,'31','Galachipa','গলাচিপা','galachipa.patuakhali.gov.bd',NULL,NULL),(241,'31','Rangabali','রাঙ্গাবালী','rangabali.patuakhali.gov.bd',NULL,NULL),(242,'32','Pirojpur Sadar','পিরোজপুর সদর','sadar.pirojpur.gov.bd',NULL,NULL),(243,'32','Nazirpur','নাজিরপুর','nazirpur.pirojpur.gov.bd',NULL,NULL),(244,'32','Kawkhali','কাউখালী','kawkhali.pirojpur.gov.bd',NULL,NULL),(245,'32','Zianagar','জিয়ানগর','zianagar.pirojpur.gov.bd',NULL,NULL),(246,'32','Bhandaria','ভান্ডারিয়া','bhandaria.pirojpur.gov.bd',NULL,NULL),(247,'32','Mathbaria','মঠবাড়ীয়া','mathbaria.pirojpur.gov.bd',NULL,NULL),(248,'32','Nesarabad','নেছারাবাদ','nesarabad.pirojpur.gov.bd',NULL,NULL),(249,'33','Barisal Sadar','বরিশাল সদর','barisalsadar.barisal.gov.bd',NULL,NULL),(250,'33','Bakerganj','বাকেরগঞ্জ','bakerganj.barisal.gov.bd',NULL,NULL),(251,'33','Babuganj','বাবুগঞ্জ','babuganj.barisal.gov.bd',NULL,NULL),(252,'33','Wazirpur','উজিরপুর','wazirpur.barisal.gov.bd',NULL,NULL),(253,'33','Banaripara','বানারীপাড়া','banaripara.barisal.gov.bd',NULL,NULL),(254,'33','Gournadi','গৌরনদী','gournadi.barisal.gov.bd',NULL,NULL),(255,'33','Agailjhara','আগৈলঝাড়া','agailjhara.barisal.gov.bd',NULL,NULL),(256,'33','Mehendiganj','মেহেন্দিগঞ্জ','mehendiganj.barisal.gov.bd',NULL,NULL),(257,'33','Muladi','মুলাদী','muladi.barisal.gov.bd',NULL,NULL),(258,'33','Hizla','হিজলা','hizla.barisal.gov.bd',NULL,NULL),(259,'34','Bhola Sadar','ভোলা সদর','sadar.bhola.gov.bd',NULL,NULL),(260,'34','Borhan Sddin','বোরহান উদ্দিন','borhanuddin.bhola.gov.bd',NULL,NULL),(261,'34','Charfesson','চরফ্যাশন','charfesson.bhola.gov.bd',NULL,NULL),(262,'34','Doulatkhan','দৌলতখান','doulatkhan.bhola.gov.bd',NULL,NULL),(263,'34','Monpura','মনপুরা','monpura.bhola.gov.bd',NULL,NULL),(264,'34','Tazumuddin','তজুমদ্দিন','tazumuddin.bhola.gov.bd',NULL,NULL),(265,'34','Lalmohan','লালমোহন','lalmohan.bhola.gov.bd',NULL,NULL),(266,'35','Amtali','আমতলী','amtali.barguna.gov.bd',NULL,NULL),(267,'35','Barguna Sadar','বরগুনা সদর','sadar.barguna.gov.bd',NULL,NULL),(268,'35','Betagi','বেতাগী','betagi.barguna.gov.bd',NULL,NULL),(269,'35','Bamna','বামনা','bamna.barguna.gov.bd',NULL,NULL),(270,'35','Pathorghata','পাথরঘাটা','pathorghata.barguna.gov.bd',NULL,NULL),(271,'35','Taltali','তালতলি','taltali.barguna.gov.bd',NULL,NULL),(272,'36','Balaganj','বালাগঞ্জ','balaganj.sylhet.gov.bd',NULL,NULL),(273,'36','Beanibazar','বিয়ানীবাজার','beanibazar.sylhet.gov.bd',NULL,NULL),(274,'36','Bishwanath','বিশ্বনাথ','bishwanath.sylhet.gov.bd',NULL,NULL),(275,'36','Companiganj','কোম্পানীগঞ্জ','companiganj.sylhet.gov.bd',NULL,NULL),(276,'36','Fenchuganj','ফেঞ্চুগঞ্জ','fenchuganj.sylhet.gov.bd',NULL,NULL),(277,'36','Golapganj','গোলাপগঞ্জ','golapganj.sylhet.gov.bd',NULL,NULL),(278,'36','Gowainghat','গোয়াইনঘাট','gowainghat.sylhet.gov.bd',NULL,NULL),(279,'36','Jaintiapur','জৈন্তাপুর','jaintiapur.sylhet.gov.bd',NULL,NULL),(280,'36','Kanaighat','কানাইঘাট','kanaighat.sylhet.gov.bd',NULL,NULL),(281,'36','Sylhet Sadar','সিলেট সদর','sylhetsadar.sylhet.gov.bd',NULL,NULL),(282,'36','Zakiganj','জকিগঞ্জ','zakiganj.sylhet.gov.bd',NULL,NULL),(283,'36','Dakshinsurma','দক্ষিণ সুরমা','dakshinsurma.sylhet.gov.bd',NULL,NULL),(284,'36','Osmaninagar','ওসমানী নগর','osmaninagar.sylhet.gov.bd',NULL,NULL),(285,'37','Barlekha','বড়লেখা','barlekha.moulvibazar.gov.bd',NULL,NULL),(286,'37','Kamolganj','কমলগঞ্জ','kamolganj.moulvibazar.gov.bd',NULL,NULL),(287,'37','Kulaura','কুলাউড়া','kulaura.moulvibazar.gov.bd',NULL,NULL),(288,'37','Moulvibazar Sadar','মৌলভীবাজার সদর','moulvibazarsadar.moulvibazar.gov.bd',NULL,NULL),(289,'37','Rajnagar','রাজনগর','rajnagar.moulvibazar.gov.bd',NULL,NULL),(290,'37','Sreemangal','শ্রীমঙ্গল','sreemangal.moulvibazar.gov.bd',NULL,NULL),(291,'37','Juri','জুড়ী','juri.moulvibazar.gov.bd',NULL,NULL),(292,'38','Nabiganj','নবীগঞ্জ','nabiganj.habiganj.gov.bd',NULL,NULL),(293,'38','Bahubal','বাহুবল','bahubal.habiganj.gov.bd',NULL,NULL),(294,'38','Ajmiriganj','আজমিরীগঞ্জ','ajmiriganj.habiganj.gov.bd',NULL,NULL),(295,'38','Baniachong','বানিয়াচং','baniachong.habiganj.gov.bd',NULL,NULL),(296,'38','Lakhai','লাখাই','lakhai.habiganj.gov.bd',NULL,NULL),(297,'38','Chunarughat','চুনারুঘাট','chunarughat.habiganj.gov.bd',NULL,NULL),(298,'38','Habiganj Sadar','হবিগঞ্জ সদর','habiganjsadar.habiganj.gov.bd',NULL,NULL),(299,'38','Madhabpur','মাধবপুর','madhabpur.habiganj.gov.bd',NULL,NULL),(300,'39','Sunamganj Sadar','সুনামগঞ্জ সদর','sadar.sunamganj.gov.bd',NULL,NULL),(301,'39','South Sunamganj','দক্ষিণ সুনামগঞ্জ','southsunamganj.sunamganj.gov.bd',NULL,NULL),(302,'39','Bishwambarpur','বিশ্বম্ভরপুর','bishwambarpur.sunamganj.gov.bd',NULL,NULL),(303,'39','Chhatak','ছাতক','chhatak.sunamganj.gov.bd',NULL,NULL),(304,'39','Jagannathpur','জগন্নাথপুর','jagannathpur.sunamganj.gov.bd',NULL,NULL),(305,'39','Dowarabazar','দোয়ারাবাজার','dowarabazar.sunamganj.gov.bd',NULL,NULL),(306,'39','Tahirpur','তাহিরপুর','tahirpur.sunamganj.gov.bd',NULL,NULL),(307,'39','Dharmapasha','ধর্মপাশা','dharmapasha.sunamganj.gov.bd',NULL,NULL),(308,'39','Jamalganj','জামালগঞ্জ','jamalganj.sunamganj.gov.bd',NULL,NULL),(309,'39','Shalla','শাল্লা','shalla.sunamganj.gov.bd',NULL,NULL),(310,'39','Derai','দিরাই','derai.sunamganj.gov.bd',NULL,NULL),(311,'40','Belabo','বেলাবো','belabo.narsingdi.gov.bd',NULL,NULL),(312,'40','Monohardi','মনোহরদী','monohardi.narsingdi.gov.bd',NULL,NULL),(313,'40','Narsingdi Sadar','নরসিংদী সদর','narsingdisadar.narsingdi.gov.bd',NULL,NULL),(314,'40','Palash','পলাশ','palash.narsingdi.gov.bd',NULL,NULL),(315,'40','Raipura','রায়পুরা','raipura.narsingdi.gov.bd',NULL,NULL),(316,'40','Shibpur','শিবপুর','shibpur.narsingdi.gov.bd',NULL,NULL),(317,'41','Kaliganj','কালীগঞ্জ','kaliganj.gazipur.gov.bd',NULL,NULL),(318,'41','Kaliakair','কালিয়াকৈর','kaliakair.gazipur.gov.bd',NULL,NULL),(319,'41','Kapasia','কাপাসিয়া','kapasia.gazipur.gov.bd',NULL,NULL),(320,'41','Gazipur Sadar','গাজীপুর সদর','sadar.gazipur.gov.bd',NULL,NULL),(321,'41','Sreepur','শ্রীপুর','sreepur.gazipur.gov.bd',NULL,NULL),(322,'42','Shariatpur Sadar','শরিয়তপুর সদর','sadar.shariatpur.gov.bd',NULL,NULL),(323,'42','Naria','নড়িয়া','naria.shariatpur.gov.bd',NULL,NULL),(324,'42','Zajira','জাজিরা','zajira.shariatpur.gov.bd',NULL,NULL),(325,'42','Gosairhat','গোসাইরহাট','gosairhat.shariatpur.gov.bd',NULL,NULL),(326,'42','Bhedarganj','ভেদরগঞ্জ','bhedarganj.shariatpur.gov.bd',NULL,NULL),(327,'42','Damudya','ডামুড্যা','damudya.shariatpur.gov.bd',NULL,NULL),(328,'43','Araihazar','আড়াইহাজার','araihazar.narayanganj.gov.bd',NULL,NULL),(329,'43','Bandar','বন্দর','bandar.narayanganj.gov.bd',NULL,NULL),(330,'43','Narayanganj Sadar','নারায়নগঞ্জ সদর','narayanganjsadar.narayanganj.gov.bd',NULL,NULL),(331,'43','Rupganj','রূপগঞ্জ','rupganj.narayanganj.gov.bd',NULL,NULL),(332,'43','Sonargaon','সোনারগাঁ','sonargaon.narayanganj.gov.bd',NULL,NULL),(333,'44','Basail','বাসাইল','basail.tangail.gov.bd',NULL,NULL),(334,'44','Bhuapur','ভুয়াপুর','bhuapur.tangail.gov.bd',NULL,NULL),(335,'44','Delduar','দেলদুয়ার','delduar.tangail.gov.bd',NULL,NULL),(336,'44','Ghatail','ঘাটাইল','ghatail.tangail.gov.bd',NULL,NULL),(337,'44','Gopalpur','গোপালপুর','gopalpur.tangail.gov.bd',NULL,NULL),(338,'44','Madhupur','মধুপুর','madhupur.tangail.gov.bd',NULL,NULL),(339,'44','Mirzapur','মির্জাপুর','mirzapur.tangail.gov.bd',NULL,NULL),(340,'44','Nagarpur','নাগরপুর','nagarpur.tangail.gov.bd',NULL,NULL),(341,'44','Sakhipur','সখিপুর','sakhipur.tangail.gov.bd',NULL,NULL),(342,'44','Tangail Sadar','টাঙ্গাইল সদর','tangailsadar.tangail.gov.bd',NULL,NULL),(343,'44','Kalihati','কালিহাতী','kalihati.tangail.gov.bd',NULL,NULL),(344,'44','Dhanbari','ধনবাড়ী','dhanbari.tangail.gov.bd',NULL,NULL),(345,'45','Itna','ইটনা','itna.kishoreganj.gov.bd',NULL,NULL),(346,'45','Katiadi','কটিয়াদী','katiadi.kishoreganj.gov.bd',NULL,NULL),(347,'45','Bhairab','ভৈরব','bhairab.kishoreganj.gov.bd',NULL,NULL),(348,'45','Tarail','তাড়াইল','tarail.kishoreganj.gov.bd',NULL,NULL),(349,'45','Hossainpur','হোসেনপুর','hossainpur.kishoreganj.gov.bd',NULL,NULL),(350,'45','Pakundia','পাকুন্দিয়া','pakundia.kishoreganj.gov.bd',NULL,NULL),(351,'45','Kuliarchar','কুলিয়ারচর','kuliarchar.kishoreganj.gov.bd',NULL,NULL),(352,'45','Kishoreganj Sadar','কিশোরগঞ্জ সদর','kishoreganjsadar.kishoreganj.gov.bd',NULL,NULL),(353,'45','Karimgonj','করিমগঞ্জ','karimgonj.kishoreganj.gov.bd',NULL,NULL),(354,'45','Bajitpur','বাজিতপুর','bajitpur.kishoreganj.gov.bd',NULL,NULL),(355,'45','Austagram','অষ্টগ্রাম','austagram.kishoreganj.gov.bd',NULL,NULL),(356,'45','Mithamoin','মিঠামইন','mithamoin.kishoreganj.gov.bd',NULL,NULL),(357,'45','Nikli','নিকলী','nikli.kishoreganj.gov.bd',NULL,NULL),(358,'46','Harirampur','হরিরামপুর','harirampur.manikganj.gov.bd',NULL,NULL),(359,'46','Saturia','সাটুরিয়া','saturia.manikganj.gov.bd',NULL,NULL),(360,'46','Manikganj Sadar','মানিকগঞ্জ সদর','sadar.manikganj.gov.bd',NULL,NULL),(361,'46','Gior','ঘিওর','gior.manikganj.gov.bd',NULL,NULL),(362,'46','Shibaloy','শিবালয়','shibaloy.manikganj.gov.bd',NULL,NULL),(363,'46','Doulatpur','দৌলতপুর','doulatpur.manikganj.gov.bd',NULL,NULL),(364,'46','Singiar','সিংগাইর','singiar.manikganj.gov.bd',NULL,NULL),(365,'47','Savar','সাভার','savar.dhaka.gov.bd',NULL,NULL),(366,'47','Dhamrai','ধামরাই','dhamrai.dhaka.gov.bd',NULL,NULL),(367,'47','Keraniganj','কেরাণীগঞ্জ','keraniganj.dhaka.gov.bd',NULL,NULL),(368,'47','Nawabganj','নবাবগঞ্জ','nawabganj.dhaka.gov.bd',NULL,NULL),(369,'47','Dohar','দোহার','dohar.dhaka.gov.bd',NULL,NULL),(370,'48','Munshiganj Sadar','মুন্সিগঞ্জ সদর','sadar.munshiganj.gov.bd',NULL,NULL),(371,'48','Sreenagar','শ্রীনগর','sreenagar.munshiganj.gov.bd',NULL,NULL),(372,'48','Sirajdikhan','সিরাজদিখান','sirajdikhan.munshiganj.gov.bd',NULL,NULL),(373,'48','Louhajanj','লৌহজং','louhajanj.munshiganj.gov.bd',NULL,NULL),(374,'48','Gajaria','গজারিয়া','gajaria.munshiganj.gov.bd',NULL,NULL),(375,'48','Tongibari','টংগীবাড়ি','tongibari.munshiganj.gov.bd',NULL,NULL),(376,'49','Rajbari Sadar','রাজবাড়ী সদর','sadar.rajbari.gov.bd',NULL,NULL),(377,'49','Goalanda','গোয়ালন্দ','goalanda.rajbari.gov.bd',NULL,NULL),(378,'49','Pangsa','পাংশা','pangsa.rajbari.gov.bd',NULL,NULL),(379,'49','Baliakandi','বালিয়াকান্দি','baliakandi.rajbari.gov.bd',NULL,NULL),(380,'49','Kalukhali','কালুখালী','kalukhali.rajbari.gov.bd',NULL,NULL),(381,'50','Madaripur Sadar','মাদারীপুর সদর','sadar.madaripur.gov.bd',NULL,NULL),(382,'50','Shibchar','শিবচর','shibchar.madaripur.gov.bd',NULL,NULL),(383,'50','Kalkini','কালকিনি','kalkini.madaripur.gov.bd',NULL,NULL),(384,'50','Rajoir','রাজৈর','rajoir.madaripur.gov.bd',NULL,NULL),(385,'51','Gopalganj Sadar','গোপালগঞ্জ সদর','sadar.gopalganj.gov.bd',NULL,NULL),(386,'51','Kashiani','কাশিয়ানী','kashiani.gopalganj.gov.bd',NULL,NULL),(387,'51','Tungipara','টুংগীপাড়া','tungipara.gopalganj.gov.bd',NULL,NULL),(388,'51','Kotalipara','কোটালীপাড়া','kotalipara.gopalganj.gov.bd',NULL,NULL),(389,'51','Muksudpur','মুকসুদপুর','muksudpur.gopalganj.gov.bd',NULL,NULL),(390,'52','Faridpur Sadar','ফরিদপুর সদর','sadar.faridpur.gov.bd',NULL,NULL),(391,'52','Alfadanga','আলফাডাঙ্গা','alfadanga.faridpur.gov.bd',NULL,NULL),(392,'52','Boalmari','বোয়ালমারী','boalmari.faridpur.gov.bd',NULL,NULL),(393,'52','Sadarpur','সদরপুর','sadarpur.faridpur.gov.bd',NULL,NULL),(394,'52','Nagarkanda','নগরকান্দা','nagarkanda.faridpur.gov.bd',NULL,NULL),(395,'52','Bhanga','ভাঙ্গা','bhanga.faridpur.gov.bd',NULL,NULL),(396,'52','Charbhadrasan','চরভদ্রাসন','charbhadrasan.faridpur.gov.bd',NULL,NULL),(397,'52','Madhukhali','মধুখালী','madhukhali.faridpur.gov.bd',NULL,NULL),(398,'52','Saltha','সালথা','saltha.faridpur.gov.bd',NULL,NULL),(399,'53','Panchagarh Sadar','পঞ্চগড় সদর','panchagarhsadar.panchagarh.gov.bd',NULL,NULL),(400,'53','Debiganj','দেবীগঞ্জ','debiganj.panchagarh.gov.bd',NULL,NULL),(401,'53','Boda','বোদা','boda.panchagarh.gov.bd',NULL,NULL),(402,'53','Atwari','আটোয়ারী','atwari.panchagarh.gov.bd',NULL,NULL),(403,'53','Tetulia','তেতুলিয়া','tetulia.panchagarh.gov.bd',NULL,NULL),(404,'54','Nawabganj','নবাবগঞ্জ','nawabganj.dinajpur.gov.bd',NULL,NULL),(405,'54','Birganj','বীরগঞ্জ','birganj.dinajpur.gov.bd',NULL,NULL),(406,'54','Ghoraghat','ঘোড়াঘাট','ghoraghat.dinajpur.gov.bd',NULL,NULL),(407,'54','Birampur','বিরামপুর','birampur.dinajpur.gov.bd',NULL,NULL),(408,'54','Parbatipur','পার্বতীপুর','parbatipur.dinajpur.gov.bd',NULL,NULL),(409,'54','Bochaganj','বোচাগঞ্জ','bochaganj.dinajpur.gov.bd',NULL,NULL),(410,'54','Kaharol','কাহারোল','kaharol.dinajpur.gov.bd',NULL,NULL),(411,'54','Fulbari','ফুলবাড়ী','fulbari.dinajpur.gov.bd',NULL,NULL),(412,'54','Dinajpur Sadar','দিনাজপুর সদর','dinajpursadar.dinajpur.gov.bd',NULL,NULL),(413,'54','Hakimpur','হাকিমপুর','hakimpur.dinajpur.gov.bd',NULL,NULL),(414,'54','Khansama','খানসামা','khansama.dinajpur.gov.bd',NULL,NULL),(415,'54','Birol','বিরল','birol.dinajpur.gov.bd',NULL,NULL),(416,'54','Chirirbandar','চিরিরবন্দর','chirirbandar.dinajpur.gov.bd',NULL,NULL),(417,'55','Lalmonirhat Sadar','লালমনিরহাট সদর','sadar.lalmonirhat.gov.bd',NULL,NULL),(418,'55','Kaliganj','কালীগঞ্জ','kaliganj.lalmonirhat.gov.bd',NULL,NULL),(419,'55','Hatibandha','হাতীবান্ধা','hatibandha.lalmonirhat.gov.bd',NULL,NULL),(420,'55','Patgram','পাটগ্রাম','patgram.lalmonirhat.gov.bd',NULL,NULL),(421,'55','Aditmari','আদিতমারী','aditmari.lalmonirhat.gov.bd',NULL,NULL),(422,'56','Syedpur','সৈয়দপুর','syedpur.nilphamari.gov.bd',NULL,NULL),(423,'56','Domar','ডোমার','domar.nilphamari.gov.bd',NULL,NULL),(424,'56','Dimla','ডিমলা','dimla.nilphamari.gov.bd',NULL,NULL),(425,'56','Jaldhaka','জলঢাকা','jaldhaka.nilphamari.gov.bd',NULL,NULL),(426,'56','Kishorganj','কিশোরগঞ্জ','kishorganj.nilphamari.gov.bd',NULL,NULL),(427,'56','Nilphamari Sadar','নীলফামারী সদর','nilphamarisadar.nilphamari.gov.bd',NULL,NULL),(428,'57','Sadullapur','সাদুল্লাপুর','sadullapur.gaibandha.gov.bd',NULL,NULL),(429,'57','Gaibandha Sadar','গাইবান্ধা সদর','gaibandhasadar.gaibandha.gov.bd',NULL,NULL),(430,'57','Palashbari','পলাশবাড়ী','palashbari.gaibandha.gov.bd',NULL,NULL),(431,'57','Saghata','সাঘাটা','saghata.gaibandha.gov.bd',NULL,NULL),(432,'57','Gobindaganj','গোবিন্দগঞ্জ','gobindaganj.gaibandha.gov.bd',NULL,NULL),(433,'57','Sundarganj','সুন্দরগঞ্জ','sundarganj.gaibandha.gov.bd',NULL,NULL),(434,'57','Phulchari','ফুলছড়ি','phulchari.gaibandha.gov.bd',NULL,NULL),(435,'58','Thakurgaon Sadar','ঠাকুরগাঁও সদর','thakurgaonsadar.thakurgaon.gov.bd',NULL,NULL),(436,'58','Pirganj','পীরগঞ্জ','pirganj.thakurgaon.gov.bd',NULL,NULL),(437,'58','Ranisankail','রাণীশংকৈল','ranisankail.thakurgaon.gov.bd',NULL,NULL),(438,'58','Haripur','হরিপুর','haripur.thakurgaon.gov.bd',NULL,NULL),(439,'58','Baliadangi','বালিয়াডাঙ্গী','baliadangi.thakurgaon.gov.bd',NULL,NULL),(440,'59','Rangpur Sadar','রংপুর সদর','rangpursadar.rangpur.gov.bd',NULL,NULL),(441,'59','Gangachara','গংগাচড়া','gangachara.rangpur.gov.bd',NULL,NULL),(442,'59','Taragonj','তারাগঞ্জ','taragonj.rangpur.gov.bd',NULL,NULL),(443,'59','Badargonj','বদরগঞ্জ','badargonj.rangpur.gov.bd',NULL,NULL),(444,'59','Mithapukur','মিঠাপুকুর','mithapukur.rangpur.gov.bd',NULL,NULL),(445,'59','Pirgonj','পীরগঞ্জ','pirgonj.rangpur.gov.bd',NULL,NULL),(446,'59','Kaunia','কাউনিয়া','kaunia.rangpur.gov.bd',NULL,NULL),(447,'59','Pirgacha','পীরগাছা','pirgacha.rangpur.gov.bd',NULL,NULL),(448,'60','Kurigram Sadar','কুড়িগ্রাম সদর','kurigramsadar.kurigram.gov.bd',NULL,NULL),(449,'60','Nageshwari','নাগেশ্বরী','nageshwari.kurigram.gov.bd',NULL,NULL),(450,'60','Bhurungamari','ভুরুঙ্গামারী','bhurungamari.kurigram.gov.bd',NULL,NULL),(451,'60','Phulbari','ফুলবাড়ী','phulbari.kurigram.gov.bd',NULL,NULL),(452,'60','Rajarhat','রাজারহাট','rajarhat.kurigram.gov.bd',NULL,NULL),(453,'60','Ulipur','উলিপুর','ulipur.kurigram.gov.bd',NULL,NULL),(454,'60','Chilmari','চিলমারী','chilmari.kurigram.gov.bd',NULL,NULL),(455,'60','Rowmari','রৌমারী','rowmari.kurigram.gov.bd',NULL,NULL),(456,'60','Charrajibpur','চর রাজিবপুর','charrajibpur.kurigram.gov.bd',NULL,NULL),(457,'61','Sherpur Sadar','শেরপুর সদর','sherpursadar.sherpur.gov.bd',NULL,NULL),(458,'61','Nalitabari','নালিতাবাড়ী','nalitabari.sherpur.gov.bd',NULL,NULL),(459,'61','Sreebordi','শ্রীবরদী','sreebordi.sherpur.gov.bd',NULL,NULL),(460,'61','Nokla','নকলা','nokla.sherpur.gov.bd',NULL,NULL),(461,'61','Jhenaigati','ঝিনাইগাতী','jhenaigati.sherpur.gov.bd',NULL,NULL),(462,'62','Fulbaria','ফুলবাড়ীয়া','fulbaria.mymensingh.gov.bd',NULL,NULL),(463,'62','Trishal','ত্রিশাল','trishal.mymensingh.gov.bd',NULL,NULL),(464,'62','Bhaluka','ভালুকা','bhaluka.mymensingh.gov.bd',NULL,NULL),(465,'62','Muktagacha','মুক্তাগাছা','muktagacha.mymensingh.gov.bd',NULL,NULL),(466,'62','Mymensingh Sadar','ময়মনসিংহ সদর','mymensinghsadar.mymensingh.gov.bd',NULL,NULL),(467,'62','Dhobaura','ধোবাউড়া','dhobaura.mymensingh.gov.bd',NULL,NULL),(468,'62','Phulpur','ফুলপুর','phulpur.mymensingh.gov.bd',NULL,NULL),(469,'62','Haluaghat','হালুয়াঘাট','haluaghat.mymensingh.gov.bd',NULL,NULL),(470,'62','Gouripur','গৌরীপুর','gouripur.mymensingh.gov.bd',NULL,NULL),(471,'62','Gafargaon','গফরগাঁও','gafargaon.mymensingh.gov.bd',NULL,NULL),(472,'62','Iswarganj','ঈশ্বরগঞ্জ','iswarganj.mymensingh.gov.bd',NULL,NULL),(473,'62','Nandail','নান্দাইল','nandail.mymensingh.gov.bd',NULL,NULL),(474,'62','Tarakanda','তারাকান্দা','tarakanda.mymensingh.gov.bd',NULL,NULL),(475,'63','Jamalpur Sadar','জামালপুর সদর','jamalpursadar.jamalpur.gov.bd',NULL,NULL),(476,'63','Melandah','মেলান্দহ','melandah.jamalpur.gov.bd',NULL,NULL),(477,'63','Islampur','ইসলামপুর','islampur.jamalpur.gov.bd',NULL,NULL),(478,'63','Dewangonj','দেওয়ানগঞ্জ','dewangonj.jamalpur.gov.bd',NULL,NULL),(479,'63','Sarishabari','সরিষাবাড়ী','sarishabari.jamalpur.gov.bd',NULL,NULL),(480,'63','Madarganj','মাদারগঞ্জ','madarganj.jamalpur.gov.bd',NULL,NULL),(481,'63','Bokshiganj','বকশীগঞ্জ','bokshiganj.jamalpur.gov.bd',NULL,NULL),(482,'64','Barhatta','বারহাট্টা','barhatta.netrokona.gov.bd',NULL,NULL),(483,'64','Durgapur','দুর্গাপুর','durgapur.netrokona.gov.bd',NULL,NULL),(484,'64','Kendua','কেন্দুয়া','kendua.netrokona.gov.bd',NULL,NULL),(485,'64','Atpara','আটপাড়া','atpara.netrokona.gov.bd',NULL,NULL),(486,'64','Madan','মদন','madan.netrokona.gov.bd',NULL,NULL),(487,'64','Khaliajuri','খালিয়াজুরী','khaliajuri.netrokona.gov.bd',NULL,NULL),(488,'64','Kalmakanda','কলমাকান্দা','kalmakanda.netrokona.gov.bd',NULL,NULL),(489,'64','Mohongonj','মোহনগঞ্জ','mohongonj.netrokona.gov.bd',NULL,NULL),(490,'64','Purbadhala','পূর্বধলা','purbadhala.netrokona.gov.bd',NULL,NULL),(491,'64','Netrokona Sadar','নেত্রকোণা সদর','netrokonasadar.netrokona.gov.bd',NULL,NULL),(492,'9','Eidgaon','ঈদগাঁও',NULL,NULL,NULL),(493,'39','Madhyanagar','মধ্যনগর',NULL,NULL,NULL),(494,'50','Dasar','ডাসার',NULL,NULL,NULL);
/*!40000 ALTER TABLE `upozilas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_attendences`
--

DROP TABLE IF EXISTS `user_attendences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_attendences` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_attendences`
--

LOCK TABLES `user_attendences` WRITE;
/*!40000 ALTER TABLE `user_attendences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_attendences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_permissions`
--

DROP TABLE IF EXISTS `user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_permissions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission_serial` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `creator` tinyint DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_permissions_permission_serial_unique` (`permission_serial`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_permissions`
--

LOCK TABLES `user_permissions` WRITE;
/*!40000 ALTER TABLE `user_permissions` DISABLE KEYS */;
INSERT INTO `user_permissions` VALUES (1,'can_create','1',NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(2,'can_edit','2',NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(3,'can_delete','3',NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30');
/*!40000 ALTER TABLE `user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_reviews`
--

DROP TABLE IF EXISTS `user_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `review` text COLLATE utf8mb4_unicode_ci,
  `date` date DEFAULT NULL,
  `reveiw_given_by` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_reviews`
--

LOCK TABLES `user_reviews` WRITE;
/*!40000 ALTER TABLE `user_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_serial` int DEFAULT NULL,
  `creator` tinyint DEFAULT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_roles_role_serial_unique` (`role_serial`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (10,'super_admin',1,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(20,'admin',2,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(30,'user',3,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(40,'Teacher',4,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(50,'branch_admin',5,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(60,'Student',6,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30'),(70,'Employee',7,NULL,NULL,1,'2024-01-21 07:07:30','2024-01-21 07:07:30');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_salaries`
--

DROP TABLE IF EXISTS `user_salaries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_salaries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `branch_id` bigint DEFAULT NULL,
  `salary` double(8,2) DEFAULT NULL,
  `hourly_salary` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_salaries`
--

LOCK TABLES `user_salaries` WRITE;
/*!40000 ALTER TABLE `user_salaries` DISABLE KEYS */;
INSERT INTO `user_salaries` VALUES (1,5,2,12500.00,NULL,'2023-12-31 12:01:36','2023-12-31 12:01:36'),(2,6,2,12600.00,NULL,'2023-12-31 12:01:37','2023-12-31 12:01:37'),(3,23,2,23500.00,NULL,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(4,24,2,24500.00,NULL,'2023-12-31 12:01:54','2023-12-31 12:01:54'),(5,25,2,25500.00,NULL,'2023-12-31 12:01:55','2023-12-31 12:01:55'),(6,26,2,26500.00,NULL,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(7,27,2,27500.00,NULL,'2023-12-31 12:01:56','2023-12-31 12:01:56'),(8,28,3,0.00,0.00,'2023-12-31 12:05:09','2023-12-31 12:05:09'),(9,5,2,12500.00,NULL,'2024-01-21 07:07:31','2024-01-21 07:07:31'),(10,6,2,12600.00,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:32'),(11,23,2,23500.00,NULL,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(12,24,2,24500.00,NULL,'2024-01-21 07:07:44','2024-01-21 07:07:44'),(13,25,2,25500.00,NULL,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(14,26,2,26500.00,NULL,'2024-01-21 07:07:45','2024-01-21 07:07:45'),(15,27,2,27500.00,NULL,'2024-01-21 07:07:46','2024-01-21 07:07:46'),(16,28,3,0.00,0.00,'2024-01-21 10:32:51','2024-01-21 10:32:51'),(17,105,11,25000.00,0.00,'2024-03-21 08:12:35','2024-03-21 08:12:35'),(18,107,11,12000.00,0.00,'2024-03-21 08:45:11','2024-03-21 08:45:11'),(19,108,11,25000.00,0.00,'2024-03-21 08:46:52','2024-03-21 08:46:52'),(20,109,11,0.00,0.00,'2024-03-23 04:19:37','2024-03-23 04:19:37'),(21,110,11,0.00,0.00,'2024-04-17 07:43:32','2024-04-17 07:43:32');
/*!40000 ALTER TABLE `user_salaries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_salary_statements`
--

DROP TABLE IF EXISTS `user_salary_statements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_salary_statements` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned DEFAULT NULL,
  `branch_id` bigint unsigned DEFAULT NULL,
  `salary_amount` double(8,2) DEFAULT NULL,
  `month` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary_category_id` bigint DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_salary_statements`
--

LOCK TABLES `user_salary_statements` WRITE;
/*!40000 ALTER TABLE `user_salary_statements` DISABLE KEYS */;
INSERT INTO `user_salary_statements` VALUES (1,105,11,20000.00,'March',1,'2024-03-23','2024-03-23 04:38:53','2024-03-23 04:38:53'),(2,105,11,25000.00,'March',1,'2024-03-23','2024-03-23 04:39:48','2024-04-18 18:05:25'),(3,107,11,20000.00,'March',1,'2024-03-23','2024-03-23 04:40:02','2024-03-23 04:40:02'),(4,109,11,10000.00,'March',1,'2024-03-23','2024-03-23 04:40:27','2024-03-23 04:40:27'),(5,105,11,500.00,'April',2,'2024-04-15','2024-04-18 18:06:27','2024-04-18 18:06:27');
/*!40000 ALTER TABLE `user_salary_statements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_permission`
--

DROP TABLE IF EXISTS `user_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_permission` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `user_permission_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_permission`
--

LOCK TABLES `user_user_permission` WRITE;
/*!40000 ALTER TABLE `user_user_permission` DISABLE KEYS */;
INSERT INTO `user_user_permission` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,2,1,NULL,NULL),(5,2,2,NULL,NULL),(6,2,3,NULL,NULL),(7,3,1,NULL,NULL),(8,3,2,NULL,NULL),(9,4,1,NULL,NULL),(10,29,1,NULL,NULL),(11,29,2,NULL,NULL),(12,29,3,NULL,NULL),(13,30,1,NULL,NULL),(14,30,2,NULL,NULL),(15,30,3,NULL,NULL),(16,31,1,NULL,NULL),(17,31,2,NULL,NULL),(18,31,3,NULL,NULL),(19,44,1,NULL,NULL),(20,44,2,NULL,NULL),(21,44,3,NULL,NULL);
/*!40000 ALTER TABLE `user_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user_role`
--

DROP TABLE IF EXISTS `user_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `user_role_id` bigint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user_role`
--

LOCK TABLES `user_user_role` WRITE;
/*!40000 ALTER TABLE `user_user_role` DISABLE KEYS */;
INSERT INTO `user_user_role` VALUES (1,1,1,NULL,NULL),(2,1,2,NULL,NULL),(3,1,3,NULL,NULL),(4,2,5,NULL,NULL),(5,3,2,NULL,NULL),(6,3,5,NULL,NULL),(7,4,3,NULL,NULL),(8,5,7,NULL,NULL),(9,6,7,NULL,NULL),(10,7,6,NULL,NULL),(11,8,6,NULL,NULL),(12,9,6,NULL,NULL),(13,10,6,NULL,NULL),(14,11,6,NULL,NULL),(15,12,6,NULL,NULL),(16,13,6,NULL,NULL),(17,14,6,NULL,NULL),(18,15,6,NULL,NULL),(19,16,6,NULL,NULL),(20,17,6,NULL,NULL),(21,18,6,NULL,NULL),(22,19,6,NULL,NULL),(23,20,6,NULL,NULL),(24,21,6,NULL,NULL),(25,22,6,NULL,NULL),(26,23,7,NULL,NULL),(27,23,4,NULL,NULL),(28,24,7,NULL,NULL),(29,24,4,NULL,NULL),(30,25,7,NULL,NULL),(31,25,4,NULL,NULL),(32,26,7,NULL,NULL),(33,26,4,NULL,NULL),(34,27,7,NULL,NULL),(35,27,4,NULL,NULL),(36,28,7,NULL,NULL),(37,29,5,NULL,NULL),(38,30,5,NULL,NULL),(39,31,5,NULL,NULL),(40,32,6,NULL,NULL),(41,44,5,NULL,NULL),(42,45,4,NULL,NULL),(43,46,6,NULL,NULL),(44,53,6,NULL,NULL),(45,54,6,NULL,NULL),(46,63,6,NULL,NULL),(47,64,6,NULL,NULL),(48,65,6,NULL,NULL),(49,66,6,NULL,NULL),(50,67,6,NULL,NULL),(51,68,6,NULL,NULL),(52,69,6,NULL,NULL),(53,70,6,NULL,NULL),(54,71,6,NULL,NULL),(55,72,6,NULL,NULL),(56,73,6,NULL,NULL),(57,74,6,NULL,NULL),(58,75,6,NULL,NULL),(59,76,6,NULL,NULL),(60,77,6,NULL,NULL),(61,78,6,NULL,NULL),(62,79,6,NULL,NULL),(63,80,6,NULL,NULL),(64,81,6,NULL,NULL),(65,82,6,NULL,NULL),(66,83,6,NULL,NULL),(67,84,6,NULL,NULL),(68,85,6,NULL,NULL),(69,86,6,NULL,NULL),(70,87,6,NULL,NULL),(71,88,6,NULL,NULL),(72,89,6,NULL,NULL),(73,90,6,NULL,NULL),(74,91,6,NULL,NULL),(75,92,6,NULL,NULL),(76,93,6,NULL,NULL),(77,94,6,NULL,NULL),(78,95,6,NULL,NULL),(79,96,6,NULL,NULL),(80,97,6,NULL,NULL),(81,98,6,NULL,NULL),(82,99,6,NULL,NULL),(83,100,6,NULL,NULL),(84,101,6,NULL,NULL),(85,102,6,NULL,NULL),(86,103,6,NULL,NULL),(87,104,6,NULL,NULL),(88,105,4,NULL,NULL),(89,106,4,NULL,NULL),(90,107,4,NULL,NULL),(91,108,4,NULL,NULL),(92,109,7,NULL,NULL),(93,110,4,NULL,NULL),(94,111,6,NULL,NULL),(95,112,6,NULL,NULL),(96,113,6,NULL,NULL),(97,114,6,NULL,NULL),(98,115,6,NULL,NULL),(99,116,6,NULL,NULL);
/*!40000 ALTER TABLE `user_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `branch_code` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telegram_name` text COLLATE utf8mb4_unicode_ci,
  `total_monthly_attendance` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salary` double(8,2) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `mobile_number` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'avatar.png',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_name_unique` (`user_name`),
  UNIQUE KEY `users_mobile_number_unique` (`mobile_number`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Merit','Care','super admin',NULL,'812239513',NULL,NULL,NULL,NULL,'01783711740','uploads/users/pp-super admin-17489.png','superadmin@gmail.com',NULL,'$2y$10$cWmxq4hkv3WXXIzLcc.iGOjWQOw8ZrPp.8ESBK6iXl3hGU.o9cm4K','30313530',NULL,1,NULL,'2024-01-21 07:07:30','2024-01-23 07:59:36'),(2,'Branch','admin','branch admin',NULL,'812239578',NULL,NULL,NULL,NULL,'01612987','avatar.png','branchadmin@gmail.com',NULL,'$2y$10$NMonGEeWbV075TMqNdUPs.eh8U0oveGwZym8HduMOFBlV2RJ5CIge','57221752',NULL,1,NULL,'2024-01-21 07:07:31','2024-01-21 07:07:31'),(3,'mr','admin','admin',NULL,'812239513',NULL,NULL,NULL,NULL,'016124','avatar.png','admin@gmail.com',NULL,'$2y$10$B3xbyj84hKYWGCpauLKJ9.gpmBVfIl5HcM2FnKyu7ZU9EH9EqVomq','51037628',NULL,1,NULL,'2024-01-21 07:07:31','2024-01-21 07:07:31'),(4,'mr','user','user',NULL,'812239513',NULL,NULL,NULL,NULL,'016125','avatar.png','user@gmail.com',NULL,'$2y$10$d4iGNlTEuVxQdki6ueISzuRSA0PzcpMkI5E1bDbtlLcKBaOJb4NM2','22149257',NULL,1,NULL,'2024-01-21 07:07:31','2024-01-21 07:07:31'),(5,'mr','employee','employee1',NULL,'453535837',NULL,NULL,NULL,NULL,'0454326583','avatar.png','employee1@gmail.com',NULL,'$2y$10$zkY4BUsqhysB/1UhGCYYtOtZStBOCGlS7SSScZlzp1GpZ.MDyN9KC','56953738',NULL,1,NULL,'2024-01-21 07:07:31','2024-01-21 07:07:31'),(6,'mr','employee 2','employee2',NULL,'453535838',NULL,NULL,NULL,NULL,'0454326584','avatar.png','employee2@gmail.com',NULL,'$2y$10$zkFIuvAbDopyfqKHRUkG6uY3tCSQx8OzFF4RCyATYSVmkzme1PxTa','60062807',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:32'),(7,'mr','student1','student1','mirpur-branch-7','8122395121',NULL,NULL,NULL,NULL,'0161259451','avatar.png','student1@gmail.com',NULL,'$2y$10$C5nIBRWATTuNfWEyGcl8ke1r7dVH8a1if2gckGvspCnaihn67WPES','28979614',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:41'),(8,'mr','student2','student2','mirpur-branch-8','8122395122',NULL,NULL,NULL,NULL,'0161259452','avatar.png','student2@gmail.com',NULL,'$2y$10$8syr1ugyRVqOVZfINHIsgeIFZHoniMxi60Vt4ZW3dCAh2gCqDR7Ra','15586058',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:41'),(9,'mr','student3','student3','mirpur-branch-9','8122395123',NULL,NULL,NULL,NULL,'0161259453','avatar.png','student3@gmail.com',NULL,'$2y$10$LeEthfUm2frEOE5RYPImseQ0udUTTyT6d0/NALpwDg95Xc/CTCLHe','93694155',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:42'),(10,'mr','student4','student4','mirpur-branch-10','8122395124',NULL,NULL,NULL,NULL,'0161259454','avatar.png','student4@gmail.com',NULL,'$2y$10$w0DGZovpnmlgc4Mp.WO8XuXGo5yVUWfi9cG9saRsh64tD5I5dNKyC','736106721',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:42'),(11,'mr','student5','student5','mirpur-branch-11','8122395125',NULL,NULL,NULL,NULL,'0161259455','avatar.png','student5@gmail.com',NULL,'$2y$10$K88ZrdwMVD9/72M5fZ5pjOX25AuVL0rPcxRIJRreimL/KTUCbvDtm','799113960',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:42'),(12,'mr','student6','student6','mirpur-branch-12','8122395126',NULL,NULL,NULL,NULL,'0161259456','avatar.png','student6@gmail.com',NULL,'$2y$10$5Glq19QW2fUu/6jL3hk1mexm0xkLXgt3w7vUif7gxjQCxWvTmcA9u','449124982',NULL,1,NULL,'2024-01-21 07:07:32','2024-01-21 07:07:42'),(13,'mr','student7','student7','mirpur-branch-13','8122395127',NULL,NULL,NULL,NULL,'0161259457','avatar.png','student7@gmail.com',NULL,'$2y$10$5ZC/MRGL3m2J0ah6GGl5YOOhhI1GDh.qc0JJ3WAZijvUZy0HYPsLu','144132402',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:42'),(14,'mr','student8','student8','mirpur-branch-14','8122395128',NULL,NULL,NULL,NULL,'0161259458','avatar.png','student8@gmail.com',NULL,'$2y$10$QiaO7duw2ZrmhGIZ.wxqqegRu86KBm4RE/VImkEVrNjaXMJz40lGO','632147697',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:42'),(15,'mr','student9','student9','mirpur-branch-15','8122395129',NULL,NULL,NULL,NULL,'0161259459','avatar.png','student9@gmail.com',NULL,'$2y$10$6S0wEDHmNE4Of/hpsJ8l0unYymBEPKzT0liHcvduboFnYHuBI/6Ue','737151407',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:42'),(16,'mr','student10','student10','mirpur-branch-16','81223951210',NULL,NULL,NULL,NULL,'01612594510','avatar.png','student10@gmail.com',NULL,'$2y$10$Rpo4iewdsPGX0WI0S7jg3.cep8E/4RenZnPuOzy81XTK2Y/m8yjES','377165835',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:42'),(17,'mr','student11','student11','mirpur-branch-17','81223951211',NULL,NULL,NULL,NULL,'01612594511','avatar.png','student11@gmail.com',NULL,'$2y$10$Ic1J2gobYqqWmluYZA.l4.GIwF56Nkjvd1vNrkaC65ju.Mgzeefm6','630172950',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:42'),(18,'mr','student12','student12','mirpur-branch-18','81223951212',NULL,NULL,NULL,NULL,'01612594512','avatar.png','student12@gmail.com',NULL,'$2y$10$BY90vZOIqU7vm/teEwy3MO/1uSV7cxOz5SVp8V/jX237Gvsh9yqo2','326181401',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:43'),(19,'mr','student13','student13','mirpur-branch-19','81223951213',NULL,NULL,NULL,NULL,'01612594513','avatar.png','student13@gmail.com',NULL,'$2y$10$bDoz4WdzXMOoKwZoihQBxuICMBqmXJIDTYRWoruq7lltUl2MXlY5e','317198801',NULL,1,NULL,'2024-01-21 07:07:33','2024-01-21 07:07:43'),(20,'mr','student14','student14','mirpur-branch-20','81223951214',NULL,NULL,NULL,NULL,'01612594514','avatar.png','student14@gmail.com',NULL,'$2y$10$FcJOjTYTNmqunC/Rz9Hy9.1IMXKy78y0XlPQDa1YvfTbzhDHWCAQ2','672205325',NULL,1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:43'),(21,'mr','student15','student15','mirpur-branch-21','81223951215',NULL,NULL,NULL,NULL,'01612594515','avatar.png','student15@gmail.com',NULL,'$2y$10$py9ciauC/wtWhX7M1U6Oj.g2B/NsrN1iDiEJyuZVXogOi0zs4OsBK','682212436',NULL,1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:43'),(22,'mr','student16','student16','mirpur-branch-22','81223951216',NULL,NULL,NULL,NULL,'01612594516','avatar.png','student16@gmail.com',NULL,'$2y$10$YiuJi3KmvjQoB.7K0sX55OHYXxjdNPtAld0B76gR/SH7wZf6yUJTa','178228096',NULL,1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:43'),(23,'mr','teacher1','teacher1','mirpur-branch-23','8122395121',NULL,NULL,NULL,NULL,'0161259442','avatar.png','teacher1@gmail.com',NULL,'$2y$10$0TUhrn/7EtNaOqSxuw0qyOfuYlDdnuNzXyKCuZyZFHbcmvdPa1hWu','537231984','Bangla teacher',1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:43'),(24,'mr','teacher2','teacher2','mirpur-branch-24','8122395122',NULL,NULL,NULL,NULL,'0161259443','avatar.png','teacher2@gmail.com',NULL,'$2y$10$Gil7.wLFG8Jpd7bqYVLDUuFBFdP2GBzvctAkQiiSMN7VmQfbphk8u','906249111','Assistant teacher',1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:44'),(25,'mr','teacher3','teacher3','mirpur-branch-25','8122395123',NULL,NULL,NULL,NULL,'0161259444','avatar.png','teacher3@gmail.com',NULL,'$2y$10$shzOJ.nQFa0zdSZDP7ezTeDKZpKDq/Xv1KyLy/R6QWPXA9qSvhEta','809259192','Assistant teacher',1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:45'),(26,'mr','teacher4','teacher4','mirpur-branch-26','8122395124',NULL,NULL,NULL,NULL,'0161259445','avatar.png','teacher4@gmail.com',NULL,'$2y$10$Rbl9pBQWaeHOih1ZnC7gyuYojg2RLgNZROsfnGYn.izDY6S8InIjO','262261908','English Teacher',1,NULL,'2024-01-21 07:07:34','2024-01-21 07:07:45'),(27,'mr','teacher5','teacher5','mirpur-branch-27','8122395125',NULL,NULL,NULL,NULL,'0161259446','avatar.png','teacher5@gmail.com',NULL,'$2y$10$QP.Q2BHGu7ZprA1Il6P5m.vuxhj7BotWujeY/XDc.8HKoJESY8BDC','900273096','Assistant teacher',1,NULL,'2024-01-21 07:07:35','2024-01-21 07:07:46'),(28,'Bo','Hernandez','BoHernandez7022','central-28',NULL,NULL,NULL,NULL,'Rafael Vincent','Lyle Kramer','avatar.png','rote@mailinator.com',NULL,'$2y$10$3avn26NNKo/AlnxQ5vA4R.rH/IHTW6eCjzvGgLymRUXqA6XaQSnlS','419282400',NULL,1,NULL,'2024-01-21 10:32:51','2024-01-21 10:32:51'),(29,'MD Murad','Hossain','MD MuradHossain5105','KH-01',NULL,NULL,NULL,NULL,'Village: Chandkhali, Upozila: Kaligonj, District: Satkhira','+8801783711740','uploads/users/branch-66164.png','muradhossain.web@gmail.com',NULL,'$2y$10$45gbGgV9.BtSgHZwrmcQc.8UoiWxw571OOVRpemb2v9T0plqxXIay','215298824',NULL,1,NULL,'2024-01-24 04:44:33','2024-01-24 04:44:33'),(30,'MD Murad','Hossain','MD MuradHossain1740','KH-01',NULL,NULL,NULL,NULL,'Village: Chandkhali, Upozila: Kaligonj, District: Satkhira','01789256135','uploads/users/branch-75374.png','muradhossain.23@gmail.com',NULL,'$2y$10$Y0f7dCXOxe7WUwMEuAu.HeVBazCyKoqcKC8JPOWyCjPbL77VBae1q','345306695',NULL,1,NULL,'2024-01-24 04:57:17','2024-01-24 04:57:17'),(31,'Hamming','Bird','HammingBird9884','KH-01',NULL,NULL,NULL,NULL,'khulna','01727232824','uploads/users/branch-112417.jpg','hammingbird@gmail.com',NULL,'$2y$10$bBAIEqFxMABUzxDXDbYq/Ozj9g.lexYe5tn7YH4FsrTMz6JcER0JK','710314839',NULL,1,NULL,'2024-03-19 03:19:35','2024-04-18 17:24:27'),(32,'Mahdi','Hassan','MahdiHassan7969',NULL,NULL,NULL,NULL,NULL,'Patharghata Sadar','01727232825','avatar.png','mahdihassan@gmail.com',NULL,'$2y$10$jX59.qB2G71wWre/OtaAmeAwZn1ejKbACWYwEtotoEGHsV4.KMGsi','112322494',NULL,1,NULL,'2024-03-19 03:48:10','2024-03-19 03:48:10'),(44,'S','M','SM9216','KH - 02',NULL,NULL,NULL,NULL,'New Market, Khulna','01727232323',NULL,'falcon@gmail.com',NULL,'$2y$10$jKao4me.Lq1Cqt7uwEvGbOkZliVJaGdrNzBdyzODjFoo7xden0Njm','834444504',NULL,1,NULL,'2024-03-19 04:10:43','2024-03-19 04:10:43'),(45,'Saifullah','Mansur','SaifullahMansur4176',NULL,NULL,NULL,'24',15000.00,'Khalishpur','01605705466','avatar.png','saifullahlecturer@gmail.com',NULL,'$2y$10$BASIcm4nWUxTNxFu.IJO7erZ9HqWbcmvf1cuiUwJSKPbKLlyrf.Dy','873457143','Lecturer',1,NULL,'2024-03-19 04:30:50','2024-03-19 04:30:50'),(46,'TORIKUL','ISLAM','TORIKULISLAM6445','khulna-46',NULL,NULL,NULL,NULL,'uttor sonakhuli','01727232823','uploads/users/pp-462230.jpg','saifullahmansur@gmail.com',NULL,'$2y$10$8XuHi5Cibq/GZf7ZKlhrDugmFVgxDRlkhvu0mvaD/cWQGDWEaWfla','371461117',NULL,1,NULL,'2024-03-21 04:27:50','2024-03-21 04:27:50'),(53,'test','test','testtest1653','khulna-53',NULL,NULL,NULL,NULL,NULL,'asdf asdf','avatar.png',NULL,NULL,'$2y$10$6iqrouN8VpWoYQmFNMw75.Mgf/dnZB2Y5brb7meh/hK6Yuu2LwMuq','820533489',NULL,1,NULL,'2024-03-21 05:02:01','2024-03-21 05:02:02'),(54,'test','test','testtest132','khulna-54',NULL,NULL,NULL,NULL,NULL,'3424234','uploads/users/pp-544693.png',NULL,NULL,'$2y$10$GggzNlhR6pkfq0Mh2hWla.Eb/wqRFlE4UTG2ZqhD9Gbafq/mHYVa6','406546177',NULL,1,NULL,'2024-03-21 05:03:52','2024-03-21 05:03:52'),(63,'MD Murad','Hossain u','MD MuradHossain u7113','khulna-63',NULL,NULL,NULL,NULL,'Village: Chandkhali, Upozila: Kaligonj, District: Satkhira','01723212562','home/meritxacademy/public_html/public/uploads/users/student/KcP1sfWBpzHKtojGYUKYWSeC92yRV7roGxXMXG38.jpg','muradhossain.web4@gmail.com',NULL,'$2y$10$buGS0cHUg9xhz0Ju1EyqL.BDk4LymRHKgmnG6hGmfJQ1.KGb8xqTK','515638019',NULL,1,NULL,'2024-03-21 05:13:13','2024-03-21 05:56:57'),(64,'asdf','adf','asdfadf6691','khulna-64',NULL,NULL,NULL,NULL,NULL,'adsf','avatar.png','saifullahmansur2@gmail.com',NULL,'$2y$10$ZD5yaVWGr0m6oyZv9Pvzp.0uP19sXjugm.VN/TgW2FXaqTf6uIlBO','421644721',NULL,1,NULL,'2024-03-21 05:13:24','2024-03-21 05:13:24'),(65,'TORIKUL','ISLAM','TORIKULISLAM9433','khulna-65',NULL,NULL,NULL,NULL,'uttor sonakhuli','01727232852','home/meritxacademy/public_html/public/uploads/users/student/v0HYqsFKsnsvWqnPPgKdGpSewiAkFYoVO1jpk70b.jpg','saifullahmansu@gmail.com',NULL,'$2y$10$6sl5iNTPlBL28fs9jHRp.uWeqESC6l/gZlGJmf8ZIh0JRqXTLoL.C','750654174',NULL,1,NULL,'2024-03-21 05:23:54','2024-03-21 05:23:54'),(66,'Mahdi','Hassan','MahdiHassan2912','khulna-66',NULL,NULL,NULL,NULL,'Patharghata Sadar','01727232324','home/meritxacademy/public_html/public/uploads/users/student/QxapDEUmcatO7R2PyDCKMEilzButAuMMf9fgwopA.jpg','mahdihassan1@gmail.com',NULL,'$2y$10$hr1yw40ojLqUPxRD9tVS1.Wrllfjjkl.iTsME.kNxwVtZoIJCLK36','363662282',NULL,1,NULL,'2024-03-21 05:56:55','2024-03-21 05:56:56'),(67,'Foysal','Ahmed','FoysalAhmed9826','khulna-67',NULL,NULL,NULL,NULL,'Patharghata Sadar','01727272328','home/meritxacademy/public_html/public/uploads/users/student/KeRvbHwTDxz6F5B9pY41wfJ5eXXRjLmq24KRa6I0.jpg','foysalahmed@gmail.com',NULL,'$2y$10$laARAnS2UIL2vygWhVWZ4eqDu1TpzDf8jiHk4q9pq/AUAaPQ38OZi','178677005',NULL,1,NULL,'2024-03-21 05:58:29','2024-03-21 05:58:29'),(68,'Soikot','Islam','SoikotIslam1855','khulna-68',NULL,NULL,NULL,NULL,'Patharghata Sadar','01723232824','avatar.png','soikotislam@gmail.com',NULL,'$2y$10$9W.Kj8siNQ88AiPyepqGQuXk3jHzBGUu3F9tQrvSO3ofHTXYZFaBe','235685686',NULL,1,NULL,'2024-03-21 05:59:42','2024-03-21 05:59:42'),(69,'Jobaer','Islam','JobaerIslam7776','khulna-69',NULL,NULL,NULL,NULL,'Patharghata Sadar','01827232824','avatar.png','jobaerislam@gmail.com',NULL,'$2y$10$N4UmUSGUQNrUCp6IMZ7ozeZKhxdWHaYhQLi3S8SnvsU7N4A7YNayW','476694171',NULL,1,NULL,'2024-03-21 06:01:12','2024-03-21 06:01:12'),(70,'Mst','Tamanna','MstTamanna2049','khulna-70',NULL,NULL,NULL,NULL,'Patharghata Sadar','01627232824','avatar.png','msttamanna@gmail.com',NULL,'$2y$10$lzB4eX/yYJVK2sJSZXfAL.2t1WRq/d.cAh6zYgVwrNwRyu8Ju36uS','178708526',NULL,1,NULL,'2024-03-21 06:02:03','2024-03-21 06:02:03'),(71,'Mst','Mim','MstMim6768','khulna-71',NULL,NULL,NULL,NULL,'Patharghata Sadar','01605705467','avatar.png','mstmim@gmail.com',NULL,'$2y$10$WdQJSZf3Lp2hIovltvxTee9pETrfPU9E/BemopKEVfPrwSji3xkZu','263712229',NULL,1,NULL,'2024-03-21 06:03:24','2024-03-21 06:03:24'),(72,'Sakib','Islam','SakibIslam3590','khulna-72',NULL,NULL,NULL,NULL,'Patharghata Sadar','01527232824','home/meritxacademy/public_html/public/uploads/users/student/HKn31wsBHKlwvMkmH3Y1OZh3HAUlLGyAGwwBwHCI.jpg','sakibislam@gmail.com',NULL,'$2y$10$UTNLsbvAWfLdu6o/OL6y7.ANrLC081L9.UWb7DQ.Ly.tvuSMhCo2i','482726258',NULL,1,NULL,'2024-03-21 06:09:04','2024-03-21 06:09:05'),(73,'Solaiman','Islam','SolaimanIslam8239','khulna-73',NULL,NULL,NULL,NULL,'Patharghata Sadar','01727252829','avatar.png','solaimanislam@gmail.com',NULL,'$2y$10$oMxlk5YFw5rWGQLUDF9Z8eG5wR30XxWveSDT.Fimcj..3/msHifKO','829732357',NULL,1,NULL,'2024-03-21 06:10:00','2024-03-21 06:10:00'),(74,'Ibrahim','Hossain','IbrahimHossain2801','khulna-74',NULL,NULL,NULL,NULL,'Patharghata Sadar','01772328242','avatar.png','ibrahimhossain@gmail.com',NULL,'$2y$10$1xsdnHZV6bKY2.8MRzgOc.7VSMAAyVgZl2bZh1djPnl34SjJqCH7u','871741957',NULL,1,NULL,'2024-03-21 06:13:40','2024-03-21 06:13:40'),(75,'Suchi','Shen','SuchiShen8618','khulna-75',NULL,NULL,NULL,NULL,'Patharghata Sadar','01852428272','avatar.png','suchishen@gmail.com',NULL,'$2y$10$G.J.Q5m0nFxFnAFM8V4Z3eYrIqRwwZajjEH7m9WdXq8iqIN/WmqWa','172752124',NULL,1,NULL,'2024-03-21 06:15:23','2024-03-21 06:15:23'),(76,'Nilima','Jaman','NilimaJaman2750','khulna-76',NULL,NULL,NULL,NULL,'Patharghata Sadar','01952428575','avatar.png','nilimajaman@gmail.com',NULL,'$2y$10$UmtqM1OmhddY2uJD83QbGePyohsHBuGI6TKFKwRTF7N2z0fz.zVKq','604761420',NULL,1,NULL,'2024-03-21 06:16:57','2024-03-21 06:16:57'),(77,'Ferdows','Islam','FerdowsIslam9624','khulna-77',NULL,NULL,NULL,NULL,'Patharghata Sadar','01956585721','home/meritxacademy/public_html/public/uploads/users/student/WrRuOaQh3si769LA1GubrAFP2RscsbZASCyKlvTG.jpg','ferdowsislam@gmail.com',NULL,'$2y$10$s/JfKLhYsoU4Bx/GU8uCnuew3Ndz3/wMXRU5OtJMrWPFZFlRRmEF2','858771772',NULL,1,NULL,'2024-03-21 06:28:24','2024-03-21 06:28:25'),(78,'Rasel','Forazi','RaselForazi447','khulna-78',NULL,NULL,NULL,NULL,'Patharghata Sadar','01578958225','avatar.png','raselforazi@gmail.com',NULL,'$2y$10$51fNSuK16QWIKkMVNNZKWezKHfNVHcmgT2AgcanDwyQdplQyMcOcG','684788697',NULL,1,NULL,'2024-03-21 06:33:55','2024-03-21 06:33:55'),(79,'Motin','Sorkar','MotinSorkar7893','khulna-79',NULL,NULL,NULL,NULL,'Patharghata Sadar','01352585457','avatar.png','motinsorkar@gmail.com',NULL,'$2y$10$X8cD28Wx0RDrA2ODW8mFru5qz7vzlaXbWSDglecHgrPXqTJ.xVFZO','835799957',NULL,1,NULL,'2024-03-21 06:35:34','2024-03-21 06:35:34'),(80,'Farjana','Mollik','FarjanaMollik4504','khulna-80',NULL,NULL,NULL,NULL,'Patharghata Sadar','01952648575','avatar.png','farjanamollik@gmail.com',NULL,'$2y$10$bOuxaRtnTIMsSZIf9STdGuS7SzdvOsg.ohtHpy/KE4S82BIrYPzA6','211804104',NULL,1,NULL,'2024-03-21 06:36:30','2024-03-21 06:36:30'),(81,'Nazat','Piash','NazatPiash5289','khulna-81',NULL,NULL,NULL,NULL,'Patharghata Sadar','01625496235','avatar.png','nazatpiash@gmail.com',NULL,'$2y$10$jIwSwW4pG7sAC.dE2QxNvOMgCcJqwZNq8cZqBRmtwWZgha6Dj/Od6','696811463',NULL,1,NULL,'2024-03-21 06:37:58','2024-03-21 06:37:58'),(82,'Mojid','Molla','MojidMolla906','khulna-82',NULL,NULL,NULL,NULL,'Patharghata Sadar','01257625879','avatar.png','mojidmolla@gmail.com',NULL,'$2y$10$MpXxtYibcplHhJtoY4VxxeNzm98.JcE.dixniW/AAMUMxYlcvhgGy','482822081',NULL,1,NULL,'2024-03-21 06:39:00','2024-03-21 06:39:00'),(83,'Imtiaz','Mridha','ImtiazMridha8549','khulna-83',NULL,NULL,NULL,NULL,'Patharghata Sadar','01568795234','avatar.png','imtiazmridha@gmail.com',NULL,'$2y$10$PEVXHO1PyesKQ4RkPS/5wOcGkQU9/D2KS9/CToxLMveG8ewokdrHG','327833748',NULL,1,NULL,'2024-03-21 06:40:04','2024-03-21 06:40:04'),(84,'Marjana','Khatun','MarjanaKhatun6140','khulna-84',NULL,NULL,NULL,NULL,'Patharghata Sadar','01524587935','avatar.png','marjanakhatun@gmail.com',NULL,'$2y$10$aSVYT2.28zhCoPq7VkFViu5Dg6M45cbm3U6wLDxjExo/WcGiM3fD.','821846761',NULL,1,NULL,'2024-03-21 06:41:01','2024-03-21 06:41:01'),(85,'Porosh','Moni','PoroshMoni9696','khulna-85',NULL,NULL,NULL,NULL,'Patharghata Sadar','01578965412','avatar.png','poroshmoni@gmail.com',NULL,'$2y$10$5IgIJPY7QaVe9hQQ6up7OOuZcQSr0VCvvOYJpv5OU2dc67kyOy1ri','796853681',NULL,1,NULL,'2024-03-21 06:41:48','2024-03-21 06:41:48'),(86,'Muhid','Khan','MuhidKhan3548','khulna-86',NULL,NULL,NULL,NULL,'Patharghata Sadar','01562584975','avatar.png','muhidkhan@gmail.com',NULL,'$2y$10$XVoQ86IeHDj93SFlXpTY9.O4H1txhsgKezHVAjfIqH4jTkjQDlZEa','776863021',NULL,1,NULL,'2024-03-21 06:46:11','2024-03-21 06:46:11'),(87,'Sabbir','Hassan','SabbirHassan7033','khulna-87',NULL,NULL,NULL,NULL,'Patharghata Sadar','012564878956','avatar.png','sabbirhassan@gmail.com',NULL,'$2y$10$/W0Rzyke28iB2jfNznzHBeRPIrhMUSom3pwk1tCkNEefs7TJH1m0S','757879800',NULL,1,NULL,'2024-03-21 06:47:12','2024-03-21 06:47:12'),(88,'Mahbub','Hossain','MahbubHossain8470','khulna-88',NULL,NULL,NULL,NULL,'Patharghata Sadar','01358795648','avatar.png','mahbubhossain@gmail.com',NULL,'$2y$10$POaXC8ynBewWjW1cIlSfFeE8IEunDvYETHeYD9vINlZ/ZdYqDNNlW','491881950',NULL,1,NULL,'2024-03-21 06:48:50','2024-03-21 06:48:50'),(89,'Sumi','Mollik','SumiMollik7261','khulna-89',NULL,NULL,NULL,NULL,'Patharghata Sadar','02158796325','avatar.png','sumimollik@gmail.com',NULL,'$2y$10$VdlQ.gU9Ah9CvAA.CvJhhOz3oer11CtcBqeTWQoSmRhBjXwN7dlnK','217897892',NULL,1,NULL,'2024-03-21 06:49:49','2024-03-21 06:49:49'),(90,'Saifulla','Mansur','SaifullaMansur2004','khulna-90',NULL,NULL,NULL,NULL,'Patharghata Sadar','01254879635','avatar.png','saifullamansur@gmail.com',NULL,'$2y$10$YoWniFsKOFL2MG1a8xSUB.qSOVckXV2cGuIESyfxKEDr/svWG1ymi','151907516',NULL,1,NULL,'2024-03-21 06:51:21','2024-03-21 06:51:21'),(91,'Imran','Sekh','ImranSekh1401','khulna-91',NULL,NULL,NULL,NULL,'Patharghata Sadar','01235687459','avatar.png','imransekh@gmail.com',NULL,'$2y$10$nk3hn62HIemYOpHdAIPRvujZKWL48RMQZvcw.CTi/dIA6fs5WFrHO','164918829',NULL,1,NULL,'2024-03-21 06:52:07','2024-03-21 06:52:07'),(92,'Abdullah','Hossain','AbdullahHossain2715','khulna-92',NULL,NULL,NULL,NULL,'Patharghata Sadar','01721902364','avatar.png','abdullahhossain@gmail.com',NULL,'$2y$10$xtz5VDfopKALsD0IgdHD6u2ATcu7DvNT7HybdQ485YnemGm81rVf.','484927015',NULL,1,NULL,'2024-03-21 06:54:10','2024-03-21 06:54:11'),(93,'Mst','Omi','MstOmi1981','khulna-93',NULL,NULL,NULL,NULL,'Patharghata Sadar','01565896547','avatar.png','mstomi@gmail.com',NULL,'$2y$10$kqb1LpwNwPAYyz.GPvm6fessdvb/mxCm./2vOe08JhqiiyiFaeVdm','752933831',NULL,1,NULL,'2024-03-21 06:57:44','2024-03-21 06:57:44'),(94,'Orpita','Dutta','OrpitaDutta997','khulna-94',NULL,NULL,NULL,NULL,'Patharghata Sadar','01598745896','avatar.png','orpitadutta@gmail.com',NULL,'$2y$10$VhtgWc0XtJ4qaP.WUSXASeloWy7EmPQb7ZY6iQMoEorgO1YbsqRFm','664946719',NULL,1,NULL,'2024-03-21 06:58:52','2024-03-21 06:58:52'),(95,'Tanvir','Hossain','TanvirHossain9386','khulna-95',NULL,NULL,NULL,NULL,'Patharghata Sadar','01589754852','avatar.png','tanvirhossain@gmail.com',NULL,'$2y$10$zXaFP3a.k49DxFUDIF89.e4sPMo/iVuiUF13m.xE6t0E6RCMKMrUK','123955749',NULL,1,NULL,'2024-03-21 07:00:34','2024-03-21 07:00:34'),(96,'Taisir','Afridi','TaisirAfridi5480','khulna-96',NULL,NULL,NULL,NULL,'Patharghata Sadar','01852325412','avatar.png','taisirafridi@gmail.com',NULL,'$2y$10$.s0EaSbiuAsJggOaJOKLlOZSBpAsQwgRQmVzmilI4qdqTEeAyP5le','231968641',NULL,1,NULL,'2024-03-21 07:01:34','2024-03-21 07:01:34'),(97,'Tuhin','Hawladar','TuhinHawladar1798','khulna-97',NULL,NULL,NULL,NULL,'Patharghata Sadar','05874596258','avatar.png','tuhinhawladar@gmail.comm',NULL,'$2y$10$bmhi9nSzAjGD.Tngg1iakOEfUSWqePZp/OTzNnfgW7reu5CxtWE12','883971017',NULL,1,NULL,'2024-03-21 07:03:22','2024-03-21 07:03:22'),(98,'Mst','Susmi','MstSusmi7062','khulna-98',NULL,NULL,NULL,NULL,'Patharghata Sadar','01523697875','avatar.png','mstsusmi@gmail.com',NULL,'$2y$10$BcjO6DsrayR8CbabM7nHS.DeQas2aQqIXYAccL/BXCgNZWh5dR3Q2','102984182',NULL,1,NULL,'2024-03-21 07:05:56','2024-03-21 07:05:56'),(99,'Misu','Akter','MisuAkter7803','khulna-99',NULL,NULL,NULL,NULL,'Patharghata Sadar','01258963145','avatar.png','misuakter@gmail.com',NULL,'$2y$10$Pk56x/ed/o6kQVbHAjnZ0eXmSlexDZkbNdpe89YwoyF5NBz0av97q','143997805',NULL,1,NULL,'2024-03-21 07:07:19','2024-03-21 07:07:19'),(100,'Shaharia','Rokon','ShahariaRokon6641','khulna-100',NULL,NULL,NULL,NULL,'Patharghata Sadar','01258963258','avatar.png','shahariarokon@gmail.com',NULL,'$2y$10$MJctkDRmN.ZRJgkpJGRYiONNGrL.0OOGQpIIKMFBPdqoAeIjHk8IK','8881006666',NULL,1,NULL,'2024-03-21 07:08:08','2024-03-21 07:08:08'),(101,'Abu','Naim','AbuNaim9358','khulna-101',NULL,NULL,NULL,NULL,'Patharghata Sadar','01586936548','avatar.png','abunaim@gmail.com',NULL,'$2y$10$9M8Y8N.J05OcHO2mB4LE/u/lOU0WAtttbx50YCXDlDgaHSL.rtF1.','7221017888',NULL,1,NULL,'2024-03-21 07:09:10','2024-03-21 07:09:10'),(102,'Hojaifa','Sekh','HojaifaSekh6902','khulna-102',NULL,NULL,NULL,NULL,'Patharghata Sadar','01258978548','avatar.png','hojaifasekh@gmail.com',NULL,'$2y$10$Sqo3F5cA3lFwm4Jc.jvr6.CeCodj5yz3v7dogMH8n3JirSBNKnBK.','9361021163',NULL,1,NULL,'2024-03-21 07:10:04','2024-03-21 07:10:04'),(103,'Mst','Taiyeba','MstTaiyeba9974','khulna-103',NULL,NULL,NULL,NULL,'Patharghata Sadar','01758569858','avatar.png','msttaiyeba@gmai.com',NULL,'$2y$10$mU2KNeAyQ9pBIZ5ep9YeXeoGWq35xPyurz2FqHsZWIxkJ5oeitlua','4931033708',NULL,1,NULL,'2024-03-21 07:10:48','2024-03-21 07:10:48'),(104,'Fahima','Akter','FahimaAkter7059','khulna-104',NULL,NULL,NULL,NULL,'Patharghata Sadar','01258963698','avatar.png','fahimaakter@gmail.com',NULL,'$2y$10$Bt3uCy8oCqjOonF5UG1cFOptnklRCPQioEtSUJetHpaZb1rU0z39m','2621044753',NULL,1,NULL,'2024-03-21 07:11:33','2024-03-21 07:11:33'),(105,'Saifullah','Mansur','SaifullahMansur8856','khulna-105',NULL,NULL,'24',25000.00,'Patharghata Sadar','01713958481','uploads/users/pp-1055115.jpg','saifulamansur@gmail.com',NULL,'$2y$10$z1diwRSHhLjU6whhqlPYFeL2xQqvbbXJlYUWHtppt6TCQ0EoNSUX2','6091053330','Lecturer',1,NULL,'2024-03-21 08:12:34','2024-03-21 08:12:35'),(106,'Murad','Hossain','MuradHossain9240',NULL,NULL,NULL,'24',25000.00,'Sathkhira','01758565254','avatar.png','muradhossain@gmail.com',NULL,'$2y$10$QUx0pWyMYVEyD6bAxRXHCuVK2C9X7wOomrvarcR664e6tpBihvGly','3691064712','Lecturer',1,NULL,'2024-03-21 08:15:13','2024-03-21 08:15:13'),(107,'TORIKUL','ISLAM','TORIKULISLAM1527','khulna-107',NULL,NULL,'24',12000.00,'uttor sonakhuli','01772575852','uploads/users/pp-1071315.jpg','torikul@gmail.com',NULL,'$2y$10$kSzD2e6MdhMbz3iyYTKpKO9W8c70.qEzCafkLceh/.J4xjkH40iK.','1761079019','Lecturer',1,NULL,'2024-03-21 08:45:11','2024-03-21 08:45:11'),(108,'Harun','Khan','HarunKhan8898','khulna-108',NULL,NULL,'24',25000.00,'Dhaka','01756565656','avatar.png','harunkhan@gmail.com',NULL,'$2y$10$5gFHJgBI18SVk8k3CTlgQ.6Ejpz/RYM8Iz8lghUAwzhSUSemGl68K','5371081592','Lecturer',1,NULL,'2024-03-21 08:46:52','2024-03-21 08:46:52'),(109,'Mojid','Mia','MojidMia5554','khulna-109',NULL,NULL,'24',NULL,'Patharghata Sadar','01523698754','uploads/users/pp-1093363.jpg','mojidmia@gmail.com',NULL,'$2y$10$d5XXNDJpe3dXP4pwsZpIPueqoAnix8a5qS.3UhVh7UgPw85J3Le56','6381095952','MLSS',1,NULL,'2024-03-23 04:19:37','2024-03-23 04:19:37'),(110,'test','te','testte2466','khulna-110',NULL,NULL,NULL,NULL,NULL,'23223','uploads/users/pp-1107945.jpg','admin34@example.com',NULL,'$2y$10$n2X4RaiA696HfzWHRddKN.JpaLowbN2UrNnnpi/C4rdUnb3XeI6L.','4291104764',NULL,1,NULL,'2024-04-17 07:43:32','2024-04-17 07:44:54'),(111,'shefat','masum','shefatmasum4537',NULL,NULL,NULL,NULL,NULL,'dhaka','01646376015','avatar.png','myphoto288@gmail.com',NULL,'$2y$10$bH/2ehSTt/ef3xAh/QySUuTisxxORBgVR3uwVASqvVurVAUhh3J1u','5951118679',NULL,1,NULL,'2024-05-26 08:34:02','2024-05-26 08:34:02'),(112,'shefat','masum','shefatmasum9909',NULL,NULL,NULL,NULL,NULL,'dhaka','01646376016','avatar.png','myphoto289@gmail.com',NULL,'$2y$10$8MMqj1nbCGWEX6zFWIShSeZlqgWjQWWuwFu4BcoOd6jZJwVUEGDRS','8351124185',NULL,1,NULL,'2024-05-26 08:35:06','2024-05-26 08:35:06'),(113,'shefat','masum','shefatmasum9204',NULL,NULL,NULL,NULL,NULL,'dhaka','01646376017','avatar.png','myphoto2888@gmail.com',NULL,'$2y$10$J3aj4l61Yaix31A59wXjouApyXdfSJIcKCV40z4xCn1xnLo02Wm.W','6171133249',NULL,1,NULL,'2024-05-26 08:54:34','2024-05-26 08:54:34'),(114,'shefat','masum','shefatmasum276','khulna-114',NULL,NULL,NULL,NULL,'dhaka','016463760173','uploads/users/pp-1147890.jpg','myphoto2887@gmail.com',NULL,'$2y$10$jFuQ54OYkXegqSQh34nDfewoCsNKZ3xkrz7f1mOJSokbCr7USqfne','3321143080',NULL,1,NULL,'2024-05-26 08:55:19','2024-05-26 08:55:20'),(115,'mrs shefat','masum','mrs shefatmasum5985','khulna-115',NULL,NULL,NULL,NULL,'dhaka','016463760145','uploads/users/pp-1154011.jpg','myphoto3288@gmail.com',NULL,'$2y$10$OZ4SemiGefGBGicn5ephdu/040je4mI2obFgRn//gktz2TGlEGAiy','6211159562',NULL,1,NULL,'2024-05-26 09:00:00','2024-05-26 09:00:00'),(116,'abir','hasan','abirhasan9316','khulna-116',NULL,NULL,NULL,NULL,'kazi para','016463760148','uploads/users/pp-1163084.jpg','abir1@gmail.com',NULL,'$2y$10$9PwdRgNsWKNLmHC/CUWnveCvYlVSMCsPRkrPB6lTJusx02jQG656a','3931161185',NULL,1,NULL,'2024-05-26 18:46:20','2024-05-26 18:46:20');
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

-- Dump completed on 2024-07-03 10:52:31
