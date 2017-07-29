-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: storelte
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

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
-- Table structure for table `storelte_app_config`
--

DROP TABLE IF EXISTS `storelte_app_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_app_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(45) NOT NULL,
  `address` varchar(80) NOT NULL,
  `country` varchar(45) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `telephone` varchar(15) NOT NULL,
  `email` varchar(60) NOT NULL,
  `logo` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_app_config`
--

LOCK TABLES `storelte_app_config` WRITE;
/*!40000 ALTER TABLE `storelte_app_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `storelte_app_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_customers`
--

DROP TABLE IF EXISTS `storelte_customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_customers`
--

LOCK TABLES `storelte_customers` WRITE;
/*!40000 ALTER TABLE `storelte_customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `storelte_customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_module`
--

DROP TABLE IF EXISTS `storelte_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `module` varchar(45) NOT NULL,
  `url` varchar(45) NOT NULL,
  `icon` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_storelte_modulo_storelte_seccion1_idx` (`section_id`),
  CONSTRAINT `storelte_module_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `storelte_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_module`
--

LOCK TABLES `storelte_module` WRITE;
/*!40000 ALTER TABLE `storelte_module` DISABLE KEYS */;
INSERT INTO `storelte_module` VALUES (1,1,'products','inventory/product',NULL,1),(2,2,'provider','purchase/provider',NULL,1),(3,3,'sales','sale/sales',NULL,1),(4,4,'reports','report/reports',NULL,1),(5,5,'config','setting/settings',NULL,1);
/*!40000 ALTER TABLE `storelte_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_module_profile`
--

DROP TABLE IF EXISTS `storelte_module_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_module_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_storelte_modulo_perfil_storelte_perfiles1_idx` (`profile_id`),
  KEY `fk_storelte_modulo_perfil_storelte_modulo1_idx` (`module_id`),
  CONSTRAINT `storelte_module_profile_ibfk_1` FOREIGN KEY (`module_id`) REFERENCES `storelte_module` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_module_profile`
--

LOCK TABLES `storelte_module_profile` WRITE;
/*!40000 ALTER TABLE `storelte_module_profile` DISABLE KEYS */;
INSERT INTO `storelte_module_profile` VALUES (1,1,1,1),(2,1,2,1),(4,1,4,1),(6,2,3,1),(7,1,3,1),(8,1,5,1);
/*!40000 ALTER TABLE `storelte_module_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_notifications`
--

DROP TABLE IF EXISTS `storelte_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(45) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = unread, 1 = seen',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `product_id` (`product_id`),
  KEY `fk_storelte_notifications_storelte_users1_idx` (`user_id`),
  CONSTRAINT `fk_storelte_notifications_storelte_users1` FOREIGN KEY (`user_id`) REFERENCES `storelte_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `storelte_notifications_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `storelte_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_notifications`
--

LOCK TABLES `storelte_notifications` WRITE;
/*!40000 ALTER TABLE `storelte_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `storelte_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_order`
--

DROP TABLE IF EXISTS `storelte_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `total` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `cash_tend` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `change_due` decimal(9,2) unsigned NOT NULL DEFAULT '0.00',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int(2) NOT NULL DEFAULT '0' COMMENT 'Tendra el valor de 0 si es una orden no concretada y 1 si es una orden concretada',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `usuario_orden` FOREIGN KEY (`user_id`) REFERENCES `storelte_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_order`
--

LOCK TABLES `storelte_order` WRITE;
/*!40000 ALTER TABLE `storelte_order` DISABLE KEYS */;
INSERT INTO `storelte_order` VALUES (30,1,4491.00,5000.00,509.00,'2017-06-24 08:44:55',1),(32,1,1913.00,2000.00,87.00,'2017-06-24 08:47:56',1),(35,1,3096.00,5000.00,1904.00,'2017-06-24 09:05:55',1),(36,1,12.00,15.00,3.00,'2017-07-04 07:38:15',1),(37,1,4950.00,4950.00,0.00,'2017-07-04 07:39:33',1),(38,1,1001.00,2000.00,999.00,'2017-07-05 22:31:27',1),(39,1,14.00,50.00,36.00,'2017-07-05 23:00:50',1),(40,1,14.00,50.00,36.00,'2017-07-05 23:01:43',1),(41,1,432.00,500.00,68.00,'2017-07-05 23:01:58',1),(42,1,504.00,700.00,196.00,'2017-07-05 23:11:31',1),(43,1,1598.00,2000.00,402.00,'2017-07-05 23:13:29',1),(44,1,4000.00,5000.00,1000.00,'2017-07-06 00:00:34',1),(45,1,21.00,30.00,9.00,'2017-07-06 00:01:56',1),(46,1,7.00,10.00,3.00,'2017-07-06 00:02:35',1),(47,1,7.00,10.00,3.00,'2017-07-06 00:03:16',1),(48,1,1000.00,3000.00,2000.00,'2017-07-06 00:04:36',1),(49,1,14.00,50.00,36.00,'2017-07-06 00:05:34',1),(50,1,2500.00,5000.00,2500.00,'2017-07-06 00:09:08',1),(51,1,14.00,5000.00,4986.00,'2017-07-06 00:12:14',1),(52,1,21.00,5000.00,4979.00,'2017-07-06 00:13:20',1),(53,1,84.00,90.00,6.00,'2017-07-06 00:13:31',1),(54,1,7500.00,15000.00,7500.00,'2017-07-06 03:31:10',1),(55,1,33.00,4950.00,4917.00,'2017-07-06 03:34:14',1),(56,1,21.00,50.00,29.00,'2017-07-06 03:35:14',1),(57,1,21.00,30.00,9.00,'2017-07-06 03:36:35',1),(58,1,19200.00,9999999.99,9999999.99,'2017-07-06 03:37:34',1),(59,1,1.00,2.00,1.00,'2017-07-06 03:38:08',1),(60,1,42.00,200.00,158.00,'2017-07-06 03:38:41',1),(61,1,204.00,900.00,696.00,'2017-07-06 03:43:28',1),(62,1,26.00,5000.00,4974.00,'2017-07-06 03:46:39',1),(63,1,2435.00,2435.00,0.00,'2017-07-06 03:50:39',1),(64,1,13.00,30.00,17.00,'2017-07-06 03:51:29',1),(65,1,2.00,4.00,2.00,'2017-07-06 04:28:02',1),(66,1,2.00,5.00,3.00,'2017-07-06 04:33:01',1),(67,1,500.00,600.00,100.00,'2017-07-06 04:33:49',1),(68,1,500.00,600.00,100.00,'2017-07-06 04:34:34',1),(69,1,2500.00,3000.00,500.00,'2017-07-06 04:34:43',1),(70,1,1500.00,3000.00,1500.00,'2017-07-13 02:26:30',1),(71,1,1500.00,5000.00,3500.00,'2017-07-13 02:36:22',1),(72,1,500.00,850.00,350.00,'2017-07-13 02:39:50',1),(73,1,1500.00,5000.00,3500.00,'2017-07-13 02:48:38',1),(74,1,3600.00,4950.00,1350.00,'2017-07-13 03:12:24',1),(75,1,4800.00,8000.00,3200.00,'2017-07-13 03:18:01',1),(76,1,17.00,50.00,33.00,'2017-07-13 03:37:06',1),(77,1,42.00,50.00,8.00,'2017-07-16 18:32:10',1),(78,1,24.00,3000.00,2976.00,'2017-07-17 00:15:41',1),(79,1,0.00,0.00,0.00,'2017-07-17 00:29:48',0);
/*!40000 ALTER TABLE `storelte_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_order_detail`
--

DROP TABLE IF EXISTS `storelte_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_order_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(9,2) unsigned NOT NULL,
  `price` decimal(9,2) unsigned NOT NULL,
  `total` decimal(9,2) unsigned NOT NULL,
  `subtotal` decimal(9,2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `storelte_order_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `storelte_order` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `storelte_order_detail_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `storelte_products` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_order_detail`
--

LOCK TABLES `storelte_order_detail` WRITE;
/*!40000 ALTER TABLE `storelte_order_detail` DISABLE KEYS */;
INSERT INTO `storelte_order_detail` VALUES (1,30,4164,9.00,99.00,99.00,99.00),(2,30,4170,6.00,600.00,600.00,600.00),(3,32,4174,6.00,12.00,12.00,12.00),(4,32,4173,3.00,12.00,12.00,12.00),(5,32,4172,4.00,1.00,1.00,1.00),(6,32,4171,1.00,1.00,1.00,1.00),(7,32,4170,3.00,600.00,600.00,600.00),(8,35,4165,36.00,77.00,77.00,77.00),(10,35,4175,12.00,12.00,12.00,12.00),(11,35,4176,15.00,12.00,12.00,12.00),(12,36,4173,1.00,12.00,12.00,12.00),(13,37,4164,50.00,99.00,99.00,99.00),(15,38,4165,13.00,77.00,77.00,77.00),(16,39,4168,2.00,7.00,7.00,7.00),(17,40,4168,2.00,7.00,7.00,7.00),(18,41,4175,36.00,12.00,12.00,12.00),(19,42,4174,42.00,12.00,12.00,12.00),(20,43,4165,1.00,77.00,77.00,77.00),(21,43,4168,3.00,7.00,7.00,7.00),(22,43,4169,3.00,500.00,500.00,500.00),(23,44,4169,8.00,500.00,500.00,500.00),(24,45,4168,3.00,7.00,7.00,7.00),(25,46,4168,1.00,7.00,7.00,7.00),(26,47,4168,1.00,7.00,7.00,7.00),(27,48,4169,2.00,500.00,500.00,500.00),(29,49,4168,2.00,7.00,7.00,7.00),(30,50,4169,5.00,500.00,500.00,500.00),(32,51,4168,2.00,7.00,7.00,7.00),(33,52,4168,3.00,7.00,7.00,7.00),(39,53,4168,12.00,7.00,7.00,7.00),(40,54,4169,15.00,500.00,500.00,500.00),(41,55,4171,33.00,1.00,1.00,1.00),(43,56,4168,3.00,7.00,7.00,7.00),(44,57,4168,3.00,7.00,7.00,7.00),(45,58,4170,32.00,600.00,600.00,600.00),(46,59,4172,1.00,1.00,1.00,1.00),(47,60,4168,6.00,7.00,7.00,7.00),(48,61,4173,17.00,12.00,12.00,12.00),(49,62,4168,2.00,7.00,7.00,7.00),(50,62,4173,1.00,12.00,12.00,12.00),(52,63,4168,5.00,7.00,7.00,7.00),(53,63,4170,4.00,600.00,600.00,600.00),(54,64,4172,1.00,1.00,1.00,1.00),(55,64,4173,1.00,12.00,12.00,12.00),(56,65,4172,2.00,1.00,1.00,1.00),(57,66,4172,0.00,1.00,0.00,0.00),(59,67,4169,1.00,500.00,500.00,500.00),(60,68,4169,1.00,500.00,500.00,500.00),(66,69,4169,5.00,500.00,500.00,500.00),(69,70,4169,3.00,500.00,500.00,500.00),(71,71,4169,3.00,500.00,500.00,500.00),(73,72,4169,1.00,500.00,500.00,500.00),(74,73,4169,3.00,500.00,500.00,500.00),(75,74,4170,6.00,600.00,600.00,600.00),(76,75,4170,8.00,600.00,600.00,600.00),(77,76,4171,17.00,1.00,1.00,1.00),(78,77,4172,42.00,1.00,1.00,1.00),(79,78,4174,2.00,12.00,12.00,12.00);
/*!40000 ALTER TABLE `storelte_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_products`
--

DROP TABLE IF EXISTS `storelte_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `hash_id` varchar(32) NOT NULL,
  `code` varchar(20) NOT NULL,
  `description` varchar(45) NOT NULL,
  `purchase_price` decimal(9,2) unsigned NOT NULL,
  `sale_price` decimal(9,2) unsigned NOT NULL,
  `wholesale_price` decimal(9,2) unsigned NOT NULL,
  `min_stock` int(11) unsigned NOT NULL,
  `stock` int(11) unsigned NOT NULL,
  `max_stock` int(11) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `descripcion` (`description`),
  UNIQUE KEY `codigo` (`code`),
  KEY `provider_id` (`provider_id`),
  CONSTRAINT `storelte_products_ibfk_1` FOREIGN KEY (`provider_id`) REFERENCES `storelte_provider` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_products`
--

LOCK TABLES `storelte_products` WRITE;
/*!40000 ALTER TABLE `storelte_products` DISABLE KEYS */;
INSERT INTO `storelte_products` VALUES (4164,1005,'861578d797aeb0634f77aff3f488cca2','AF7F-3594','nike',9.00,99.00,9.00,0,0,27,'2017-04-10 15:10:16','2017-07-05 22:30:46',0),(4165,1006,'a7f0d2b95c60161b3f3c82f764b1d1c9','EBDD-39D9','hammer',7.00,77.00,7.00,0,0,14,'2017-04-10 15:21:28','2017-07-05 23:30:09',0),(4168,1007,'e46bc064f8e92ac2c404b9871b2a4ef2','1CBD-59FD','whey protein',7.00,7.00,7.00,0,0,7,'2017-04-11 10:54:34','2017-07-06 03:51:21',0),(4169,1008,'2192890582189ff58ddbb2b79900f246','DBB7-519B','papas',500.00,500.00,500.00,0,0,50,'2017-06-21 02:30:16','2017-07-13 03:12:17',0),(4170,1009,'adc8ca1b15e20915c3ea6008fc2f52ed','AA3A-9DC1','iphone',600.00,600.00,600.00,0,0,50,'2017-06-21 02:31:05','2017-07-13 03:36:59',0),(4171,1010,'1bd36c9ae813f304363ae6ac7f48068e','1F0F-1089','ipad',12.00,1.00,12.00,0,0,2,'2017-06-23 05:13:45','2017-07-16 18:32:04',0),(4172,1011,'8ce1a43fb75e779c6b794ba4d255cf6d','737F-A4F4','dr. beats solo 2',1.00,1.00,1.00,0,0,56,'2017-06-23 05:17:11','2017-07-17 00:15:35',0),(4173,1012,'2130eb640e0a272898a51da41363542d','A4A5-2959','nintendo ds',12.00,12.00,12.00,0,27,800,'2017-06-24 06:26:01','2017-07-06 04:18:45',1),(4174,1013,'f69041d874533096748e2d77480c1fea','FF78-9C8B','FX 8230E AMD',12.00,12.00,12.00,0,0,50,'2017-06-24 06:42:25','2017-07-17 00:29:41',0),(4175,1014,'97008ea27052082be055447be9e85612','CBD2-9624','12dsfds',12.00,12.00,12.00,0,2,1,'2017-06-27 09:23:41','2017-07-06 03:29:17',1),(4176,1011,'16d11e9595188dbad0418a85f0351aba','D535-7C09','aa',12.00,12.00,12.00,0,35,1,'2017-06-27 09:31:18','2017-07-04 07:38:10',1);
/*!40000 ALTER TABLE `storelte_products` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `storelte`.`update_product_status`
BEFORE UPDATE ON `storelte`.`storelte_products`
FOR EACH ROW
BEGIN
IF (NEW.`stock` = 0 AND NEW.`stock` <> OLD.`stock`) 
THEN
    SET NEW.status = 0;
ELSE
    SET NEW.status = 1;
END IF;
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `storelte_profile`
--

DROP TABLE IF EXISTS `storelte_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_profile`
--

LOCK TABLES `storelte_profile` WRITE;
/*!40000 ALTER TABLE `storelte_profile` DISABLE KEYS */;
INSERT INTO `storelte_profile` VALUES (1,'admin',1),(2,'vendedor',1);
/*!40000 ALTER TABLE `storelte_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_provider`
--

DROP TABLE IF EXISTS `storelte_provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_provider` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash_id` varchar(32) DEFAULT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(70) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1017 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_provider`
--

LOCK TABLES `storelte_provider` WRITE;
/*!40000 ALTER TABLE `storelte_provider` DISABLE KEYS */;
INSERT INTO `storelte_provider` VALUES (1005,'2387337ba1e0b0249ba90f55b2ba2521','Luis','Fernando','6691234763','ajdjh159@gmail.com','9267 3rd Terrace','2017-06-04 04:53:26','2017-06-24 08:38:44',1),(1006,'9246444d94f081e3549803b928260f56','Aaron','Imperial','6691297463','2014030391@gmail.com','95657 Dayton Drive','2017-06-04 04:53:26','2017-06-24 08:34:37',1),(1007,'d7322ed717dedf1eb4e6e52a37ea7bcd','Vaclav','Welchman','1-(717)350-7799','vwelchman0@cam.ac.uk','2 Bunting Lane','2017-06-24 08:30:58','2017-06-24 08:36:33',1),(1008,'1587965fb4d4b5afe8428a4a024feb0d','Priscella','Berard','51-(666)428-0803','pberard1@deviantart.com','95657 Dayton Drive','2017-06-24 08:30:58','2017-06-24 08:30:58',1),(1009,'31b3b31a1c2f8a370206f111127c0dbd','Conan','Reeder','380-(625)153-0067','creeder2@canalblog.com','3 Saint Paul Alley','2017-06-24 08:30:59','2017-06-24 08:30:59',1),(1010,'1e48c4420b7073bc11916c6c1de226bb','Moira','MacDiarmond','86-(208)522-9926','mmacdiarmond3@free.fr','85060 Magdeline Park','2017-06-24 08:30:59','2017-06-24 08:30:59',1),(1011,'23a1b15a787f353467b4c05ae4a6294d','Tirrell','Jiruca','375-(602)707-0372','tjiruca4@ibm.com','797 Barnett Court','2017-06-24 08:30:59','2017-06-24 08:30:59',1),(1012,'7f975a56c761db6506eca0b37ce6ec87','Ardelle','O\'Neal','351-(768)327-9216','aoneal5@issuu.com','835 Clarendon Court','2017-06-24 08:30:59','2017-06-24 08:36:33',1),(1013,'6b180037abbebea991d8b1232f8a8ca9','Traci','Brounsell','357-(827)196-0058','tbrounsell6@twitpic.com','5367 Aberg Avenue','2017-06-24 08:30:59','2017-06-24 08:36:33',1),(1014,'766d856ef1a6b02f93d894415e6bfa0e','Giusto','Cullen','216-(774)653-7737','gcullen7@upenn.edu','9267 3rd Terrace','2017-06-24 08:30:59','2017-06-24 08:36:33',1),(1015,'298923c8190045e91288b430794814c4','Lyon','Espadero','62-(243)456-0782','lespadero8@eventbrite.com','94183 Daystar Road','2017-06-24 08:30:59','2017-06-24 08:36:33',1),(1016,'08fe2621d8e716b02ec0da35256a998d','Consuela','Tschirschky','7-(194)509-2878','ctschirschky9@abc.net.au','4628 Buell Court','2017-06-24 08:30:59','2017-06-24 08:30:59',1);
/*!40000 ALTER TABLE `storelte_provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_section`
--

DROP TABLE IF EXISTS `storelte_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section` varchar(45) NOT NULL,
  `icon` varchar(45) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_section`
--

LOCK TABLES `storelte_section` WRITE;
/*!40000 ALTER TABLE `storelte_section` DISABLE KEYS */;
INSERT INTO `storelte_section` VALUES (1,'Inventory','items.png',1),(2,'Purchase','suppliers.png',1),(3,'Sales','sales.png',1),(4,'Reports','barchart.png',1),(5,'Store Config','config.png',1);
/*!40000 ALTER TABLE `storelte_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_sessions`
--

DROP TABLE IF EXISTS `storelte_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_sessions`
--

LOCK TABLES `storelte_sessions` WRITE;
/*!40000 ALTER TABLE `storelte_sessions` DISABLE KEYS */;
INSERT INTO `storelte_sessions` VALUES ('icil2jivsv8d6qvjs85vad490putln0v','192.168.0.1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499915830,'__ci_last_regenerate|i:1499915830;'),('910c5714k12jk64kphb6q4ike7odc4us','69.171.225.77','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',1499915838,'__ci_last_regenerate|i:1499915838;'),('9i10m486jg4fl0lkltfelhaltfkk24lr','173.252.123.180','Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_2 like Mac OS X) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.0 Mobile/14F',1499915840,'__ci_last_regenerate|i:1499915840;'),('0s95c1dead765vji96iksa60g2slmsam','69.171.225.85','facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)',1499915868,'__ci_last_regenerate|i:1499915868;'),('974u1uk01k94sb2ndon7aju92oorh8ha','189.174.73.68','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36',1499915890,'__ci_last_regenerate|i:1499915890;'),('974u1uk01k94sb2ndon7aju92oorh8ha','23.27.248.121','Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36',1499916008,'__ci_last_regenerate|i:1499916008;'),('io3nj388mq1u1olddfhlhup2hr1gtgga','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499916719,'__ci_last_regenerate|i:1499916719;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('pi2qk0ieahjgc1i0j81q8srhpa96kvt1','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499917031,'__ci_last_regenerate|i:1499917031;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|i:76;'),('tb3h9vf9m4psp1p60ca9g6005ri6ugfg','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499917273,'__ci_last_regenerate|i:1499917031;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|i:76;'),('kl1s17si07h7ngpbnbv79edrpjerdgfh','189.173.98.240','Mozilla/5.0 (Linux; Android 5.1.1; Lenovo A6020l36 Build/LMY47V; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 ',1499923253,'__ci_last_regenerate|i:1499923253;'),('v0g4brhkfgsri9e5qbmur1ocab3021g1','187.189.241.13','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36',1499960828,'__ci_last_regenerate|i:1499960828;'),('schstqe9eohg0dqos34d5qbm05tq2rva','187.189.241.13','Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36',1499960951,'__ci_last_regenerate|i:1499960828;'),('0i58ja7rkk5lg5hpsu47erko266sveaj','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499993990,'__ci_last_regenerate|i:1499993990;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('372lhk6ap9vpovaadd1ist2pp8748n04','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499994561,'__ci_last_regenerate|i:1499994561;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('s93jd4no4ar8jddd51s4fc7mebq2pmrs','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499996229,'__ci_last_regenerate|i:1499996229;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('gs41h2qh89js58qaj28clsjvv8hlh7rh','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499996336,'__ci_last_regenerate|i:1499996229;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('jjjel6gfh2k51v5qls27tseuut65g1uf','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499996652,'__ci_last_regenerate|i:1499996652;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('fjejv5q4au2pjjhpf8da02upveg6m4qr','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499997265,'__ci_last_regenerate|i:1499997265;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('mgss45h5oba6ns6lvu0t4bfgpa2f8f8j','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499998328,'__ci_last_regenerate|i:1499998328;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('fhkmark3tkahqsulfllg3cqpnknkruru','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499998639,'__ci_last_regenerate|i:1499998639;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('ipl4sli6q6me4i3v1nb3ov75teqkp63s','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499998965,'__ci_last_regenerate|i:1499998965;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('vfqu6clgp3vl7djr6rvtrhedbqspcn1p','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499999267,'__ci_last_regenerate|i:1499999267;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('8hr41kdmghcs474rc7le763elhjjgvlv','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499999582,'__ci_last_regenerate|i:1499999582;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('farfk4isapaenbi01r3epunsshbecu8q','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1499999909,'__ci_last_regenerate|i:1499999909;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"76\";'),('n0lfrcq64lok19u598d6gafkpg5kktr4','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500000213,'__ci_last_regenerate|i:1500000213;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"76\";'),('s1uocppl6picu2ieifjm895r4niqiiim','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500000611,'__ci_last_regenerate|i:1500000611;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"76\";'),('v78ndvtfbd6qvjvuid0fa3kguc00js2o','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500001152,'__ci_last_regenerate|i:1500001152;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"76\";'),('28g706ov3ut9a2k2q9ofptnah3gdcg4d','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500001517,'__ci_last_regenerate|i:1500001517;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"76\";'),('7q8ol8ptab7n266i119ro21k5te83j8v','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500001585,'__ci_last_regenerate|i:1500001517;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"76\";'),('ssqcuacubemfk3vu9csfobhefv7cv800','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500229912,'__ci_last_regenerate|i:1500229912;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('5e3epvcet59cuh3oqjfo3qfngkqq7kr0','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500230293,'__ci_last_regenerate|i:1500230293;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"77\";'),('8fcto797b411p9psdog753tkm849r8bh','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500230621,'__ci_last_regenerate|i:1500230621;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"77\";'),('k4lltbkdh5997d5rltogvllhtsgjfi6b','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500231166,'__ci_last_regenerate|i:1500231166;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"77\";'),('3m0q1flfn0itq5fil6c8un7677esgedh','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500232538,'__ci_last_regenerate|i:1500232538;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"77\";'),('mj7mp81r52qlms5rhkq5ivicsu8um14t','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500233335,'__ci_last_regenerate|i:1500233335;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"77\";'),('si6ib82mcdpf8hnasn0q9jp9cp4s9l7q','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.10',1500233335,'__ci_last_regenerate|i:1500233335;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"77\";'),('vi9ga9bvn115oh7iqn6c97p6rlkmd78r','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500243389,'__ci_last_regenerate|i:1500243230;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('5mp0rc45p736njlouk9q0vsd9b5oaev3','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500244917,'__ci_last_regenerate|i:1500244917;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('i8q2b9rmkc38cs7oedubdghk4ir0mob4','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500245346,'__ci_last_regenerate|i:1500245346;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('mo7k1vf0hdps23n9i7e22acliv266j7a','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500245689,'__ci_last_regenerate|i:1500245689;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('p7v15tb3d75or6ubqfgh7nv3ptvv8dkt','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500246934,'__ci_last_regenerate|i:1500246934;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('64hf32buvi99nt84hcpv0ubsusctl488','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500247238,'__ci_last_regenerate|i:1500247238;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('4da91lkc33pfjugela8prsono67qqhf4','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500247551,'__ci_last_regenerate|i:1500247551;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('j1jju7q7aqr4rcmqqnd0m9gj9j26412a','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500247858,'__ci_last_regenerate|i:1500247858;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('ciljmm03qofpvie1dkk528uvfqtler2o','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500248543,'__ci_last_regenerate|i:1500248543;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('6n9tbvfk05lra67n6js9mo3mg4nkshv5','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500248796,'__ci_last_regenerate|i:1500248543;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('pn7p8vcc4c2r2bn6qscvr671dknt533i','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500248862,'__ci_last_regenerate|i:1500248819;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('t5tuu0ivhu4vd91k6cqsvotvup8bmspa','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500249193,'__ci_last_regenerate|i:1500249193;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('pitssqoc6e7ic5vip2226u45650168oh','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500250103,'__ci_last_regenerate|i:1500250103;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('vtmc4pjbm670esiklrbln7vpkc72ou01','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500250407,'__ci_last_regenerate|i:1500250407;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('vj52uli2821tcbn3gg1475uvfjnvj1b4','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500250801,'__ci_last_regenerate|i:1500250801;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('9pgjvsff7t4cggv2erbbsbdet9u9b2hj','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500250570,'__ci_last_regenerate|i:1500250505;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"78\";'),('mkbsmtshaiabananovus926h4s1c2ssm','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500251310,'__ci_last_regenerate|i:1500251310;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}'),('a3jqdrt5g4vnsujc8i0d54n77k3ub8rf','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500251616,'__ci_last_regenerate|i:1500251616;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"79\";'),('c73keje17ta42hahsfjmepbomfj3ts2o','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500251939,'__ci_last_regenerate|i:1500251939;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"79\";'),('ed17q5juiovtvtngsneejp1rkk08k74u','::1','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/59.0.3071.109 Chrome/59.0.3071.109 Safari/537.36',1500251940,'__ci_last_regenerate|i:1500251939;log|a:5:{s:2:\"id\";s:1:\"1\";s:4:\"name\";s:5:\"Aaron\";s:9:\"last_name\";s:8:\"Imperial\";s:4:\"type\";s:1:\"1\";s:9:\"logged_in\";b:1;}carrito|s:2:\"79\";');
/*!40000 ALTER TABLE `storelte_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `storelte_users`
--

DROP TABLE IF EXISTS `storelte_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `storelte_users` (
  `id` int(11) NOT NULL,
  `profile_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(70) NOT NULL,
  `creaded_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_storelte_usuarios_storelte_perfiles_idx` (`profile_id`),
  CONSTRAINT `storelte_users_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `storelte_profile` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storelte_users`
--

LOCK TABLES `storelte_users` WRITE;
/*!40000 ALTER TABLE `storelte_users` DISABLE KEYS */;
INSERT INTO `storelte_users` VALUES (1,1,'Aaron','Imperial','admin','984301de02477e669104753ddb39f12a6d578623ac5962b0feabe9e315f9133a','2017-04-09 13:42:02',1),(2,2,'Anne','Fay','demo','5ce79ddbd1ef55c03dcfeeca71fd6e0e28702aabf2d391a3e919729feaa2478c','2017-04-09 13:42:02',1);
/*!40000 ALTER TABLE `storelte_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!50001 DROP VIEW IF EXISTS `ticket`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ticket` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `description`,
 1 AS `quantity`,
 1 AS `price`,
 1 AS `total`,
 1 AS `cash_tend`,
 1 AS `change_due`,
 1 AS `created_at`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'storelte'
--
/*!50003 DROP PROCEDURE IF EXISTS `storelte_best_selling` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ALLOW_INVALID_DATES,ERROR_FOR_DIVISION_BY_ZERO,TRADITIONAL,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `storelte_best_selling`()
BEGIN
   SELECT `description`,SUM(`storelte_order_detail`.quantity) AS best_selling_product
   FROM `storelte_order_detail`
   INNER JOIN `storelte_products` ON `storelte_order_detail`.`product_id` = `storelte_products`.id
   GROUP BY storelte_order_detail.product_id
   ORDER BY SUM(storelte_order_detail.`quantity`) DESC LIMIT 0,10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `ticket`
--

/*!50001 DROP VIEW IF EXISTS `ticket`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ticket` AS select `storelte_users`.`first_name` AS `first_name`,`storelte_users`.`last_name` AS `last_name`,`storelte_products`.`description` AS `description`,`storelte_order_detail`.`quantity` AS `quantity`,`storelte_order_detail`.`price` AS `price`,`storelte_order`.`total` AS `total`,`storelte_order`.`cash_tend` AS `cash_tend`,`storelte_order`.`change_due` AS `change_due`,`storelte_order`.`created_at` AS `created_at` from (((`storelte_order_detail` join `storelte_products` on((`storelte_products`.`id` = `storelte_order_detail`.`product_id`))) join `storelte_order` on((`storelte_order`.`id` = `storelte_order_detail`.`order_id`))) join `storelte_users` on((`storelte_users`.`id` = `storelte_order`.`user_id`))) where ((`storelte_order`.`id` = (select max(`storelte_order`.`id`) from `storelte_order` where ((`storelte_order`.`user_id` = 1) and (`storelte_order`.`status` = 1)))) and (`storelte_order`.`user_id` = 1) and (`storelte_order`.`status` = 1)) */;
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

-- Dump completed on 2017-07-16 18:43:09
