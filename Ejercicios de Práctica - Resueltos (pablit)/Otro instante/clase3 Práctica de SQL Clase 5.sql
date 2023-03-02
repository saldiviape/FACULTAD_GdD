--4. Práctica de SQL Clase 5
use stores7

--1
SELECT c.customer_num, company, order_num
FROM customer c, orders o
WHERE c.customer_num = o.customer_num
ORDER BY c.customer_num



--2
SELECT order_num, item_num, description, p.manu_code, quantity, total_price 
FROM items i JOIN products p ON (i.stock_num = p.stock_num)
			 JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE order_num = 1004



--3
SELECT i.order_num, i.item_num, description, p.manu_code, quantity, total_price, manu_name
FROM items i JOIN products p ON (i.stock_num = p.stock_num)
			 JOIN manufact m ON (p.manu_code = m.manu_code)
			 JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE i.order_num = 1004



--4
SELECT o.order_num, o.customer_num, c.fname, c.lname, c.company
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
WHERE o.order_date IS NOT NULL



--5
SELECT distinct o.customer_num, c.fname, c.lname, c.company
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
WHERE o.order_date IS NOT NULL



--6
SELECT m.manu_name, p.stock_num, tp.description, unit_code, unit_price, unit_price * 1.2 AS precioJunio
FROM products p JOIN manufact m ON (p.manu_code = m.manu_code)
				JOIN product_types tp ON (p.stock_num = tp.stock_num)


--7
SELECT i.item_num, description, quantity, total_price
FROM items i JOIN products p ON (i.stock_num = p.stock_num)
			 JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE i.order_num = 1004



--8
SELECT manu_name, lead_time
FROM manufact m JOIN products p ON (m.manu_code = p.manu_code)
				JOIN items i ON (p.stock_num = i.stock_num)
				JOIN orders o ON (i.order_num = o.order_num)
				JOIN customer c ON (o.customer_num = c.customer_num)
WHERE c.customer_num = 104



--9
SELECT o.order_num, o.order_date, i.item_num, description, quantity, total_price
FROM orders o JOIN items i ON (o.order_num = i.order_num)
			  JOIN products p ON (i.stock_num = p.stock_num)
			  JOIN product_types tp ON (p.stock_num = tp.stock_num)



--10
SELECT lname + ', ' + fname AS 'Apellido, Nombre', '(' + SUBSTRING(phone, 1, 3) + ') ' + SUBSTRING(phone,5,9) ,count(order_num) cantOrdenes
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
GROUP BY lname, fname, phone
ORDER BY lname, fname



--11
SELECT ship_date fechaDeEmbarque, lname + ', ' + fname AS 'Apellido, Nombre', COUNT(order_num) cantOrdenes
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
			  JOIN state s ON (c.state = s.code)
WHERE sname = 'CA'
  AND zipcode BETWEEN 94000 AND 94100
GROUP BY ship_date, lname, fname
ORDER BY ship_date, lname, fname



--12
SELECT manu_name, description, SUM(quantity) cantProductosVendidos, SUM(total_price) importeTotal
FROM items i JOIN products p ON (i.stock_num = p.stock_num)
			 JOIN manufact m ON (p.manu_code = m.manu_code)
			 JOIN product_types tp ON (p.stock_num = tp.stock_num)
			 JOIN orders o ON (i.order_num = o.order_num)
WHERE m.manu_code IN ('ANZ', 'HRO', 'HSK', 'SMT')
  AND o.order_date BETWEEN '2015-05-01 00:00:00.000'
  AND '2015-06-30 23:59:59.999'
GROUP BY manu_name, description
ORDER BY cantProductosVendidos DESC



--13
SELECT order_date, COUNT(quantity) cantidadMensualDeItemsVendidos, SUM(total_price) total
FROM orders o JOIN items i ON (o.order_num = i.order_num)
GROUP BY order_date
ORDER BY SUM(total_price) DESC
