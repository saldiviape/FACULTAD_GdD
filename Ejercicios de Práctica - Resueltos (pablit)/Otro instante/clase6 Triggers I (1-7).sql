--7. Triggers I (1-7)
use stores7

--1
CREATE TABLE stock_historia_precios(
	stock_historia_id INT IDENTITY(1,1),
	stock_num SMALLINT,
	manu_code CHAR(3),
	fechaHora DATETIME,	--getdate()
	usuario VARCHAR(20),	--CURRENT_USER
	unit_price_old DECIMAL(6,2),
	unit_price_new DECIMAL(6,2),
	estado CHAR DEFAULT 'A' CHECK (estado IN ('A', 'I'))
)
GO

CREATE TRIGGER updatePreciosStock
ON products
AFTER UPDATE
AS
BEGIN 
	INSERT INTO stock_historia_precios
		(stock_num, manu_code, fechaHora, usuario, unit_price_old, unit_price_new)
	SELECT i.stock_num, i.manu_code, GETDATE(), CURRENT_USER, d.unit_price, i.unit_price
	FROM inserted i JOIN deleted d ON (i.stock_num = d.stock_num AND i.manu_code = d.manu_code)
	WHERE i.unit_price != d.unit_price --Solamente audito si lo único que cambié es el precio
END

--Pruebas
	select * from products										--Revisamos los valores anteriores en la tabla products
	select * from stock_historia_precios						--Revisamos valores anteriores en la tabla stock_historia_precios
	UPDATE products SET unit_price = 251 WHERE stock_num = 1 AND manu_code = 'HRO'		--Actualizo un valor en particular
	select * from products										--Revisamos los valores anteriores en la tabla products
	select * from stock_historia_precios						--Revisamos valores anteriores en la tabla stock_historia_precios
	UPDATE products SET unit_price = 250 WHERE stock_num = 1 AND manu_code = 'HRO'
	select * from products										--Revisamos los valores anteriores en la tabla products
	select * from stock_historia_precios						--Revisamos valores anteriores en la tabla stock_historia_precios
	go


--2
CREATE TRIGGER updateEstadoAaI
ON stock_historia_precios
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @id_actual int
	DECLARE cursor1 CURSOR FOR
		SELECT stock_historia_id FROM deleted
	OPEN cursor1
	FETCH NEXT FROM cursor1 INTO @id_actual
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		UPDATE stock_historia_precios SET estado = 'I' WHERE stock_historia_id = @id_actual
		FETCH NEXT FROM cursor1 INTO @id_actual
	END
	CLOSE cursor1
	DEALLOCATE cursor1
END

--Pruebas
DELETE FROM stock_historia_precios WHERE stock_historia_id = 2
SELECT * FROM stock_historia_precios



--3
CREATE TRIGGER insertsSóloEntreLas8yLas20
ON products
INSTEAD OF INSERT
AS
BEGIN
	IF (DATEPART(HOUR, GETDATE()) BETWEEN 8 AND 20)
	BEGIN
		INSERT INTO products
			SELECT stock_num, manu_code, unit_code, unit_price FROM inserted
	END
	ELSE
	BEGIN
		RAISERROR('Tenés que esperar hasta las 8 de mañana para poder insertar algo...', 12, 1)
	END
END
--Antes de insertar una nueva FK, hay que insertar la PK correspondiente en otra tabla (product_types, manufact, units).
--Es por eso que para probar este trigger, habría que realizar más de un INSERT en una única tabla.



--4
CREATE TRIGGER borradoEnCascadaSobreOrdersEItems
ON orders
INSTEAD OF DELETE
AS
BEGIN
	DECLARE @customer_num smallint
	DECLARE @order_num smallint
	IF ((SELECT COUNT(*) FROM deleted) > 1)
	BEGIN
		RAISERROR('No es posible eliminar más de una orden a la vez', 12, 1)
	END
	ELSE
	BEGIN
		SELECT @order_num = order_num, @customer_num = customer_num FROM deleted
		DELETE FROM items WHERE order_num = @order_num
		DELETE FROM orders WHERE order_num = @order_num AND customer_num = @customer_num
	END
END
 




--5
CREATE TRIGGER punto5
ON items
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @manu_code_ingresado char(3),
			@order_num_ingresado smallint
	DECLARE items_ingresados CURSOR FOR
		SELECT manu_code, order_num FROM inserted
	OPEN items_ingresados

	FETCH NEXT FROM items_ingresados
		INTO @manu_code_ingresado, @order_num_ingresado
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF (@manu_code_ingresado NOT IN (SELECT manu_code FROM manufact))
		--IF NOT EXISTS (SELECT * FROM manufact WHERE manu_code = @manu_code_ingresado)
		BEGIN
			INSERT INTO manufact (manu_code, manu_name, lead_time)
				VALUES (@manu_code_ingresado, 'Fabricante Nro. de Orden ' + @order_num_ingresado, 1)
		END
		FETCH NEXT FROM items_ingresados
			INTO @manu_code_ingresado, @order_num_ingresado
	END

	CLOSE items_ingresados
	DEALLOCATE items_ingresados
END




--6
CREATE TABLE stock_replica(
	stock_num smallint,
	manu_code char(3),
	unit_price decimal(6,2),
	unit_code smallint
)


CREATE TRIGGER insert_sobre_products
ON products
AFTER INSERT
AS
BEGIN
	INSERT INTO stock_replica (stock_num, manu_code, unit_price, unit_code)
		SELECT * FROM inserted
END

CREATE TRIGGER update_sobre_products
ON products
AFTER INSERT
AS
BEGIN
	UPDATE sr
		SET sr.stock_num = i.stock_num,
			sr.manu_code = i.manu_code,
			sr.unit_price = i.unit_price,
			sr.unit_code = i.unit_code
		FROM stock_replica sr JOIN inserted i ON (sr.stock_num = i.stock_num AND sr.manu_code = i.manu_code)
END

CREATE TRIGGER delete_sobre_products
ON products
AFTER DELETE
AS
BEGIN
	DELETE stock_replica
		FROM stock_replica sr JOIN deleted d ON (sr.stock_num = d.stock_num AND sr.manu_code = d.manu_code)
END



--7
CREATE VIEW Productos_por_fabricante
AS
	SELECT p.stock_num, p.manu_code, tp.description, m.manu_name
	FROM products p JOIN product_types tp ON (p.stock_num = tp.stock_num)
					JOIN manufact m ON (p.manu_code = m.manu_code)
GO

CREATE TRIGGER insertVistaProductosPorFabricante
ON Productos_por_fabricante
INSTEAD OF INSERT
AS
BEGIN
	DECLARE @stock_num smallint,
			@manu_code char(3),
			@description varchar(15),
			@manu_name varchar(15)
	DECLARE cursorVista CURSOR FOR
		SELECT stock_num, manu_code, description, manu_name FROM inserted
	OPEN cursorVista
	FETCH NEXT FROM cursorVista
		INTO @stock_num, @manu_code, @description, @manu_name

	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO products (stock_num, manu_code)
			VALUES (@stock_num, @manu_code)
		IF NOT EXISTS (SELECT * FROM products p WHERE manu_code = @manu_code)
		BEGIN
			INSERT INTO manufact (manu_code, manu_name, lead_time)
				VALUES (@manu_code, @manu_name, 1)
		END
		FETCH NEXT FROM cursorVista
			INTO @stock_num, @manu_code, @description, @manu_name
	END

	CLOSE cursorVista
	DEALLOCATE cursorVista
	SELECT distinct m.manu_code FROM manufact m, inserted i
END

