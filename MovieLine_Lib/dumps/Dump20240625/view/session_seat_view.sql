CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vgb`.`session_seat_view` AS
    SELECT 
        `vgb`.`sessions`.`date` AS `date`,
        `vgb`.`sessions`.`time` AS `time`,
        `vgb`.`sessions`.`theater` AS `theater`,
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
        `vgb`.`movies`.`cast` AS `cast`,
        `vgb`.`seats`.`A` AS `A`,
        `vgb`.`seats`.`B` AS `B`,
        `vgb`.`seats`.`C` AS `C`,
        `vgb`.`seats`.`D` AS `D`,
        `vgb`.`seats`.`E` AS `E`,
        `vgb`.`seats`.`F` AS `F`,
        `vgb`.`seats`.`G` AS `G`,
        `vgb`.`seats`.`H` AS `H`,
        `vgb`.`seats`.`I` AS `I`
    FROM
        ((`vgb`.`sessions`
        LEFT JOIN `vgb`.`movies` ON ((`vgb`.`sessions`.`movie_id` = `vgb`.`movies`.`id`)))
        LEFT JOIN `vgb`.`seats` ON (((`vgb`.`seats`.`session_date` = `vgb`.`sessions`.`date`)
            AND (`vgb`.`seats`.`session_time` = `vgb`.`sessions`.`time`)
            AND (`vgb`.`seats`.`session_theater` = `vgb`.`sessions`.`theater`))))