--Clase 8 - Funciones
--1
--HECHO
CREATE OR ALTER FUNCTION dbo.f_dia_semana (
	@fecha DATETIME,
	@estado VARCHAR(15)
)
RETURNS VARCHAR(15)
AS
BEGIN
	DECLARE @dia INT,
			@nombre_dia VARCHAR(15)
	SET @dia = DATEPART(WEEKDAY, @fecha)
	IF @estado <> 'CA' BEGIN
		SET @nombre_dia = (
			CASE WHEN @dia = 1 THEN 'Domingo'
				 WHEN @dia = 2 THEN 'Lunes'
				 WHEN @dia = 3 THEN 'Martes'
				 WHEN @dia = 4 THEN 'Miércoles'
				 WHEN @dia = 5 THEN 'Jueves'
				 WHEN @dia = 6 THEN 'Viernes'
				 WHEN @dia = 7 THEN 'Sábado'
			END)
	END
	ELSE IF @estado = 'CA' BEGIN
		SET @nombre_dia = (
			CASE WHEN @dia = 1 THEN 'Sunday'
				 WHEN @dia = 2 THEN 'Monday'
				 WHEN @dia = 3 THEN 'Tuesday'
				 WHEN @dia = 4 THEN 'Wednesday'
				 WHEN @dia = 5 THEN 'Thursday'
				 WHEN @dia = 6 THEN 'Friday'
				 WHEN @dia = 7 THEN 'Saturday'
			END)
	END

	RETURN @nombre_dia
END
GO

SELECT o.order_num, o.order_date, state, dbo.f_dia_semana(o.order_date, c.state) AS 'Día de la semana'
FROM orders o JOIN customer c ON (o.customer_num = c.customer_num)
WHERE paid_date IS NULL
GO




--2
--SIN HACER
SELECT c.customer_num, DATEPART(YEAR, o.order_date) 'Año', DATEPART(MONTH, o.order_date) 'Mes', o.order_num
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
ORDER BY c.customer_num, Año, Mes, o.order_num


SELECT c.customer_num, DATEPART(YEAR, o.order_date) 'Año', DATEPART(MONTH, o.order_date) 'Mes', SUM(o.ship_charge)
FROM customer c JOIN orders o ON (c.customer_num = o.customer_num)
GROUP BY c.customer_num, DATEPART(YEAR, o.order_date), DATEPART(MONTH, o.order_date)




--3
--HECHO
CREATE OR ALTER FUNCTION f_string_manu_code (
	@stock_num SMALLINT
)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @manu_code_leido CHAR(3),
			@string_manu_code VARCHAR(30)
	SET @string_manu_code = ''
	DECLARE elCursor CURSOR FOR
		SELECT manu_code FROM products WHERE stock_num = @stock_num

	OPEN elCursor

	FETCH NEXT FROM elCursor INTO @manu_code_leido

	WHILE (@@FETCH_STATUS = 0) BEGIN
		SET @string_manu_code = @string_manu_code + @manu_code_leido + ' | '
		
		FETCH NEXT FROM elCursor INTO @manu_code_leido
	END

	CLOSE elCursor
	DEALLOCATE elCursor

	SET @string_manu_code = SUBSTRING(@string_manu_code, 1, LEN(@string_manu_code) - 2)
	RETURN @string_manu_code
END
GO

SELECT DISTINCT stock_num, dbo.f_string_manu_code(stock_num) AS 'Fabricantes'
FROM products
GO