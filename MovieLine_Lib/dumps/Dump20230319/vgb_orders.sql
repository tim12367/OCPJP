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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (13,'A123123123','2023-03-14','18:40:46',0,'HOME',50,'','HOME',100,'','台北市復興北路99號12F','林莉','test01@uuu.com.tw','0987641111'),(14,'A123123123','2023-03-15','16:03:10',0,'HOME',50,'','HOME',100,'','台北市復興北路99號12F','林莉','test01@uuu.com.tw','0987641111'),(15,'A123123123','2023-03-15','16:13:10',0,'HOME',50,'','HOME',100,'','台北市復興北路99號12F','林莉','test01@uuu.com.tw','0987641111'),(16,'L270977205','2023-03-16','13:32:03',0,'ATM',0,'','HOME',100,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(17,'L270977205','2023-03-16','13:34:19',0,'HOME',50,'','STORE',65,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(18,'L270977205','2023-03-16','15:17:35',0,'HOME',50,'','HOME',100,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(19,'L270977205','2023-03-16','18:12:31',0,'HOME',50,'','HOME',100,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(20,'L270977205','2023-03-16','19:15:42',0,'HOME',50,'','HOME',100,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(21,'L270977205','2023-03-16','19:42:39',0,'HOME',50,'','HOME',100,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789'),(22,'L270977205','2023-03-16','20:26:36',0,'STORE',0,'','SHOP',0,'','臺北市中山區','吉拍坦','test@9876.com','0123456789'),(23,'L270977205','2023-03-16','20:30:27',0,'ATM',0,'','SHOP',0,'','花蓮','錫金欸','test8763@uuu.com','0912348763'),(24,'A123123123','2023-03-16','20:33:42',0,'HOME',50,'','HOME',100,'','花蓮市','金價','i123@uuu.com','022222222'),(25,'A123123123','2023-03-16','20:35:58',0,'HOME',50,'','HOME',100,'','新北','李四','test123@uuu.com','02-23456789'),(31,'A123123123','2023-03-18','12:26:47',0,'HOME',50,'','HOME',100,'','新莊','李四','test123@uuu.com','02-23456789'),(32,'A123123123','2023-03-18','12:50:29',0,'HOME',50,'','HOME',100,'','新莊','李四','test123@uuu.com','02-23456789'),(33,'L270977205','2023-03-18','16:51:07',0,'ATM',0,'','HOME',100,'','臺北市中正區忠孝西路一段49號','林思妤','test205@uuu.com','032868789');
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

-- Dump completed on 2023-03-19  0:50:41
