SELECT id, name, subtitle, unit_price, stock, 
	description, photo_url, trailer_url, 
    launch_date, category, discount, box_office, 
    director, cast
FROM products
	JOIN product_seats;