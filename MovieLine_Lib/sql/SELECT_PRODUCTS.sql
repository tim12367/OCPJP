/*E04-a:查詢全部產品*/ 
SELECT id, name, unit_price, stock, description, 
photo_url, launch_date, category, discount, box_office 
FROM movies;

/*E04-b:用關鍵字查詢*/ 
SELECT id, name, unit_price, stock, description, 
	photo_url, launch_date, category, discount, box_office 
FROM movies WHERE name LIKE '%the%';

/*E04-b:用分類查詢*/ 
SELECT id, name, unit_price, stock, description, 
	photo_url, launch_date, category, discount, box_office 
FROM movies WHERE category='劇情';

/*E04-d:新品上架*/
SELECT id, name, unit_price, stock, description, 
	photo_url, launch_date, category, discount, box_office 
FROM movies
/*WHERE launch_date <= curdate()*/
ORDER BY launch_date DESC limit 3;

/* 產品分類清單 */
SELECT DISTINCT category FROM movies;

SELECT category,COUNT(category) AS category_counter FROM movies
GROUP BY category;

/*用id查詢*/ 
SELECT id, name, unit_price, stock, description, 
	photo_url, launch_date, category, discount, box_office 
FROM movies WHERE id=1;