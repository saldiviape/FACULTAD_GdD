USE GD2C2018
GO

--CREACION DEL ESQUEMA
CREATE SCHEMA DATEROS 
GO

--CREACION DE TABLAS

CREATE TABLE DATEROS.funcionalidad(
	idFuncionalidad numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(255)
	)
GO

CREATE TABLE DATEROS.rol(
	idRol numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	nombre nvarchar(255)
	)
GO

CREATE TABLE DATEROS.usuario(
	username nvarchar(255) PRIMARY KEY,
	password varbinary(255),
	estado nvarchar(255) DEFAULT 'Habilitado'
	)
GO

CREATE TABLE DATEROS.funcionalidad_rol(
	idRol numeric(18,0) REFERENCES DATEROS.rol,
	idFuncionalidad numeric(18,0) REFERENCES DATEROS.funcionalidad
	)
GO

CREATE TABLE DATEROS.rolesInhabilitados(
	idRol numeric(18,0) REFERENCES DATEROS.rol
	)
GO

CREATE TABLE DATEROS.roles_usuario(
	username nvarchar(255) REFERENCES DATEROS.usuario ON UPDATE CASCADE,
	idRol numeric(18,0) REFERENCES DATEROS.rol
	)
GO

CREATE TABLE DATEROS.grado(
	idGrado numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	prioridad nvarchar(20),
	porcentaje numeric(3,2),
	estado bit
	)
GO

CREATE TABLE DATEROS.rubro(
	idRubro numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	descripcion nvarchar(255)
	)
GO

CREATE TABLE DATEROS.estados(
	idEstado numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	estado nvarchar(255)
)
GO

CREATE TABLE DATEROS.tipoUbicacion(
	idTipoUbicacion numeric(18,0) PRIMARY KEY,
	descripcion nvarchar(255)
	)
GO

CREATE TABLE DATEROS.ubicacion(
	idUbicacion numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	idTipoUbicacion numeric(18,0) NOT NULL REFERENCES DATEROS.tipoUbicacion,
	fila varchar(3),
	asiento numeric(18,0),
	precio numeric(18,2)
	)
GO

CREATE TABLE DATEROS.publicacion(
	idPublicacion numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	descripcion nvarchar(255),
	direccion nvarchar(255),
	fechaCreacion datetime,
	idRubro numeric(18,0) REFERENCES DATEROS.rubro,
	idGrado numeric(18,0) REFERENCES DATEROS.grado,
	username nvarchar(255) REFERENCES DATEROS.usuario,
	idEstado numeric(18,0) REFERENCES DATEROS.estados
	)
GO

CREATE TABLE DATEROS.funcion(
	idFuncion numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	idPublicacion numeric(18,0) REFERENCES DATEROS.publicacion,
	fechaHora datetime
	)
GO

CREATE TABLE DATEROS.empresas(
	idEmpresa numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	username nvarchar(255) REFERENCES DATEROS.usuario ON UPDATE CASCADE,
	razonSocial nvarchar(255),
	mail nvarchar(255),
	telefono numeric(10,0),
	direccion nvarchar(255),
	nroPiso numeric(18,0),
	depto nvarchar(255),
	localidad nvarchar(255),
	codPostal nvarchar(255),
	ciudad nvarchar(255),
	fechaCreacion datetime,
	cuit nvarchar(255)
	)
GO

CREATE TABLE DATEROS.tarjeta(
	nroTarjeta numeric(18,0) PRIMARY KEY,
    nombre nvarchar(255),
	fechaVencimiento datetime,
	banco nvarchar(255),
    marca nvarchar(255),
    cvv numeric(3,0)
    )
GO

CREATE TABLE DATEROS.clientes(
	idCliente numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	username nvarchar(255) REFERENCES DATEROS.usuario ON UPDATE CASCADE,
	nombre nvarchar(255),
	apellido nvarchar(255),
	docTipo nvarchar(255),
	docNum numeric(18,0),
	cuil nvarchar(255),
	mail nvarchar(255),
	telefono numeric(10,0),
	direccion nvarchar(255),
	nroPiso numeric(18,0),
	depto nvarchar(255),
	localidad nvarchar(255),
	codPostal nvarchar(255),
	fechaNac datetime,
	fechaCreacion datetime,
	nroTarjeta numeric(18,0) REFERENCES DATEROS.tarjeta
	)
GO

CREATE TABLE DATEROS.premios(
	idPremio numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	descripcion nvarchar(255),
	puntosNecesarios numeric(18,0)
	)
GO

CREATE TABLE DATEROS.premios_cliente(
	idCliente numeric(18,0) REFERENCES DATEROS.clientes,
	idPremio numeric(18,0) REFERENCES DATEROS.premios
	)
GO

CREATE TABLE DATEROS.puntosTrimestralesClientes(
	idCliente numeric(18,0) REFERENCES DATEROS.clientes,
	anio numeric(4,0),
	trimestre smallint,
	puntos numeric(18,0)
	)
GO

CREATE TABLE DATEROS.compra(
	idCompra numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	idCliente numeric(18,0) REFERENCES DATEROS.clientes,
	fecha datetime,
	metodoDePago nvarchar(255),
	puntaje numeric(18,0),
	fueRendida bit default 'FALSE'
	)
GO

CREATE TABLE DATEROS.funcion_ubicacion(
	idFuncion numeric(18,0) REFERENCES DATEROS.funcion,
	idUbicacion numeric(18,0) REFERENCES DATEROS.ubicacion,
	idCompra numeric(18,0) REFERENCES DATEROS.compra,
	vendido bit
	)
GO

CREATE TABLE DATEROS.compra_publicacion(
	idCompra numeric(18,0) REFERENCES DATEROS.compra,
	idPublicacion numeric(18,0) REFERENCES DATEROS.publicacion
	)
GO

CREATE TABLE DATEROS.factura(
	nroFactura numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	idEmpresa numeric(18,0) REFERENCES DATEROS.empresas,
	fecha datetime,
	total numeric(18,2)
	)
GO

CREATE TABLE DATEROS.itemFactura(
	nroItem numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
	nroFactura numeric(18,0) REFERENCES DATEROS.factura,
	idCompra numeric(18,0) REFERENCES DATEROS.compra,
	cant numeric(18,0),
	descripcion nvarchar(60),
	monto numeric(18,2)
	)
GO

--PROCEDURES Y FUNCIONES

--CREACIÓN de la FUNCIÓN armarDireccion
CREATE FUNCTION DATEROS.armarDireccion (@calle NVARCHAR(255), @altura NUMERIC)
RETURNS NVARCHAR(255)
AS
BEGIN
	DECLARE @direccion NVARCHAR(255);
	SET @direccion = @calle + ' ' + CAST(@altura AS nvarchar(255));
	RETURN @direccion;
END
GO

