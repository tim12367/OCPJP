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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `address` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(45) NOT NULL DEFAULT '',
  `subscribed` tinyint NOT NULL DEFAULT '0',
  `discount` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('A123123123','test123@uuu.com','12345;lkj','李四','2000-01-23','M','','02-23456789',1,10),('A123123132','test132@uuu.com','12345;lkj','林梅莉','2005-08-15','M','台北市信義路二段100號','',0,0),('A123456752','test752@uuu.com','12345;lkj','武厄','2001-06-01','U','高雄中和區中山路4段5號','',0,0),('A123456761','test761@uuu.com.tw','12345;lkj','露易莎','1999-12-12','U','臺北市信義區信義路5段7號73樓之1','02-87296000',1,0),('A123456770','test770@uuu.com.tw','12345;lkj','碧螺春','2000-05-05','M','','',0,0),('A123456789','test02@uuu.com','12345;lkj','張三','2000-01-01','M','','',1,0),('A136304061','test03@uuu.com','12345;lkj','金凱利','2005-08-15','F','台北市復興北路99號14F','02-23456789',1,0),('C133258957','test04@uuu.com','12345;lkj','白帥帥','1999-09-09','M','','',0,0),('G177224855','test05@uuu.com','12345;lkj','湯米','2005-07-07','U','新北市中和區中山路信義路4段5號','',0,0),('G196344943','test943@uuu.com','12345;lkj','童英凱','2003-02-21','F','','',0,0),('J124234730','test730@uuu.com','12345;lkj','郭良銘','2011-02-03','M','','',1,0),('L270977205','test205@uuu.com','12345;lkj','林思妤','2007-01-30','F','臺北市中正區忠孝西路一段49號','032868789',0,20),('N181149333','test333@uuu.com.tw','12345678','張山豐','1999-10-10','M','新北三重','0900000000',1,15);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-16 20:51:35
