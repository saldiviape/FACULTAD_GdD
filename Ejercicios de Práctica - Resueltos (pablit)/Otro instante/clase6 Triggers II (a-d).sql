--7. Triggers II (a-d)
use stores7

--a drop table items_error
CREATE TABLE items_error(
	item_num smallint,
	order_num smallint,
	stock_num smallint,
	manu_code char(3),
	quantity smallint,
	total_price decimal(8,2),
	fecha datetime,
	PRIMARY KEY (item_num, order_num)
)
GO

CREATE TRIGGER triggerA
ON items
INSTEAD OF INSERT
BEGIN
	DECLARE cursor1 CURSOR FOR
		SELECT c.state, i.item_num, i.order_num, i.stock_num, i.manu_code, i.quantity, i.total_price
		FROM items i JOIN orders o ON (i.order_num = o.order_num)
					 JOIN customer c ON (o.customer_num = c.customer_num)
	DECLARE @estadoCliente char(2),
			@item_num smallint,
			@order_num smallint,
			@stock_num smallint,
			@manu_code char(3),
			@quantity smallint,
			@total_price decimal(8,2),
	OPEN cursor1
	FETCH NEXT FROM cursor1
		INTO @estadoCliente, @item_num,	@order_num, @stock_num,	@manu_code, @quantity, @total_price
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @estadoCliente = 'CA'
		BEGIN
			IF (SELECT COUNT(*) FROM items WHERE order_num = @order_num < 5)
			BEGIN
				INSERT INTO items
					VALUES (@item_num, @order_num, @stock_num, @manu_code, @quantity, @total_price)
			END
			ELSE
			BEGIN
				INSERT INTO items_error
					VALUES (@item_num, @order_num, @stock_num, @manu_code, @quantity, @total_price, GETDATE())
			END
		END
		IF (SELECT COUNT(item_num) FROM inserted WHERE order_num = @order_num GROUP BY order_num) >
			(SELECT COUNT(item_num) FROM items WHERE order_num = @order_num GROUP BY order_num)
		BEGIN
			--se inserta en la tabla items_error
			INSERT INTO items_error (item_num, order_num, stock_num, manu_code, quantity, total_price, fecha)
				VALUES (@item_num,	@order_num, @stock_num,	@manu_code, @quantity, @total_price, GETDATE())
		END
		ELSE
		BEGIN
			--se inserta en la tabla items
			INSERT INTO items SELECT * FROM inserted
		END
		FETCH NEXT FROM cursor1
			INTO @estadoCliente, @item_num,	@order_num, @stock_num,	@manu_code, @quantity, @total_price
	END
	CLOSE cursor1
	DEALLOCATE cursor1
END
GO



--b
CREATE VIEW ProdPorFabricante AS
	SELECT m.manu_code, manu_name, COUNT(*) cant
	FROM manufact m INNER JOIN products p ON (m.manu_code = p.manu_code)
	GROUP BY m.manu_code, manu_name
GO

CREATE TRIGGER insertSobreProdPorFabricante
ON ProdPorFabricante
AFTER INSERT
BEGIN
	DECLARE cursor1 CURSOR FOR
		SELECT * FROM manufact
	DECLARE @manu_code char(3),
			@manu_name varchar(15),
			@state char(2),
			@f_alta_audit datetime,
			@d_usualta_audit varchar(20)
	OPEN cursor1
	FETCH NEXT FROM cursor1
		INTO @manu_code, @manu_name, @state, @f_alta_audit, @d_usualta_audit
	WHILE @@FETCH_STATUS = 0
	BEGIN
		INSERT INTO manufact
			VALUES (@manu_code, @manu_name, 10, @state, @f_alta_audit, @d_usualta_audit)

		FETCH NEXT FROM cursor1
			INTO @manu_code, @manu_name, @state, @f_alta_audit, @d_usualta_audit
	END
END
GO


--c
--



--d
CREATE VIEW ProdPorFabricanteDet AS
SELECT m.manu_code, manu_name, stock_num, description
FROM manufact m LEFT OUTER JOIN stock s ON (m.manu_code = s.manu_code)
--
