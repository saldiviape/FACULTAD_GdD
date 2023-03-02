--Clase 6 - JOINs (GROUP BY, HAVING, subqueries correlacionados, OUTER JOINs, tablas temporales)
--1
--Mostrar el C�digo del fabricante, nombre del fabricante, tiempo de entrega y monto Total de productos vendidos, ordenado por nombre de fabricante. En caso que el fabricante no tenga ventas, mostrar el total en NULO.
SELECT m.manu_code, m.manu_name, m.lead_time, SUM(i.quantity * i.unit_price) AS 'Monto Total'
FROM manufact m LEFT JOIN items i ON (m.manu_code = i.manu_code)
GROUP BY m.manu_code, m.manu_name, m.lead_time
ORDER BY m.manu_name
GO




--2
--Mostrar una lista de a pares, de todos los fabricantes que fabriquen el mismo producto. En el caso que haya un �nico fabricante deber� mostrar el C�digo de fabricante 2 en nulo.
--El listado tiene que tener el siguiente formato:
--	Nro. de Producto	Descripcion		C�d. de fabric. 1	C�d. de fabric. 2
--	(stock_num)			(Description)	(manu_code)			(manu_code)
SELECT p1.stock_num AS 'Nro de Producto', tp.description AS 'Descripci�n', p1.manu_code AS 'Fabricante 1', p2.manu_code  AS 'Fabricante 2'
FROM products p1 LEFT JOIN product_types tp ON (p1.stock_num = tp.stock_num)
				 LEFT JOIN products p2 ON (tp.stock_num = p2.stock_num)
WHERE p1.manu_code <> p2.manu_code
UNION
SELECT p1.stock_num AS 'Nro de Producto', tp.description AS 'Descripci�n', p1.manu_code AS 'Fabricante 1', NULL  AS 'Fabricante 2'
FROM products p1 LEFT JOIN product_types tp ON (p1.stock_num = tp.stock_num)
				 LEFT JOIN products p2 ON (tp.stock_num = p2.stock_num)
WHERE p1.stock_num IN (SELECT DISTINCT p.stock_num
					   FROM products p
					   GROUP BY p.stock_num
					   HAVING COUNT(*) = 1) --un subquery que muestre los productos que s�lo son fabricados por 1 fabricante
GO




--3
--Listar todos los clientes que hayan tenido m�s de una orden.
--La consulta deber� tener el siguiente formato:
--	N�mero_de_Cliente	Nombre		Apellido
--	(customer_num)		(fname)		(lname)

--a) En primer lugar, escribir una consulta usando una subconsulta.
SELECT c.customer_num, c.fname, c.lname
FROM customer c
WHERE c.customer_num IN (SELECT DISTINCT c.customer_num
						 FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
						 GROUP BY c.customer_num
						 HAVING COUNT(*) > 1)
GO


--b) Reescribir la consulta usando dos sentencias SELECT y una tabla temporal.
SELECT customer_num
INTO #tt
FROM orders
GROUP BY customer_num
HAVING COUNT (*) > 1
GO

SELECT c.customer_num, c.fname, c.lname
FROM customer c JOIN #tt tt ON (c.customer_num = tt.customer_num)
GO


--c) Reescribir la consulta utilizando GROUP BY y HAVING.
SELECT c.customer_num, c.fname, c.lname
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
GROUP BY c.customer_num, c.fname, c.lname
HAVING COUNT(*) > 1
GO




--4
--Seleccionar todas las �rdenes de compra cuyo Monto total (Suma de p x q de sus items) sea menor al precio total promedio (avg p x q) de todos los �tems de todas las ordenes.
--Formato de la salida:
--	Nro. de Orden	Total
--	(order_num)		(suma)
SELECT o.order_num, SUM(i.quantity * i.unit_price) 'Monto Total'
FROM orders o JOIN items i ON (o.order_num = i.order_num)
GROUP BY o.order_num
HAVING SUM(i.quantity * i.unit_price) > (SELECT AVG(i.quantity * i.unit_price) FROM items i)
GO