--FUNCION Y PROCEDURE PARA MIGRACION DE COMPRAS
CREATE FUNCTION DATEROS.dameIdCliente (@docNum numeric(18,0), @mail nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idCliente FROM DATEROS.clientes WHERE docNum=@docNum AND mail=@mail)
END
GO

CREATE PROCEDURE DATEROS.migracionCompras
AS
BEGIN 	
	DECLARE @docNum numeric(18,0), @mail nvarchar(255)
	DECLARE @idCliente numeric(18,0)
	DECLARE cursorClientes CURSOR FOR
		SELECT docNum, mail FROM DATEROS.clientes

	OPEN cursorClientes
	FETCH NEXT FROM cursorClientes INTO @docNum, @mail
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
		SET @idCliente = (SELECT DATEROS.dameidCliente(@docNum, @mail))

		INSERT INTO DATEROS.compra(idCliente, metodoDePago, fecha)
			SELECT DISTINCT @idCliente, Forma_Pago_Desc, Compra_Fecha FROM gd_esquema.Maestra WHERE Cli_Mail=@mail AND Cli_Dni=@docNum;
			
		FETCH NEXT FROM cursorClientes INTO @docNum, @mail
		END
	CLOSE cursorClientes
	DEALLOCATE cursorClientes		
END
GO

--FUNCION Y PROCEDURE PARA MIGRACION DE FACTURAS
CREATE FUNCTION DATEROS.dameIdEmpresa (@razonSocial nvarchar(255), @cuit nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idEmpresa FROM DATEROS.empresas WHERE razonSocial=@razonSocial AND cuit=@cuit)
END
GO

CREATE PROCEDURE DATEROS.migracionFacturas
AS
BEGIN 	
	DECLARE @razonSocial nvarchar(255), @cuit nvarchar(255)
	DECLARE @idEmpresa numeric(18,0)
	
	DECLARE cursorEmpresas CURSOR FOR
		SELECT razonSocial, cuit FROM DATEROS.empresas

	SET IDENTITY_INSERT DATEROS.factura ON

	OPEN cursorEmpresas
	FETCH NEXT FROM cursorEmpresas INTO @razonSocial, @cuit
	WHILE (@@FETCH_STATUS = 0)
		BEGIN
		SET @idEmpresa = (SELECT DATEROS.dameidEmpresa(@razonSocial, @cuit))

		INSERT INTO DATEROS.factura(nroFactura, idEmpresa, fecha, total)
			SELECT DISTINCT Factura_Nro, @idEmpresa, Factura_Fecha, Factura_Total FROM gd_esquema.Maestra WHERE @razonSocial=Espec_Empresa_Razon_Social AND @cuit=Espec_Empresa_Cuit AND Factura_Nro IS NOT NULL
			
		FETCH NEXT FROM cursorEmpresas INTO @razonSocial, @cuit
		END
	CLOSE cursorEmpresas
	DEALLOCATE cursorEmpresas		
END
GO	

--Alta de Factura
CREATE PROCEDURE DATEROS.altaFactura
@idEmpresa numeric(18,0),
@fecha datetime,
@total numeric(18,2)
AS
BEGIN 	
	INSERT INTO DATEROS.factura(idEmpresa, fecha, total)
		values (@idEmpresa, @fecha, @total)	
END
GO	

--Alta de Item_Factura
CREATE PROCEDURE DATEROS.altaItemFactura
@nroFactura numeric(18,0),
@idCompra numeric(18,0),
@descripcion nvarchar(60),
@monto numeric(18,2)
AS
BEGIN
	-- Creo item_factura 	
	INSERT INTO DATEROS.itemFactura(nroFactura, idCompra, descripcion, monto)
		values (@nroFactura, @idCompra, @descripcion, @monto)	
	-- Modifico la compra para que aparezca como rendida
	UPDATE DATEROS.compra
	SET fueRendida = 'TRUE'
	WHERE idCompra = @idCompra
END
GO

--FUNCION PARA MIGRACION ITEM_FACTURA
CREATE FUNCTION DATEROS.dameIdFactura (@nroFactura numeric(18,0))
RETURNS numeric(18,0) 
AS
BEGIN
	RETURN (SELECT nroFactura FROM DATEROS.factura WHERE nroFactura=@nroFactura)
END
GO

--FUNCIONES PARA MIGRACION DE PUBLICACIONES
CREATE FUNCTION DATEROS.dameIdRubro (@rubro nvarchar(255))
RETURNS numeric(18,0) 
AS
BEGIN
	RETURN (SELECT idRubro FROM DATEROS.rubro WHERE descripcion=@rubro)
END
GO

CREATE FUNCTION DATEROS.dameIdEstado (@estado nvarchar(255))
RETURNS numeric(18,0) 
AS
BEGIN
	RETURN (SELECT idEstado FROM DATEROS.estados WHERE estado=@estado)
END
GO

--Alta de Rol

CREATE PROCEDURE DATEROS.altaRol
@rol nvarchar(255)
AS
IF NOT EXISTS (SELECT idRol FROM DATEROS.rol WHERE @rol=nombre)
	BEGIN
		INSERT INTO DATEROS.rol (nombre)
			VALUES (@rol)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el rol.', 16, 1)
	END
GO

CREATE FUNCTION DATEROS.dameidFuncionalidad (@nombre nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idFuncionalidad FROM DATEROS.funcionalidad WHERE nombre=@nombre)
END
GO

CREATE FUNCTION DATEROS.dameidRol (@nombre nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idRol FROM DATEROS.rol WHERE nombre=@nombre)
END
GO

CREATE PROCEDURE DATEROS.asignarFuncRol
@rol nvarchar(255),
@func nvarchar(255)
AS
BEGIN 	
	DECLARE	@idFunc numeric(18,0)
	DECLARE @idR numeric(18,0)
	SET @idFunc = (SELECT DATEROS.dameiDFuncionalidad(@func));
	SET @idR = (SELECT DATEROS.dameidRol(@rol));
	INSERT INTO DATEROS.funcionalidad_rol(idRol, idFuncionalidad)
		VALUES(@idR, @idFunc)
END
GO

--Modificacion de Rol
CREATE PROCEDURE DATEROS.agregarFuncionalidad
@funcionalidad nvarchar(255),
@rol nvarchar(255)
AS

DECLARE @idFunc numeric(18,0)
SET @idFunc = (SELECT idFuncionalidad FROM DATEROS.funcionalidad WHERE nombre=@funcionalidad)

IF NOT EXISTS (SELECT * FROM DATEROS.funcionalidad_rol WHERE idRol=@rol AND idFuncionalidad=@idFunc)
	BEGIN
		INSERT INTO DATEROS.funcionalidad_rol(idRol,idFuncionalidad)
			SELECT idRol, idFuncionalidad 
			FROM DATEROS.rol r, DATEROS.funcionalidad f
			WHERE @rol=r.idRol AND f.idFuncionalidad=@idFunc
	END
