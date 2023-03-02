--Clase 9 - Auditoría
--1
--HECHO
CREATE TABLE dbo.auditoria (
	auditID INTEGER PRIMARY KEY IDENTITY,
	nombreTabla VARCHAR(30) NOT NULL,
	operacion CHAR CHECK (operacion IN ('I', 'O', 'N', 'D')),
	rowData VARCHAR(255),
	usuario VARCHAR(30) DEFAULT USER,
	fecha DATE DEFAULT GETDATE()
)
GO




--2
--HECHO
CREATE OR ALTER PROCEDURE dbo.altaAuditoria (
	@nombreTabla VARCHAR(30),
	@operacion CHAR,
	@rowData VARCHAR(255))
AS
BEGIN
	INSERT INTO auditoria (nombreTabla, operacion, rowData)
		VALUES (@nombreTabla, @operacion, @rowData)
END
GO
--Los inserta por default (toma el usuario y el tiempo por default definido en la tabla del punto 1).




--3
--HECHO
CREATE OR ALTER TRIGGER triggerPunto3 ON manufact
AFTER INSERT
AS
BEGIN
	DECLARE @manu_code CHAR(3),
			@manu_name VARCHAR(15),
			@lead_time SMALLINT
	DECLARE cursorPunto3 CURSOR FOR
		SELECT manu_code, manu_name, lead_time FROM inserted
	DECLARE @string_rowData AS VARCHAR(255)
	OPEN cursorPunto3
	FETCH NEXT FROM cursorPunto3
		INTO @manu_code, @manu_name, @lead_time
	WHILE (@@FETCH_STATUS = 0) BEGIN
		SET @string_rowData = CAST(@manu_code AS VARCHAR) + ' | ' + @manu_name + ' | ' + CAST(@lead_time AS VARCHAR)
		EXEC altaAuditoria 'manufact', 'I', @string_rowData
		FETCH NEXT FROM cursorPunto3
			INTO @manu_code, @manu_name, @lead_time
	END
	CLOSE cursorPunto3
	DEALLOCATE cursorPunto3
END
GO

--Diferencias entre usuarios (del sistema y del esquema en SSMS)
SELECT SUSER_NAME(), SYSTEM_USER, CURRENT_USER, USER_NAME()
--Diferencias entre fechas
SELECT GETDATE(), SYSDATETIME()




--4
--HECHO
CREATE OR ALTER TRIGGER triggerPunto4 ON manufact
AFTER DELETE
AS
BEGIN
	DECLARE @manu_code CHAR(3),
			@manu_name VARCHAR(15),
			@lead_time SMALLINT
	DECLARE cursorPunto4 CURSOR FOR
		SELECT manu_code, manu_name, lead_time FROM deleted
	DECLARE @string_rowData AS VARCHAR(255)
	OPEN cursorPunto4
	FETCH NEXT FROM cursorPunto4
		INTO @manu_code, @manu_name, @lead_time
	WHILE (@@FETCH_STATUS = 0) BEGIN
		SET @string_rowData = CAST(@manu_code AS VARCHAR) + ' | ' + @manu_name + ' | ' + CAST(@lead_time AS VARCHAR)
		EXEC altaAuditoria 'manufact', 'D', @string_rowData
		FETCH NEXT FROM cursorPunto4
			INTO @manu_code, @manu_name, @lead_time
	END
	CLOSE cursorPunto4
	DEALLOCATE cursorPunto4
END
GO



