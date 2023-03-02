--6. QueriesComplejos I (1-9)
use stores7

--1
SELECT c.customer_num,
	   lname,
	   fname,
	   SUM(i.total_price * i.quantity) 'Total del Cliente',
	   COUNT(distinct o.order_num) 'OCs del Cliente',
	   (SELECT COUNT(order_num) FROM orders)
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
				JOIN items i ON (o.order_num = i.order_num)
WHERE c.zipcode LIKE '94%'
GROUP BY c.customer_num, lname, fname
HAVING (SUM(i.total_price * i.quantity)/COUNT(distinct o.order_num)) > (SELECT (SUM(i.total_price * i.quantity)/COUNT(distinct o.order_num))
																		FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
																						JOIN items i ON (o.order_num = i.order_num))
   AND COUNT(distinct o.order_num) >= 2



--2.a
DROP TABLE #ABC_Productos
SELECT i.stock_num,
	   i.manu_code,
	   description,
	   m.manu_name,
	   SUM(i.quantity * i.total_price) '$ por Producto',
	   SUM(i.quantity) 'Unid. por Producto'
INTO #ABC_Productos
FROM items i JOIN manufact m ON (i.manu_code = m.manu_code)
			 JOIN product_types tp ON (i.stock_num = tp.stock_num)
WHERE m.manu_code IN (SELECT manu_code
					  FROM products
					  GROUP BY manu_code
					  HAVING COUNT(stock_num) > 10)
GROUP BY i.stock_num, i.manu_code, description, m.manu_name
ORDER BY SUM(i.quantity * i.total_price)



--2.b
SELECT * FROM #ABC_Productos
ORDER BY #ABC_Productos.[$ por Producto] DESC, stock_num, manu_code



--3
SELECT description,
	   MONTH(o.order_date) 'Mes',
	   c.lname + ', ' + c.fname 'Cliente',
	   COUNT(DISTINCT o.order_num) 'Cant OC por mes',
	   SUM(quantity) 'Unid Producto por Mes',
	   SUM(total_price) 'u$ Producto por Mes'
FROM #ABC_Productos abc JOIN items i ON (abc.stock_num = i.stock_num)
						JOIN orders o ON (i.order_num = o.order_num)
						JOIN customer c ON (o.customer_num = c.customer_num)
WHERE c.state = (SELECT top 1 s.code
				 FROM customer c JOIN state s ON (c.state = s.code)
				 GROUP BY s.code
				 ORDER BY count(c.customer_num) desc)
GROUP BY abc.stock_num, description, MONTH(order_date), c.lname, c.fname, quantity
ORDER BY 2, 1



--4
DROP TABLE #tabla4
SELECT c.customer_num, stock_num, SUM(quantity) 'Cantidad'
INTO #tabla4
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
				JOIN items i ON (o.order_num = i.order_num)
WHERE stock_num IN (5, 6, 9)
  AND manu_code = 'ANZ'
GROUP BY c.customer_num, stock_num
ORDER BY 2, 1, 3
select * from #tabla4

SELECT t4.stock_num, t4.customer_num 'Cliente1', t4bis.customer_num 'Cliente2'
INTO #t4final
FROM #tabla4 t4, #tabla4 t4bis
WHERE t4.stock_num = t4bis.stock_num
  AND t4.customer_num != t4bis.customer_num
  AND t4.Cantidad > t4bis.Cantidad
select * from #t4final

SELECT stock_num, c1.customer_num 'Cliente 1', c1.lname 'Apellido del 1er Cliente', c2.customer_num 'Cliente 2', c2.lname 'Apellido del 2do Cliente'
FROM #t4final t4f JOIN customer c1 ON (t4f.Cliente1 = c1.customer_num)
				  JOIN customer c2 ON (t4f.Cliente2 = c2.customer_num)



--5
SELECT COUNT(order_num) cant INTO #cantOCsPorCliente 
	FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
	GROUP BY c.customer_num
SELECT SUM(total_price * quantity) total INTO #totalPorCliente
	FROM customer c JOIN orders o ON (c.customer_num = o.customer_num) JOIN items i ON (o.order_num = i.order_num)
	GROUP BY c.customer_num
SELECT COUNT(i.item_num) cantItems INTO #cantItemsOCporCliente
	FROM customer c JOIN orders o ON (c.customer_num = o.customer_num) JOIN items i ON (o.order_num = i.order_num)
	GROUP BY c.customer_num, o.order_num

