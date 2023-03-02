--CREACION DEL ESQUEMA
CREATE SCHEMA DEVOLVESELA_A_MESSI 
GO

--CREACION DE PROCEDURES Y FUNCIONES

--ABM Clientes

--Alta Cliente
CREATE PROCEDURE DEVOLVESELA_A_MESSI.crearCliente

@nom nvarchar(255),
@ape nvarchar(255),
@tipoID nvarchar(255),
@numID numeric(18,0),
@mail nvarchar(255),
@fechaNac varchar(255),
@telefono numeric(18,0),
@domicilio nvarchar(255),
@piso numeric(18,0),
@depto nvarchar(255),
@localidad nvarchar(255),
@paisOrigen nvarchar(255),
@nacionalidad nvarchar(255)

AS
IF NOT EXISTS (SELECT mail, numID FROM DEVOLVESELA_A_MESSI.cliente WHERE @mail=mail OR @numID = numID)
	BEGIN
		INSERT INTO DEVOLVESELA_A_MESSI.cliente (nombre, apellido, tipoID, numID, mail, fechaNac, telefono, domicilio, piso, depto, localidad, paisOrigen, nacionalidad)
			VALUES (@nom, @ape, @tipoID, @numID, @mail, @fechaNac, @telefono, @domicilio, @piso, @depto, @localidad, @paisOrigen, @nacionalidad)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el cliente', 16, 1)
	END
GO

--Modificacion Cliente
CREATE PROCEDURE DEVOLVESELA_A_MESSI.modificarCliente
@numID numeric(18,0),
@mail nvarchar(255),
@nom nvarchar(255),
@ape nvarchar(255),
@tipoID nvarchar(255),
@telefono numeric(18,0),
@domicilio nvarchar(255),
@piso numeric(18,0),
@depto nvarchar(255),
@localidad nvarchar(255),
@paisOrigen nvarchar(255),
@nacionalidad nvarchar(255),
@fechaNac datetime
AS
IF EXISTS (SELECT numID, mail FROM DEVOLVESELA_A_MESSI.cliente WHERE numID=@numID OR mail=@mail)
BEGIN
		UPDATE DEVOLVESELA_A_MESSI.cliente SET nombre = @nom, tipoID = @tipoID, telefono=@telefono, domicilio=@domicilio, piso=@piso, depto=@depto, localidad=@localidad, paisOrigen=@paisOrigen, nacionalidad=@nacionalidad, fechaNac = @fechaNac WHERE numID=@numID OR mail=@mail
	END
ELSE
	BEGIN
		 RAISERROR ('No se ha podido modificar el cliente.', 16, 1)
	END
GO

--Baja Cliente
CREATE PROCEDURE DEVOLVESELA_A_MESSI.bajaCliente

@numID numeric(18,0),
@mail nvarchar(255)

AS
IF EXISTS (SELECT numID, mail FROM DEVOLVESELA_A_MESSI.cliente WHERE numID=@numID OR mail=@mail)
BEGIN
		INSERT INTO DEVOLVESELA_A_MESSI.clienteInhabilitado (mail, numID)
			VALUES (@mail, @numID)
	END
ELSE
	BEGIN
		 RAISERROR ('No se ha podido eliminar el cliente.', 16, 1)
	END
GO

--ABM Hotel

--Alta Hotel
CREATE PROCEDURE DEVOLVESELA_A_MESSI.altaHotel

@nombre nvarchar(255),
@mail nvarchar(255),
@telefono numeric(18,0),
@direccion nvarchar(255),
@cantEstrellas numeric(18,0),
@recargaEstrella numeric(18,0),
@ciudad nvarchar(255),
@pais nvarchar(255),
@fechaCreacion datetime
AS
IF NOT EXISTS (SELECT nombre, direccion, ciudad FROM DEVOLVESELA_A_MESSI.hotel WHERE @nombre=nombre AND @direccion=direccion AND @ciudad=ciudad)
	BEGIN
		INSERT INTO DEVOLVESELA_A_MESSI.hotel (nombre, mail, telefono, direccion, cantEstrellas, recargaEstrella, ciudad, pais, fechaCreacion)
			VALUES (@nombre, @mail, @telefono, @direccion, @cantEstrellas, @recargaEstrella, @ciudad, @pais, @fechaCreacion)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el hotel.', 16, 1)
	END
GO

CREATE PROCEDURE DEVOLVESELA_A_MESSI.asignarHotelRegimen
@direccion nvarchar(255),
@codRegimen numeric(18,0)
AS
BEGIN 	
	DECLARE	@idHotel numeric(18,0)
	SET @idHotel = (SELECT DEVOLVESELA_A_MESSI.dameidHotel(@direccion));
	INSERT INTO DEVOLVESELA_A_MESSI.hotelRegimen(idHotel, codRegimen)
		VALUES(@idHotel, @codRegimen)
