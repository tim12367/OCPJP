SELECT date, time, thread, stock, id, name, 
subtitle, unit_price, description, photo_url, 
trailer_url, launch_date, category, discount, 
box_office, director, cast 
FROM vgb.session_view 
WHERE id = '1' 
ORDER BY date,time ;
/*測試*/
SELECT date, time, thread, stock, id, name, 
subtitle, unit_price, description, photo_url, 
trailer_url, launch_date, category, discount, 
box_office, director, cast 
FROM session_view 
WHERE id = '1'
GROUP BY id
ORDER BY id ;

