

/*cross join*/ 
SELECT id, name, subtitle, unit_price, products.stock, 
	description, photo_url, trailer_url, 
    launch_date, category, discount, box_office, 
	director, cast, 
    row_name, seats_booked, product_seats.stock 
FROM products
	JOIN product_seats;
/*Inner Join*/
SELECT id, name, subtitle, unit_price, products.stock AS total_stock, 
	description, photo_url, trailer_url, 
    launch_date, category, discount, box_office, 
	director, cast 
    row_name, seats_booked, product_seats.stock AS stock 
FROM products INNER JOIN product_seats
	on id=product_id
    where id = '1'
    order by id,showing;

/* ***LEFT OUTER Join FOR E05*/
SELECT id, name, subtitle, unit_price, products.stock , 
	description, photo_url, trailer_url, 
    launch_date, category, discount, box_office, 
	director, cast, 
    row_name, seats_booked, product_seats.stock AS row_stock ,showing 
FROM products LEFT OUTER JOIN product_seats
	on id=product_id
    where id = '1'
    order by id,showing;