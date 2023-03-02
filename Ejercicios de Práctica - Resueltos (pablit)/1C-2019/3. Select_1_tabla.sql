--Clase 3 - SELECT para una sola tabla
--1
--Obtener un listado de todos los clientes y sus direcciones.
SELECT customer_num, fname, lname, address1, address2
FROM customer


--2
--Obtener el listado anterior pero s�lo los clientes que viven en el estado de California �CA�.
SELECT customer_num, lname, fname, address1, address2
FROM customer
WHERE state = 'CA'


--3
--Listar todas las ciudades (city) de la tabla clientes que pertenecen al estado de �CA�, mostrar s�lo una vez cada ciudad.
SELECT DISTINCT city
FROM customer
WHERE state = 'CA'


--4
--Ordenar la lista anterior alfab�ticamente.
SELECT DISTINCT city
FROM customer
WHERE state = 'CA'
ORDER BY city


--5
--Mostrar la direcci�n s�lo del cliente 103. (customer_num)
SELECT address1, address2
FROM customer
WHERE customer_num = 103


--6
--Mostrar la lista de productos que fabrica el fabricante �ANZ� ordenada por el campo C�digo de Unidad de Medida. (unit_code)
SELECT *
FROM products
WHERE manu_code = 'ANZ'
ORDER BY unit_code


--7
--Listar los c�digos de fabricantes que tengan alguna orden de pedido ingresada, ordenados alfab�ticamente y no repetidos.
SELECT distinct manu_code
FROM items
ORDER BY manu_code


--8
--Escribir una sentencia SELECT que devuelva el n�mero de orden, fecha de orden, n�mero de cliente y fecha de embarque de todas las �rdenes que no han sido pagadas (paid_date es nulo), pero fueron embarcadas (ship_date) durante los primeros seis meses de 2015.
SELECT order_num, order_date, customer_num, ship_date
FROM orders
WHERE paid_date IS NULL
  AND YEAR(ship_date) = 2015
  AND MONTH(ship_date) BETWEEN 1 AND 6


--9
--Obtener de la tabla cliente (customer) los n�mero de clientes y nombres de las compa��as, cuyos nombres de compa��as contengan la palabra �town�.
SELECT customer_num, company
FROM customer
WHERE company LIKE '%town%'


--10
--Obtener el precio m�ximo, m�nimo y precio promedio pagado (ship_charge) por todos los embarques. Se pide obtener la informaci�n de la tabla ordenes (orders).
SELECT MAX(ship_charge) AS 'Precio m�ximo pagado',
	   MIN(ship_charge) AS 'Precio m�nimo pagado',
	   AVG(ship_charge) AS 'Promedio pagado'
FROM orders


--11
--Realizar una consulta que muestre el n�mero de orden, fecha de orden y fecha de embarque de todas que fueron embarcadas (ship_date) en el mismo mes que fue dada de alta la orden (order_date).
SELECT order_num, order_date, ship_date
FROM orders
WHERE YEAR(ship_date) = YEAR(order_date)
  AND MONTH(ship_date) = MONTH(order_date)


--12
--Obtener la Cantidad de embarques y Costo total (ship_charge) del embarque por n�mero de cliente y por fecha de embarque. Ordenar los resultados por el total de costo en orden inverso
SELECT customer_num, ship_date, COUNT(ship_date) AS 'Cantidad', SUM(ship_charge) AS 'Costo total' 
FROM orders
GROUP BY customer_num, ship_date
ORDER BY SUM(ship_charge) DESC


--13
--Mostrar fecha de embarque (ship_date) y cantidad total de libras (ship_charge) por d�a, de aquellos d�as cuyo peso de los embarques superen las 30 libras. Ordenar el resultado por el total de libras en orden descendente.
SELECT distinct ship_date, SUM(ship_charge) AS 'Cantidad total de libras'
FROM orders
GROUP BY ship_date
HAVING SUM(ship_charge) > 30
ORDER BY SUM(ship_charge) DESC

