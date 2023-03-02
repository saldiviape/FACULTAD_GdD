--8. StoredProcedures I (a-c)
use stores7

--a
CREATE TABLE CustomerStatistics (
	customer_num INTEGER PRIMARY KEY,
	ordersqty INTEGER,
	maxdate DATETIME,
	uniqueManufact INTEGER
)
GO

CREATE PROCEDURE actualizaEstadisticas
	@customer_numDESDE INT,
	@customer_numHASTA INT
AS
BEGIN
	DECLARE CustomerCursor CURSOR FOR
		SELECT customer_num
		FROM customer
		WHERE customer_num BETWEEN @customer_numDESDE AND @customer_numHASTA
	DECLARE @customer_num INT,
			@ordersqty INT,
			@maxdate DATETIME,
			@uniqueManufact INT
	OPEN CustomerCursor
	FETCH NEXT FROM CustomerCursor
		INTO @customer_num
	WHILE @@FETCH_STATUS = 0
	BEGIN
		SELECT @ordersqty=count(*) /*cant ordenes*/, @maxDate=max(order_date)
			FROM orders
			WHERE customer_num = @customer_num
		
		SELECT @uniqueManufact=count(distinct manu_code) /*cant productos diferentes que compró este cliente*/
			FROM items i, orders o
			WHERE o.customer_num = @customer_num AND o.order_num =	i.order_num
		
		IF NOT EXISTS (SELECT 1 FROM CustomerStatistics WHERE customer_num = @customer_num)
			INSERT INTO CustomerStatistics VALUES (@customer_num,@ordersQty, @maxDate,@uniqueManufact)
		ELSE update CustomerStatistics SET ordersQty=@ordersQty,
										   maxDate=@maxDate,
										   uniqueManufact= @uniqueManufact
									   WHERE customer_num = @customer_num
		FETCH NEXT FROM CustomerCursor
			INTO @customer_num
	END
CLOSE CustomerCursor
DEALLOCATE CustomerCursor
END
GO
SELECT * FROM CustomerStatistics
EXECUTE actualizaEstadisticas 101,110



--b
--REVISAR Y PROBAR
CREATE TABLE [dbo].[clientesCalifornia]( [customer_num] [smallint] NOT NULL, [fname] [varchar](15), [lname] [varchar](15), [company] [varchar](20), [address1] [varchar](20), [address2] [varchar](20), [city] [varchar](15) , [state] [char](2) , [zipcode] [char](5), [phone] [varchar](18) )
CREATE TABLE [dbo].[clientesNoCaBaja]( [customer_num] [smallint] NOT NULL, [fname] [varchar](15) , [lname] [varchar](15) , [company] [varchar](20), [address1] [varchar](20), [address2] [varchar](20), [city] [varchar](15) , [state] [char](2) , [zipcode] [char](5), [phone] [varchar](18) )
CREATE TABLE [dbo].[clientesNoCaAlta]( [customer_num] [smallint] NOT NULL, [fname] [varchar](15) , [lname] [varchar](15) , [company] [varchar](20), [address1] [varchar](20), [address2] [varchar](20), [city] [varchar](15) , [state] [char](2) , [zipcode] [char](5), [phone] [varchar](18) )
ALTER TABLE customer ADD status CHAR(1) /*se agrega la columna status*/

CREATE PROCEDURE migraClientes
	@customer_numDESDE INT,
	@customer_numHASTA INT
AS
BEGIN
	BEGIN TRY
		DECLARE @customer_num INT,
				@lname VARCHAR(15),
				@fname VARCHAR(15),
				@company VARCHAR(20),
				@address1 VARCHAR(20),
				@address2 VARCHAR(20),
				@city VARCHAR(15),
				@state CHAR(2),
				@zipcode CHAR(5),
				@phone VARCHAR(18),
				@status CHAR(1)
		DECLARE CustomerCursor CURSOR FOR
			SELECT customer_num,lname,fname,company,address1, address2,city,state,zipcode,phone
			FROM customer
			WHERE customer_num BETWEEN @customer_numDESDE AND @customer_numHASTA
		OPEN CustomerCursor
		FETCH NEXT FROM CustomerCursor
			INTO @customer_num,@lname,@fname,@company, @address1,@address2,@city,@state, @zipcode,@phone
		BEGIN TRANSACTION
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF @state='CA'
					BEGIN
						insert into clientesCalifornia (customer_num,lname,fname,company, address1,address2,city,state, zipcode,phone)
							values (@customer_num,@lname,@fname,@company, @address1,@address2,@city,@state, @zipcode,@phone);
					END
				ELSE
				BEGIN
					IF (SELECT sum(total_price)
						FROM orders	o JOIN items i ON (o.order_num = i.order_num)
						WHERE customer_num = @customer_num) > 999
						BEGIN
							insert into clientesNoCaAlta (customer_num,lname,fname,company, address1,address2,city,state, zipcode,phone)
								values (@customer_num,@lname,@fname,@company, @address1,@address2,@city,@state, @zipcode,@phone)
						END
					ELSE
						BEGIN
							insert into clientesNoCaBaja (customer_num,lname,fname,company, address1,address2,city,state, zipcode,phone)
								values (@customer_num,@lname,@fname,@company, @address1,@address2,@city,@state, @zipcode,@phone)
						END
				END
				UPDATE customer SET status= 'P' WHERE customer_num= @customer_num
	
				FETCH NEXT FROM CustomerCursor
					INTO @customer_num,@lname,@fname,@company, @address1,@address2,@city,@state, @zipcode,@phone
			END
		COMMIT TRANSACTION
		CLOSE CustomerCursor
		DEALLOCATE CustomerCursor
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		DECLARE @errorDescripcion VARCHAR(100)
		SELECT @errorDescripcion = 'Error en Cliente '+CAST(@customer_num AS CHAR(5))
		RAISERROR(@errorDescripcion,14,1)
	END CATCH