--5
--HECHO
CREATE OR ALTER TRIGGER triggerPunto5 ON manufact
AFTER UPDATE
AS
BEGIN
	DECLARE @manu_code_viejo CHAR(3),
			@manu_name_viejo VARCHAR(15),
			@lead_time_viejo SMALLINT,
			@manu_code_nuevo CHAR(3),
			@manu_name_nuevo VARCHAR(15),
			@lead_time_nuevo SMALLINT
	DECLARE cursorPunto5 CURSOR FOR
		SELECT d.manu_code, d.manu_name, d.lead_time, i.manu_code, i.manu_name, i.lead_time
		FROM deleted d JOIN inserted i ON (d.manu_code = i.manu_code)
	DECLARE @string_rowData_viejo AS VARCHAR(255),
			@string_rowData_nuevo AS VARCHAR(255)
	OPEN cursorPunto5
	FETCH NEXT FROM cursorPunto5
		INTO @manu_code_viejo, @manu_name_viejo, @lead_time_viejo, @manu_code_nuevo, @manu_name_nuevo, @lead_time_nuevo
	WHILE (@@FETCH_STATUS = 0) BEGIN
		SET @string_rowData_viejo = CAST(@manu_code_viejo AS VARCHAR) + ' | ' + @manu_name_viejo + ' | ' + CAST(@lead_time_viejo AS VARCHAR)
		EXEC altaAuditoria 'manufact', 'O', @string_rowData_viejo

		SET @string_rowData_nuevo = CAST(@manu_code_nuevo AS VARCHAR) + ' | ' + @manu_name_nuevo + ' | ' + CAST(@lead_time_nuevo AS VARCHAR)
		EXEC altaAuditoria 'manufact', 'N', @string_rowData_nuevo
		
		FETCH NEXT FROM cursorPunto5
			INTO @manu_code_viejo, @manu_name_viejo, @lead_time_viejo, @manu_code_nuevo, @manu_name_nuevo, @lead_time_nuevo
	END
	CLOSE cursorPunto5
	DEALLOCATE cursorPunto5
END
GO

--ANZ · Anza · 5
--Lo cambiamos a:
--ANZ · Anza · 100
SELECT * FROM manufact WHERE state = 'CA'
BEGIN TRANSACTION
UPDATE manufact SET lead_time = 100 WHERE state = 'CA'
SELECT * FROM manufact WHERE state = 'CA'
SELECT * FROM auditoria
ROLLBACK

SELECT * FROM manufact WHERE state = 'CA'
SELECT * FROM auditoria
GO




--6
--SIN HACER
--a
BEGIN TRANSACTION
SELECT * FROM manufact
SELECT * FROM auditoria
INSERT INTO dbo.manufact (manu_code, manu_name, lead_time) VALUES ('XXX', 'Xtra large', 23)
SELECT * FROM manufact
SELECT * FROM auditoria
ROLLBACK
--Anda


--Hacer las otras pruebas...




--7
--HECHO
CREATE TABLE errorAudit (
	errorID INTEGER PRIMARY KEY IDENTITY,
	sqlError INTEGER,
	isamError INTEGER DEFAULT NULL,
	errorInfo CHAR(70),
	nombreTabla VARCHAR(30) NOT NULL,
	operacion CHAR,
	rowData VARCHAR(255),
	usuario VARCHAR(30) DEFAULT USER_NAME(),
	fecha DATETIME DEFAULT CURRENT_USER,
	errorStatus CHAR DEFAULT 'P' CHECK (errorStatus IN ('P', 'F'))
)
GO



--8
--HACIENDO
CREATE OR ALTER PROCEDURE dbo.altaAuditoria (
	@nombreTabla VARCHAR(30),
	@operacion CHAR,
	@rowData VARCHAR(255))
AS
BEGIN
	BEGIN TRY
		INSERT INTO auditoria (nombreTabla, operacion, rowData)
			VALUES (@nombreTabla, @operacion, @rowData)
	END TRY
	BEGIN CATCH
		INSERT INTO errorAudit (sqlError,
								errorInfo,
								nombreTabla,
								operacion,
								rowData,
								usuario,
								fecha)
			VALUES (ERROR_NUMBER(),
					ERROR_MESSAGE(),
					'manufact',
					--operacion,
					--rowdata,
					USER_NAME(),
					GETDATE())
	END CATCH
END
GO




--9
--SIN HACER



--10
--SIN HACER


