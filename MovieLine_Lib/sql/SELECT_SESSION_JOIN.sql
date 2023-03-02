/*查詢全部session庫存 by id*/ 
SELECT group_concat(date), group_concat(time),group_concat(thread) , movie_id, SUM(stock) AS total_stock, 
id, name, subtitle, unit_price, description, 
photo_url, trailer_url, launch_date, category, discount, 
box_office, director, cast
FROM sessions LEFT JOIN movies
ON id = movie_id
GROUP BY id;
/*查詢全部session庫存 by id*/ 

/*查詢sql_mode*/
SHOW variables LIKE '%sql_mode';
/*設定為 ONLY_FULL_GROUP_BY*/
/*sql_mode=only_full_group_by*/
SET sql_mode = (SELECT REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
/*cross join*/
SELECT date, time, thread, movie_id, sessions.stock , 
id, name, subtitle, 
unit_price, description, 
photo_url, trailer_url, launch_date, 
category, discount, box_office, director, cast 
FROM sessions 
JOIN movies;
/*left join*/
SELECT date, time, thread, movie_id, stock ,
id, name, subtitle, 
unit_price, description, 
photo_url, trailer_url, launch_date, 
category, discount, box_office, director, cast 
FROM sessions 
LEFT JOIN movies 
ON id=movie_id 
WHERE movie_id = 2
ORDER BY date,time ;

