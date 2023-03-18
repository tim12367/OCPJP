/*E10: 查詢訂單明細 */
SELECT orders.id, customer_id, order_date, order_time, 
status, payment_type, payment_fee, payment_note, 
shipping_type, shipping_fee, shipping_note, shipping_address, 
recipient_name, recipient_email, recipient_phone ,
session_date, session_time, session_theater, price, quantity, A, B, C, D, E, F, G, H, I,
movie_id,stock, 
name, subtitle, unit_price, description, photo_url, trailer_url,
 launch_date, category, discount, box_office, director, cast
FROM orders 
LEFT JOIN order_items ON orders.id = order_items.order_id
LEFT JOIN sessions ON (session_date = date AND session_time = time AND session_theater=theater)
LEFT JOIN movies ON movie_id = movies.id
WHERE orders.id = '13' AND customer_id ='A123123123';

/*E10: 查詢所有訂單 */
SELECT orders.id, customer_id, order_date, order_time, 
status, payment_type, payment_fee, payment_note, 
shipping_type, shipping_fee, shipping_note, shipping_address, 
recipient_name, recipient_email, recipient_phone ,
session_date, session_time, session_theater, price, quantity, A, B, C, D, E, F, G, H, I,
movie_id,stock, 
name, subtitle, unit_price, description, photo_url, trailer_url,
 launch_date, category, discount, box_office, director, cast
FROM orders 
LEFT JOIN order_items ON orders.id = order_items.order_id
LEFT JOIN sessions ON (session_date = date AND session_time = time AND session_theater=theater)
LEFT JOIN movies ON movie_id = movies.id
WHERE orders.id = '13' AND customer_id ='A123123123'
ORDER BY order_date DESC,order_time DESC ;