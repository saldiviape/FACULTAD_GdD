--Clase 10 - QUERIES COMPLEJOS I
--1a
--HECHO
CREATE OR ALTER VIEW v_punto1 AS
	SELECT m.manu_code,
		   m.manu_name,
		   COUNT(p.stock_num) AS 'cant_producto',
		   (SELECT MAX(o2.order_date)
			FROM orders o2
				JOIN items i2 ON (o2.order_num = i2.order_num)
			WHERE i2.manu_code = m.manu_code) AS 'ult_fecha_orden'
	FROM manufact m
		LEFT JOIN products p ON (m.manu_code = p.manu_code)
	GROUP BY m.manu_code, m.manu_name
	HAVING COUNT(p.stock_num) >= 0
GO


--1b
--HECHO
SELECT manu_code, manu_name, cant_producto, COALESCE(ult_fecha_orden, 'No posee órdenes')
FROM v_punto1
GO




--2
--HECHO
SELECT m.manu_code,
	   m.manu_name,
	   COUNT(DISTINCT i.order_num) AS 'cantidad_ordenes',
	   SUM(i.quantity * i.unit_price) AS 'total_comprado'
FROM manufact m
	JOIN products p ON (m.manu_code = p.manu_code)
	JOIN items i ON (p.stock_num = i.stock_num AND p.manu_code = i.manu_code)
	JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE m.manu_code LIKE 'H__'
  AND (tp.description LIKE '%tennis%' OR tp.description LIKE '%ball%')
GROUP BY m.manu_code, manu_name
--HAVING (SUM(i.quantity * i.unit_price)) > (SELECT (SUM(i.quantity * i.unit_price)) / (COUNT(DISTINCT m.manu_code)) FROM items i)
HAVING (SUM(i.quantity * i.unit_price)) > ((SUM(i.quantity * i.unit_price)) / (COUNT(DISTINCT m.manu_code)))
ORDER BY total_comprado
GO




--3
--HECHO
CREATE OR ALTER VIEW v_punto3 AS
	SELECT c.customer_num,
		   c.lname,
		   c.company,
		   COUNT(o.order_num) AS 'cant_ordenes',
		   (SELECT MAX(o2.order_date)
			FROM orders o2
			WHERE o2.customer_num = c.customer_num) AS 'ult_fecha_orden',
		   SUM(i.quantity * i.unit_price) AS 'total_en_dólares',
		   (SELECT SUM(i2.quantity * i2.unit_price)
			FROM items i2) AS 'total_general_comprado_por_todos_los_clientes'
	FROM customer c
		LEFT JOIN orders o ON (c.customer_num = o.customer_num)
		JOIN items i ON (i.order_num = o.order_num)
	WHERE stock_num IN (SELECT p.stock_num
						FROM products p
						GROUP BY p.stock_num
						HAVING COUNT(p.manu_code) > 2)
	GROUP BY c.customer_num, c.lname, c.company
	HAVING COUNT(o.order_num) < 5
	ORDER BY cant_ordenes DESC
GO




--4
--HECHO
CREATE VIEW productMasComprados AS
SELECT t.description AS tipoProducto,
	   c.state AS estado,
	   SUM(i.quantity) AS cantVendida,
	   SUM(i.unit_price * i.quantity) AS totalVendido 
FROM products s
	JOIN items i ON (s.stock_num = i.stock_num)
	JOIN product_types t ON (s.stock_num=t.stock_num)
	JOIN orders o ON (i.order_num = o.order_num)
	JOIN customer c ON (o.customer_num = c.customer_num)
GROUP BY t.description, c.state
HAVING SUM(i.quantity) = (SELECT TOP 1 SUM(i1.quantity)
						  FROM products s1
							  JOIN product_types t1 ON (s1.stock_num = t1.stock_num)
							  JOIN items i1 ON (s1.stock_num = i1.stock_num)
							  JOIN orders o1 ON (i1.order_num = o1.order_num)
							  JOIN customer c1 ON (o1.customer_num = c1.customer_num)
						  WHERE t1.description = t.description
						  GROUP BY c1.state, t1.description
						  ORDER BY SUM(i1.quantity) DESC)
