CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `vgb`.`session_view` AS
    SELECT 
        `vgb`.`sessions`.`date` AS `date`,
        `vgb`.`sessions`.`time` AS `time`,
        `vgb`.`sessions`.`theater` AS `theater`,
        `vgb`.`sessions`.`stock` AS `stock`,
        `vgb`.`movies`.`id` AS `id`,
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
        (`vgb`.`sessions`
        LEFT JOIN `vgb`.`movies` ON ((`vgb`.`movies`.`id` = `vgb`.`sessions`.`movie_id`)))
    ORDER BY `vgb`.`sessions`.`date` , `vgb`.`sessions`.`time`