END

--drop procedure migraClientes
--Pruebas SELECT count(*) FROM clientesCalifornia select count(*) from customer

--exec migraClientes 100,126

--select count(*) from customer where customer_num between 100 and 126
--select count(*) from clientesCalifornia
--select count(*) from clientesNoCaAlta --NO son de California, tienen alta facturación
--select count(*) from clientesNoCaBaja --NO son de California, tienen baja facturación
--select count(*) from customer where customer_num between 100 and 126 and status='P'

--delete from clientesCalifornia delete from clientesNoCaAlta delete from clientesNoCaBaja



--c
--Se agrega la columna status en la tabla products
ALTER TABLE products ADD status CHAR(1)
--Se crean las tablas listaPrecioMayor y listaPrecioMenor, de similar estructura a products
CREATE TABLE listaPrecioMayor(
	stock_num [smallint] NOT NULL,
	manu_code [char](3) NOT NULL,
	unit_price [decimal](6, 2) NULL,
	unit_code [smallint] NULL
	PRIMARY KEY (stock_num, manu_code)
)
GO
CREATE TABLE listaPrecioMenor(
	stock_num [smallint] NOT NULL,
	manu_code [char](3) NOT NULL,
	unit_price [decimal](6, 2) NULL,
	unit_code [smallint] NULL,
	PRIMARY KEY (stock_num, manu_code)
)
GO

CREATE PROCEDURE actualizaPrecios
@manu_codeDES char(3),
@manu_codeHAS char(3),
@porcActualizacion decimal(6,2)
AS
BEGIN
	BEGIN TRY
		DECLARE cursorActualizaPrecios CURSOR FOR 
			SELECT distinct p.stock_num, p.manu_code, i.quantity, p.unit_price, p.unit_code
			FROM products p JOIN items i ON (p.stock_num = i.stock_num AND p.manu_code = i.manu_code)
			WHERE @manu_codeDES <= p.manu_code AND p.manu_code <= @manu_codeHAS
		DECLARE @stock_num smallint,
				@manu_code char(3),
				@quantity smallint,
				@unit_price decimal(6,2),
				@unit_code smallint
		OPEN cursorActualizaPrecios
		FETCH NEXT FROM cursorActualizaPrecios
			INTO @stock_num, @manu_code, @quantity, @unit_price, @unit_code
		BEGIN TRANSACTION
		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @quantity >= 500
			BEGIN
				INSERT INTO listaPrecioMayor
					VALUES (@stock_num, @manu_code, @unit_price * (@porcActualizacion * 0.80), @unit_code)
			END
			IF @quantity < 500
			BEGIN
				INSERT INTO listaPrecioMenor
					VALUES (@stock_num, @manu_code, @unit_price * @porcActualizacion, @unit_code)
			END
			UPDATE products SET status = 'A' WHERE stock_num = @stock_num
			FETCH NEXT FROM cursorActualizaPrecios
				INTO @stock_num, @manu_code, @quantity, @unit_price, @unit_code
		END
		COMMIT TRANSACTION	
		CLOSE cursorActualizaPrecios
		DEALLOCATE cursorActualizaPrecios
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
		--DECLARE @errorDescripcion varchar(100)
		--SELECT @errorDescripcion = 'Error con el fabricante ' + CAST(@manu_name AS char(5))
		--RAISERROR(@errorDescripcion, 16, 1)
		RAISERROR('Error con un fabricante', 16, 1)
	END CATCH
END

--drop procedure actualizaPrecios  
--begin EXEC actualizaPrecios 'ANZ', 'ANZ', '0,05'

