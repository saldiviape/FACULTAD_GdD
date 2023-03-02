--6. QueriesComplejos II (1-6)
use stores7

--1a
CREATE VIEW tabla1A AS
	SELECT m.manu_code,
		   m.manu_name, 
		   COUNT(distinct p.stock_num) cant_producto, 
		   (SELECT MAX(o.order_date)) ult_fecha_orden
	FROM products p JOIN manufact m ON (p.manu_code = m.manu_code)
					JOIN items i ON (p.manu_code = i.manu_code)
					JOIN orders o ON (i.order_num = o.order_num)
	GROUP BY m.manu_code, m.manu_name
	HAVING COUNT(distinct p.stock_num) > 1
--select * from tabla1A
--DROP VIEW tabla1A


--1b
SELECT manu_code,
	   manu_name,
	   cant_producto,
	   COALESCE(CAST(ult_fecha_orden AS CHAR), 'No posee órdenes') ult_fecha_orden
FROM tabla1A



--2
CREATE VIEW tabla2 AS
	SELECT SUM(i.quantity * i.total_price) 'total ventas'
	FROM items i
	GROUP BY i.manu_code
--select * from tabla2
--DROP VIEW tabla2
CREATE VIEW tabla2prom AS
	SELECT AVG([total ventas]) 'prom total ventas'
	FROM tabla2
--select * from tabla2prom
--DROP VIEW tabla2prom

SELECT m.manu_code,
	   m.manu_name,
	   COUNT(DISTINCT o.order_num) cantOrdenes,
	   SUM(i.total_price * i.quantity) sumaTotalProductosVendidos
FROM manufact m JOIN items i ON (m.manu_code = i.manu_code)
				JOIN orders o ON (i.order_num = o.order_num)
				JOIN product_types tp ON (i.stock_num = tp.stock_num)
WHERE m.manu_code LIKE 'H__'
  AND (tp.description LIKE '%tennis%'
      OR tp.description LIKE '%ball%')
GROUP BY m.manu_code, m.manu_name
HAVING SUM(i.total_price * i.quantity) > (SELECT *
										  FROM tabla2prom)
ORDER BY sumaTotalProductosVendidos DESC



--3
SELECT c.customer_num,
	   c.lname,
	   c.company,
	   COUNT(o.order_num)--, (fecha última OC), (total en dólares comprado), (total general comprado) por todos los clientes
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)



--4
CREATE VIEW tabla4 AS
	SELECT TOP 1 s.code 'estado', i.stock_num 'num stock', COUNT(i.total_price) 'total vendido' 
	FROM state s JOIN customer c ON (s.code = c.state)
				 JOIN orders o ON (c.customer_num = o.customer_num)
				 JOIN items i ON (o.order_num = i.order_num)
	GROUP BY s.code, i.stock_num
	ORDER BY COUNT(i.total_price) DESC
--select * from tabla4
--drop view tabla4

SELECT top 5 tp.description,
			 SUM(i.quantity) 'cantVendida',
			 SUM(i.quantity * i.total_price) 'precioTotal'
FROM state s JOIN customer c ON (s.code = c.state)
			 JOIN orders o ON (c.customer_num = o.customer_num)
			 JOIN items i ON (o.order_num = i.order_num)
			 JOIN product_types tp ON (i.stock_num = tp.stock_num)
GROUP BY s.code, tp.description
HAVING s.code = (SELECT estado
				 FROM tabla4)
ORDER BY SUM(i.quantity) DESC



--5
--TERMINARLO
SELECT manu_code, AVG(unit_price)
FROM products
GROUP BY manu_code

SELECT m.manu_code,
	   m.manu_name,
	   p.stock_num,
	   tp.description,
	   p.unit_price
FROM manufact m JOIN products p ON (m.manu_code = p.manu_code)
				JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE p.unit_price > (SELECT AVG(p2.unit_price)
					  FROM manufact m2 JOIN products p2 ON (m2.manu_code = p2.manu_code)
					  WHERE p.manu_code = p2.manu_code)
ORDER BY 1, 2
