--Clase 7 - Triggers
--1
--Dada la tabla stock de la base de datos stores7 se requiere crear una tabla stock_historia_precios que almacene los cambios de precios que haya habido.
--Tabla stock_historia_precios:
--		Stock_historia_Id INT Identity
--		Stock_num
--		Manu_code
--		fechaYhora (grabar fecha y hora del evento)
--		usuario (grabar usuario que realiza el cambio de precios)
--		unit_price_old
--		unit_price_new
--		estado char default ‘A’ check (estado IN (‘A’,’I’))
--HECHO
CREATE TABLE Products_historia_precios (
	stock_historia_id INT identity,
	stock_num SMALLINT,
	manu_code CHAR(3),
	fechaHora DATETIME,
	usuario VARCHAR(30),
	unit_price_old SMALLINT,
	unit_price_new SMALLINT,
	estado CHAR default 'A' check(estado IN ('A', 'I'))
)
GO

CREATE TRIGGER punto1 ON products
AFTER UPDATE
AS
BEGIN
	DECLARE @stock_num SMALLINT,
			@manu_code CHAR(3),
			@unit_price_viejo SMALLINT,
			@unit_price_nuevo SMALLINT
	DECLARE cursor1 CURSOR FOR
		SELECT d.stock_num, d.manu_code, d.unit_price, i.unit_price
		FROM deleted d JOIN inserted i ON (d.stock_num = i.stock_num)
	OPEN cursor1
	FETCH NEXT FROM cursor1 INTO @stock_num, @manu_code, @unit_price_viejo, @unit_price_nuevo
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		INSERT INTO Products_historia_precios (stock_num, manu_code, fechaHora, usuario, unit_price_old, unit_price_new)
		VALUES (@stock_num, @manu_code, GETDATE(), SYSTEM_USER, @unit_price_viejo, @unit_price_nuevo)
		FETCH NEXT FROM cursor1 INTO @stock_num, @manu_code, @unit_price_viejo, @unit_price_nuevo
	END
	CLOSE cursor1
	DEALLOCATE cursor1
END
GO

--Prueba del trigger
select * from products where stock_num = 2 --unit_price = 126.00
select * from Products_historia_precios

--actualizo un precio (126 ---> 500)
SET ANSI_WARNINGS OFF --Para que no tire el error de "Los datos de cadena o binarios se truncarían. Se terminó la instrucción."
UPDATE products SET unit_price = 500 WHERE stock_num = 2
select * from products where stock_num = 2 --unit_price = 500
select * from Products_historia_precios

--vuelvo al precio anterior (500 ---> 126)
UPDATE products SET unit_price = 126 WHERE stock_num = 2
select * from products where stock_num = 2
select * from Products_historia_precios
SET ANSI_WARNINGS ON --Para dejar todo como estaba antes...
--fin prueba
GO




--2
--Crear un trigger sobre la tabla stock_historia_precios que ante un delete sobre la misma realice en su lugar un update de campo estado de ‘A’ a ‘I’ (inactivo).
--HECHO
CREATE TRIGGER punto2 ON Products_historia_precios
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @stock_historia_id INT
	DECLARE cursor2 CURSOR FOR
		SELECT stock_historia_id FROM deleted d
	OPEN cursor2
	FETCH NEXT FROM cursor2 INTO @stock_historia_id
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE Products_historia_precios
			SET estado = 'I'
			WHERE stock_historia_id = @stock_historia_id

		FETCH NEXT FROM cursor2 INTO @stock_historia_id
	END 
	CLOSE cursor2
	DEALLOCATE cursor2
END
GO

--Prueba del trigger
select * from Products_historia_precios --A
delete from Products_historia_precios WHERE stock_historia_id = 1
select * from Products_historia_precios --I
GO




--3
--Validar que sólo se puedan hacer inserts en la tabla stock en un horario entre las 8:00 AM y 8:00 PM. En caso contrario enviar un error por pantalla.
--HECHO
CREATE TRIGGER punto3 ON products
INSTEAD OF INSERT
AS
BEGIN
	IF DATEPART(HOUR, GETDATE()) BETWEEN 8 AND 20 BEGIN
		INSERT INTO products
			SELECT * FROM inserted
	END
	ELSE BEGIN
		RAISERROR('No se pueden hacer INSERTs en este horario.', 16, 1)
	END
END
GO

--Prueba del trigger
SELECT * FROM products WHERE stock_num = 888
INSERT INTO products VALUES (888, 'WWW', 888, 88)
SELECT * FROM products WHERE stock_num = 888
GO




--4
--Crear un trigger que realice un borrado en cascada sobre las tablas orders e ítems, validando que sólo se borre 1 órden de compra.
--Si detecta que están queriendo borrar más de una orden de compra, informará un error y abortará la operación.
--SIN HACER
CREATE TRIGGER punto4 ON orders
INSTEAD OF DELETE
AS
BEGIN
	IF (SELECT COUNT(*) FROM deleted) > 1 BEGIN
		RAISERROR('No se puede borrar más de una orden...', 16, 1)
	END
	ELSE BEGIN
		DECLARE @order_num SMALLINT
		SELECT @order_num = order_num FROM deleted
		DELETE FROM orders WHERE order_num = @order_num
		DELETE FROM items WHERE order_num = @order_num
		
	END
END
GO

--DROP TRIGGER punto4