GO

SELECT TOP 5 *
FROM productMasComprados
ORDER BY cantVendida DESC
GO




--5
--HECHO
--con UNION
SELECT c.customer_num,
	   c.fname,
	   c.lname,
	   o.paid_date,
	   SUM(i.unit_price)
FROM customer c
	JOIN orders o ON (c.customer_num = o.customer_num)
	JOIN items i ON (o.order_num = i.order_num)
WHERE o.paid_date IN (SELECT MAX(o1.paid_date)
					  FROM customer c1
						  JOIN orders o1 ON (c1.customer_num = o1.customer_num)
					  WHERE c1.customer_num = c.customer_num)
					  GROUP BY c.customer_num, c.fname, c.lname, o.paid_date
HAVING SUM(i.unit_price) >=
	(SELECT AVG(i1.unit_price)
	 FROM customer c1
		 JOIN orders o1 ON (c1.customer_num = o1.customer_num)
		 JOIN items i1 ON (o1.order_num = i1.order_num)
	 WHERE o.paid_date >= o1.paid_date
	   AND c1.customer_num = c.customer_num)

UNION

SELECT c.customer_num,
	   c.fname,
	   c.lname,
	   o.paid_date,
	   SUM(i.unit_price)
FROM customer c
	LEFT JOIN orders o ON (c.customer_num = o.customer_num)
	LEFT JOIN items i ON (o.order_num = i.order_num)
WHERE c.customer_num NOT IN (SELECT customer_num FROM orders)
GROUP BY c.customer_num, c.fname, c.lname, o.paid_date
ORDER BY o.paid_date DESC

--sin UNION
SELECT c.customer_num,
	   c.fname,
	   c.lname,
	   o.paid_date,
	   SUM(i.unit_price) AS precioTotal
FROM customer c
	LEFT JOIN orders o ON (c.customer_num = o.customer_num)
	LEFT JOIN items i ON (o.order_num = i.order_num)
WHERE (o.paid_date IN (SELECT MAX(o1.paid_date)
					   FROM customer c1
						   JOIN orders o1 ON (c1.customer_num = o1.customer_num)
					   WHERE c1.customer_num = c.customer_num))
   OR c.customer_num NOT IN (SELECT customer_num FROM orders)
GROUP BY c.customer_num, c.fname, c.lname, o.paid_date
HAVING SUM(i.unit_price) >= (SELECT AVG(i1.unit_price)
							 FROM customer c1
								 JOIN orders o1 ON (c1.customer_num = o1.customer_num)
								 JOIN items i1 ON (o1.order_num = i1.order_num)
							 WHERE o.paid_date >= o1.paid_date AND c1.customer_num = c.customer_num)
	OR SUM(i.unit_price) IS NULL
ORDER BY o.paid_date DESC




--6
--HECHO
SELECT m.manu_code,
	   m.manu_name,
	   t.description,
	   SUM(i.quantity) cantidad,
	   SUM(i.unit_price* i.quantity) totalVendido
FROM manufact m
	JOIN items i ON (m.manu_code = i.manu_code)
	JOIN product_types t ON (i.stock_num=t.stock_num)
GROUP BY m.manu_code, m.manu_name, t.stock_num, t.description
HAVING SUM(i.quantity) >= COALESCE((SELECT TOP 1 SUM(i2.quantity)
									FROM manufact m2
										JOIN items i2 ON (m2.manu_code = i2.manu_code)
										JOIN product_types t2 ON (i2.stock_num = t2.stock_num)
									WHERE t2.stock_num = t.stock_num
									  AND m2.manu_code != m.manu_code
									GROUP BY m2.manu_code, m2.manu_name, t2.description
									ORDER BY 1 DESC), 0)
ORDER BY 3