--5
--Obtener por cada fabricante, el listado de todos los productos de stock con precio unitario (unit_price) mayor que el precio unitario promedio para dicho fabricante.
--Los campos de salida ser�n: manu_code, manu_name, stock_num, description, unit_price.
--Por ejemplo:
--El precio unitario promedio de los productos fabricados por ANZ es $180.23. se debe incluir en su lista todos los productos de ANZ que tengan un precio unitario superior a dicho importe.
SELECT p.manu_code, m.manu_name, p.stock_num, tp.description, p.unit_price
FROM products p JOIN manufact m ON (p.manu_code = m.manu_code)
				JOIN product_types tp ON (p.stock_num = tp.stock_num)
WHERE p.unit_price > (SELECT AVG(p2.unit_price)
					  FROM products p2
					  WHERE p.manu_code = p2.manu_code)
GO


					  

--6
--Usando el operador NOT EXISTS listar la informaci�n de �rdenes de compra que NO incluyan ning�n producto que contenga en su descripci�n el string � baseball gloves�. Ordenar el resultado por compa��a del cliente ascendente y n�mero de orden descendente.
--El formato de salida deber� ser:
--	N�mero de Cliente	Compa��a	N�mero de Orden		Fecha de la Orden
--	(customer_num)		(company)	(order_num)			(order_date)

--el resuelto
SELECT c.customer_num, company, o.order_num, order_date
FROM orders o JOIN customer c ON (o.customer_num=c.customer_num)
WHERE NOT EXISTS (SELECT item_num
				  FROM items i JOIN product_Types tp ON (i.stock_num=tp.stock_num)
				  WHERE description LIKE '%baseball gloves%'
					AND i.order_num = o.order_num)
ORDER BY company, order_num desc
GO

--el m�o
SELECT c.customer_num, c.company, o.order_num, o.order_date
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
				--JOIN items i ON (o.order_num = i.order_num)
				--JOIN product_types tp ON (i.stock_num = tp.stock_num)
WHERE NOT EXISTS --?
ORDER BY c.company, o.order_num DESC
GO

SELECT *
FROM orders o JOIN items i ON (o.order_num = i.order_num) JOIN product_types tp ON (i.stock_num = tp.stock_num)
WHERE tp.description NOT LIKE '%baseball gloves%'
GO



--Operador UNION
--7
--Reescribir la siguiente consulta utilizando el operador UNION:
SELECT * FROM products WHERE manu_code = 'HRO' OR stock_num = 1
GO

SELECT * FROM products WHERE manu_code = 'HRO'
UNION
SELECT * FROM products WHERE stock_num = 1
GO




--8
--Desarrollar una consulta que devuelva las ciudades y compa��as de todos los Clientes ordenadas alfab�ticamente por Ciudad pero en la consulta deber�n aparecer primero las compa��as situadas en Redwood City y luego las dem�s.
--Formato:
--	Clave de ordenamiento	Ciudad		Compa��a
--	(sortkey)				(city)		(company)
SELECT 1 sortkey, city, company FROM customer WHERE city = 'Redwood City'
UNION
SELECT 2 sortkey, city, company FROM customer WHERE city <> 'Redwood City'
ORDER BY sortkey, city
GO




--VISTAS
--9
--Crear una Vista llamada ClientesConMultiplesOrdenes basada en la consulta realizada en el punto 3.c con los nombres de atributos solicitados en dicho punto.
CREATE VIEW ClientesConMultiplesOrdenes AS
SELECT c.customer_num, c.fname, c.lname
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
GROUP BY c.customer_num, c.fname, c.lname
HAVING COUNT(*) > 1
GO




