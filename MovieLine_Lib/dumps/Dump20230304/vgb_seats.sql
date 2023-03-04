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
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `session_id` int NOT NULL,
  `A` int DEFAULT NULL,
  `B` int DEFAULT NULL,
  `C` int DEFAULT NULL,
  `D` int DEFAULT NULL,
  `E` int DEFAULT NULL,
  `F` int DEFAULT NULL,
  `G` int DEFAULT NULL,
  `H` int DEFAULT NULL,
  `I` int DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  CONSTRAINT `seat_id_TO_session_id` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,839,600,484,620,624,237,336,970,0),(2,769,937,332,898,422,442,943,317,0),(3,806,5,680,313,549,783,220,799,0),(4,262,964,962,896,568,152,83,985,0),(5,577,955,997,74,449,999,576,910,0),(6,773,113,293,101,651,907,534,971,0),(7,184,54,744,487,204,584,258,563,0),(8,1017,325,622,86,616,771,987,571,0),(9,920,839,412,569,585,195,244,635,0),(10,398,83,248,988,103,623,760,907,0),(11,209,372,207,944,5,263,277,597,0),(12,107,792,566,455,579,506,793,399,0),(13,641,985,954,793,81,71,112,350,0),(14,390,900,260,648,414,125,407,639,0),(15,947,772,1021,739,634,954,819,210,0),(16,640,525,706,929,480,638,728,702,0),(17,303,431,223,848,501,983,342,809,0),(18,973,389,50,106,383,573,691,714,0),(19,471,217,695,777,778,534,337,82,0),(20,422,843,902,957,32,362,688,308,0),(21,502,563,282,749,850,980,303,624,0),(22,161,984,342,805,951,292,657,362,0),(23,863,158,247,763,2,792,883,1016,0),(24,382,912,341,1019,999,914,550,9,0),(25,444,146,423,651,964,819,179,487,0),(26,875,868,688,839,81,963,476,514,0),(27,118,72,10,855,149,231,706,790,0),(28,810,658,858,271,828,255,838,355,0),(29,286,365,969,679,486,394,511,350,0),(30,217,35,549,591,286,681,500,459,0),(31,794,546,346,96,465,1015,609,1,0),(32,227,107,881,1010,361,822,980,389,0),(33,27,1015,902,440,520,254,737,873,0),(34,106,984,506,602,470,546,293,853,0),(35,314,36,263,185,133,112,163,477,0),(36,872,884,778,216,794,249,913,747,0),(37,996,693,475,296,58,425,926,284,0),(38,690,551,684,746,652,1,98,486,0),(39,91,18,844,71,895,167,199,492,0),(40,842,686,903,411,370,616,946,836,0),(41,319,109,616,703,646,96,591,620,0),(42,304,683,457,237,837,402,524,389,0),(43,373,699,328,569,837,432,673,21,0),(44,134,608,592,112,830,745,213,875,0),(45,668,714,542,567,188,261,741,875,0),(46,103,965,420,227,903,761,72,126,0),(47,415,671,65,360,581,801,214,716,0),(48,889,251,637,386,18,979,746,794,0),(49,706,128,568,411,348,511,486,898,0),(50,984,177,1007,407,38,1020,891,371,0),(51,207,945,10,288,387,48,104,374,0),(52,536,535,42,656,82,488,148,299,0),(53,27,263,209,257,660,480,422,668,0),(54,27,182,827,517,106,3,722,531,0),(55,487,844,710,1017,910,473,663,869,0),(56,310,991,952,766,972,515,682,843,0),(57,121,124,259,924,772,65,58,94,0);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-04 18:35:26
