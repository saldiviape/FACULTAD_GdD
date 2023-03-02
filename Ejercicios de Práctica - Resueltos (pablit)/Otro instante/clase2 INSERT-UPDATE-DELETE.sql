--3. INSERT-UPDATE-DELETE
use stores7

--1
SELECT * INTO #clientes
FROM customer



--2
INSERT INTO #clientes (customer_num, fname, lname, company, state , city)
VALUES (144,'agustin','creevy','jaguares sa', 'ca', 'los angeles')



--3
SELECT * INTO #ClientesCalifornia FROM customer

INSERT INTO #ClientesCalifornia
SELECT * FROM customer
WHERE state = 'ca'

SELECT * FROM #ClientesCalifornia



--4
--NO ANDA ESTE...
INSERT INTO #clientes (103, fname, lname, company, address1, address2, city, state, zipcode, phone, customer_num_referedBy)
VALUES (155, fname, lname, company, address1, address2, city, state, zipcode, phone, customer_num_referedBy)
select * from #clientes
INSERT INTO #clientes
SELECT *FROM customer
WHERE customer_num = 103
UPDATE #clientes
SET customer_num = 155
WHERE customer_num = 103



--5
SELECT * FROM #clientes
DELETE FROM #clientes
WHERE zipcode BETWEEN 94000 AND 94050
AND city  LIKE 'M%'



--6, NO HAY QUE HACERLO (no vimos subqueries todavía)



--7
SELECT * FROM #clientes
WHERE state = 'CO'
UPDATE #clientes SET state = 'AK',
					 address2 = 'Barrio las heras'
WHERE state = 'CO'



--8
UPDATE #clientes
SET phone = '1' + phone
SELECT * FROM #clientes


--9
BEGIN TRANSACTION
	INSERT INTO #clientes (customer_num, lName, state,company)
	VALUES (166, 'apellido', 'ca', 'nombre empresa')
	DELETE FROM #clientesCalifornia
	select * from #clientes
	select * from #ClientesCalifornia
ROLLBACK TRANSACTION
--Habiendo ejecutado BEGIN TRANSACTION en un primer momento, digamos que todo se guarda en un estado temporal...
--...se hace cualquier tipo de consultas en el medio...
--...y al ejecutar ROLLBACK TRANSACCTION, todo vuelve al estado anterior (definido por BEGIN TRANSACTION).



--10
BEGIN TRANSACTION
	INSERT INTO #clientes (customer_num, lName, state,company)
	VALUES (166, 'apellido', 'ca', 'nombre empresa')
	DELETE FROM #clientesCalifornia
	select * from #clientes
	select * from #ClientesCalifornia
COMMIT TRANSACTION
select * from #clientes
select * from #ClientesCalifornia
--Con el COMMIT TRANSACTION (habiendo definido antes un BEGIN TRANSACTION) guardo todos los datos actuales en forma definitiva, para siempre. No puedo volver atrás.
