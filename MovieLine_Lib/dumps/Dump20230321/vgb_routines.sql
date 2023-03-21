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
-- Temporary view structure for view `session_view`
--

DROP TABLE IF EXISTS `session_view`;
/*!50001 DROP VIEW IF EXISTS `session_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session_view` AS SELECT 
 1 AS `date`,
 1 AS `time`,
 1 AS `theater`,
 1 AS `stock`,
 1 AS `id`,
 1 AS `name`,
 1 AS `subtitle`,
 1 AS `unit_price`,
 1 AS `description`,
 1 AS `photo_url`,
 1 AS `trailer_url`,
 1 AS `launch_date`,
 1 AS `category`,
 1 AS `discount`,
 1 AS `box_office`,
 1 AS `director`,
 1 AS `cast`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `orders_orderitems_sessions_movies_view`
--

DROP TABLE IF EXISTS `orders_orderitems_sessions_movies_view`;
/*!50001 DROP VIEW IF EXISTS `orders_orderitems_sessions_movies_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `orders_orderitems_sessions_movies_view` AS SELECT 
 1 AS `id`,
 1 AS `customer_id`,
 1 AS `order_date`,
 1 AS `order_time`,
 1 AS `status`,
 1 AS `payment_type`,
 1 AS `payment_fee`,
 1 AS `payment_note`,
 1 AS `shipping_type`,
 1 AS `shipping_fee`,
 1 AS `shipping_note`,
 1 AS `shipping_address`,
 1 AS `recipient_name`,
 1 AS `recipient_email`,
 1 AS `recipient_phone`,
 1 AS `session_date`,
 1 AS `session_time`,
 1 AS `session_theater`,
 1 AS `price`,
 1 AS `quantity`,
 1 AS `A`,
 1 AS `B`,
 1 AS `C`,
 1 AS `D`,
 1 AS `E`,
 1 AS `F`,
 1 AS `G`,
 1 AS `H`,
 1 AS `I`,
 1 AS `movie_id`,
 1 AS `stock`,
 1 AS `name`,
 1 AS `subtitle`,
 1 AS `unit_price`,
 1 AS `description`,
 1 AS `photo_url`,
 1 AS `trailer_url`,
 1 AS `launch_date`,
 1 AS `category`,
 1 AS `discount`,
 1 AS `box_office`,
 1 AS `director`,
 1 AS `cast`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `session_seat_view`
--

DROP TABLE IF EXISTS `session_seat_view`;
/*!50001 DROP VIEW IF EXISTS `session_seat_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `session_seat_view` AS SELECT 
 1 AS `date`,
 1 AS `time`,
 1 AS `theater`,
 1 AS `movie_id`,
 1 AS `stock`,
 1 AS `name`,
 1 AS `subtitle`,
 1 AS `unit_price`,
 1 AS `description`,
 1 AS `photo_url`,
 1 AS `trailer_url`,
 1 AS `launch_date`,
 1 AS `category`,
 1 AS `discount`,
 1 AS `box_office`,
 1 AS `director`,
 1 AS `cast`,
 1 AS `A`,
 1 AS `B`,
 1 AS `C`,
 1 AS `D`,
 1 AS `E`,
 1 AS `F`,
 1 AS `G`,
 1 AS `H`,
 1 AS `I`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `session_view`
--

/*!50001 DROP VIEW IF EXISTS `session_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `session_view` AS select `sessions`.`date` AS `date`,`sessions`.`time` AS `time`,`sessions`.`theater` AS `theater`,`sessions`.`stock` AS `stock`,`movies`.`id` AS `id`,`movies`.`name` AS `name`,`movies`.`subtitle` AS `subtitle`,`movies`.`unit_price` AS `unit_price`,`movies`.`description` AS `description`,`movies`.`photo_url` AS `photo_url`,`movies`.`trailer_url` AS `trailer_url`,`movies`.`launch_date` AS `launch_date`,`movies`.`category` AS `category`,`movies`.`discount` AS `discount`,`movies`.`box_office` AS `box_office`,`movies`.`director` AS `director`,`movies`.`cast` AS `cast` from (`sessions` left join `movies` on((`movies`.`id` = `sessions`.`movie_id`))) order by `sessions`.`date`,`sessions`.`time` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_orderitems_sessions_movies_view`
--

/*!50001 DROP VIEW IF EXISTS `orders_orderitems_sessions_movies_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_orderitems_sessions_movies_view` AS select `orders`.`id` AS `id`,`orders`.`customer_id` AS `customer_id`,`orders`.`order_date` AS `order_date`,`orders`.`order_time` AS `order_time`,`orders`.`status` AS `status`,`orders`.`payment_type` AS `payment_type`,`orders`.`payment_fee` AS `payment_fee`,`orders`.`payment_note` AS `payment_note`,`orders`.`shipping_type` AS `shipping_type`,`orders`.`shipping_fee` AS `shipping_fee`,`orders`.`shipping_note` AS `shipping_note`,`orders`.`shipping_address` AS `shipping_address`,`orders`.`recipient_name` AS `recipient_name`,`orders`.`recipient_email` AS `recipient_email`,`orders`.`recipient_phone` AS `recipient_phone`,`order_items`.`session_date` AS `session_date`,`order_items`.`session_time` AS `session_time`,`order_items`.`session_theater` AS `session_theater`,`order_items`.`price` AS `price`,`order_items`.`quantity` AS `quantity`,`order_items`.`A` AS `A`,`order_items`.`B` AS `B`,`order_items`.`C` AS `C`,`order_items`.`D` AS `D`,`order_items`.`E` AS `E`,`order_items`.`F` AS `F`,`order_items`.`G` AS `G`,`order_items`.`H` AS `H`,`order_items`.`I` AS `I`,`sessions`.`movie_id` AS `movie_id`,`sessions`.`stock` AS `stock`,`movies`.`name` AS `name`,`movies`.`subtitle` AS `subtitle`,`movies`.`unit_price` AS `unit_price`,`movies`.`description` AS `description`,`movies`.`photo_url` AS `photo_url`,`movies`.`trailer_url` AS `trailer_url`,`movies`.`launch_date` AS `launch_date`,`movies`.`category` AS `category`,`movies`.`discount` AS `discount`,`movies`.`box_office` AS `box_office`,`movies`.`director` AS `director`,`movies`.`cast` AS `cast` from (((`orders` left join `order_items` on((`orders`.`id` = `order_items`.`order_id`))) left join `sessions` on(((`order_items`.`session_date` = `sessions`.`date`) and (`order_items`.`session_time` = `sessions`.`time`) and (`order_items`.`session_theater` = `sessions`.`theater`)))) left join `movies` on((`sessions`.`movie_id` = `movies`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `session_seat_view`
--

/*!50001 DROP VIEW IF EXISTS `session_seat_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `session_seat_view` AS select `sessions`.`date` AS `date`,`sessions`.`time` AS `time`,`sessions`.`theater` AS `theater`,`sessions`.`movie_id` AS `movie_id`,`sessions`.`stock` AS `stock`,`movies`.`name` AS `name`,`movies`.`subtitle` AS `subtitle`,`movies`.`unit_price` AS `unit_price`,`movies`.`description` AS `description`,`movies`.`photo_url` AS `photo_url`,`movies`.`trailer_url` AS `trailer_url`,`movies`.`launch_date` AS `launch_date`,`movies`.`category` AS `category`,`movies`.`discount` AS `discount`,`movies`.`box_office` AS `box_office`,`movies`.`director` AS `director`,`movies`.`cast` AS `cast`,`seats`.`A` AS `A`,`seats`.`B` AS `B`,`seats`.`C` AS `C`,`seats`.`D` AS `D`,`seats`.`E` AS `E`,`seats`.`F` AS `F`,`seats`.`G` AS `G`,`seats`.`H` AS `H`,`seats`.`I` AS `I` from ((`sessions` left join `movies` on((`sessions`.`movie_id` = `movies`.`id`))) left join `seats` on(((`seats`.`session_date` = `sessions`.`date`) and (`seats`.`session_time` = `sessions`.`time`) and (`seats`.`session_theater` = `sessions`.`theater`)))) */;
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

-- Dump completed on 2023-03-21 12:02:57