END
GO

--Baja Hotel
CREATE PROCEDURE DEVOLVESELA_A_MESSI.bajaHotel
@idHotel numeric(18,0)
AS
IF EXISTS (SELECT idHotel FROM DEVOLVESELA_A_MESSI.hotel WHERE @idHotel=idHotel)
BEGIN
		INSERT INTO DEVOLVESELA_A_MESSI.hotelBaja(idHotel)
			VALUES (@idHotel)
	END
ELSE
	BEGIN
		 RAISERROR ('No se ha podido eliminar el hotel.', 16, 1)
	END
GO

--ABM Habitacion

--Alta Habitacion
CREATE PROCEDURE DEVOLVESELA_A_MESSI.altaHabitacion

@numero numeric(18,0),
@piso numeric(18,0),
@ubicacion nvarchar(255),
@descripcion nvarchar(255),
@enMantenimiento bit,
@direccion nvarchar(255)
AS
IF NOT EXISTS (SELECT numero, piso, ubicacion FROM DEVOLVESELA_A_MESSI.habitacion WHERE @numero=numero AND @piso=piso AND @ubicacion=ubicacion)
	BEGIN
		DECLARE @idHotel numeric(18,0)
		DECLARE  @idHabitacion numeric(18,0)
		DECLARE @tipoHabitacion numeric(18,0)
		SET @tipoHabitacion = (SELECT DEVOLVESELA_A_MESSI.dameTipoHabitacion(@descripcion))
		
		INSERT INTO DEVOLVESELA_A_MESSI.habitacion (numero, piso, ubicacion, tipoHabitacion, enMantenimiento)
			VALUES (@numero, @piso, @ubicacion, @tipoHabitacion, @enMantenimiento)

		SET @idHotel = (SELECT DEVOLVESELA_A_MESSI.dameIdHotel(@direccion))
		SET @idHabitacion = (SELECT DEVOLVESELA_A_MESSI.dameIdHabitacion(@numero, @piso, @ubicacion, @tipoHabitacion))

		INSERT INTO DEVOLVESELA_A_MESSI.hotelHabitacion (idHotel, idHabitacion)
			VALUES (@idHotel, @idHabitacion)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe la habitacion.', 16, 1)
	END
GO

CREATE FUNCTION DEVOLVESELA_A_MESSI.dameTipoHabitacion (@descripcion nvarchar(255))
RETURNS numeric (18,0)
AS
BEGIN
	RETURN (SELECT tipoHabitacion FROM DEVOLVESELA_A_MESSI.tipoHabitacion WHERE descripcion=@descripcion)
END
GO

CREATE FUNCTION DEVOLVESELA_A_MESSI.dameIdHotel (@direccion nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idHotel FROM DEVOLVESELA_A_MESSI.hotel WHERE direccion=@direccion)
END
GO

CREATE FUNCTION DEVOLVESELA_A_MESSI.dameIdHabitacion (@numero numeric(18,0), @piso numeric(18,0), @ubicacion nvarchar(255), @tipoHabitacion numeric(18,0))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idHabitacion FROM DEVOLVESELA_A_MESSI.habitacion WHERE numero=@numero AND piso=@piso AND ubicacion=@ubicacion AND tipoHabitacion=@tipoHabitacion)
END
GO

--Modificacion Habitacion
CREATE PROCEDURE DEVOLVESELA_A_MESSI.modificarHabitacion
@idHabitacion numeric(18,0),
@numero numeric(18,0),
@piso numeric(18,0),
@ubicacion nvarchar(255)

AS
IF EXISTS (SELECT idHabitacion FROM DEVOLVESELA_A_MESSI.habitacion WHERE idHabitacion=@idHabitacion)
BEGIN
		UPDATE DEVOLVESELA_A_MESSI.habitacion SET numero=@numero, piso=@piso, ubicacion=@ubicacion WHERE idHabitacion=@idHabitacion
	END
ELSE
	BEGIN
		 RAISERROR ('No se ha podido modificar la habitacion.', 16, 1)
	END
GO

--Baja Habitacion
CREATE PROCEDURE DEVOLVESELA_A_MESSI.bajaHabitacion
@idHabitacion numeric(18,0)
AS
UPDATE DEVOLVESELA_A_MESSI.habitacion SET estado=0 WHERE idHabitacion=@idHabitacion
GO

--ABM Rol