ELSE
	BEGIN
		 RAISERROR ('No esta permitido agregar una funcionalidad ya existente.', 16, 1)
	END
GO

CREATE PROCEDURE DATEROS.quitarFuncionalidad
@funcionalidad nvarchar(255),
@rol nvarchar(255)
AS

DECLARE @idFunc numeric(18,0)
SET @idFunc = (SELECT idFuncionalidad FROM DATEROS.funcionalidad WHERE nombre=@funcionalidad)

IF EXISTS (SELECT * FROM DATEROS.funcionalidad_rol WHERE idRol=@rol AND idFuncionalidad=@idFunc)
	BEGIN
		DELETE FROM DATEROS.funcionalidad_rol WHERE idFuncionalidad=@idFunc AND idRol=@rol
	END
ELSE
	BEGIN
		 RAISERROR ('Este rol no tiene la funcionalidad que desea eliminar.', 16, 1)
	END
GO

--Habilitacion/Eliminacion De Roles
CREATE PROCEDURE DATEROS.habilitarRol
@rol numeric(18,0)
AS
	IF EXISTS (SELECT idRol FROM DATEROS.rolesInhabilitados WHERE idRol=@rol)
	BEGIN
		DELETE FROM DATEROS.rolesInhabilitados
		WHERE @rol=idRol
	END
ELSE
	BEGIN
		 RAISERROR ('El rol seleccionado ya se encuentra habilitado.', 16, 1)
	END
GO

CREATE PROCEDURE DATEROS.deshabilitarRol
@rol numeric(18,0)
AS
	IF NOT EXISTS (SELECT idRol FROM DATEROS.rolesInhabilitados WHERE idRol=@rol)
		BEGIN
			INSERT INTO DATEROS.rolesInhabilitados VALUES(@rol)
			DELETE FROM DATEROS.funcionalidad_rol WHERE idRol=@rol
		END
ELSE
	BEGIN
		 RAISERROR ('El rol seleccionado ya se encuentra deshabilitado.', 16, 1)
	END
GO

--Baja Usuario
CREATE PROCEDURE DATEROS.bajaUsuario
@username nvarchar(255)
AS
UPDATE DATEROS.usuario SET estado='Dado de Baja' WHERE username=@username
GO

--Alta Empresa
CREATE PROCEDURE DATEROS.altaEmpresaAdmin
@razonSocial nvarchar(255),
@mail nvarchar(255),
@telefono numeric(10,0),
@direccion nvarchar(255),
@piso numeric(18,0),
@depto nvarchar(255),
@localidad nvarchar(255),
@codPostal nvarchar(255),
@ciudad nvarchar(255),
@cuit nvarchar(255),
@fechaCreacion datetime
AS
DECLARE @usuario nvarchar(255)

IF NOT EXISTS (SELECT idEmpresa FROM DATEROS.empresas WHERE razonSocial=@razonSocial AND cuit=@cuit)
	BEGIN
		IF(@cuit LIKE '__-________-_')
			BEGIN
				SET @usuario = CONCAT(@razonSocial, @cuit)
				INSERT INTO DATEROS.usuario(username, password, estado)
					VALUES (@usuario, HASHBYTES('SHA2_256', '123'), 'Pausado')
				INSERT INTO DATEROS.roles_usuario(idRol, username)
					VALUES(2, @usuario)
				INSERT INTO DATEROS.empresas(razonSocial, mail, telefono, direccion, nroPiso, depto, localidad, codPostal, ciudad, cuit, fechaCreacion, username)
					VALUES (@razonSocial, @mail, @telefono, @direccion, @piso, @depto, @localidad, @codPostal, @ciudad, @cuit, @fechaCreacion, @usuario)
			END
		ELSE
			BEGIN
				RAISERROR ('CUIT Invalido.', 16, 1)
			END
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe la empresa.', 16, 1)
	END
GO

CREATE PROCEDURE DATEROS.altaEmpresa
@razonSocial nvarchar(255),
@mail nvarchar(255),
@telefono numeric(10,0),
@direccion nvarchar(255),
@piso numeric(18,0),
@depto nvarchar(255),
@localidad nvarchar(255),
@codPostal nvarchar(255),
@ciudad nvarchar(255),
@cuit nvarchar(255),
@fechaCreacion datetime,
@username nvarchar(255),
@rol numeric(18,0)
AS

IF NOT EXISTS (SELECT idEmpresa FROM DATEROS.empresas WHERE razonSocial=@razonSocial AND cuit=@cuit)
	BEGIN
		IF(@cuit LIKE '__-________-_')
			BEGIN
				INSERT INTO DATEROS.roles_usuario(idRol, username)
					VALUES(@rol, @username)
				INSERT INTO DATEROS.empresas(razonSocial, mail, telefono, direccion, nroPiso, depto, localidad, codPostal, ciudad, cuit, fechaCreacion, username)
					VALUES (@razonSocial, @mail, @telefono, @direccion, @piso, @depto, @localidad, @codPostal, @ciudad, @cuit, @fechaCreacion, @username)
			END
		ELSE
			BEGIN
				RAISERROR ('CUIT Invalido.', 16, 1)
			END
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe la empresa.', 16, 1)
	END
GO

--Habilitacion Usuario
CREATE PROCEDURE DATEROS.habilitarUsuario
@username nvarchar(255)
AS
UPDATE DATEROS.usuario SET estado='Habilitado' WHERE username=@username
GO

--Modificacion Empresa
CREATE PROCEDURE DATEROS.modificacionEmpresa
@empresaActual nvarchar(255),
@mail nvarchar(255),
@telefono numeric(10,0),
@direccion nvarchar(255),
@piso numeric(18,0),
@depto nvarchar(255),
@localidad nvarchar(255),
@codPostal nvarchar(255),
@ciudad nvarchar(255)
AS
	BEGIN
		UPDATE DATEROS.empresas SET mail=@mail, telefono=@telefono, direccion=@direccion, nroPiso=@piso, depto=@depto, localidad=@localidad, codPostal=@codPostal, ciudad=@ciudad WHERE razonSocial=@empresaActual
	END
GO

CREATE PROCEDURE DATEROS.modifRazonSocialEmpresa
@empresaActual nvarchar(255),
@nuevaRazonSocial nvarchar(255)
AS
	IF NOT EXISTS (SELECT idEmpresa FROM DATEROS.empresas WHERE razonSocial=@nuevaRazonSocial)
		BEGIN
			UPDATE DATEROS.empresas SET razonSocial=@nuevaRazonSocial WHERE razonSocial=@empresaActual
		END
	ELSE
		BEGIN
			 RAISERROR ('Ya existe una empresa con esta Razon Social.', 16, 1)
		END
