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
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `photo_url` varchar(250) DEFAULT NULL,
  `launch_date` date NOT NULL DEFAULT (curdate()),
  `category` varchar(20) NOT NULL DEFAULT '劇情',
  `discount` int NOT NULL DEFAULT '0',
  `box_office` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'蟻人與黃蜂女：量子狂熱',340,60,'蟻人史考特一貫自嘲幽默的風格，認為有前科的他怎麼樣也不該是復仇者聯盟的料，更翻出常被誤認為蜘蛛人的糗事，接著揭曉蟻人女兒凱西已經長大成為亭亭玉立的青少女，而且還繼承父親系統工程師衣缽，聰明絕頂具有科學家頭腦、發明能夠更便捷通往量子領域的「量子衛星」，卻未料把自己和所有家人傳送進去！形同高科技外星世界的量子領域，是一個人類所知宇宙底下的神秘宇宙，在那裡等著他們的，竟為於第四階段影集《洛基》短暫壓軸現身的征服者康，並提供把他們送回地球的「交換條件」。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230116003.jpg','2023-02-15','劇情',18,0),(2,'灌籃高手 THE FIRST SLAM DUNK',340,52,'「教練，我想打籃球！」火紅32年的經典漫畫《灌籃高手》從1990年連載到1996年，人物角色為了籃球比賽揮灑熱血汗水激勵不少人骨子裡的「籃球魂」，光在日本的發行量就超過1億2千萬冊，在台灣也擄獲不少粉絲，櫻木花道、流川楓、宮城良田、三井壽、赤木剛憲、赤木晴子等角色都各自有擁護者；儘管連載結束26年，書迷一直引頸期盼作品能回歸，2019年當原作井上雄彥在社群公佈櫻木花道的繪圖時，關注度瞬間破表，大家紛紛留言回憶起當年追漫畫跟動畫的感動，就知道書迷有多期待。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230110014.jpg','2023-01-13','動畫',18,9893),(3,'阿凡達：水之道',340,5,'《阿凡達：水之道》設於首集超過十年後，成為納美人並與奈蒂莉共結連理的傑克，在潘朵拉星上與他們的孩子組成蘇里一家，過著與世無爭的幸福生活，未料威脅再度降臨，他們不遺餘力保護彼此，為了生存再度奮戰，還得承受隨之而來的悲痛創傷。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20221121003.jpg','2022-12-14','奇幻/科幻、冒險、劇情',18,18685);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-14 16:45:25
