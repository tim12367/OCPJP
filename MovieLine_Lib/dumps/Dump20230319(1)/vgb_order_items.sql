-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: vgb
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
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `session_date` date NOT NULL,
  `session_time` time NOT NULL,
  `session_theater` int NOT NULL,
  `price` double NOT NULL,
  `quantity` int NOT NULL,
  `A` int NOT NULL,
  `B` int NOT NULL,
  `C` int NOT NULL,
  `D` int NOT NULL,
  `E` int NOT NULL,
  `F` int NOT NULL,
  `G` int NOT NULL,
  `H` int NOT NULL,
  `I` int NOT NULL,
  PRIMARY KEY (`order_id`,`session_date`,`session_time`,`session_theater`),
  KEY `fkey_order_item_time_TO_sessions_time_idx` (`session_time`),
  KEY `fkey_order_item_thread_TO_sessions_thread_idx` (`session_theater`),
  KEY `fkey_order_item_date_TO_sessions_date_idx` (`session_date`,`session_time`,`session_theater`),
  CONSTRAINT `fkey_order_item_TO_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `fkey_order_item_TO_sessions` FOREIGN KEY (`session_date`, `session_time`, `session_theater`) REFERENCES `sessions` (`date`, `time`, `theater`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (13,'2023-02-28','18:10:00',1,278.8,3,8,3,0,0,0,0,0,0,0),(13,'2023-02-28','21:30:00',1,278.8,2,0,6,0,0,0,0,0,0,0),(14,'2023-02-28','18:10:00',1,278.8,3,8,3,0,0,0,0,0,0,0),(14,'2023-02-28','21:30:00',1,278.8,2,0,6,0,0,0,0,0,0,0),(15,'2023-02-28','12:50:00',3,278.8,2,0,0,0,0,0,128,0,64,0),(15,'2023-02-28','19:30:00',3,278.8,3,0,0,0,0,8,24,0,0,0),(16,'2023-03-01','09:40:00',3,278.8,3,0,0,0,0,128,192,0,0,0),(17,'2023-03-02','14:05:00',3,278.8,3,128,384,0,0,0,0,0,0,0),(18,'2023-03-01','09:40:00',3,278.8,3,0,0,0,0,0,0,0,112,0),(19,'2023-03-02','14:05:00',3,278.8,3,0,0,0,0,0,0,352,0,0),(20,'2023-03-01','09:40:00',3,278.8,3,0,0,0,0,0,0,8,8,2),(21,'2023-03-01','09:40:00',3,278.8,3,0,0,0,14,0,0,0,0,0),(21,'2023-03-02','14:05:00',3,278.8,3,0,0,0,0,512,512,512,0,0),(22,'2023-02-28','14:25:00',2,278.8,4,0,0,0,0,48,48,0,0,0),(22,'2023-02-28','23:15:00',4,278.8,2,0,16,32,0,0,0,0,0,0),(23,'2023-03-02','14:05:00',3,278.8,4,0,0,0,12,12,0,0,0,0),(23,'2023-03-03','17:45:00',2,278.8,2,0,0,0,0,0,48,0,0,0),(24,'2023-02-28','19:30:00',3,278.8,3,0,0,0,0,192,32,0,0,0),(24,'2023-03-01','14:20:00',1,278.8,3,0,0,0,32,64,64,0,0,0),(24,'2023-03-02','14:05:00',3,278.8,3,0,0,0,2,1,1,0,0,0),(24,'2023-03-02','16:20:00',3,278.8,1,0,0,0,64,0,0,0,0,0),(25,'2023-03-01','14:20:00',1,278.8,2,0,0,0,0,0,160,0,0,0),(31,'2023-03-01','09:40:00',3,278.8,3,0,0,0,0,0,0,112,0,0),(32,'2023-03-01','09:40:00',3,278.8,2,0,0,0,0,0,0,12,0,0),(33,'2023-03-01','09:40:00',3,278.8,3,0,0,0,0,0,448,0,0,0),(34,'2023-03-02','12:15:00',3,278.8,1,0,0,0,0,0,0,0,0,64);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-19 22:49:15