GO

CREATE PROCEDURE DATEROS.modifCuitEmpresa
@empresaActual nvarchar(255),
@nuevoCuit nvarchar(255)
AS
DECLARE @cuitActual nvarchar(255)
SET @cuitActual = (SELECT cuit FROM DATEROS.empresas WHERE razonSocial=@empresaActual)

	IF NOT EXISTS (SELECT idEmpresa FROM DATEROS.empresas WHERE cuit=@nuevoCuit)
		BEGIN
			IF(@nuevoCuit LIKE '__-________-_')
				BEGIN
					UPDATE DATEROS.empresas SET cuit=@nuevoCuit WHERE cuit=@cuitActual
				END
			ELSE
				BEGIN
					RAISERROR ('CUIT Invalido.', 16, 1)	
				END
		END
	ELSE
		BEGIN
			 RAISERROR ('Ya existe una empresa con este CUIT.', 16, 1)
		END
GO

--Compras de Empresa
CREATE PROCEDURE DATEROS.comprasDeEmpresa
@empresa nvarchar(255),
@fecha datetime
AS
SELECT c.idCompra as idCompra,
	p.idPublicacion as idPublicacion, 
	p.descripcion as descripcion, 
	g.porcentaje as porcentaje, 
	u.precio as precio, 
	u.fila as fila, 
	u.asiento as asiento
FROM DATEROS.compra c INNER JOIN DATEROS.funcion_ubicacion fu ON c.idCompra = fu.idCompra
	INNER JOIN DATEROS.funcion f ON f.idFuncion = fu.idFuncion
	INNER JOIN DATEROS.publicacion p ON p.idPublicacion = f.idPublicacion
	INNER JOIN DATEROS.grado g ON G.idGrado = p.idGrado
	INNER JOIN DATEROS.ubicacion u ON fu.idUbicacion = u.idUbicacion
WHERE p.username = @empresa
	AND c.fueRendida != 'TRUE'
	AND fu.vendido = 1
ORDER BY c.idCompra asc,
	p.idPublicacion,
	u.idUbicacion,
	u.fila
GO

--Alta Grado
CREATE PROCEDURE DATEROS.altaGrado
@prioridad nvarchar(20),
@porcentaje numeric(3,2)
AS
IF NOT EXISTS (SELECT prioridad FROM DATEROS.grado WHERE prioridad=@prioridad)
	BEGIN
		INSERT INTO DATEROS.grado(prioridad, porcentaje, estado)
			VALUES (@prioridad, @porcentaje, 1)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el grado.', 16, 1)
	END
GO

--Modificacion Grado
CREATE PROCEDURE DATEROS.modifGrado
@prioridad nvarchar(20),
@porcentaje numeric(3,2)
AS
	BEGIN
		UPDATE DATEROS.grado SET porcentaje=@porcentaje WHERE prioridad=@prioridad
	END
GO

--Habilitacion Grado
CREATE PROCEDURE DATEROS.habilitarGrado
@prioridad nvarchar(20)
AS
	BEGIN
		UPDATE DATEROS.grado SET estado=1 WHERE prioridad=@prioridad
	END
GO

--Baja Grado
CREATE PROCEDURE DATEROS.bajaGrado
@prioridad nvarchar(20)
AS
	BEGIN
		UPDATE DATEROS.grado SET estado=0 WHERE prioridad=@prioridad
	END
GO

--Alta Clientes
CREATE PROCEDURE DATEROS.altaClienteAdmin
@nombre nvarchar(255),
@apellido nvarchar(255),
@docTipo nvarchar(255),
@docNro numeric(18,0),
@cuil nvarchar(255),
@mail nvarchar(255),
@telefono numeric(10,0),
@direccion nvarchar(255),
@piso nvarchar(255),
@depto nvarchar(255),
@localidad nvarchar(255),
@codPostal nvarchar(255),
@fechaNac datetime,
@fechaCreacion datetime
AS
DECLARE @usuario nvarchar(255)
DECLARE @error int = 1
DECLARE @error_message nvarchar(255)

IF NOT EXISTS (SELECT idCliente FROM DATEROS.clientes WHERE (docTipo=@docTipo AND docNum=@docNro) OR (cuil=@cuil))
	BEGIN
		IF(@cuil LIKE '__-________-_')
			BEGIN
				BEGIN TRANSACTION
				BEGIN TRY
					SET @usuario = CONCAT(@apellido, @docNro)
					INSERT INTO DATEROS.usuario(username, password, estado)
						VALUES (@usuario, HASHBYTES('SHA2_256', '123'), 'Pausado')
					SET @error = 2
					INSERT INTO DATEROS.roles_usuario(idRol, username)
						VALUES(3, @usuario)
					SET @error = 3
					INSERT INTO DATEROS.clientes(nombre, apellido, docTipo, docNum, cuil, mail, telefono, direccion, nroPiso, depto, localidad, codPostal, fechaNac, fechaCreacion, username)
						VALUES (@nombre, @apellido, @docTipo, @docNro, @cuil, @mail, @telefono, @direccion, CASE WHEN @piso != '' THEN CAST(@piso AS numeric(18,0)) ELSE NULL END, @depto, @localidad, @codPostal, @fechaNac, @fechaCreacion, @usuario)
					COMMIT TRANSACTION
				END TRY
				BEGIN CATCH
					ROLLBACK TRANSACTION
					SET @error_message = (SELECT
					CASE @error
						WHEN 1 THEN 'Nombre de usuario repetido'
						WHEN 2 THEN 'Error creando el rol del usuario'
						ELSE 'Error creando el cliente'
					END)
					RAISERROR (@error_message, 16, 1)
				END CATCH
			END
		ELSE
			BEGIN
				RAISERROR ('CUIL Invalido', 16, 1)
			END
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el cliente', 16, 1)
	END
GO

CREATE PROCEDURE DATEROS.altaCliente
@nombre nvarchar(255),
@apellido nvarchar(255),
@docTipo nvarchar(255),
@docNro numeric(18,0),
@cuil nvarchar(255),
@mail nvarchar(255),
@telefono numeric(10,0),
@direccion nvarchar(255),
@piso nvarchar(255),
@depto nvarchar(255),
@localidad nvarchar(255),
@codPostal nvarchar(255),
@fechaNac datetime,
@fechaCreacion datetime,
@username nvarchar(255),
@rol numeric(18,0)
AS
DECLARE @error int = 1
DECLARE @error_message nvarchar(255)

