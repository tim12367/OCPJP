/*查詢全部session庫存 by id*/ 
SELECT date, time, thread, movie_id, SUM(sessions.stock) AS total_stock, 
id, name, subtitle, unit_price, description, 
photo_url, trailer_url, launch_date, category, discount, 
box_office, director, cast
FROM sessions LEFT JOIN movies
ON id = movie_id
GROUP BY id;
/*查詢sql_mode*/
SHOW variables LIKE '%sql_mode';

/*cross join*/
SELECT date, time, thread, movie_id, sessions.stock , 
id, name, subtitle, 
unit_price, movies.stock, description, 
photo_url, trailer_url, launch_date, 
category, discount, box_office, director, cast 
FROM sessions 
JOIN movies;
/*left join*/
SELECT date, time, thread, movie_id, sessions.stock ,
id, name, subtitle, 
unit_price, movies.stock, description, 
photo_url, trailer_url, launch_date, 
category, discount, box_office, director, cast 
FROM sessions 
LEFT JOIN movies 
ON id=movie_id 
WHERE movie_id = 1
ORDER BY date,time ;