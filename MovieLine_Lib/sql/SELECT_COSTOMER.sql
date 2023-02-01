USE vgb;
SELECT * FROM customers;
/*
SELECT id, email, password, name, birthday, gender
	, address, phone, blood_type, subscribed
	FROM customers
    ORDER BY birthday ASC,email ASC;
*/
SELECT id, email, password, name, birthday, gender
	,address, phone, blood_type, subscribed FROM customers
    WHERE id>='A123123123' AND password<='12345;lkj'
    ORDER BY birthday;

SELECT id, email, password, name, birthday, gender, 
	address, phone, blood_type, subscribed
    FROM customers
    WHERE id = 'A123123123';
    
SELECT id, email, password, name, birthday, gender, 
	address, phone, blood_type, subscribed
    FROM customers
    # 分大小寫加BINARY
    WHERE id = 'a123123123' AND password = BINARY '12345;lkj';

SELECT id, email, password, name, birthday, gender, 
	address, phone, blood_type, subscribed
    FROM customers
    WHERE id LIKE BINARY'a123123123' AND password LIKE '12345%';
CREATE TABLE `customers2` (
  `id` char(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `address` varchar(60) NOT NULL DEFAULT '',
  `phone` varchar(45) NOT NULL DEFAULT '',
  `blood_type` varchar(2) DEFAULT NULL,
  `subscribed` tinyint NOT NULL DEFAULT '0'#,
 # PRIMARY KEY (`id`)#,
 # UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