IF NOT EXISTS (SELECT idCliente FROM DATEROS.clientes WHERE (docTipo=@docTipo AND docNum=@docNro) OR (cuil=@cuil))
	BEGIN
		IF(@cuil LIKE '__-________-_')
			BEGIN
				BEGIN TRANSACTION
				BEGIN TRY
					INSERT INTO DATEROS.roles_usuario(idRol, username)
						VALUES(@rol, @username)
					SET @error = 2
					INSERT INTO DATEROS.clientes(nombre, apellido, docTipo, docNum, cuil, mail, telefono, direccion, nroPiso, depto, localidad, codPostal, fechaNac, fechaCreacion, username)
						VALUES (@nombre, @apellido, @docTipo, @docNro, @cuil, @mail, @telefono, @direccion, CASE WHEN @piso != '' THEN CAST(@piso AS numeric(18,0)) ELSE NULL END, @depto, @localidad, @codPostal, @fechaNac, @fechaCreacion, @username)
					COMMIT TRANSACTION
				END TRY
				BEGIN CATCH
					ROLLBACK TRANSACTION
					SET @error_message = (SELECT
					CASE @error
						WHEN 1 THEN 'Error creando el rol del usuario'
						ELSE 'Error creando el cliente'
					END)
					RAISERROR (@error_message, 16, 1)
				END CATCH
			END
		ELSE
			BEGIN
				RAISERROR ('CUIL Invalido', 16, 1)
			END
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el cliente', 16, 1)
	END
GO


--Modificacion Cliente
CREATE PROCEDURE DATEROS.modificacionCliente
@docTipoActual nvarchar(255),
@docNumActual numeric(18,0),
@nombre nvarchar(255),
@apellido nvarchar(255),
@mail nvarchar(255),
@telefono numeric(10,0),
@direccion nvarchar(255),
@piso nvarchar(255),
@depto nvarchar(255),
@localidad nvarchar(255),
@codPostal nvarchar(255),
@fechaNac datetime,
@fechaCreacion datetime,
@nroTarjeta numeric(18,0),
@nombreTarjeta nvarchar(255),
@fechaVtoTarjeta datetime,
@banco nvarchar(255),
@marca nvarchar(255),
@cvv numeric(3,0)
AS

DECLARE @nroTarjetaActual numeric(18,0)
SET @nroTarjetaActual = (SELECT nroTarjeta FROM DATEROS.clientes WHERE docNum=@docNumActual AND docTipo=@docTipoActual)

	BEGIN
		UPDATE DATEROS.clientes SET nombre=@nombre, apellido=@apellido, mail=@mail, telefono=@telefono, direccion=@direccion, nroPiso=CASE WHEN @piso != '' THEN CAST(@piso AS numeric(18,0)) ELSE NULL END, depto=@depto, localidad=@localidad, codPostal=@codPostal, fechaNac=@fechaNac, fechaCreacion=@fechaCreacion WHERE docTipo=@docTipoActual AND docNum=@docNumActual
		UPDATE DATEROS.tarjeta SET nroTarjeta=@nroTarjeta, nombre=@nombreTarjeta, fechaVencimiento=@fechaVtoTarjeta, banco=@banco, marca=@marca, cvv=@cvv WHERE nroTarjeta=@nroTarjetaActual
	END
GO

CREATE PROCEDURE DATEROS.modifDocumentoCliente
@documentoActual numeric(18,0),
@tipoDocumentoActual nvarchar(255),
@nuevoDocumento numeric(18,0),
@nuevoTipoDocumento nvarchar(255)
AS
	IF NOT EXISTS (SELECT idCliente FROM DATEROS.clientes WHERE docTipo=@nuevoTipoDocumento AND docNum=@nuevoDocumento)
		BEGIN
			UPDATE DATEROS.clientes SET docTipo=@nuevoTipoDocumento, docNum=@nuevoDocumento WHERE docNum=@documentoActual AND docTipo=@tipoDocumentoActual
		END
	ELSE
		BEGIN
			 RAISERROR ('Ya existe un cliente con este Tipo y Numero de Documento.', 16, 1)
		END
GO

CREATE PROCEDURE DATEROS.modifCuilCliente
@documentoActual numeric(18,0),
@tipoDocumentoActual nvarchar(255),
@nuevoCuil nvarchar(255)
AS
DECLARE @cuilActual nvarchar(255)
SET @cuilActual = (SELECT cuil FROM DATEROS.clientes WHERE docNum=@documentoActual AND docTipo=@tipoDocumentoActual)

	IF NOT EXISTS (SELECT idCliente FROM DATEROS.clientes WHERE cuil=@nuevoCuil)
		BEGIN
			IF(@nuevoCuil LIKE '__-________-_')
				BEGIN
					UPDATE DATEROS.clientes SET cuil=@nuevoCuil WHERE cuil=@cuilActual
				END
			ELSE
				BEGIN
					RAISERROR ('CUIL Invalido.', 16, 1)
				END
		END
	ELSE
		BEGIN
			RAISERROR ('Ya existe un cliente con este CUIL.', 16, 1)
		END
GO

--Generar Publicacion
CREATE FUNCTION DATEROS.dameidPublicacion (@descripcion nvarchar(255), @direccion nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idPublicacion FROM dateros.publicacion WHERE descripcion=@descripcion AND direccion=@direccion)
END
GO

CREATE FUNCTION DATEROS.dameidGrado(@grado nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idGrado FROM dateros.grado WHERE prioridad=@grado)
END
GO

CREATE PROCEDURE DATEROS.generarPublicacion
@descripcion nvarchar(255),
@direccion nvarchar(255),
@rubro nvarchar(255),
@grado nvarchar(255),
@estado nvarchar(255),
@fechaCreacion datetime,
@username nvarchar(255)
AS

DECLARE @idRubro numeric(18,0), @idEstado numeric(18,0), @idGrado numeric(18,0)

IF NOT EXISTS (SELECT idPublicacion FROM DATEROS.publicacion WHERE descripcion=@descripcion AND direccion=@direccion)
	BEGIN

	SET @idRubro = (SELECT DATEROS.dameIdRubro(@rubro))
	SET @idEstado= (SELECT DATEROS.dameIdEstado(@estado))
	SET @idGrado = (SELECT DATEROS.dameIdGrado(@grado))

		INSERT INTO DATEROS.publicacion(descripcion, direccion, idRubro, idGrado, idEstado, fechaCreacion, username)
			VALUES (@descripcion, @direccion, @idRubro, @idGrado, @idEstado, @fechaCreacion, @username)
		END
ELSE
	BEGIN
		RAISERROR ('Ya existe la publicacion.', 16, 1)
	END
GO

CREATE PROCEDURE DATEROS.agregarFuncion
@descripcion nvarchar(255),
@direccion nvarchar(255),
@fechaFuncion datetime,
@fechaActual datetime
AS

DECLARE @idPublicacion numeric(18,0)
SET @idPublicacion = (SELECT DATEROS.dameidPublicacion(@descripcion, @direccion))
DECLARE @error varchar(30)
SET @error = CAST(@fechaFuncion AS varchar(30))
SET @fechaFuncion = CONVERT(datetime, DATEDIFF(d,0, @fechaFuncion))

