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
-- Table structure for table `product_seats`
--

DROP TABLE IF EXISTS `product_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_seats` (
  `product_id` int NOT NULL,
  `date` date NOT NULL DEFAULT (curdate()),
  `showing` int NOT NULL,
  `row_name` varchar(10) NOT NULL,
  `seats_booked` int NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`product_id`,`date`,`showing`,`row_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seats`
--

LOCK TABLES `product_seats` WRITE;
/*!40000 ALTER TABLE `product_seats` DISABLE KEYS */;
INSERT INTO `product_seats` VALUES (1,'2023-02-24',1,'A',0,10),(1,'2023-02-24',1,'B',0,10),(1,'2023-02-24',1,'C',0,10),(1,'2023-02-24',1,'D',0,10),(1,'2023-02-24',1,'E',0,10),(1,'2023-02-24',1,'F',0,10),(1,'2023-02-24',1,'G',0,10),(1,'2023-02-24',1,'H',0,10),(1,'2023-02-24',1,'I',134,7),(2,'2023-02-24',3,'A',0,10),(2,'2023-02-24',3,'B',0,10),(2,'2023-02-24',3,'C',0,10),(2,'2023-02-24',3,'D',0,10),(2,'2023-02-24',3,'E',0,10),(2,'2023-02-24',3,'F',0,10),(2,'2023-02-24',3,'G',0,10),(2,'2023-02-24',3,'H',0,10),(2,'2023-02-24',3,'I',134,7),(3,'2023-02-24',2,'A',0,10),(3,'2023-02-24',2,'B',0,10),(3,'2023-02-24',2,'C',0,10),(3,'2023-02-24',2,'D',0,10),(3,'2023-02-24',2,'E',0,10),(3,'2023-02-24',2,'F',0,10),(3,'2023-02-24',2,'G',0,10),(3,'2023-02-24',2,'H',0,10),(3,'2023-02-24',2,'I',134,7),(4,'2023-02-24',6,'A',0,10),(4,'2023-02-24',6,'B',0,10),(4,'2023-02-24',6,'C',0,10),(4,'2023-02-24',6,'D',0,10),(4,'2023-02-24',6,'E',0,10),(4,'2023-02-24',6,'F',0,10),(4,'2023-02-24',6,'G',0,10),(4,'2023-02-24',6,'H',0,10),(4,'2023-02-24',6,'I',134,7),(5,'2023-02-24',4,'A',0,10),(5,'2023-02-24',4,'B',0,10),(5,'2023-02-24',4,'C',0,10),(5,'2023-02-24',4,'D',0,10),(5,'2023-02-24',4,'E',0,10),(5,'2023-02-24',4,'F',0,10),(5,'2023-02-24',4,'G',0,10),(5,'2023-02-24',4,'H',0,10),(5,'2023-02-24',4,'I',134,7),(6,'2023-02-24',5,'A',0,10),(6,'2023-02-24',5,'B',0,10),(6,'2023-02-24',5,'C',0,10),(6,'2023-02-24',5,'D',0,10),(6,'2023-02-24',5,'E',0,10),(6,'2023-02-24',5,'F',0,10),(6,'2023-02-24',5,'G',0,10),(6,'2023-02-24',5,'H',0,10),(6,'2023-02-24',5,'I',134,7),(7,'2023-02-24',9,'A',0,10),(7,'2023-02-24',9,'B',0,10),(7,'2023-02-24',9,'C',0,10),(7,'2023-02-24',9,'D',0,10),(7,'2023-02-24',9,'E',0,10),(7,'2023-02-24',9,'F',0,10),(7,'2023-02-24',9,'G',0,10),(7,'2023-02-24',9,'H',0,10),(7,'2023-02-24',9,'I',134,7),(8,'2023-02-24',7,'A',0,10),(8,'2023-02-24',7,'B',0,10),(8,'2023-02-24',7,'C',0,10),(8,'2023-02-24',7,'D',0,10),(8,'2023-02-24',7,'E',0,10),(8,'2023-02-24',7,'F',0,10),(8,'2023-02-24',7,'G',0,10),(8,'2023-02-24',7,'H',0,10),(8,'2023-02-24',7,'I',134,7),(9,'2023-02-24',8,'A',0,10),(9,'2023-02-24',8,'B',0,10),(9,'2023-02-24',8,'C',0,10),(9,'2023-02-24',8,'D',0,10),(9,'2023-02-24',8,'E',0,10),(9,'2023-02-24',8,'F',0,10),(9,'2023-02-24',8,'G',0,10),(9,'2023-02-24',8,'H',0,10),(9,'2023-02-24',8,'I',134,7),(10,'2023-02-24',10,'A',0,10),(10,'2023-02-24',10,'B',0,10),(10,'2023-02-24',10,'C',0,10),(10,'2023-02-24',10,'D',0,10),(10,'2023-02-24',10,'E',0,10),(10,'2023-02-24',10,'F',0,10),(10,'2023-02-24',10,'G',0,10),(10,'2023-02-24',10,'H',0,10),(10,'2023-02-24',10,'I',134,7);
/*!40000 ALTER TABLE `product_seats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-02 10:40:09