--10
--Crear una Vista llamada Productos_HRO en base a la consulta:
SELECT * FROM products WHERE manu_code = 'HRO'
--La vista deber� restringir la posibilidad de insertar datos que no cumplan con su criterio de selecci�n.
--a. Realizar un INSERT de un Producto con manu_code='ANZ' y stock_num=303. Qu� sucede?
--b. Realizar un INSERT con manu_code='HRO' y stock_num=303. Qu� sucede?
--c. Validar los datos insertados a trav�s de la vista.

CREATE VIEW Productos_HRO AS
SELECT * FROM products WHERE manu_code = 'HRO'
WITH CHECK OPTION --Para que un valor se pueda insertar/actualizar, debe cumplir la condici�n del WHERE: que el manu_code sea 'HRO'.

--a
INSERT INTO Productos_HRO (manu_code, stock_num)
VALUES ('ANZ', 303)
--No inserta nada porque no cumple la condici�n del WHERE: se quiere ingresar un manu_code 'ANZ' cuando la condici�n es que sea 'HRO'.

--b
INSERT INTO Productos_HRO (manu_code, stock_num)
VALUES ('HRO', 303)
--Se inserta sin problemas, porque cumple la condici�n del WHERE: que manu_code sea 'HRO'.

--c
SELECT * FROM Productos_HRO
--El valor ('ANZ', 303) no fue insertado.
--El valor ('HRO', 303) s� fue insertado.

--Borramos el producto insertado, para dejar todo como est�...
SELECT * FROM products WHERE stock_num = 303
DELETE FROM products WHERE stock_num = 303 AND unit_price IS NULL
SELECT * FROM products WHERE stock_num = 303




--TRANSACCIONES
--11
--Escriba una transacci�n que incluya las siguientes acciones:
BEGIN TRANSACTION
--Insertar un nuevo cliente llamado �Fred Flintstone� en la tabla de clientes (customer).
--Seleccionar todos los clientes llamados Fred de la tabla de clientes (customer).
ROLLBACK TRANSACTION
--Luego volver a ejecutar la consulta
--Seleccionar todos los clientes llamados Fred de la tabla de clientes (customer).
--Completado el ejercicio descripto arriba. Observar que los resultados del segundo SELECT difieren con respecto al primero.
BEGIN TRANSACTION
INSERT INTO customer (customer_num, fname, lname)
VALUES (999, 'Fred', 'Flintstone')
SELECT * FROM customer WHERE fname = 'Fred' --Se muestran 2 clientes: Fred Jewell y Fred Flintstone
ROLLBACK TRANSACTION
SELECT * FROM customer WHERE fname = 'Fred' --Se muestra 1 �nico cliente: Fred Jewell.




--12
--Se ha decidido crear un nuevo fabricante AZZ, qui�n proveer� parte de los mismos productos que provee el fabricante ANZ, los productos ser�n los que contengan el string �tennis� en su descripci�n.
--Agregar las nuevas filas en la tabla manufact y la tabla products.
--El c�digo del nuevo fabricante ser� �AZZ�, el nombre de la compa��a �AZZIO SA� y el tiempo de env�o ser� de 5 d�as (lead_time).
--La informaci�n del nuevo fabricante �AZZ� de la tabla Products ser� la misma que la del fabricante �ANZ� pero s�lo para los productos que contengan 'tennis' en su descripci�n.
--Tener en cuenta las restricciones de integridad referencial existentes, manejar todo dentro de una misma transacci�n.
BEGIN TRANSACTION
	INSERT INTO manufact (manu_code, manu_name, lead_time)
	VALUES ('AZZ', 'Azzio SA', 5)
	SELECT * FROM manufact

	INSERT INTO products (stock_num, manu_code, unit_price, unit_code)
	SELECT p.stock_num, 'AZZ', unit_price, unit_code
	FROM products p JOIN product_types tp ON (p.stock_num = tp.stock_num)
	WHERE p.manu_code = 'ANZ'
	  AND tp.description LIKE '%tennis%'
	SELECT * FROM products
ROLLBACK TRANSACTION