IF(@fechaFuncion > @fechaActual)
BEGIN
	IF NOT EXISTS (SELECT idFuncion FROM DATEROS.funcion WHERE idPublicacion=@idPublicacion AND fechaHora=@fechaFuncion)
		BEGIN
			DECLARE @funcionMasActual DateTime;
			SET @funcionMasActual = (SELECT MAX(fechaHora) FROM DATEROS.funcion WHERE idPublicacion = @idPublicacion)
	
			IF(@funcionMasActual IS NULL)
				BEGIN
					INSERT INTO DATEROS.funcion(idPublicacion, fechaHora)
						VALUES (@idPublicacion, @fechaFuncion)
				END
			ELSE
				BEGIN
					IF((@fechaFuncion > @funcionMasActual))
						BEGIN 
							INSERT INTO DATEROS.funcion(idPublicacion, fechaHora)
								VALUES (@idPublicacion, @fechaFuncion)
						END
					ELSE
						BEGIN
							RAISERROR ('Ya existe una funcion con una fecha posterior a %s.', 16, 1, @error)
						END
				END
		END
	ELSE
		BEGIN
			RAISERROR ('Ya existe una funcion para la fecha %s.', 16, 1, @error)
		END
END
ELSE
	BEGIN
		RAISERROR ('No esta permitido ingresar una funcion con fecha anterior a la actual.', 16, 1)
	END
GO

--Agregar Ubicacion
CREATE FUNCTION DATEROS.dameIdTipoUbicacion(@tipo nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idTipoUbicacion FROM dateros.tipoUbicacion WHERE descripcion=@tipo)
END
GO

CREATE FUNCTION DATEROS.dameIdUbicacion(@tipoUbicacion numeric(18,0), @fila varchar(3), @asiento numeric(18,0), @precio numeric(18,2))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idUbicacion FROM DATEROS.ubicacion WHERE idTipoUbicacion=@tipoUbicacion AND fila=@fila AND asiento=@asiento AND precio=@precio)
END
GO

CREATE FUNCTION DATEROS.dameIdFuncion(@fechaFuncion datetime, @idPublicacion numeric(18,0))
RETURNS numeric(18,0)
AS
BEGIN 
	RETURN (SELECT idFuncion FROM DATEROS.funcion WHERE fechaHora=(SELECT CONVERT (datetime, DATEDIFF(d, 0, CONVERT(datetime, @fechaFuncion, 111)), 102)) AND idPublicacion=@idPublicacion)
END
GO

CREATE PROCEDURE DATEROS.agregarUbicacion
@idPublicacion numeric(18,0),
@fechaFuncion datetime,
@tipoUbicacion nvarchar(255),
@fila varchar(3),
@asiento numeric(18,0),
@precio numeric(18,2)
AS

DECLARE @idTipoUbicacion numeric(18,0)
DECLARE @idFuncion numeric(18,0)
DECLARE @idUbicacion numeric(18,0)
SET @idTipoUbicacion = (SELECT DATEROS.dameIdTipoUbicacion(@tipoUbicacion))
SET @idFuncion = (SELECT DATEROS.dameidFuncion(@fechaFuncion, @idPublicacion))
SET @idUbicacion = (SELECT DATEROS.dameIdUbicacion(@idTipoUbicacion, @fila, @asiento, @precio))


IF(@precio >= 0)
	BEGIN
	IF(@idUbicacion IS NULL)
		BEGIN
			INSERT INTO DATEROS.ubicacion(idTipoUbicacion, fila, asiento, precio)
				VALUES (@idTipoUbicacion, @fila, @asiento, @precio)
			SET @idUbicacion = (SELECT DATEROS.dameIdUbicacion(@idTipoUbicacion, @fila, @asiento, @precio))
			INSERT INTO DATEROS.funcion_ubicacion(idFuncion, idUbicacion, vendido)
				VALUES (@idFuncion, @idUbicacion, 0)
		END
	ELSE
		BEGIN
			IF ((NOT EXISTS (SELECT * FROM DATEROS.funcion_ubicacion WHERE idUbicacion=@idUbicacion AND idFuncion=@idFuncion)))
				BEGIN
					INSERT INTO DATEROS.funcion_ubicacion(idFuncion, idUbicacion, vendido)
						VALUES (@idFuncion, @idUbicacion, 0)
				END
			ELSE
				BEGIN
					RAISERROR ('Ya existe la ubicacion.', 16, 1)
				END
		END
	END
ELSE
	BEGIN
		RAISERROR ('No esta permitido ingresar precios negativos.', 16, 1)
	END
GO

--Modificacion Publicacion
CREATE PROCEDURE DATEROS.modificacionDescripcion
@descActual nvarchar(255),
@dirActual nvarchar(255),
@nuevaDesc nvarchar(255)
AS
	IF NOT EXISTS (SELECT idPublicacion FROM DATEROS.publicacion WHERE descripcion=@nuevaDesc AND direccion=@dirActual)
		BEGIN
			UPDATE DATEROS.publicacion SET descripcion=@nuevaDesc WHERE descripcion=@descActual AND direccion=@dirActual
		END
	ELSE
		BEGIN
			 RAISERROR ('Ya existe una publicacion con esta descripcion y direccion.', 16, 1)
		END
GO

CREATE PROCEDURE DATEROS.modificacionDireccion
@descActual nvarchar(255),
@dirActual nvarchar(255),
@nuevaDir nvarchar(255)
AS
	IF NOT EXISTS (SELECT idPublicacion FROM DATEROS.publicacion WHERE descripcion=@descActual AND direccion=@nuevaDir)
		BEGIN
			UPDATE DATEROS.publicacion SET direccion=@nuevaDir WHERE descripcion=@descActual AND direccion=@dirActual
		END
	ELSE
		BEGIN
			 RAISERROR ('Ya existe una publicacion con esta descripcion y direccion.', 16, 1)
		END
GO

--Publicar Publicacion
CREATE PROCEDURE DATEROS.publicar
@descripcion nvarchar(255),
@direccion nvarchar(255)
AS
			UPDATE DATEROS.publicacion SET idEstado=2 WHERE descripcion=@descripcion AND direccion=@direccion
GO

--Baja Funcion
CREATE PROCEDURE DATEROS.bajaFuncion
@descripcion nvarchar(255),
@direccion nvarchar(255),
@funcion datetime
AS

DECLARE @idPublicacion numeric(18,0)
SET @idPublicacion = (SELECT DATEROS.dameidPublicacion(@descripcion, @direccion))
	
	BEGIN
		DELETE FROM DATEROS.funcion WHERE idPublicacion=@idPublicacion AND fechaHora=@funcion
	END
GO

