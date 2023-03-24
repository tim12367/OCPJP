-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: vgb
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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` char(10) NOT NULL,
  `order_date` date NOT NULL,
  `order_time` time NOT NULL,
  `status` int NOT NULL DEFAULT '0',
  `payment_type` varchar(12) NOT NULL,
  `payment_fee` double NOT NULL,
  `payment_note` varchar(100) NOT NULL DEFAULT '',
  `shipping_type` varchar(12) NOT NULL,
  `shipping_fee` double NOT NULL,
  `shipping_note` varchar(100) NOT NULL DEFAULT '',
  `shipping_address` varchar(100) NOT NULL,
  `recipient_name` varchar(20) NOT NULL,
  `recipient_email` varchar(60) NOT NULL,
  `recipient_phone` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fkey_orders_TO_customers_idx` (`customer_id`),
  CONSTRAINT `fkey_orders_TO_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (35,'L270977205','2023-03-20','10:43:27',2,'SHOP',0,'','E_TICKET',0,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(36,'L270977205','2023-03-20','11:36:36',2,'CARD',0,'','E_TICKET',0,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(37,'A123123123','2023-03-20','16:38:27',2,'SHOP',0,'','E_TICKET',0,'','新莊','李四','test123@uuu.com','02-23456789'),(38,'A123123123','2023-03-20','16:44:35',2,'CARD',0,'','E_TICKET',0,'','新北','李四','test123@uuu.com','02-23456789'),(39,'A123123123','2023-03-20','17:39:46',0,'CARD',0,'','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(40,'A123123123','2023-03-20','17:43:07',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-20T17:43:31.969458100','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(41,'A123123123','2023-03-20','17:55:22',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-20T17:55:44.273341900','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(42,'A123123123','2023-03-20','19:18:25',0,'SHOP',0,'','SHOP',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(43,'A123123123','2023-03-20','19:19:59',0,'SHOP',0,'','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(44,'A123123123','2023-03-21','10:11:15',0,'CARD',0,'','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(45,'A123123123','2023-03-21','10:23:35',0,'CARD',0,'','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(46,'A123123123','2023-03-21','10:25:08',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-21T10:25:32.189892','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(47,'A123123123','2023-03-21','10:26:33',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-21T10:27:43.203362','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(48,'A123123123','2023-03-21','11:33:09',0,'SHOP',0,'','SHOP',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(49,'A123123123','2023-03-21','11:34:53',0,'SHOP',0,'','SHOP',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(50,'A123123123','2023-03-21','11:37:13',0,'SHOP',0,'','SHOP',0,'','100台北市中正區汀州路一段105號','李四','test123@uuu.com','02-23456789'),(51,'A123456789','2023-03-21','16:35:03',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-21T16:35:23.473278','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456'),(52,'A123456789','2023-03-21','19:10:03',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-21T19:10:24.929061600','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456'),(53,'A123456789','2023-03-22','01:47:59',0,'CARD',0,'','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456'),(54,'A123456789','2023-03-22','01:48:50',0,'CARD',0,'','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456'),(55,'A123456789','2023-03-22','01:49:59',0,'CARD',0,'','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456'),(56,'A123456789','2023-03-22','01:51:48',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-22T01:52:05.885725600','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456'),(57,'A123123123','2023-03-22','13:46:49',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-22T13:47:14.390499800','E_TICKET',0,'','100台北市中正區汀州路一段105號','李四光','test123@uuu.com','02-23456789'),(58,'A123456789','2023-03-22','19:31:42',2,'CARD',0,'信用卡號:4311-95**-****2222,授權碼:777777,交易時間:2023-03-22T19:32:00.360163600','E_TICKET',0,'','220新北市板橋區南雅南路一段3巷42號1樓','張三','test02@uuu.com','0911234456');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-23  8:50:55