SELECT * FROM orders WHERE order_num = 1001
SELECT * FROM items WHERE order_num = 1001
BEGIN TRANSACTION
DELETE FROM orders WHERE order_num = 1001
SELECT * FROM orders WHERE order_num = 1001
SELECT * FROM items WHERE order_num = 1001
ROLLBACK TRANSACTION
GO
--tira error:
--"Instrucción DELETE en conflicto con la restricción REFERENCE 'FK__items__order_num__31EC6D26'. El conflicto ha aparecido en la base de datos 'stores7new', tabla 'dbo.items', column 'order_num'.




--5
--Crear un trigger de insert sobre la tabla ítems que al detectar que el código de fabricante (manu_code) del producto a comprar, no existe en la tabla manufact, inserte una fila en dicha tabla con él manu_code ingresado, en el campo manu_name la descipción ‘Fabricante Nro. de Orden 9999’ donde 9999 corresponde al nro. de la órden de compra a la que pertenece el ítem y en el campo lead_time el valor 1.
--SIN HACER
CREATE TRIGGER punto5 ON items
INSTEAD OF INSERT
AS
BEGIN
	--
END
GO




--6
--Crear tres triggers (Insert, Update y Delete) sobre la tabla stock para replicar todas las operaciones en la tabla stock_replica, la misma deberá tener la misma estructura de la tabla stock.
--SIN HACER
CREATE TABLE Products_replica (
	stock_num SMALLINT,
	manu_code CHAR(3),
	unit_price DECIMAL(6,2),
	unit_code SMALLINT,
	PRIMARY KEY (stock_num, manu_code))
GO

CREATE TRIGGER punto6_I ON products
AFTER INSERT
AS
BEGIN
	DECLARE @stock_num SMALLINT,
			@manu_code CHAR(3),
			@unit_price DECIMAL(6,2),
			@unit_code SMALLINT
	DECLARE cursor6_insert CURSOR FOR
		SELECT stock_num, manu_code, unit_price, unit_code
		FROM inserted
	FETCH NEXT FROM cursor6_insert
		INTO @stock_num, @manu_code, @unit_price, @unit_code
	OPEN cursor6
	WHILE (@@FETCH_STATUS = 0) BEGIN
		INSERT INTO Products_replica 
			VALUES (@stock_num, @manu_code, @unit_price, @unit_code)
		FETCH NEXT FROM cursor6_insert
			INTO @stock_num, @manu_code, @unit_price, @unit_code
	END
	CLOSE cursor6_insert
	DEALLOCATE cursor6_insert
END
GO

CREATE TRIGGER punto6_U ON products
AFTER UPDATE
AS
BEGIN
	UPDATE Products_replica
		SET 
END
GO

CREATE TRIGGER punto6_D ON products
AFTER DELETE
AS
BEGIN
	DECLARE @stock_num SMALLINT,
			@manu_code CHAR(3),
			@unit_price_viejo DECIMAL(6,2),
			@unit_code_viejo SMALLINT,
			@unit_price_nuevo DECIMAL(6,2),
			@unit_code_nuevo SMALLINT
	DECLARE cursor6_delete CURSOR FOR
		SELECT * FROM deleted d
	FETCH NEXT FROM cursor6_delete
		INTO @stock_num, @manu_code, @unit_price, @unit_code
	OPEN cursor6_delete
	WHILE (@@FETCH_STATUS = 0) BEGIN

		DELETE FROM Products_replica
			WHERE stock_num = @stock_num AND manu_code = @manu_code

		--INSERT INTO Products_replica 
			--VALUES (@stock_num, @manu_code, @unit_price, @unit_code)
		FETCH NEXT FROM cursor6_delete
			INTO @stock_num, @manu_code, @unit_price, @unit_code
	END
	CLOSE cursor6_delete
	DEALLOCATE cursor6_delete
END
GO




--7
--Crear la vista Productos_por_fabricante que tenga los siguientes atributos: Stock_num, manu_code, description, manu_name.
--Crear un trigger de Insert sobre la vista anterior que ante un insert en la vista, en su lugar inserte una fila en la tabla stock, pero que valide que si el manu_code no existe en la tabla manufact, inserte además una fila en dicha tabla con el campo lead_time en 1.
--HECHO
CREATE VIEW Productos_x_fabricante AS
	SELECT p.stock_num, description, p.manu_code, manu_name, unit_price
	FROM products p JOIN product_types tp ON (p.stock_num = tp.stock_num)
					JOIN manufact m ON (p.manu_code = m.manu_code)
GO

SELECT * FROM Productos_x_fabricante
GO

CREATE TRIGGER punto7 ON Productos_x_fabricante
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @stock_num SMALLINT,
			@description VARCHAR(15),
			@manu_code CHAR(3),
			@manu_name VARCHAR(15),
			@unit_price DECIMAL(6,2)
	DECLARE cursor7 CURSOR FOR
		SELECT i.stock_num, i.description, i.manu_code, i.manu_name, i.unit_price
		FROM inserted i
	OPEN cursor7
	FETCH NEXT FROM cursor7
		INTO @stock_num, @description, @manu_code, @manu_name, @unit_price
	WHILE (@@FETCH_STATUS = 0) BEGIN
		INSERT INTO products (stock_num, manu_code, unit_price)
		VALUES (@stock_num, @manu_code, @unit_price)
		
		IF NOT EXISTS (SELECT manu_code FROM manufact WHERE manu_code = @manu_code) BEGIN
			INSERT INTO manufact (manu_code, manu_name, lead_time)
			VALUES (@manu_code, @manu_name, 1)
		END

		FETCH NEXT FROM cursor7
			INTO @stock_num, @description, @manu_code, @manu_name, @unit_price
	END
	CLOSE cursor7
	DEALLOCATE cursor7
END
GO