--Alta Rol
CREATE PROCEDURE DEVOLVESELA_A_MESSI.altaRol
@rol nvarchar(255),
@estado bit
AS
IF NOT EXISTS (SELECT rol FROM DEVOLVESELA_A_MESSI.rol WHERE @rol=rol)
	BEGIN
		INSERT INTO DEVOLVESELA_A_MESSI.rol (rol, estado)
			VALUES (@rol, @estado)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el rol.', 16, 1)
	END
GO

CREATE PROCEDURE DEVOLVESELA_A_MESSI.asignarFuncRol
@rol nvarchar(255),
@func nvarchar(255)
AS
BEGIN 	
	DECLARE	@codigo int
	SET @codigo = (SELECT DEVOLVESELA_A_MESSI.dameCodFuncionalidad (@func));
	INSERT INTO DEVOLVESELA_A_MESSI.rolFuncionalidad(rol, codFunc)
		VALUES(@rol, @codigo)
END
GO

CREATE FUNCTION DEVOLVESELA_A_MESSI.dameCodFuncionalidad (@desc nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT codFunc FROM DEVOLVESELA_A_MESSI.funcionalidadNombre WHERE @desc=nombreFunc)
END
GO

--Modificacion Rol
CREATE PROCEDURE DEVOLVESELA_A_MESSI.agregarFuncionalidad
@funcionalidad nvarchar(255),
@rol nvarchar(255)
AS
	INSERT INTO DEVOLVESELA_A_MESSI.rolFuncionalidad(rol, codFunc)
		SELECT rol, codFunc 
		FROM DEVOLVESELA_A_MESSI.rol r, DEVOLVESELA_A_MESSI.funcionalidadNombre fn
		WHERE @rol=r.rol AND fn.nombreFunc=@funcionalidad
GO

CREATE PROCEDURE DEVOLVESELA_A_MESSI.quitarFuncionalidad
@funcionalidad nvarchar(255),
@rol nvarchar(255)
AS
	DELETE FROM DEVOLVESELA_A_MESSI.rolFuncionalidad WHERE codFunc=(SELECT(DEVOLVESELA_A_MESSI.dameCodFuncionalidad(@funcionalidad))) AND @rol=rol
GO

CREATE PROCEDURE DEVOLVESELA_A_MESSI.habilitarRol
@rol nvarchar(255)
AS
	UPDATE DEVOLVESELA_A_MESSI.rol SET estado=1
GO

--Baja Rol
CREATE PROCEDURE DEVOLVESELA_A_MESSI.bajaRol
@rol nvarchar(255)
AS
UPDATE DEVOLVESELA_A_MESSI.rol SET estado=0 WHERE rol=@rol
GO

--ABM De Usuario

--Alta Usuario
CREATE PROCEDURE DEVOLVESELA_A_MESSI.altaUsuario
@username nvarchar(255),
@password nvarchar(255),
@nombre nvarchar(255),
@apellido nvarchar(255),
@tipoDoc nvarchar(255),
@numDoc numeric(18,0),
@mail nvarchar(255),
@telefono numeric(18,0),
@direccion nvarchar(255),
@fechaNac datetime	
AS
DECLARE @idUsuario numeric(18,0)
IF NOT EXISTS (SELECT username FROM DEVOLVESELA_A_MESSI.usuarioLogin WHERE @username=username)
	BEGIN
		INSERT INTO DEVOLVESELA_A_MESSI.usuarioLogin (username, password)
			VALUES (@username, @password)
		SET @idUsuario = (SELECT DEVOLVESELA_A_MESSI.dameidUsuario(@username))
		INSERT INTO DEVOLVESELA_A_MESSI.usuarioDatosPersonales (idUsuario, nombre, apellido, tipoDoc, numDoc, mail, telefono, direccion, fechaNac)
			VALUES (@idUsuario, @nombre, @apellido, @tipoDoc, @numDoc, @mail, @telefono, @direccion, @fechaNac)
	END
ELSE
	BEGIN
		 RAISERROR ('Ya existe el usuario.', 16, 1)
	END
GO

CREATE PROCEDURE DEVOLVESELA_A_MESSI.asignarUsuarioHotel
@idHotel numeric(18,0),
@usuario nvarchar(255)
AS
BEGIN 	
	DECLARE @idUsuario numeric(18,0)
	SET @idUsuario = (SELECT DEVOLVESELA_A_MESSI.dameidUsuario(@usuario));
	INSERT INTO DEVOLVESELA_A_MESSI.hotelPorUsuario(idHotel, idUsuario)
		VALUES(@idHotel, @idUsuario);
END
GO