--Modificacion Rubro
CREATE PROCEDURE DATEROS.modificacionRubro
@descripcion nvarchar(255),
@direccion nvarchar(255),
@rubro nvarchar(255)
AS

DECLARE @idRubro numeric(18,0)
SET @idRubro = (SELECT DATEROS.dameIdRubro(@rubro))

	BEGIN
		UPDATE DATEROS.publicacion SET idRubro=@idRubro WHERE descripcion=@descripcion AND direccion=@direccion
	END
GO

--Modificacion Grado
CREATE PROCEDURE DATEROS.modificacionGrado
@descripcion nvarchar(255),
@direccion nvarchar(255),
@grado nvarchar(255)
AS

DECLARE @idGrado numeric(18,0)
SET @idGrado = (SELECT DATEROS.dameidGrado(@grado))

	BEGIN
		UPDATE DATEROS.publicacion SET idGrado=@idGrado WHERE descripcion=@descripcion AND direccion=@direccion
	END
GO

--Baja Ubicacion
CREATE PROCEDURE DATEROS.bajaUbicacion
@idFuncion numeric(18,0),
@ubicacion numeric(18,0)
AS
	BEGIN
		DELETE FROM DATEROS.funcion_ubicacion WHERE idFuncion=@idFuncion AND idUbicacion=@ubicacion
	END
GO

--Alta Tarjeta
CREATE PROCEDURE DATEROS.altaTarjeta
@username nvarchar(255),
@nroTarjeta numeric(18,0),
@nombre nvarchar(255),
@fechaVencimiento datetime,
@banco nvarchar(255),
@marca nvarchar(255),
@cvv numeric(33,0)
AS
IF NOT EXISTS (SELECT nroTarjeta FROM DATEROS.tarjeta WHERE @nroTarjeta=nroTarjeta)
	BEGIN
		INSERT INTO DATEROS.tarjeta(nroTarjeta, nombre, fechaVencimiento, banco, marca, cvv)
			VALUES (@nroTarjeta, @nombre, @fechaVencimiento, @banco, @marca, @cvv)
		UPDATE DATEROS.clientes SET nroTarjeta=@nroTarjeta WHERE username=@username
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe la tarjeta.', 16, 1)
	END
GO

--Compras
CREATE FUNCTION DATEROS.dameIdCompra(@idCliente numeric(18,0), @fecha datetime)
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idCompra FROM DATEROS.compra WHERE idCliente=@idCliente AND fecha=@fecha)
END
GO

CREATE PROCEDURE DATEROS.comprar
@idCliente numeric(18,0),
@fecha datetime,
@idUbicacion numeric(18,0),
@idFuncion numeric(18,0)
AS

DECLARE @idCompra numeric(18,0)
DECLARE @puntaje numeric(18,0)
SET @idCompra = (SELECT DATEROS.dameIdCompra(@idCliente, @fecha))
SET @puntaje = (SELECT FLOOR(precio*10/100) FROM DATEROS.ubicacion WHERE idUbicacion=@idUbicacion)

	BEGIN
		IF (@idCompra IS NULL)
			BEGIN
				INSERT INTO DATEROS.compra(idCliente, fecha, metodoDePago, puntaje)
					VALUES (@idCliente, @fecha, 'Tarjeta de Credito', 0)
				SET @idCompra = (SELECT DATEROS.dameIdCompra(@idCliente, @fecha))
				UPDATE DATEROS.funcion_ubicacion SET vendido=1, idCompra=@idCompra WHERE idFuncion=@idFuncion AND idUbicacion=@idUbicacion
				UPDATE DATEROS.compra SET puntaje = @puntaje WHERE idCompra=@idCompra
			END
		ELSE
			BEGIN
				UPDATE DATEROS.funcion_ubicacion SET vendido=1, idCompra=@idCompra WHERE idFuncion=@idFuncion AND idUbicacion=@idUbicacion
				UPDATE DATEROS.compra SET puntaje += @puntaje WHERE idCompra=@idCompra
			END
		IF NOT EXISTS (SELECT * FROM DATEROS.puntosTrimestralesClientes WHERE anio=YEAR(@fecha) AND trimestre=DATEPART(QUARTER, @fecha))
			BEGIN 
				INSERT INTO DATEROS.puntosTrimestralesClientes(idCliente,anio, trimestre, puntos)
					VALUES(@idCliente, YEAR(@fecha), DATEPART(QUARTER, @fecha), @puntaje)
			END
		ELSE
			BEGIN
				UPDATE DATEROS.puntosTrimestralesClientes SET puntos += @puntaje WHERE idCliente=@idCliente AND trimestre=DATEPART(QUARTER, @fecha) AND anio=YEAR(@fecha)
			END		
	END
GO

--MIGRACION DESDE LA TABLA MAESTRA

--CREACIÓN DE ROLES (3: administrativo, empresa y cliente)
INSERT INTO DATEROS.rol
VALUES ('Administrativo'),
	   ('Empresa'),
	   ('Cliente')
GO

--CREACIÓN DE FUNCIONALIDADES (14)
INSERT INTO DATEROS.funcionalidad
VALUES ('ABM de Rol'),
	   ('Registro de Usuario'),
	   ('ABM de Cliente'),
	   ('ABM de Empresa'),
	   ('ABM de Rubro'),
	   ('ABM de Grado de Publicación'),
	   ('Generar Publicación'),
	   ('Editar Publicación'),
	   ('Comprar'),
	   ('Historial del Cliente'),
	   ('Canje y Administración de Puntos'),
	   ('Generar Pago de Comisiones'),
	   ('Listado Estadístico')
GO

--ASIGNACIÓN DE FUNCIONALIDADES A ROLES
INSERT INTO DATEROS.funcionalidad_rol
VALUES (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12), (1, 13), (2, 2), (2, 5), (2, 6), (2, 7), (2, 8), (3, 2), (3, 9), (3, 10), (3, 11)
GO

--CREACIÓN DEL USUARIO admin Y ASIGNACIÓN DEL ROL CORRESPONDIENTE
INSERT INTO DATEROS.usuario (username, password)
	VALUES ('admin', HASHBYTES('SHA2_256','w23e'))
GO
INSERT INTO DATEROS.roles_usuario
	VALUES ('admin', 1)
GO

--MIGRACIÓN de los TIPOS DE UBICACIÓN
INSERT INTO DATEROS.tipoUbicacion
	SELECT DISTINCT Ubicacion_Tipo_Codigo, Ubicacion_Tipo_Descripcion FROM gd_esquema.Maestra
GO

