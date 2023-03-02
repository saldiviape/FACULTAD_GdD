--Clase 4 - INSERT, UPDATE, DELETE
--1
--Crear una tabla temporal #clientes a partir de la siguiente consulta: SELECT * FROM customer
SELECT *
INTO #clientes
FROM customer


--2
--Insertar el siguiente cliente en la tabla #clientes:
--	Customer_num	144
--	Fname			Agustín
--	Lname			Creevy
--	Company			Jaguares SA
--	State			CA
--	City			Los Angeles
INSERT INTO #clientes (customer_num, fname, lname, company, state, city)
VALUES (144, 'Agustín', 'Creevy', 'Jaguares SA', 'CA', 'Los Angeles')


--3
--Crear una tabla temporal #clientesCalifornia con la misma estructura de la tabla customer.
--Realizar un insert masivo en la tabla #clientesCalifornia con todos los clientes de la tabla customer cuyo state sea CA.
SELECT *
INTO #clientesCalifornia
FROM customer
WHERE state = 'CA'


--4
--Insertar el siguiente cliente en la tabla #clientes un cliente que tenga los mismos datos del cliente 103, pero cambiando en customer_num por 155. Valide lo insertado.
INSERT INTO #clientes
	SELECT 155, fname, lname, company, address1, address2, city, state, zipcode, phone, customer_num_referedBy
	FROM customer
	WHERE customer_num = 103


--5
--Borrar de la tabla #clientes los clientes cuyo campo zipcode esté entre 94000 y 94050 y la ciudad comience con ‘M’. Validar los registros a borrar antes de ejecutar la acción.
DELETE FROM #clientes
	WHERE zipcode BETWEEN 94000 AND 94050
	  AND city LIKE 'M%'


--6
--Borrar de la tabla #clientes todos los clientes que posean no posean órdenes de compra en la tabla orders. (Utilizar un subquery).
--Aún no vimos subqueries...


--7
--Modificar los registros de la tabla #clientes cambiando el campo state por ‘AK’ y el campo address2 por ‘Barrio Las Heras’ para los clientes que vivan en el state 'CO'. Validar previamente la cantidad de registros a modificar.
UPDATE #clientes
SET state = 'AK',
	address2 = 'Barrio Las Heras'
WHERE state = 'CO'


--8
--Modificar todos los clientes de la tabla #clientes, modificando el phone agregando un dígito 1 delante de cada número telefónico, debido a un cambio de la compañía de teléfonos.
UPDATE #clientes
SET phone = '1' + phone


--9
--Comenzar una transacción, dentro de ella realizar:
--	a. Insertar un registro en la tabla #clientes con los siguientes 4 datos
--		i.		Customer_num	166
--		ii.		Lname			apellido
--		iii.	State			CA
--		iv.		Company			nombre empresa
--	b. Borrar los registros de la tabla #clientesCalifornia
--Consultar los datos de las tablas #clientes y #clientesCalifornia, y asegurarse de que se haya realizado las operaciones.
--Realizar un ROLLBACK y volver a chequear la información, que pasó??


--10. Ejecutar la misma transacción del punto 9.
--Realizar un COMMIT y volver a chequear la información, que pasó??
