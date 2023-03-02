--5. Práctica de SQL Clase 6
use stores7

--JOINS (Group by, having, Subqueries, subq. correlacionados, outer joins, Temp tables)
--1
SELECT m.manu_code, m.manu_name, lead_time, SUM(total_price) MontoTotalVentasRealizadas
FROM items i JOIN manufact m ON (i.manu_code = m.manu_code)
GROUP BY m.manu_code, m.manu_name, lead_time
ORDER BY m.manu_code



--2
SELECT p.stock_num, description, manu_code INTO #p_tp FROM products p JOIN product_types tp ON (p.stock_num = tp.stock_num)
SELECT p.stock_num, p.manu_code INTO #p_m FROM products p JOIN manufact m ON (p.manu_code = m.manu_code)

SELECT ptp.stock_num, description, ptp.manu_code, pm.manu_code
FROM #p_tp ptp JOIN #p_m pm ON (ptp.stock_num = pm.stock_num)
WHERE ptp.manu_code != pm.manu_code



--3a
SELECT customer_num, lname, fname
FROM customer
WHERE customer_num IN (SELECT customer_num FROM orders GROUP BY customer_num HAVING COUNT(order_num)>1)
--dentro de la subquery no va el "COUNT(order_num)" porque el IN necesita varios valores de una misma columna para que ande bien



--3b
SELECT c.customer_num, fname, lname, order_num INTO #tt FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)

SELECT customer_num, fname, lname
FROM #tt
GROUP BY customer_num, fname, lname
HAVING COUNT(order_num) > 1



--3c
SELECT c.customer_num, fname, lname, COUNT(order_num) cantOrdenes
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
GROUP BY c.customer_num, fname, lname
HAVING COUNT(order_num) > 1



--4
SELECT order_num, SUM(total_price) montoTotal
FROM items
GROUP BY order_num
HAVING SUM(total_price) < (SELECT AVG(total_price) FROM items)



--5
SELECT m.manu_code, manu_name, p.stock_num, description, unit_price
FROM products p JOIN manufact m ON (p.manu_code = m.manu_code)
				JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE unit_price > (SELECT AVG(unit_price)
					FROM products p2
					WHERE p2.manu_code = m.manu_code)
ORDER BY m.manu_code



--6
SELECT o.customer_num, company, order_num, order_date
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
WHERE NOT EXISTS (SELECT item_num
				  FROM orders o JOIN items i ON (o.order_num = i.order_num)
								JOIN product_types tp ON (i.stock_num = tp.stock_num)
				  WHERE description LIKE '%baseball gloves%')
ORDER BY o.order_num



--Operador UNION
--7
	SELECT *
	FROM products
	WHERE manu_code = 'HRO'
UNION
	SELECT *
	FROM products
	WHERE stock_num = 1



--8
	SELECT 1 sortkey, city, company
	FROM customer
	WHERE city ='Redwood City'
UNION
	SELECT 2 sortkey, city, company
	FROM customer
	WHERE city !='Redwood City'
	ORDER BY sortkey, city



--Vistas
--9
CREATE VIEW ClientesConMultiplesOrdenes AS
	SELECT c.customer_num, fname, lname, COUNT(order_num) cantOrdenes
	FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
	GROUP BY c.customer_num, fname, lname
	HAVING COUNT(order_num) > 1



--10
CREATE VIEW Productos_HRO AS
	SELECT *
	FROM products
	WHERE manu_code = 'HRO'
WITH CHECK OPTION

--10.a) No se inserta nada porque el valor de manu_code ('ANZ') no cumple con la condición del WHERE (manu_code = 'HRO')
INSERT INTO Productos_HRO (stock_num, manu_code) VALUES (1000, 'ANZ')

--10.b) No se inserta nada porque... ¿por qué?
INSERT INTO Productos_HRO (stock_num, manu_code) VALUES (100, 'HRO')

--10.c) ¿A qué se refiere con "validar los datos insertados"? ---> creo que a 'WITH CHECK OPTION'



--Transacciones
--11
BEGIN TRANSACTION
	INSERT INTO customer (customer_num, fname, lname) VALUES (129, 'Fred', 'Flintstone')
	SELECT * FROM customer WHERE fname = 'Fred'
ROLLBACK TRANSACTION



--12
BEGIN TRANSACTION
	INSERT INTO manufact (manu_code, manu_name, lead_time) VALUES ('AZZ', 'AZZIO Division SA', 5)
	--INSERT INTO products SELECT * FROM products WHERE description LIKE '%tennis%'
ROLLBACK TRANSACTION
--select * from product_types where description LIKE '%tennis%'
