--2. SELECT para una sola tabla
use stores7

--1
SELECT customer_num, fname, lname, address1, address2
FROM customer



--2
SELECT customer_num, fname, lname, address1, address2
FROM customer
WHERE state ='CA'



--3
SELECT DISTINCT city
FROM customer
WHERE state = 'CA'



--4
SELECT DISTINCT city
FROM customer
WHERE state = 'CA'
ORDER BY city



--5
SELECT customer_num, fname, lname, address1, address2
FROM customer
WHERE customer_num = 103



--6
SELECT stock_num, manu_code, unit_code
FROM products
WHERE manu_code = 'ANZ'
ORDER BY unit_code



--7
SELECT DISTINCT manu_code
FROM items
ORDER BY manu_code



--8
SELECT order_num, order_date, customer_num, ship_date
FROM orders
WHERE paid_date IS NULL AND (YEAR(ship_date) = 2015 AND MONTH(ship_date) BETWEEN 1 AND 9)



--9
SELECT customer_num, company
FROM customer
WHERE UPPER(company) LIKE '%town%'



--10
SELECT ship_date, MAX(ship_charge) PrecioMaximo, MIN(ship_charge) PrecioMinimo, AVG(ship_charge) PrecioPromedio
FROM orders
GROUP BY ship_date



--11
SELECT order_num, order_date, ship_date
FROM orders
WHERE (YEAR(ship_date) = YEAR(order_date)) AND (MONTH(ship_date) = MONTH(order_date))



--12
SELECT customer_num, ship_date, sum(ship_charge) totalCosto
FROM orders
WHERE ship_date IS NOT NULL
GROUP BY ship_date, customer_num
ORDER BY sum(ship_charge) DESC



--13
SELECT ship_date FechaEmbarque, SUM(ship_weight) CantidadLibrasTotales
FROM orders
GROUP BY ship_date
HAVING SUM(ship_weight) > 30
ORDER BY SUM(ship_weight) DESC



--14
SELECT * INTO #forsam
FROM customer
WHERE state = 'CA'
ORDER BY company

SELECT * FROM #forsam



--15
SELECT manu_code, COUNT(unit_code) cantidadComprada, SUM(unit_price) totalComprado
FROM products
GROUP BY manu_code
HAVING SUM(unit_price) > 1500
ORDER BY COUNT(unit_code) DESC



--16
SELECT manu_code, stock_num, quantity, total_price
FROM items
WHERE manu_code LIKE '_[Rr]%'
ORDER BY manu_code, stock_num



--17
SELECT customer_num, COUNT(order_num) cantOrdenes, MIN(order_date) primeraFechaCompra, MAX(order_date) ultimaFechaCompra
INTO #ordenesTemp
FROM orders
GROUP BY customer_num

SELECT * FROM #ordenesTemp
WHERE primeraFechaCompra < '20150523 00:00:00.000'
ORDER BY ultimaFechaCompra



--18
SELECT cantOrdenes, count(customer_num) cantClientes
FROM #ordenesTemp
GROUP BY cantOrdenes
ORDER BY cantOrdenes DESC



--19
SELECT * FROM #ordenesTemp
--Se ejecuta el código de la tabla temporal (creada en la última sesión) pero SQL no la encuentra. Lógicamente, porque las tablas temporales existen a lo largo de una misma sesión. Al cerrar la sesión, se borra la tabla temporal.



--20
SELECT state, city, COUNT(customer_num) cantClientes
FROM customer
WHERE company LIKE '%ts%'
	  AND zipcode BETWEEN 93000 AND 94000
	  AND city != 'Mountain View'
GROUP BY state, city
ORDER BY city



--21
SELECT customer_num, state, COUNT(customer_num_referedBy) cantidadClientesReferidos
FROM customer
WHERE company LIKE '[A-L]%' 
GROUP BY customer_num, state
--Es innecesario agregar "customer_num_referedBy IS NOT NULL" porque el COUNT lo hace implícitamente (lo de no contar nulos)



--22
SELECT state, AVG(lead_time) AVG_leadTime
FROM manufact
WHERE manu_name LIKE '%[Ee]%'
	  AND lead_time BETWEEN 5 AND 20
GROUP BY state



--23
SELECT unit, COUNT(unit_code) + 1 cantidadUnidadesPorCadaTipo
FROM units
WHERE unit_descr IS NOT NULL
GROUP BY unit
HAVING COUNT(unit_code) < 5
