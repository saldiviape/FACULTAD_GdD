--Clase 11 - QUERIES COMPLEJOS II
--1
--HECHO
SELECT c.customer_num,
	   c.lname,
	   c.fname,
	   SUM(i.quantity * i.unit_price) AS 'Total del Cliente',
	   COUNT(DISTINCT o.order_num) AS 'Cantidad de OCs del Cliente',
	   (SELECT COUNT(o.order_num) FROM orders o) AS 'Cantidad Total de OCs'
FROM customer c
JOIN orders o ON (c.customer_num = o.customer_num)
JOIN items i ON (o.order_num = i.order_num)
WHERE c.zipcode LIKE '94%'
GROUP BY c.customer_num, c.lname, c.fname
HAVING COUNT(DISTINCT o.order_num) >= 2
   AND (SUM(i.quantity * i.unit_price) / COUNT(DISTINCT i.order_num))
		>
	   (SELECT (SUM(i2.quantity * i2.unit_price)) / (COUNT(DISTINCT i2.order_num))
	    FROM items i2)
GO




--2.a
--HECHO
SELECT p.stock_num,
	   p.manu_code,
	   tp.description,
	   m.manu_name,
	   SUM(i.quantity * i.unit_price) AS 'USS por Producto',
	   SUM(i.quantity) AS 'Unidad por Producto'
INTO #ABC_products
FROM products p
JOIN product_types tp ON (p.stock_num = tp.stock_num)
JOIN manufact m ON (p.manu_code = m.manu_code)
JOIN items i ON (p.stock_num = i.stock_num AND p.manu_code = i.manu_code)
WHERE p.manu_code IN (SELECT p2.manu_code--, COUNT(p2.stock_num)
					  FROM products p2
					  GROUP BY p2.manu_code
					  HAVING COUNT(p2.stock_num) >= 10)
GROUP BY p.stock_num, p.manu_code, tp.description, m.manu_name
GO
--Se puede hacer sin la tabla productos, porque la información que uso de ahí la tengo en la tabla items

--2.b
--HECHO
SELECT [USS por Producto], stock_num, manu_code
FROM #ABC_products
ORDER BY [USS por Producto] DESC, stock_num, manu_code
GO




--3
--HECHO
SELECT MONTH(o.order_date) AS 'Mes',
	   o.customer_num,
	   tt.stock_num,
	   tt.description,
	   COUNT(DISTINCT i.order_num) AS 'OCs por mes',
	   SUM(i.quantity) AS 'Cantidad de Productos por mes',
	   SUM(i.quantity * i.unit_price) AS 'USS Productos por mes'
FROM #ABC_products tt
JOIN items i ON (tt.stock_num = i.stock_num AND tt.manu_code = i.manu_code)
JOIN orders o ON (o.order_num = i.order_num)
JOIN customer c ON (c.customer_num = o.customer_num)
WHERE c.state IN (SELECT TOP 1 c2.state
				  FROM customer c2
				  GROUP BY c2.state
				  ORDER BY COUNT(customer_num) DESC)
GROUP BY tt.stock_num, tt.description, MONTH(o.order_date), o.customer_num
ORDER BY Mes, stock_num
GO




--4
--HECHO
SELECT DISTINCT i1.stock_num,
	   i1.manu_code,
	   c1.customer_num,
	   c1.lname,
	   c2.customer_num,
	   c2.lname
FROM items i1
JOIN orders o1 ON (i1.order_num = o1.order_num)
JOIN customer c1 ON (o1.customer_num = c1.customer_num)
JOIN items i2 ON (i1.stock_num = i2.stock_num AND i1.manu_code = i2.manu_code)
JOIN orders o2 ON (i2.order_num = o2.order_num)
JOIN customer c2 ON (o2.customer_num = c2.customer_num)
WHERE i1.stock_num IN (5, 6, 9)
  AND i1.manu_code = 'ANZ'
  AND (SELECT SUM(quantity)
	   FROM items i11
	   JOIN orders o11 ON (i11.order_num = o11.order_num)
	   WHERE i11.stock_num = i1.stock_num
	     AND i11.manu_code = i1.manu_code
		 AND o11.customer_num = c1.customer_num) > (SELECT SUM(quantity)
													FROM items i12
													JOIN orders o12 ON (i12.order_num = o12.order_num)
													WHERE i12.stock_num = i2.stock_num
													  AND i12.manu_code = i2.manu_code
													  AND o12.customer_num = c2.customer_num)