--Migración de usuarios tipo empresa...
	INSERT INTO DATEROS.usuario 
		SELECT DISTINCT REPLACE(REPLACE(Espec_Empresa_Razon_Social, ' ', ''), 'Nº:', ''),
			   HASHBYTES('SHA2_256', '123'),
			   'Pausado'
		FROM gd_esquema.Maestra
	GO
	--... y su respectiva asignación de roles
	INSERT INTO DATEROS.roles_usuario
		SELECT DISTINCT REPLACE(REPLACE(Espec_Empresa_Razon_Social, ' ', ''), 'Nº:', ''),
			   2
		FROM gd_esquema.Maestra
	GO

--Migración de usuarios tipo cliente...
	INSERT INTO DATEROS.usuario
		SELECT DISTINCT REPLACE(Cli_Apeliido + Cli_Nombre + Cli_Cod_Postal, ' ',''),
			   HASHBYTES('SHA2_256','123'),
			   'Pausado'
		FROM gd_esquema.Maestra
		WHERE Cli_Dni IS NOT NULL
	GO
	--... y su respectiva asignación de roles
	INSERT INTO DATEROS.roles_usuario
		SELECT DISTINCT REPLACE(Cli_Apeliido + Cli_Nombre + Cli_Cod_Postal, ' ',''),
			   3
		FROM gd_esquema.Maestra
		WHERE Cli_Dni IS NOT NULL
	GO

--MIGRACIÓN de CLIENTES
INSERT INTO DATEROS.clientes (username, nombre, apellido, docTipo, docNum, mail, direccion, nroPiso, depto, codPostal, fechaNac, fechaCreacion)
	SELECT DISTINCT REPLACE(Cli_Apeliido + Cli_Nombre + Cli_Cod_Postal, ' ',''),
			Cli_Nombre,
			Cli_Apeliido,
			'DNI',
			Cli_Dni,
			Cli_Mail,
			DATEROS.armarDireccion (Cli_Dom_Calle, Cli_Nro_Calle),
			Cli_Piso,
			Cli_Depto,
			Cli_Cod_Postal,
			Cli_Fecha_Nac,
			GETDATE()
	FROM gd_esquema.Maestra
	WHERE Cli_Apeliido IS NOT NULL
GO

--MIGRACION de EMPRESAS
INSERT INTO DATEROS.empresas (username, razonSocial, mail, direccion, nroPiso, depto, codPostal, fechaCreacion, cuit)
	SELECT DISTINCT REPLACE(REPLACE(Espec_Empresa_Razon_Social, ' ', ''), 'Nº:', ''),
		   Espec_Empresa_Razon_Social,
		   Espec_Empresa_Mail,
		   DATEROS.armarDireccion (Espec_Empresa_Dom_Calle, Espec_Empresa_Nro_Calle),
		   Espec_Empresa_Piso,
		   Espec_Empresa_Depto,
		   Espec_Empresa_Cod_Postal,
		   Espec_Empresa_Fecha_Creacion,
		   Espec_Empresa_Cuit
	FROM gd_esquema.Maestra
GO

--CREACIÓN de GRADOS DE PUBLICACIÓN
INSERT INTO DATEROS.grado (prioridad, porcentaje, estado)
	VALUES ('Alta', 0.15, 1),
		   ('Media', 0.10, 1),
		   ('Baja', 0.05, 1)
GO

--CREACIÓN de los RUBROS DE LOS ESPECTÁCULOS
INSERT INTO DATEROS.rubro
	SELECT DISTINCT Espectaculo_Rubro_Descripcion
	FROM gd_esquema.Maestra
GO

--CREACIÓN de los ESTADOS DE LAS PUBLICACIONES
INSERT INTO DATEROS.estados
	VALUES ('Borrador'),
		   ('Publicada'),
		   ('Finalizada')
GO

--MIGRACION COMPRAS
EXEC DATEROS.migracionCompras
GO

--MIGRACION FACTURAS
EXEC DATEROS.migracionFacturas
GO

--MIGRACION ITEM_FACTURA
INSERT INTO DATEROS.itemFactura(nroFactura, idCompra, cant, descripcion, monto)
	SELECT DISTINCT (SELECT DATEROS.dameIdFactura(Factura_Nro)), idCompra, Item_Factura_Cantidad, Item_Factura_Descripcion, Item_Factura_Monto 
	FROM gd_esquema.Maestra, DATEROS.compra
	WHERE Factura_Nro IS NOT NULL AND fecha=Compra_Fecha AND metodoDePago=Forma_Pago_Desc AND idCliente=(SELECT DATEROS.dameIdCliente(cli_dni, cli_mail))
GO

--MIGRACION PUBLICACIONES
SET IDENTITY_INSERT DATEROS.publicacion ON
GO

INSERT INTO DATEROS.publicacion(idPublicacion, descripcion, fechaCreacion, idRubro, idEstado)
	SELECT DISTINCT Espectaculo_Cod, Espectaculo_Descripcion, Espectaculo_Fecha, (SELECT DATEROS.dameIdRubro(Espectaculo_Rubro_Descripcion)), (SELECT DATEROS.dameIdEstado(Espectaculo_Estado)) FROM gd_esquema.Maestra
GO

SET IDENTITY_INSERT DATEROS.publicacion OFF
GO

--MIGRACION FUNCION
INSERT INTO DATEROS.funcion(idPublicacion, fechaHora)
	SELECT DISTINCT Espectaculo_Cod, Espectaculo_Fecha_Venc FROM gd_esquema.Maestra
GO

--MIGRACION UBICACION
INSERT INTO DATEROS.ubicacion(idTipoUbicacion, fila, asiento, precio)
	SELECT DISTINCT Ubicacion_Tipo_Codigo, Ubicacion_Fila, Ubicacion_Asiento, Ubicacion_Precio FROM gd_esquema.Maestra
GO

--MIGRACION COMPRA_PUBLICACION
INSERT INTO DATEROS.compra_publicacion(idCompra, idPublicacion)
	SELECT DISTINCT idCompra, idPublicacion FROM DATEROS.publicacion p, DATEROS.compra c, gd_esquema.Maestra m WHERE m.Espectaculo_Cod=p.idPublicacion AND c.idCliente=(SELECT DATEROS.dameIdCliente(Cli_Dni, Cli_Mail)) AND c.fecha=m.Compra_Fecha AND c.metodoDePago=m.Forma_Pago_Desc
GO

--CREACIÓN DE ALGUNOS PREMIOS para probar...
INSERT INTO DATEROS.premios (descripcion, puntosNecesarios)
	VALUES ('Oso de peluche chico', 100),
		   ('Caja de chocolates en rama', 150),
		   ('Oso de peluche mediano', 300),
		   ('Oso de peluche gigante', 500),
		   ('Perfume francés', 600),
		   ('Selfie con Diego Peretti', 800)
GO

--CREACIÓN DE ALGUNOS RUBROS para probar...
INSERT INTO DATEROS.rubro (descripcion)
		VALUES ('Teatro'), ('Musical - Concierto'), ('Cine - TV'), ('Danza'), ('Deportes')
GO
