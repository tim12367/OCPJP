USE vgb;
CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `address` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(45) NOT NULL DEFAULT '',
  `blood_type` varchar(2) DEFAULT NULL,
  `subscribed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*
-- Query: SELECT * FROM vgb.customers
LIMIT 0, 1000

-- Date: 2023-01-05 08:53
*/
INSERT INTO `customers` (`id`,`email`,`password`,`name`,`birthday`,`gender`,`address`,`phone`,`blood_type`,`subscribed`) VALUES ('A123123123','test01@uuu.com','12345;lkj','李四','2000-01-01','M','','',NULL,0);
INSERT INTO `customers` (`id`,`email`,`password`,`name`,`birthday`,`gender`,`address`,`phone`,`blood_type`,`subscribed`) VALUES ('A123456789','test02@uuu.com','12345;lkj','張三','2000-01-01','M','','',NULL,0);
INSERT INTO `customers` (`id`,`email`,`password`,`name`,`birthday`,`gender`,`address`,`phone`,`blood_type`,`subscribed`) VALUES ('A136304061','test03@uuu.com','12345;lkj','金凱利','2005-08-15','F','台北市復興北路99號14F','02-23456789','AB',1);
INSERT INTO `customers` (`id`,`email`,`password`,`name`,`birthday`,`gender`,`address`,`phone`,`blood_type`,`subscribed`) VALUES ('C133258957','test04@uuu.com','12345;lkj','白帥帥','1999-09-09','M','','',NULL,0);
