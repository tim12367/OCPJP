CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vgb`.`orders_orderitems_sessions_movies_view` AS
    SELECT 
        `vgb`.`orders`.`id` AS `id`,
        `vgb`.`orders`.`customer_id` AS `customer_id`,
        `vgb`.`orders`.`order_date` AS `order_date`,
        `vgb`.`orders`.`order_time` AS `order_time`,
        `vgb`.`orders`.`status` AS `status`,
        `vgb`.`orders`.`payment_type` AS `payment_type`,
        `vgb`.`orders`.`payment_fee` AS `payment_fee`,
        `vgb`.`orders`.`payment_note` AS `payment_note`,
        `vgb`.`orders`.`shipping_type` AS `shipping_type`,
        `vgb`.`orders`.`shipping_fee` AS `shipping_fee`,
        `vgb`.`orders`.`shipping_note` AS `shipping_note`,
        `vgb`.`orders`.`shipping_address` AS `shipping_address`,
        `vgb`.`orders`.`recipient_name` AS `recipient_name`,
        `vgb`.`orders`.`recipient_email` AS `recipient_email`,
        `vgb`.`orders`.`recipient_phone` AS `recipient_phone`,
        `vgb`.`order_items`.`session_date` AS `session_date`,
        `vgb`.`order_items`.`session_time` AS `session_time`,
        `vgb`.`order_items`.`session_theater` AS `session_theater`,
        `vgb`.`order_items`.`price` AS `price`,
        `vgb`.`order_items`.`quantity` AS `quantity`,
        `vgb`.`order_items`.`A` AS `A`,
        `vgb`.`order_items`.`B` AS `B`,
        `vgb`.`order_items`.`C` AS `C`,
        `vgb`.`order_items`.`D` AS `D`,
        `vgb`.`order_items`.`E` AS `E`,
        `vgb`.`order_items`.`F` AS `F`,
        `vgb`.`order_items`.`G` AS `G`,
        `vgb`.`order_items`.`H` AS `H`,
        `vgb`.`order_items`.`I` AS `I`,
        `vgb`.`sessions`.`movie_id` AS `movie_id`,
        `vgb`.`sessions`.`stock` AS `stock`,
        `vgb`.`movies`.`name` AS `name`,
        `vgb`.`movies`.`subtitle` AS `subtitle`,
        `vgb`.`movies`.`unit_price` AS `unit_price`,
        `vgb`.`movies`.`description` AS `description`,
        `vgb`.`movies`.`photo_url` AS `photo_url`,
        `vgb`.`movies`.`trailer_url` AS `trailer_url`,
        `vgb`.`movies`.`launch_date` AS `launch_date`,
        `vgb`.`movies`.`category` AS `category`,
        `vgb`.`movies`.`discount` AS `discount`,
        `vgb`.`movies`.`box_office` AS `box_office`,
        `vgb`.`movies`.`director` AS `director`,
        `vgb`.`movies`.`cast` AS `cast`
    FROM
        (((`vgb`.`orders`
        LEFT JOIN `vgb`.`order_items` ON ((`vgb`.`orders`.`id` = `vgb`.`order_items`.`order_id`)))
        LEFT JOIN `vgb`.`sessions` ON (((`vgb`.`order_items`.`session_date` = `vgb`.`sessions`.`date`)
            AND (`vgb`.`order_items`.`session_time` = `vgb`.`sessions`.`time`)
            AND (`vgb`.`order_items`.`session_theater` = `vgb`.`sessions`.`theater`))))
        LEFT JOIN `vgb`.`movies` ON ((`vgb`.`sessions`.`movie_id` = `vgb`.`movies`.`id`)))