CREATE PROCEDURE DEVOLVESELA_A_MESSI.asignarUsuarioRol
@username nvarchar(255),
@rol nvarchar(255)
AS
BEGIN 	
	DECLARE	@idUsuario numeric(18,0)
	SET @idUsuario = (SELECT DEVOLVESELA_A_MESSI.dameidUsuario(@username));
	INSERT INTO DEVOLVESELA_A_MESSI.rolPorUsuario(rol, idUsuario)
		VALUES(@rol, @idUsuario)
END
GO

CREATE FUNCTION DEVOLVESELA_A_MESSI.dameidUsuario (@username nvarchar(255))
RETURNS numeric(18,0)
AS
BEGIN
	RETURN (SELECT idUsuario FROM DEVOLVESELA_A_MESSI.usuarioLogin WHERE @username=username)
END
GO

--Baja Usuario
CREATE PROCEDURE DEVOLVESELA_A_MESSI.bajaUsuario
@idUsuario numeric(18,0)
AS
UPDATE DEVOLVESELA_A_MESSI.usuarioLogin SET estado=0 WHERE idUsuario=@idUsuario
GO

--CREACION DE TABLAS

CREATE TABLE DEVOLVESELA_A_MESSI.hotel
    (idHotel numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
    nombre nvarchar(255),
    mail nvarchar(255),
    telefono numeric(18,0),
    direccion nvarchar(255),
    cantEstrellas numeric(18,0),
    recargaEstrella numeric(18,0),
    ciudad nvarchar(255),
    pais nvarchar(255),
    fechaCreacion datetime
    )

CREATE TABLE DEVOLVESELA_A_MESSI.regimen
    (codRegimen numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
    precioBase numeric(18,2),
    descripcion nvarchar(255),
    estado bit
    )

CREATE TABLE DEVOLVESELA_A_MESSI.usuarioLogin
    (idUsuario numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
    username nvarchar(255),
    password nvarchar(255),
    cantIngresosFallidos numeric(18,0),
	estado bit DEFAULT 1
    )

