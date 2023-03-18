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
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(70) NOT NULL,
  `subtitle` varchar(100) NOT NULL DEFAULT '',
  `unit_price` double NOT NULL,
  `description` varchar(500) NOT NULL DEFAULT '',
  `photo_url` varchar(250) DEFAULT NULL,
  `trailer_url` varchar(100) NOT NULL DEFAULT '',
  `launch_date` date NOT NULL DEFAULT (curdate()),
  `category` varchar(20) NOT NULL DEFAULT '劇情',
  `discount` int NOT NULL DEFAULT '0',
  `box_office` int NOT NULL DEFAULT '0',
  `director` varchar(100) NOT NULL DEFAULT '',
  `cast` varchar(500) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (1,'蟻人與黃蜂女：量子狂熱','ANT MAN AND THE WASP QUANTUMANIA',340,'蟻人史考特一貫自嘲幽默的風格，認為有前科的他怎麼樣也不該是復仇者聯盟的料，更翻出常被誤認為蜘蛛人的糗事，接著揭曉蟻人女兒凱西已經長大成為亭亭玉立的青少女，而且還繼承父親系統工程師衣缽，聰明絕頂具有科學家頭腦、發明能夠更便捷通往量子領域的「量子衛星」，卻未料把自己和所有家人傳送進去！形同高科技外星世界的量子領域，是一個人類所知宇宙底下的神秘宇宙，在那裡等著他們的，竟為於第四階段影集《洛基》短暫壓軸現身的征服者康，並提供把他們送回地球的「交換條件」。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230116003.jpg','https://www.youtube.com/embed/VXYUf5oqano','2023-02-15','劇情',18,11057,'派頓瑞德','伊凡潔琳莉莉、保羅路德、強納森梅爾斯、蜜雪兒菲佛、比爾默瑞、麥可道格拉斯、凱瑟琳紐頓、朴藍道、寇瑞史多'),(2,'灌籃高手 THE FIRST SLAM DUNK','THE FIRST SLAM DUNK',340,'「教練，我想打籃球！」火紅32年的經典漫畫《灌籃高手》從1990年連載到1996年，人物角色為了籃球比賽揮灑熱血汗水激勵不少人骨子裡的「籃球魂」，光在日本的發行量就超過1億2千萬冊，在台灣也擄獲不少粉絲，櫻木花道、流川楓、宮城良田、三井壽、赤木剛憲、赤木晴子等角色都各自有擁護者；儘管連載結束26年，書迷一直引頸期盼作品能回歸，2019年當原作井上雄彥在社群公佈櫻木花道的繪圖時，關注度瞬間破表，大家紛紛留言回憶起當年追漫畫跟動畫的感動，就知道書迷有多期待。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230110014.jpg','https://www.youtube.com/embed/cxVo8S7Rju4','2023-01-13','動畫',18,9893,'井上雄彥','三宅健太 、 木村昴 、 神尾晉一郎 、 仲村宗悟 、 笠間淳'),(3,'阿凡達：水之道','AVATAR THE WAY OF WATER',340,'《阿凡達：水之道》設於首集超過十年後，成為納美人並與奈蒂莉共結連理的傑克，在潘朵拉星上與他們的孩子組成蘇里一家，過著與世無爭的幸福生活，未料威脅再度降臨，他們不遺餘力保護彼此，為了生存再度奮戰，還得承受隨之而來的悲痛創傷。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20221121003.jpg','https://www.youtube.com/embed/T-8MtZ2kY98','2022-12-14','奇幻/科幻',18,74274,'詹姆斯卡麥隆','山姆沃辛頓、柔伊莎達娜、凱特溫絲蕾、雪歌妮薇佛、楊紫瓊、傑梅奈克萊門特'),(4,'超難搞先生','A MAN CALLED OTTO',340,'改編自《紐約時報》排行榜暢銷小說，湯姆漢克飾演憤世嫉俗又脾氣暴躁的喪妻鰥夫－奧托，他唯一的生活樂趣來自批評和糾正他可憐的鄰居們。但當身懷六甲的瑪莉莎和她年輕活潑的家庭搬到他家隔壁時，這段不期而遇的友誼從此改變了奧托的人生。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230106002.jpg','https://www.youtube.com/embed/7ajCJkyQfqo','2023-02-10','溫馨',18,1038,'馬克佛斯特','湯姆漢克斯、瑞秋凱勒、曼紐賈西亞魯佛、卡麥隆布里頓'),(5,'鐵達尼號 25周年重映版','TITANIC 25TH ANNIVERSARY',340,'1912年四月十五日凌晨，重達四十六萬噸的鐵達尼號，也是當時被稱為全世界最大最安全的豪華遊輪自英格蘭駛向紐約，在加拿大東岸紐芬蘭附近海面撞上巨大冰山，2223名乘客只有七百多名逃過這場史上最大船難，一千五百多人隨著巨船沉沒海底。八十五年後，尋寶探險家在三千英尺深處的鐵達尼號殘骸中找到一幅完美無損的少女裸身素描畫，而畫中人正是年逾百歲的倖存者羅絲。當她面對這張熟悉的畫像時，飽經滄桑的老人陷入往事的追憶，而故事也就此開始。回溯當年愛爾蘭海岸旁，“夢之船”鐵達尼號即將展開處女航，年輕貌美的貴族少女羅絲隨著母親和未婚夫卡爾乘上這艘豪華巨輪。但羅絲內心孤獨寂寞，單調乏味的貴族生活使她鬱鬱寡歡。與之相比，同船三等艙的年輕畫家傑克就顯得興高采烈。他生活窘迫，卻樂天知命。悶悶不樂的羅絲無法忍受生活的無奈，面對著滾滾的海浪欲結束自己的生命。但傑克的出現不僅挽救了她的生命，更挽救了她的靈魂。羅絲在傑克身上體驗到愛情的美妙和活力。她不顧母親的反對，毅然地與傑克沉浸在愛情的喜悅之中。然而，這段美麗的邂逅，卻將隨著突來的浩劫，沉入陰陰鬱鬱的大西洋底。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230131006.jpg','https://www.youtube.com/embed/dvTDJBvvW1s','2023-02-10','愛情',18,95,'詹姆斯卡麥隆','李奧納多狄卡皮歐、凱特溫絲蕾、凱西貝茲、法蘭西斯費雪、比爾派頓、維特賈勃'),(6,'新世紀福音戰士新劇場版 : 終','EVANGELION 3.0+1.0 THRICE UPON A TIME',340,'這是《福音戰士新劇場版》的第四部，也是最終版。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230103022.jpg','https://www.youtube.com/embed/TZKH_QFcCa0','2023-02-03','動畫',18,219,'庵野秀明','緒方惠美、林原惠、宮村優子、坂本真綾、三石琴乃、石田彰'),(7,'迫降危機','PLANE',340,'★《全面攻佔》《天劫倒數》製片團隊全新動作災難鉅獻','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230109019.jpg','https://www.youtube.com/embed/fknbFGp7B1k','2023-01-25','動作',18,732,'強法蘭柯瑞西','傑瑞德巴特勒、麥克寇特、安柚鑫、丹妮拉皮內達'),(8,'想見你','SOMEDAY OR ONE DAY',340,'命中註定的相遇，似曾相似的夢境，想再次見到你，千方百計。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20221220021.jpg','https://www.youtube.com/embed/S7FCMK2h_OQ','2022-12-30','愛情',18,3220,'黃天仁','柯佳嬿、許光漢、施柏宇'),(9,'窒友梅根','M3GAN',340,'梅根 (M3GAN) 是一個具備高度人工智慧、栩栩如生的玩具人偶，被設計成小孩子最好的玩伴和令家長最安心的盟友。這款玩具人偶由一名玩具公司傑出的機器人專家潔瑪精心設計，梅根能夠藉由聆聽以及觀察學習人類行為，並且成為她照顧的小孩的朋友、老師、玩伴和保護者。','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230109021.jpg','https://www.youtube.com/embed/wO65E21oVHo','2023-01-13','奇幻/科幻',18,1232,'傑拉德強斯頓','愛莉森威廉絲、薇樂麥格勞、錢信伊、珍范埃普斯'),(10,'玩命特攻：武演行動','OPERATION FORTUNE RUSEDE GUERRE',340,'★ 《阿拉丁》億萬大導蓋瑞奇打造全新諜報動作鉅片','https://www.vscinemas.com.tw/vsweb/upload/film/film_20230106008.jpg','https://www.youtube.com/embed/KILpP45Vkz8','2023-01-19','喜劇',18,928,'蓋瑞奇','傑森史塔森、凱瑞艾文斯、喬許哈奈特、休葛蘭、奧布瑞普拉薩、艾迪馬森、麥斯比斯利');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
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