ORDER BY 1, 2
GO




--5
--HECHO
SELECT (SELECT TOP 1 COUNT(DISTINCT o.order_num)
		FROM customer c
		JOIN orders o ON (c.customer_num = o.customer_num)
		GROUP BY c.customer_num
		ORDER BY 1 DESC) AS 'Mayor cantidad de OC',
	   (SELECT TOP 1 SUM(i.quantity * i. unit_price)
		FROM items i
		JOIN orders o ON (i.order_num = o.order_num)
		GROUP BY o.customer_num
		ORDER BY 1 DESC) AS 'Mayor total en dólares',
	   (SELECT TOP 1 COUNT(o.order_num)
		FROM orders o
		JOIN items i ON (o.order_num = i.order_num)
		GROUP BY o.customer_num
		ORDER BY 1 DESC) AS 'Mayor cantidad de ítems de una OC',
	   (SELECT TOP 1 COUNT(DISTINCT o.order_num)
		FROM customer c
		JOIN orders o ON (c.customer_num = o.customer_num)
		GROUP BY c.customer_num
		ORDER BY 1) AS 'Menor cantidad de OC',
	   (SELECT TOP 1 SUM(i.quantity * i. unit_price)
		FROM items i
		JOIN orders o ON (i.order_num = o.order_num)
		GROUP BY o.customer_num
		ORDER BY 1) AS 'Menor total en dólares',
	   (SELECT TOP 1 COUNT(o.order_num)
		FROM orders o
		JOIN items i ON (o.order_num = i.order_num)
		GROUP BY o.customer_num
		ORDER BY 1) AS 'Menor cantidad de ítems de una OC'
GO




--6
--HECHO
SELECT c.customer_num,
	   o.order_num,
	   SUM(i.unit_price * i.quantity) totalOrdenPorCliente
FROM customer c
	JOIN orders o ON (c.customer_num = o.customer_num)
LEFT JOIN items i ON (o.order_num = i.order_num)
WHERE c.state = 'CA'
  AND YEAR(o.order_date) = 2015 -- linea agregada
  AND c.customer_num IN (SELECT c1.customer_num
						 FROM customer c1
							JOIN orders o1 ON (c1.customer_num = o1.customer_num)
						 WHERE YEAR(o1.order_date) = 2015
						 GROUP BY c1.customer_num
						 HAVING COUNT(*) >= 4)
GROUP BY c.customer_num, o.order_num
HAVING COUNT(i.item_num) > (SELECT TOP 1 COUNT(i3.item_num)
							FROM orders o3 JOIN items i3 ON (o3.order_num = i3.order_num)
								JOIN customer c3 ON o3.customer_num = c3.customer_num
							WHERE YEAR(o3.order_date) = 2015
							  AND c3.state = 'AZ'
							GROUP BY o3.order_num
							ORDER BY COUNT(i3.item_num) DESC)
ORDER BY 1, 2
GO




--7
--HECHO
SELECT TOP 1 c1.state,
	   sname,
	   c1.lname + ', ' + c1.fname,
	   c2.lname + ', ' + c2.fname,
	   SUM(i1.unit_price) + SUM(i2.unit_price)
FROM customer c1
	INNER JOIN orders o1 ON (c1.customer_num = o1.customer_num)
	INNER JOIN items i1 ON (o1.order_num = i1.order_num)
	INNER JOIN customer c2 ON (c1.state = c2.state AND c1.state = 'CA')
	INNER JOIN orders o2 ON (c2.customer_num = o2.customer_num)
	INNER JOIN items i2 ON (o2.order_num = i2.order_num)
	INNER JOIN state s ON (c1.state = s.state)
WHERE c1.customer_num < c2.customer_num
GROUP BY c1.state, sname, c1.lname, c1.fname, c2.lname, c2.fname
ORDER BY 5 DESC
GO




--8
--HECHO
SELECT DISTINCT o1.order_num,
	o1.customer_num,
	o1.order_date,
	NULL AS 'Fecha Modificada'
