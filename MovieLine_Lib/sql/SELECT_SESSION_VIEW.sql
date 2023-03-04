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
/*電影編號 時間 日期 查詢場次*/

SELECT id, date, time, thread, movie_id, stock, name, subtitle, unit_price, 
			description, photo_url, trailer_url, launch_date, category, 
			discount, box_office, director, cast, A, B, C, D, E, F, G, H, I 
			FROM session_seat_view 
			WHERE movie_id ='1' AND date = '2023-03-01 'AND time ='16:45' 
			ORDER BY date,time 
