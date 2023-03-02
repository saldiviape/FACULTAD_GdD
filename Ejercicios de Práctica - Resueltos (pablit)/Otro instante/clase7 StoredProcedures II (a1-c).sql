--8. StoredProcedures I (a1-c)
use stores7

--a1
drop table CustomerStatistics
CREATE TABLE CustomerStatistics
(
	customer_num integer Primary Key,
	ordersqty integer,
	maxdate date,
	uniqueProducts int
)

select * from CustomerStatistics
--a2
CREATE PROCEDURE CustomerStatisticsUpdate
	@fechaDES datetime
AS
BEGIN
	DECLARE @customer_num integer,
			@or
	DECLARE cursorCustomer CURSOR FOR
		SELECT * FROM customer 
	OPEN cursorCustomer
	IF ...
	BEGIN
		INSERT INTO CustomerStatistics
			VALUES (_, _, _, _)
	END
	ELSE
	BEGIN

	END
END


select * from state
declare estados cursor for select sname from state

open estados
fetch next from estados into @estados



--b
CREATE TABLE informeStock (
	fechaInforme date,
	stock_num integer,
	manu_code char(3),
	cantOrdenes integer,
	ultCompra date,
	cantClientes integer,
	totalVentas decimal(10,2),
	PRIMARY KEY (fechaInforme, stock_num, manu_code))

	
CREATE PROCEDURE generarInformeGerencial
@fechaInforme date
AS
BEGIN
	DECLARE @stock_num AS integer,
			@manu_code AS char(3)
	DECLARE cursor1 CURSOR FOR
		SELECT stock_num, manu_code FROM products
	OPEN cursor1
	FETCH NEXT FROM cursor1 INTO @stock_num, @manu_code
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO informeStock VALUES (@fechaInforme,
										 @stock_num,
										 @manu_code,
										 (SELECT COUNT(order_num)
											FROM items
											WHERE stock_num = @stock_num),
										 (SELECT TOP 1 o.order_date
											FROM orders o JOIN items i ON (o.order_num = i.order_num)
														  JOIN products p ON (i.stock_num = p.stock_num AND i.manu_code = p.manu_code)
											WHERE p.stock_num = @stock_num
											ORDER BY 1 DESC),
										 (SELECT distinct customer_num
											FROM orders o JOIN items i ON (o.order_num = i.order_num)
											WHERE i.stock_num = @stock_num
											GROUP BY customer_num
											HAVING COUNT(customer_num) = 1),
										 (SELECT SUM(quantity * total_price)
											FROM orders o JOIN items i ON (o.order_num = i.order_num)
											WHERE stock_num = @stock_num))
		FETCH NEXT FROM cursor1 INTO @stock_num, @manu_code
	END
	CLOSE cursor1
	DEALLOCATE cursor1
END
---

SELECT COUNT(order_num) FROM items i WHERE stock_num = 5



--c
CREATE TABLE informeVentas(
	fechaInforme datetime,
	codEstado char(3),
	customer_num smallint,
	cantOrdenes smallint,
	primerVenta datetime,
	ultVenta datetime,
	cantProductos smallint,
	totalVentas decimal(8,2)
)

CREATE PROCEDURE generarInformeVentas
	@fechaInforme date,
	@codEstado char(2)
AS
BEGIN
	DECLARE cursorInformeVentas CURSOR FOR
		SELECT distinct customer_num FROM customer WHERE state = @codEstado
	DECLARE @customer_num smallint,
			@

	FETCH NEXT FROM cursorInformeVentas INTO ___
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO informeVentas
			VALUES (@fechaInforme,
					@codEstado,
					@customer_num,
					(SELECT COUNT(*) FROM orders o WHERE o.customer_num = @customer_num),
					(SELECT TOP 1 order_date FROM orders o WHERE o.customer_num = @customer_num ORDER BY 1 DESC),
					(SELECT TOP 1 order_date FROM orders o WHERE o.customer_num = @customer_num ORDER BY 1),
					(SELECT distinct COUNT(i.quantity) FROM orders o JOIN items i ON (o.order_num = i.order_num) WHERE o.customer_num = @customer_num),
					_)
		FETCH NEXT FROM cursorInformeVentas INTO ___
	END
END

SELECT * FROM items