SELECT (SELECT MAX(cant) FROM #cantOCsPorCliente) 'Mayor Cantidad de OCs solicitada por un C',
	   (SELECT MAX(total) FROM #totalPorCliente) 'Mayor Total en US$ solicitado por un C',
	   (SELECT MAX(cantItems) FROM #cantItemsOCporCliente) 'Mayor Cantidad de Items de una OC solicitada por un C',
	   (SELECT MIN(cant) FROM #cantOCsPorCliente) 'Menor Cantidad de OCs solicitada por un C',
	   (SELECT MIN(total) FROM #totalPorCliente) 'Menor Total en US$ solicitado por un C',
	   (SELECT MIN(cantItems) FROM #cantItemsOCporCliente) 'Menor Cantidad de Items de una OC solicitada por un C' 



--6
SELECT c.customer_num, COUNT(o.order_num) cantOrdenes, SUM(i.quantity * i.total_price) totalCobrado
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
				JOIN items i ON (o.order_num = i.order_num)
WHERE state = 'CA'
  AND YEAR(o.order_date) = 2015
GROUP BY c.customer_num
HAVING COUNT(o.order_num) > 4
   AND COUNT(i.quantity) > (...)

SELECT DISTINCT o.order_num
FROM orders o JOIN items i ON (o.order_num = i.order_num)
	 JOIN manufact m ON (i.manu_code = m.manu_code)
	 JOIN state s ON (m.state = s.code)
WHERE m.state = 'CA'
  AND year(o.order_date) = 2015
ORDER BY o.order_num


SELECT c.customer_num, COUNT(o.order_num) cantOrdenes, SUM(i.quantity * i.total_price) totalCobradoDeEsasOrdenes
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
				JOIN items i ON (o.order_num = i.order_num)
WHERE state = 'CA'
  AND YEAR(o.order_date) = 2015
  AND o.order_num IN (SELECT o.order_num
					  FROM orders o JOIN items i ON (o.order_num = i.order_num)
									JOIN manufact m ON (i.manu_code = m.manu_code)
									JOIN state s ON (m.state = s.code)
					  WHERE m.state = 'CA'
					    AND year(o.order_date) = 2015
					  GROUP BY c.customer_num
					  HAVING COUNT(o.order_num) > 4
--AND COUNT(i.quantity) > (...)

--TERMINARLO...
--Le cambié el año a 2015 para que muestre algo... si no, no muestra ninguna fila



--7
SELECT p.manu_code, m.manu_name, tp.description, p.stock_num, SUM(i.quantity) cantCompradas
FROM products p JOIN items i ON (p.stock_num = i.stock_num)
				JOIN product_types tp ON (p.stock_num = tp.stock_num)
				JOIN manufact m ON (p.manu_code = m.manu_code)
GROUP BY p.manu_code, m.manu_name, tp.description, p.stock_num
HAVING SUM(i.quantity) < 10
   AND tp.description LIKE '%shoes%'
   AND p.stock_num IN (SELECT stock_num
					   FROM products
					   GROUP BY stock_num
					   HAVING count(manu_code) > 2)



--8
SELECT TOP 2 c.customer_num 'Cliente', SUM(i.quantity * i.total_price) 'Monto en US$ en OCs'
INTO #cmm
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
				JOIN items i ON (o.order_num = i.order_num)
WHERE c.state = 'CA'
GROUP BY c.customer_num
ORDER BY SUM(i.quantity * i.total_price) DESC

SELECT TOP 1 c.lname + ', ' + c.fname 'AyN' into #c1
FROM #cmm JOIN customer c on (#cmm.Cliente = c.customer_num)
ORDER BY c.lname

SELECT TOP 1 c.lname + ', ' + c.fname 'AyN' into #c2
FROM #cmm JOIN customer c on (#cmm.Cliente = c.customer_num)
ORDER BY c.lname DESC

SELECT c.state, s.sname , (select * from #c1) 'Cliente 1', (select * from #c2) 'Cliente 2', SUM(#cmm.[Monto en US$ en OCs]) 'Total Solicitado'
FROM #cmm JOIN customer c ON (#cmm.Cliente = c.customer_num)
		  JOIN state s ON (c.state = s.code)
GROUP BY c.state, s.sname



--9
SELECT DISTINCT o.order_num, o.customer_num, o.order_date, o.order_date + m.lead_time + 1 'Fecha Modificada'
FROM orders o JOIN items i ON (o.order_num = i.order_num) JOIN manufact m ON (i.manu_code = m.manu_code)
WHERE o.order_num != (SELECT TOP 1 o.order_num
					  FROM orders o JOIN items i ON (o.order_num = i.order_num)
					  WHERE i.manu_code = 'ANZ'
					  GROUP BY o.order_num
					  ORDER BY COUNT(i.manu_code) desc)
UNION ALL
SELECT DISTINCT o.order_num, o.customer_num, o.order_date, NULL 'Fecha Modificada'
FROM orders o JOIN items i ON (o.order_num = i.order_num)
			  JOIN manufact m ON (i.manu_code = m.manu_code)
WHERE o.order_num = (SELECT TOP 1 o.order_num
					 FROM orders o JOIN items i ON (o.order_num = i.order_num)
					 WHERE i.manu_code = 'ANZ'
					 GROUP BY o.order_num
					 ORDER BY COUNT(i.manu_code) desc)
ORDER BY [Fecha Modificada], order_num

--Últimas 5 OCs emitidas que contengan productos del fabric. 'ANZ'
SELECT DISTINCT TOP 5 o.order_num
FROM orders o JOIN items i ON (o.order_num = i.order_num)
			  JOIN products p ON (i.stock_num = p.stock_num)
WHERE i.manu_code = 'ANZ'
ORDER BY o.order_num desc

--OC del cliente que más productos del fabricante 'ANZ' nos compró
SELECT TOP 1 o.order_num
FROM orders o JOIN items i ON (o.order_num = i.order_num)
WHERE i.manu_code = 'ANZ'
GROUP BY o.order_num
ORDER BY COUNT(i.manu_code) desc
