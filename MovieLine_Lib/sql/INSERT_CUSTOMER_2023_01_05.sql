/*
-- Query: SELECT * FROM vgb.customers
LIMIT 0, 1000

-- Date: 2023-01-05 11:06
*/
USE vgb;
SELECT id, email, password, name, birthday, gender,
	address, phone, blood_type, subscribed
    FROM customers;

INSERT INTO customers (id,email,password,name,
birthday,gender,address,phone,blood_type,subscribed) 
	VALUES ('A123123123','test01@uuu.com',
    '12345;lkj','李四','2000-01-01','M','','',NULL,0);

INSERT INTO customers (id,email,password,name
,birthday,gender,address,phone,blood_type,subscribed) 
	VALUES ('A123123132','test20@uuu.com','12345;lkj',
    '林梅莉','2005-08-15','M','台北市信義路二段100號','',NULL,0);

INSERT INTO customers (id,email,password,name
,birthday,gender,address,phone,blood_type,subscribed)
	VALUES ('A123456789','test02@uuu.com','12345;lkj'
    ,'張三','2000-01-01','M','','',NULL,0);

INSERT INTO customers (id,email,password,name
,birthday,gender,address,phone,blood_type,subscribed) 
	VALUES ('A136304061','test03@uuu.com','12345;lkj'
    ,'金凱利','2005-08-15','F','台北市復興北路99號14F','02-23456789','AB',1);

INSERT INTO customers (id,email,password,name
,birthday,gender,address,phone,blood_type,subscribed) 
	VALUES ('C133258957','test04@uuu.com','12345;lkj',
    '白帥帥','1999-09-09','M','','',NULL,0);

INSERT INTO customers (id,email,password,name,
birthday,gender,address,phone,blood_type,subscribed) 
	VALUES ('G177224855','test05@uuu.com','12345;lkj'
    ,'tom','1999-03-03','M','新北市中和區中山路','0912334444','O',0);

DELETE FROM customers WHERE id='A123123123';