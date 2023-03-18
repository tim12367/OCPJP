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
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `date` date NOT NULL,
  `time` time NOT NULL,
  `thread` int NOT NULL,
  `movie_id` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`date`,`time`,`thread`),
  KEY `fkey_sessions_TO_movies_idx` (`movie_id`),
  CONSTRAINT `fkey_sessions_TO_movies` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('2023-02-28','00:20:00',3,9,25),('2023-02-28','10:10:00',4,6,20),('2023-02-28','10:20:00',3,6,10),('2023-02-28','11:20:00',5,6,10),('2023-02-28','12:00:00',2,7,10),('2023-02-28','12:50:00',3,7,20),('2023-02-28','14:20:00',2,6,20),('2023-02-28','14:25:00',2,9,10),('2023-02-28','17:45:00',2,6,10),('2023-02-28','18:10:00',1,6,30),('2023-02-28','19:30:00',3,10,10),('2023-02-28','21:00:00',3,6,20),('2023-02-28','21:30:00',1,9,20),('2023-02-28','21:45:00',1,7,15),('2023-02-28','23:15:00',4,10,35),('2023-03-01','09:00:00',1,6,20),('2023-03-01','09:00:00',2,2,10),('2023-03-01','09:20:00',3,4,20),('2023-03-01','09:30:00',1,1,20),('2023-03-01','09:40:00',3,2,20),('2023-03-01','09:40:00',5,4,10),('2023-03-01','10:30:00',5,6,15),('2023-03-01','11:35:00',1,2,10),('2023-03-01','12:15:00',2,2,20),('2023-03-01','14:20:00',1,1,30),('2023-03-01','14:30:00',3,6,10),('2023-03-01','14:40:00',1,4,10),('2023-03-01','14:40:00',4,6,10),('2023-03-01','16:15:00',1,6,20),('2023-03-01','16:25:00',2,2,10),('2023-03-01','16:30:00',2,6,10),('2023-03-01','16:45:00',1,1,10),('2023-03-01','16:55:00',2,4,10),('2023-03-01','19:10:00',1,1,20),('2023-03-01','21:50:00',1,4,15),('2023-03-01','22:20:00',4,4,15),('2023-03-01','23:00:00',1,9,15),('2023-03-02','00:00:00',1,1,40),('2023-03-02','10:40:00',1,6,10),('2023-03-02','11:35:00',1,2,25),('2023-03-02','11:35:00',2,8,20),('2023-03-02','12:15:00',3,2,35),('2023-03-02','13:20:00',1,1,20),('2023-03-02','13:25:00',2,2,15),('2023-03-02','14:05:00',1,3,10),('2023-03-02','14:05:00',3,3,30),('2023-03-02','14:30:00',3,6,20),('2023-03-02','16:05:00',2,6,10),('2023-03-02','16:15:00',1,5,10),('2023-03-02','16:20:00',3,8,15),('2023-03-02','17:20:00',2,8,25),('2023-03-02','18:00:00',1,1,20),('2023-03-02','18:25:00',1,7,25),('2023-03-02','22:30:00',4,10,20),('2023-03-02','22:40:00',1,1,20),('2023-03-03','17:45:00',2,5,15),('2023-03-06','17:45:00',1,5,20);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-17 20:01:06
