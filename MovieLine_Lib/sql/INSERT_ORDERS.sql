INSERT INTO orders
	(id, customer_id, order_date, order_time, status, 
    payment_type, payment_fee, payment_note,
    shipping_type, shippinf_fee,shipping_address, 
    recipient_name, recipient_email, recipient_phone)
    VALUES(?,?,?,?,0, ?,?,'', ?,?,?, ?,?,?);
INSERT INTO orderItems
	(order_id, session_id, price, quantity)
    VALUES(?,?,?,?)