CREATE TABLE DEVOLVESELA_A_MESSI.cliente
    (numID numeric(18,0),
    mail nvarchar(255),
    apellido nvarchar(255),
    nombre nvarchar(255),
    tipoID nvarchar(255),
    fechaNac datetime,
    telefono numeric(18,0),
    domicilio nvarchar(255),
    piso numeric(18,0),
    depto nvarchar(255),
    localidad nvarchar(255),
    paisOrigen nvarchar(255),
    nacionalidad nvarchar(255),
	PRIMARY KEY (numID, mail)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.tipoHabitacion
    (tipoHabitacion numeric(18,0) PRIMARY KEY,
    descripcion nvarchar(255),
    porcentual numeric(18,2)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.habitacion
    (idHabitacion numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
    tipoHabitacion numeric(18,0) NOT NULL REFERENCES DEVOLVESELA_A_MESSI.tipoHabitacion,
    numero numeric(18,0),
    piso numeric(18,0),
    ubicacion nvarchar(255),
    enMantenimiento bit DEFAULT 0,
	estado bit DEFAULT 1
    )

CREATE TABLE DEVOLVESELA_A_MESSI.estadoReserva
    (estadoReserva nvarchar(255) PRIMARY KEY,
    leyendaEstado nvarchar(255)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.reserva
    (idReserva numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
    idHotel numeric(18,0),
    codRegimen numeric(18,0),
    tipoHabitacion numeric(18,0),
    idUsuario numeric(18,0),
	numID numeric(18,0),
    mail nvarchar(255),
    fechaInicio datetime,
    fechaDesde datetime,
    fechaHasta datetime,
    estadoReserva nvarchar(255),
    costoTotalReserva numeric(18,2),
	FOREIGN KEY (numID, mail) REFERENCES DEVOLVESELA_A_MESSI.cliente (numID, mail),
	FOREIGN KEY (idHotel) REFERENCES DEVOLVESELA_A_MESSI.hotel,
	FOREIGN KEY (codRegimen) REFERENCES DEVOLVESELA_A_MESSI.regimen,
	FOREIGN KEY (tipoHabitacion) REFERENCES DEVOLVESELA_A_MESSI.tipoHabitacion,
	FOREIGN KEY (idUsuario) REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
	FOREIGN KEY (estadoReserva) REFERENCES DEVOLVESELA_A_MESSI.estadoReserva
    )

CREATE TABLE DEVOLVESELA_A_MESSI.habitacionReserva
    (idHabitacion numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.habitacion,
    idReserva numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.reserva
    )

CREATE TABLE DEVOLVESELA_A_MESSI.reservaCancelada
    (idReserva numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.reserva,
    idUsuario numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    fechaCancelacion datetime,
    motivoCancelacion nvarchar(255)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.estadia
    (idEstadia numeric(18,0) IDENTITY(1,1) PRIMARY KEY,
    idReserva numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.reserva,
    idHabitacion numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.habitacion,
    fechaIngreso datetime,
    fechaEgreso datetime,
    usuarioACargoIngreso numeric(18,0),
    usuarioACargoEgreso numeric(18,0),
    cantNoches numeric(18,0)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.estadiaCliente
    (idEstadia numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.estadia,
    mail nvarchar(255),
    numID numeric(18,0),
	FOREIGN KEY (numID, mail) REFERENCES DEVOLVESELA_A_MESSI.cliente (numID, mail)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.hotelRegimen
    (idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel,
    codRegimen numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.regimen
    )

CREATE TABLE DEVOLVESELA_A_MESSI.tarjeta
    (nroTarjeta numeric(18,0) PRIMARY KEY,
    banco nvarchar(255),
    marca nvarchar(255),
    fechaVencimiento datetime,
    cvv numeric(18,0)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.factura
    (numFactura numeric(18,0) PRIMARY KEY,
    idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel,
    idEstadia numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.estadia,
    numID numeric(18,0),
	mail nvarchar(255),
    formaDePago nvarchar(255),
    nroTarjeta numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.tarjeta,
    fecha datetime,
    itemDescuentoPorAllInclusive numeric(18,2),
    total numeric(18,2),
	FOREIGN KEY (numID, mail) REFERENCES DEVOLVESELA_A_MESSI.cliente (numID, mail)
    )
	
CREATE TABLE DEVOLVESELA_A_MESSI.consumible
    (codConsumible numeric(18,0) PRIMARY KEY,
    descripcion nvarchar(255),
    precioUnitario numeric(18,2)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.consumiblePorEstadia
    (idEstadia numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.estadia,
    codConsumible numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.consumible
    )

CREATE TABLE DEVOLVESELA_A_MESSI.clienteInhabilitado
    (idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel,
	numID numeric(18,0),
    mail nvarchar(255),
	FOREIGN KEY (numID, mail) REFERENCES DEVOLVESELA_A_MESSI.cliente (numID, mail),
    )

CREATE TABLE DEVOLVESELA_A_MESSI.hotelBaja
    (idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel,
    fechaInicioBaja datetime,
    fechaFinBaja datetime,
    razonBaja nvarchar(255)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.hotelHabitacion
    (idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel,
    idHabitacion numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.habitacion
    )

CREATE TABLE DEVOLVESELA_A_MESSI.rol
    (rol nvarchar(255) PRIMARY KEY,
    estado bit
    )

CREATE TABLE DEVOLVESELA_A_MESSI.rolPorUsuario
	(rol nvarchar(255) REFERENCES DEVOLVESELA_A_MESSI.rol,
	idUsuario numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel
    )

CREATE TABLE DEVOLVESELA_A_MESSI.funcionalidadNombre
    (codFunc numeric(18,0) PRIMARY KEY,
    nombreFunc nvarchar(255)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.rolFuncionalidad
    (rol nvarchar(255) REFERENCES DEVOLVESELA_A_MESSI.rol,
    codFunc numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.funcionalidadNombre
    )
    
CREATE TABLE DEVOLVESELA_A_MESSI.hotelPorUsuario
    (idUsuario numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    idHotel numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.hotel
    )

CREATE TABLE DEVOLVESELA_A_MESSI.usuarioDatosPersonales
    (idUsuario numeric(18,0) REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    nombre nvarchar(255),
    apellido nvarchar(255),
    tipoDoc nvarchar(255),
    numDoc numeric(18,0),
    mail nvarchar(255),
    telefono numeric(18,0),
    direccion nvarchar(255),
    fechaNac datetime
    )

--MIGRACION DESDE LA TABLA MAESTRA

--Migracion TipoHabitacion
INSERT INTO DEVOLVESELA_A_MESSI.tipoHabitacion
    SELECT DISTINCT Habitacion_Tipo_Codigo, Habitacion_Tipo_Descripcion, Habitacion_Tipo_Porcentual
       FROM gd_esquema.Maestra
       ORDER BY Habitacion_Tipo_Codigo

--Migracion Hoteles
INSERT INTO DEVOLVESELA_A_MESSI.hotel (ciudad, direccion, cantEstrellas, recargaEstrella, pais)
    SELECT DISTINCT Hotel_Ciudad, Hotel_Calle + ' ' + cast(Hotel_Nro_Calle as nvarchar(255)), Hotel_CantEstrella, Hotel_Recarga_Estrella, 'Argentina'
    FROM gd_esquema.Maestra
    ORDER BY Hotel_Ciudad

--Migracion Regimen
INSERT INTO DEVOLVESELA_A_MESSI.regimen (descripcion, precioBase, estado)
    SELECT DISTINCT Regimen_Descripcion, Regimen_Precio, 0
    FROM gd_esquema.Maestra
    ORDER BY Regimen_Precio

--Migracion Consumibles
INSERT INTO DEVOLVESELA_A_MESSI.consumible (codConsumible, descripcion, precioUnitario)
    SELECT DISTINCT Consumible_Codigo, Consumible_Descripcion, Consumible_Precio
    FROM gd_esquema.Maestra
    WHERE Consumible_Codigo IS NOT NULL AND Consumible_Descripcion IS NOT NULL AND Consumible_Precio IS NOT NULL
    ORDER BY Consumible_Codigo

--Migracion Habitaciones
INSERT INTO DEVOLVESELA_A_MESSI.habitacion (tipoHabitacion, numero, piso, ubicacion, enMantenimiento)
    SELECT DISTINCT Habitacion_Tipo_Codigo, Habitacion_Numero, Habitacion_Piso, Habitacion_Frente, 0
    FROM gd_esquema.Maestra
    ORDER BY 1, 2, 3
	
--Migracion HotelHabitacion
INSERT INTO DEVOLVESELA_A_MESSI.hotelHabitacion(idHotel, idHabitacion)
    SELECT DISTINCT idHotel, idHabitacion
    FROM DEVOLVESELA_A_MESSI.hotel hotel, DEVOLVESELA_A_MESSI.habitacion hab, gd_esquema.Maestra esq
    WHERE esq.Hotel_Calle + ' ' + cast(esq.Hotel_Nro_Calle as nvarchar(255)) = hotel.direccion AND hab.numero=esq.Habitacion_Numero AND hab.piso = esq.Habitacion_Piso AND hab.ubicacion=esq.Habitacion_Frente AND hab.tipoHabitacion = esq.Habitacion_Tipo_Codigo
    ORDER BY idHotel, idHabitacion

--Migracion HotelRegimen
INSERT INTO DEVOLVESELA_A_MESSI.hotelRegimen
    SELECT distinct h.idHotel, r.codRegimen
    FROM gd_esquema.Maestra m JOIN DEVOLVESELA_A_MESSI.regimen r ON (m.Regimen_Descripcion = r.descripcion) JOIN DEVOLVESELA_A_MESSI.hotel h ON (m.Hotel_Calle + ' ' + cast(m.Hotel_Nro_Calle as nvarchar(255)) = h.direccion)
    ORDER BY h.idHotel, r.codRegimen

--Ingreso Funcionalidades
INSERT INTO DEVOLVESELA_A_MESSI.funcionalidadNombre
    VALUES (1, 'ABM de Rol'),
           (2, 'ABM de Usuario'),
           (3, 'ABM de Clientes'),
           (4, 'ABM de Hotel'),
           (5, 'ABM de Habitación'),
           (6, 'ABM de Régimen de Estadía'),
           (7, 'A-M de Reserva'),
           (8, '-B- de Reserva'),
           (9, 'Registrar Estadía'),
           (10, 'Registrar Consumibles'),
           (11, 'Facturar Estadía'),
           (12, 'Listado Estadístico')

--Ingreso Roles
INSERT INTO DEVOLVESELA_A_MESSI.rol
    VALUES ('adminGeneral', 1),
           ('admin', 1),
           ('recepcionista', 1),
           ('guest', 1)

--Ingreso RolFuncionalidad
INSERT INTO DEVOLVESELA_A_MESSI.rolFuncionalidad
    VALUES ('adminGeneral', 1),
           ('adminGeneral', 3),
           ('adminGeneral', 4),
           ('adminGeneral', 5),
           ('adminGeneral', 6),
           ('adminGeneral', 7),
           ('adminGeneral', 8),
           ('adminGeneral', 9),
           ('adminGeneral', 10),
           ('adminGeneral', 11),
           ('adminGeneral', 12),
           ('adminGeneral', 13),
           ('admin', 1),
           ('admin', 3),
           ('admin', 5),
           ('admin', 6),
           ('admin', 7),
           ('admin', 13),
           ('recepcionista', 4),
           ('recepcionista', 8),
           ('recepcionista', 10),
           ('recepcionista', 11),
           ('recepcionista', 12),
           ('guest', 8),
           ('guest', 9)

--Creacion de usuario “admin” con la contraseña “w23e” (hasheada con SHA256)
INSERT INTO DEVOLVESELA_A_MESSI.usuarioLogin (username, password, cantIngresosFallidos)
    VALUES('admin', HASHBYTES('SHA2_256','w23e'), 0)

--Carga Hoteles Al Administrador General
INSERT INTO DEVOLVESELA_A_MESSI.hotelPorUsuario
    VALUES (1, 1),
           (1, 2),
           (1, 3),
           (1, 4),
           (1, 5),
           (1, 6),
           (1, 7),
           (1, 8),
           (1, 9),
           (1, 10),
           (1, 11),
           (1, 12),
           (1, 13),
           (1, 14),
           (1, 15)

--Ingreso RolPorUsuario
INSERT INTO DEVOLVESELA_A_MESSI.rolPorUsuario
    VALUES ('adminGeneral', 1, 1),
           ('adminGeneral', 1, 2),
           ('adminGeneral', 1, 3),
           ('adminGeneral', 1, 4),
           ('adminGeneral', 1, 5),
           ('adminGeneral', 1, 6),
           ('adminGeneral', 1, 7),
           ('adminGeneral', 1, 8),
           ('adminGeneral', 1, 9),
           ('adminGeneral', 1, 10),
           ('adminGeneral', 1, 11),
           ('adminGeneral', 1, 12),
           ('adminGeneral', 1, 13),
           ('adminGeneral', 1, 14),
           ('adminGeneral', 1, 15) 

--Ingreso Administrador General
INSERT INTO DEVOLVESELA_A_MESSI.usuarioDatosPersonales (idUsuario, nombre, apellido)
    VALUES (1, 'Administrador', 'General')

--Ingreso EstadoReserva
INSERT INTO DEVOLVESELA_A_MESSI.estadoReserva
    VALUES (1, 'Correcta'),
           (2, 'Modificada'),
           (3, 'Cancelada'),
           (4, 'Efectivizada')

--Migracion Clientes
INSERT INTO DEVOLVESELA_A_MESSI.cliente (numID, mail, apellido, nombre, tipoID, fechaNac, telefono, domicilio, piso, depto, localidad, paisOrigen, nacionalidad)
    SELECT DISTINCT Cliente_Pasaporte_Nro, Cliente_Mail, Cliente_Apellido, SUBSTRING(Cliente_Nombre, 1, 1) + SUBSTRING(LOWER(Cliente_Nombre), 2, 255), 'pasaporte', Cliente_Fecha_Nac, null, Cliente_Dom_Calle + ' ' + cast(Cliente_Nro_Calle as nvarchar(255)), Cliente_Piso, Cliente_Depto, null, 'Argentina', LOWER(Cliente_Nacionalidad)
    FROM gd_esquema.Maestra
    ORDER BY Cliente_Pasaporte_Nro, Cliente_Mail

--Migracion Clientes Inhabilitados
INSERT INTO DEVOLVESELA_A_MESSI.clienteInhabilitado (numID, mail)
    SELECT numID, mail
    FROM DEVOLVESELA_A_MESSI.cliente c
    WHERE c.mail IN (SELECT c.mail
                     FROM DEVOLVESELA_A_MESSI.cliente c
                     GROUP BY c.mail
                     HAVING COUNT(c.mail) > 1)
      OR c.numID IN (SELECT c.numID
                     FROM DEVOLVESELA_A_MESSI.cliente c
                     GROUP BY c.numID
                     HAVING COUNT(c.numID) > 1)
    ORDER BY numID, mail

--Migracion Reservas
SET IDENTITY_INSERT DEVOLVESELA_A_MESSI.reserva ON
INSERT INTO DEVOLVESELA_A_MESSI.reserva (idReserva, fechaDesde, fechaHasta, idHotel, codRegimen, tipoHabitacion, numId, mail)
    SELECT DISTINCT Reserva_Codigo, Reserva_Fecha_Inicio, (select dateadd(day, esq.Reserva_Cant_Noches, esq.Reserva_Fecha_Inicio)),idHotel, codRegimen, tipoHabitacion, cli.numId, cli.mail
    FROM gd_esquema.Maestra esq, DEVOLVESELA_A_MESSI.hotel hotel, DEVOLVESELA_A_MESSI.regimen reg, DEVOLVESELA_A_MESSI.tipoHabitacion tipoHab, DEVOLVESELA_A_MESSI.cliente cli
    WHERE esq.Hotel_Calle + ' ' + cast(esq.Hotel_Nro_Calle as nvarchar(255)) = hotel.direccion
      AND esq.Regimen_Descripcion = reg.descripcion
      AND esq.Habitacion_Tipo_Codigo = tipoHab.tipoHabitacion
      AND esq.Cliente_Pasaporte_Nro = cli.numID
      AND esq.Cliente_Mail = cli.mail
    ORDER BY Reserva_Codigo

--Migracion Estadias
INSERT INTO DEVOLVESELA_A_MESSI.estadia (idReserva, idHabitacion, fechaIngreso, cantNoches)
    SELECT DISTINCT idReserva, idHabitacion, esq.Estadia_Fecha_Inicio, esq.Estadia_Cant_Noches
    FROM gd_esquema.Maestra esq, DEVOLVESELA_A_MESSI.reserva res, DEVOLVESELA_A_MESSI.habitacion hab
    WHERE esq.Reserva_Codigo = res.idReserva
      AND esq.Habitacion_Frente = hab.ubicacion
      AND esq.Habitacion_Numero = hab.numero
      AND esq.Habitacion_Piso = hab.piso
      AND esq.Habitacion_Tipo_Codigo = hab.tipoHabitacion 
      AND esq.Estadia_Fecha_Inicio IS NOT NULL
      AND esq.Estadia_Cant_Noches IS NOT NULL
    ORDER BY esq.Estadia_Fecha_Inicio, idReserva

--Migracion ConsumiblePorEstadia
INSERT INTO DEVOLVESELA_A_MESSI.consumiblePorEstadia
    SELECT e.idEstadia, m.Consumible_Codigo
    FROM gd_esquema.Maestra m JOIN DEVOLVESELA_A_MESSI.estadia e ON (m.Reserva_Codigo = e.idReserva)
    WHERE m.Consumible_Codigo IS NOT NULL

--Migracion EstadiaCliente
INSERT INTO DEVOLVESELA_A_MESSI.estadiaCliente(idEstadia, numID, mail)
    SELECT DISTINCT e.idEstadia, Cliente_Pasaporte_Nro, Cliente_Mail
    FROM gd_esquema.Maestra m, DEVOLVESELA_A_MESSI.estadia e
    WHERE e.idReserva = m.Reserva_Codigo
    ORDER BY idEstadia

--Migracion HabitacionReserva
INSERT INTO DEVOLVESELA_A_MESSI.habitacionReserva(idHabitacion, idReserva)
    SELECT DISTINCT idHabitacion, Reserva_Codigo
    FROM gd_esquema.Maestra m, DEVOLVESELA_A_MESSI.habitacion hab
    WHERE m.Habitacion_Tipo_Codigo = hab.tipoHabitacion AND m.Habitacion_Numero = hab.numero AND m.Habitacion_Frente = hab.ubicacion AND m.Habitacion_Piso = hab.piso
    ORDER BY idHabitacion, Reserva_Codigo

--Migracion Factura
INSERT INTO DEVOLVESELA_A_MESSI.factura
    SELECT distinct m.Factura_Nro, ho.idHotel, e.idEstadia, m.Cliente_Pasaporte_Nro, m.Cliente_Mail, null, null, null, 0, m.Factura_Total
    FROM gd_esquema.Maestra m
        JOIN DEVOLVESELA_A_MESSI.hotel ho ON (m.Hotel_Calle + ' ' + cast(m.Hotel_Nro_Calle as nvarchar(255)) = ho.direccion)
        JOIN DEVOLVESELA_A_MESSI.estadia e ON (m.Reserva_Codigo = e.idReserva)
    WHERE Factura_Nro is not null
    ORDER BY Factura_Nro

--Completar Datos De Reservas
UPDATE DEVOLVESELA_A_MESSI.reserva
SET estadoReserva = 4
FROM DEVOLVESELA_A_MESSI.reserva r
WHERE r.idReserva IN (SELECT idReserva FROM DEVOLVESELA_A_MESSI.estadia e) 
UPDATE DEVOLVESELA_A_MESSI.reserva
SET estadoReserva = 1
FROM DEVOLVESELA_A_MESSI.reserva r
WHERE r.idReserva IN (SELECT idReserva FROM DEVOLVESELA_A_MESSI.reserva
                      EXCEPT
                      SELECT idReserva FROM DEVOLVESELA_A_MESSI.estadia)
UPDATE DEVOLVESELA_A_MESSI.reserva
SET costoTotalReserva = m.Regimen_Precio * m.Habitacion_Tipo_Porcentual + m.Hotel_CantEstrella * m.Hotel_Recarga_Estrella
FROM gd_esquema.Maestra m JOIN DEVOLVESELA_A_MESSI.reserva r ON (m.Reserva_Codigo = r.idReserva)