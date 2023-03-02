--9. Auditoría (triggers-storedProcedures)
use stores7

--1
CREATE TABLE auditoria(
	auditID INT IDENTITY(1,1) PRIMARY KEY,
	nombreTabla VARCHAR(30) NOT NULL,
	operacion CHAR CHECK (operacion = 'I' OR operacion = 'O' OR operacion = 'N' OR operacion = 'D'),
	rowData VARCHAR(255) NOT NULL,
	usuario VARCHAR(30) DEFAULT USER,
	fecha DATE DEFAULT getDate()
)
GO



--2
CREATE PROCEDURE altaAuditoria
	@nombreTabla VARCHAR(30),
	@operacion CHAR,
	@rowData VARCHAR(255)
AS
BEGIN
	INSERT INTO auditoria (nombreTabla, operacion, rowData)
		VALUES (@nombreTabla, @operacion, @rowData)
END
GO
	--Prueba de ejecución - inserción de un elemento en la tabla
	EXECUTE altaAuditoria 'unaTabla', 'I', 'unRowData'
	SELECT * FROM auditoria
	--Los campos usuario y fecha se insertan de acuerdo a lo definido por default, sin problemas



--3
-- Lo siguiente es válido para los puntos 3, 4 y 5 (el "FOREACH ROW" indica)
-- Si no uso cursores, al hacer un insert masivo, el trigger actuará sobre la primera fila únicamente!
--	Sin cursor:		-- 1 único INSERT	--->	el trigger actúa sobra esa fila
					-- INSERT masivo	--->	¡el trigger actúa sólo para la primera fila!
--	Con cursor:		-- No importa la cantidad de valores que INSERTe, el trigger actuará sobre TODAS las filas que inserte
CREATE TRIGGER punto3
ON manufact
AFTER INSERT
AS
BEGIN
	DECLARE @manu_code CHAR(3), @manu_name VARCHAR(15), @lead_time SMALLINT, @rowData NVARCHAR(30)
	SELECT @manu_code = manu_code,
		   @manu_name = manu_name,
		   @lead_time = lead_time
	FROM inserted
	SET @rowData = @manu_code + ' | ' + @manu_name + ' | ' + CAST(@lead_time AS NVARCHAR(30))
	EXECUTE altaAuditoria 'manufact', 'I', @rowData
END



--4
CREATE TRIGGER punto4
ON manufact
AFTER DELETE
AS
BEGIN
	DECLARE @manu_code CHAR(3), @manu_name VARCHAR(15), @lead_time SMALLINT, @rowData NVARCHAR(30)
	SELECT @manu_code = manu_code,
		   @manu_name = manu_name,
		   @lead_time = lead_time
	FROM deleted
	SET @rowData = @manu_code + ' | ' + @manu_name + ' | ' + CAST(@lead_time AS NVARCHAR(30))
	EXECUTE altaAuditoria 'manufact', 'D', @rowData
END



--5
CREATE TRIGGER punto5
ON manufact
AFTER UPDATE
AS
BEGIN
	DECLARE @manu_code_deleted CHAR(3), @manu_name_deleted VARCHAR(15), @lead_time_deleted SMALLINT, @rowData_deleted NVARCHAR(30)
	DECLARE @manu_code_inserted CHAR(3), @manu_name_inserted VARCHAR(15), @lead_time_inserted SMALLINT, @rowData_inserted NVARCHAR(30)
	SELECT @manu_code_deleted = manu_code,
		   @manu_name_deleted = manu_name,
		   @lead_time_deleted = lead_time
	FROM deleted
	SELECT @manu_code_inserted = manu_code,
		   @manu_name_inserted = manu_name,
		   @lead_time_inserted = lead_time
	FROM inserted
	SET @rowData_deleted = @manu_code_deleted + ' | ' + @manu_name_deleted + ' | ' + CAST(@lead_time_deleted AS NVARCHAR(30))
	SET @rowData_inserted = @manu_code_inserted + ' | ' + @manu_name_inserted + ' | ' + CAST(@lead_time_inserted AS NVARCHAR(30))
	EXECUTE altaAuditoria 'manufact', 'O', @rowData_deleted
	EXECUTE altaAuditoria 'manufact', 'N', @rowData_inserted
END



--6
INSERT INTO manufact (manu_code, manu_name, lead_time) VALUES ('XXX', 'Xtra large', 23)
UPDATE manufact SET manu_name = 'Extra Large' WHERE manu_code = 'XXX'
	SELECT * FROM auditoria
	--La tabla auditoria contiene estos registros:
	--	1	manufact	O	XXX | Extra Large | 23	dbo	2018-10-31
	--	2	manufact	N	XXX | Extra Large | 23	dbo	2018-10-31
	
INSERT INTO manufact (manu_code, manu_name, lead_time) VALUES ('XXX', 'Xtra large', 23)
	--Tira un error porque ya existe esa PK
	--Msg 2627, Level 14, State 1, Line 1
	--Violation of PRIMARY KEY constraint 'PK__manufact__07556B5D80FDA189'. Cannot insert duplicate key in object 'dbo.manufact'. The duplicate key value is (XXX).
	--The statement has been terminated.

INSERT INTO manufact (manu_code, manu_name, lead_time) VALUES ('ZZZ', 'Zampini SA', 11)
DELETE FROM manufact WHERE manu_code = 'ZZZ'
	SELECT * FROM auditoria
	--La tabla auditoria contiene estos registros:
	--	1	manufact	O	XXX | Extra Large | 23	dbo	2018-10-31
	--	2	manufact	N	XXX | Extra Large | 23	dbo	2018-10-31
	--	3	manufact	I	ZZZ | Zampini SA | 11	dbo	2018-10-31
	--	4	manufact	D	ZZZ | Zampini SA | 11	dbo	2018-10-31



--7
CREATE TABLE errorAudit(
	errorID INT PRIMARY KEY IDENTITY(1,1),
	sqlError INT,
	isamError INT,
	errorInfo CHAR(70),
	nombreTabla VARCHAR(30) NOT NULL,
	operacion CHAR,
	rowData VARCHAR(255) NOT NULL,
	usuario VARCHAR(255) DEFAULT SUSER_SNAME(),
	fecha DATETIME DEFAULT GETDATE(),
	errorStatus CHAR CHECK (errorStatus IN ('P', 'F')) DEFAULT 'P'
)



--8