FROM orders o1
	JOIN items i1 ON (o1.order_num = i1.order_num)
	JOIN (SELECT TOP 1 o2.customer_num,
				 SUM(unit_price) totcliente
		  FROM orders o2
			JOIN items i2 ON (o2.order_num = i2.order_num)
		  WHERE i2.manu_code = 'ANZ'
		  GROUP BY o2.customer_num
		  ORDER BY 2 DESC) sub1 ON (o1.customer_num = sub1.customer_num)
WHERE o1.order_num IN (SELECT DISTINCT TOP 5 o2.order_num
					   FROM orders o2
					        JOIN items i2 ON (o2.order_num = i2.order_num)
					   WHERE i2.manu_code = 'ANZ'
					   ORDER BY o2.order_num DESC)
UNION
SELECT DISTINCT o1.order_num,
	   o1.customer_num,
	   o1.order_date,
	   o1.order_date + m1.lead_time
FROM orders o1
	JOIN items i1 ON (o1.order_num = i1.order_num)
	JOIN (SELECT TOP 1 o2.customer_num,
				 SUM(unit_price) totcliente
		  FROM orders o2
			JOIN items i2 ON (o2.order_num = i2.order_num)
		  WHERE i2.manu_code = 'ANZ'
		  GROUP BY o2.customer_num
		  ORDER BY 2 DESC) sub1 ON (o1.customer_num <> sub1.customer_num)
	JOIN manufact m1 ON (i1.manu_code = m1.manu_code)
WHERE o1.order_num IN (SELECT DISTINCT TOP 5 o2.order_num
					   FROM orders o2
						   JOIN items i2 ON (o2.order_num = i2.order_num)
					   WHERE i2.manu_code = 'ANZ'
					   ORDER BY o2.order_num DESC)
  AND i1.manu_code = 'ANZ'
ORDER BY 4
GO


--9
--HECHO
SELECT c.customer_num,
	   c.fname,
	   c.lname,
	   c.state,
	   COUNT(distinct o.order_num) AS 'cant_ordenes',
	   SUM(i.quantity * i.unit_price) AS 'monto_total'
FROM customer c
	JOIN orders o ON (c.customer_num = o.customer_num)
	JOIN items i ON (o.order_num = i.order_num)
WHERE c.state <> 'FL'
  AND YEAR(o.order_date) = 2015
GROUP BY c.customer_num, c.fname, c.lname, c.state
HAVING (SUM(i.quantity * i.unit_price))
	   >
	   (SELECT SUM(i2.quantity * i2.unit_price) / COUNT(DISTINCT c2.customer_num)
		FROM orders o2
			JOIN items i2 ON (o2.order_num = i2.order_num)
			JOIN customer c2 ON (o2.customer_num = c2.customer_num)
		WHERE c2.state <> 'FL')
ORDER BY monto_total DESC
GO




--10
--HECHO
SELECT c.customer_num,
	   c.fname,
	   c.lname,
	   SUM(i.unit_price * i.quantity) MontoOrdenes,
       cr.customer_num,
	   cr.fname,
	   cr.lname,
	   cr.totalRef
FROM customer c
	JOIN orders o ON (c.customer_num = o.customer_num)
	JOIN items i ON (o.order_num = i.order_num)
	LEFT JOIN (SELECT r.customer_num,
					  r.fname,
					  r.lname, 
					  SUM(i2.unit_price * i2.quantity) totalRef
			   FROM customer r
					LEFT JOIN orders o2 ON (r.customer_num = o2.customer_num)
					LEFT JOIN items i2 ON (o2.order_num = i2.order_num)
			   WHERE YEAR(o2.order_date) = 2015
			   GROUP BY r.customer_num, r.fname, r.lname) cr ON (cr.customer_num = c.customer_num_referedBy)
WHERE YEAR(o.order_date) = 2015
GROUP BY c.customer_num, c.fname, c.lname, cr.customer_num, cr.fname, cr.lname, cr.totalRef
HAVING SUM(i.unit_price * i.quantity) > COALESCE(cr.totalRef, 0)
ORDER BY MontoOrdenes DESC
GO
