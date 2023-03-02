--8. Funciones (1-3)
use stores7

--1
SELECT o.order_num,
	   o.order_date,
	   [dbo].[nombreDia] (o.order_date, CASE c.state WHEN 'CA' THEN 'ING'
											 ELSE 'ESP' END)
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
WHERE o.paid_date IS NULL

CREATE FUNCTION nombreDia (@fecha datetime,
						   @idioma varchar(10))
RETURNS varchar(15)
AS
BEGIN
	DECLARE @dia AS INTEGER,
			@nombreDia AS varchar(15)
	SET @dia = DATEPART(WEEKDAY, @fecha)
	IF @idioma = 'ING'
	BEGIN		
		SET @nombreDia = CASE WHEN @dia = 1 THEN 'Sunday'
							  WHEN @dia = 2 THEN 'Monday'
							  WHEN @dia = 3 THEN 'Tuesday'
							  WHEN @dia = 4 THEN 'Wednesday'
							  WHEN @dia = 5 THEN 'Thursday'
							  WHEN @dia = 6 THEN 'Friday'
							  WHEN @dia = 7 THEN 'Saturday'
						 END
	END
	IF @idioma = 'ESP'
	BEGIN
		SET @nombreDia = CASE WHEN @dia = 1 THEN 'Domingo'
							  WHEN @dia = 2 THEN 'Lunes'
							  WHEN @dia = 3 THEN 'Martes'
							  WHEN @dia = 4 THEN 'Miércoles'
							  WHEN @dia = 5 THEN 'Jueves'
							  WHEN @dia = 6 THEN 'Viernes'
							  WHEN @dia = 7 THEN 'Sábado'
						 END
	END
	RETURN @nombreDia
END



--2



--3
SELECT distinct stock_num, [dbo].[Fx_FABRICANTES] (stock_num)
FROM products



DROP FUNCTION Fx_fabricantes
CREATE FUNCTION Fx_FABRICANTES (@CODIGO INT)
RETURNS VARCHAR (100)
AS
BEGIN
	DECLARE @RETORNO VARCHAR(100),
			@FABRICANTE VARCHAR(3)
	DECLARE CUR_FABRICANTES CURSOR FOR
		SELECT manu_code FROM products WHERE stock_num = @CODIGO
	SET @RETORNO = ''
	OPEN CUR_FABRICANTES
	FETCH NEXT FROM CUR_FABRICANTES INTO @FABRICANTE
	WHILE (@@FETCH_STATUS = 0)
	BEGIN
		SET @RETORNO = @RETORNO + @FABRICANTE + ' | '
		FETCH NEXT FROM CUR_FABRICANTES INTO @FABRICANTE
	END
	CLOSE CUR_FABRICANTES
	DEALLOCATE CUR_FABRICANTES
	
	SET @RETORNO = SUBSTRING(@RETORNO, 1, LEN(@RETORNO) - 2)
	
	RETURN @RETORNO
END
	
SELECT DISTINCT stock_num, dbo.fx_fabricantes(stock_num) as Fabricantes
FROM catalog c
WHERE EXISTS (SELECT 1 FROM products s WHERE c.stock_num = s.stock_num)
	
--Para ejecutar
exec dbo.Fx_FABRICANTES 1
--Para mostrar
PRINT dbo.Fx_FABRICANTES(1)
