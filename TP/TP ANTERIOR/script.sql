CREATE TABLE DEVOLVESELA_A_MESSI.hotel
    (idHotel int IDENTITY(1,1) PRIMARY KEY,
    nombre varchar(30),
    mail varchar(40),
    telefono int,
    direccion nvarchar(255),
    cantEstrellas numeric(18,0),
    recargaEstrella numeric(18,0),
    ciudad nvarchar(255),
    pais varchar(15),
    fechaCreacion date
    )

CREATE TABLE DEVOLVESELA_A_MESSI.regimen
    (codRegimen int PRIMARY KEY,
    precioBase numeric(18,2),
    descripcion nvarchar(255),
    estado bit --VER
    )

CREATE TABLE DEVOLVESELA_A_MESSI.usuarioLogin
    (idUsuario int IDENTITY(1,1) PRIMARY KEY,
    username nvarchar(255),
    password nvarchar(255),
    cantIngresosFallidos smallint
    )


CREATE TABLE DEVOLVESELA_A_MESSI.cliente
    (numID numeric(18,0) PRIMARY KEY,
    mail nvarchar(255) UNIQUE,
    apellido nvarchar(255),
    nombre nvarchar(255),
    tipoID nvarchar(255),
    fechaNac date,
    telefono int,
    domicilio varchar(30),
    piso smallint,
    depto varchar(1),
    localidad varchar(20),
    paisOrigen varchar(15),
    nacionalidad varchar(15),
    estadoHab bit
    )

CREATE TABLE DEVOLVESELA_A_MESSI.tipoHabitacion
    (tipoHabitacion int PRIMARY KEY,
    descripcion nvarchar(255),
    porcentual numeric(18,2)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.habitacion
    (idHabitacion int IDENTITY(1,1) PRIMARY KEY,
    tipoHabitacion int NOT NULL REFERENCES DEVOLVESELA_A_MESSI.tipoHabitacion,
    numero smallint,
    piso smallint,
    ubicacion char(1),
    enMantenimiento bit NOT NULL --NO EXISTE BOOL, bit maneja 1,0 o null
    )

CREATE TABLE DEVOLVESELA_A_MESSI.reserva
    (idReserva int IDENTITY(1,1) PRIMARY KEY,
    idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel,
    codRegimen smallint REFERENCES DEVOLVESELA_A_MESSI.regimen,
    tipoHabitacion int REFERENCES DEVOLVESELA_A_MESSI.tipoHabitacion,
    idUsuario int REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    mail varchar(100) REFERENCES DEVOLVESELA_A_MESSI.cliente,
    numID int REFERENCES DEVOLVESELA_A_MESSI.cliente,
    fechaInicio date,
    fechaDesde date,
    fechaHasta date,
    estadoReserva bit, --VER
    costoTotalReserva numeric(18,2)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.habitacionReserva
    (idHabitacion int REFERENCES DEVOLVESELA_A_MESSI.habitacion,
    idReserva int REFERENCES DEVOLVESELA_A_MESSI.reserva,
    costoPorDiaDeLaHabitacion numeric(18,2)
    )


CREATE TABLE DEVOLVESELA_A_MESSI.reservaCancelada
    (idReserva int REFERENCES DEVOLVESELA_A_MESSI.reserva,
    idUsuario int REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    fechaCancelacion date,
    motivoCancelacion varchar(100)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.estadoReservas
    (estadoReserva bit PRIMARY KEY,
    leyendaEstado varchar(100)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.estadia
    (idEstadia int IDENTITY(1,1) PRIMARY KEY,
    idReserva int REFERENCES DEVOLVESELA_A_MESSI.reserva,
    idHabitacion int REFERENCES DEVOLVESELA_A_MESSI.habitacion,
    fechaIngreso date,
    fechaEgreso date,
    usuarioACargoIngreso int,
    usuarioACargoEgreso int,
    cantNoches smallint
    )

--Cliente_Pasaporte_Nro es único
SELECT DISTINCT Cliente_Pasaporte_Nro, Cliente_Apellido, Cliente_Nombre
FROM gd_esquema.Maestra
ORDER BY Cliente_Pasaporte_Nro

--Cliente_Pasaporte ----> cliente.numID ---> PK
--Cliente_Mail ---------> cliente.mail ----> UNIQUE
SELECT DISTINCT Cliente_Apellido + ', ' + Cliente_Nombre, Cliente_Pasaporte_Nro
FROM gd_esquema.Maestra
ORDER BY 1


CREATE TABLE DEVOLVESELA_A_MESSI.estadiaCliente
    (idEstadia int REFERENCES DEVOLVESELA_A_MESSI.estadia,
    mail varchar(40) REFERENCES DEVOLVESELA_A_MESSI.cliente,
    numID int REFERENCES DEVOLVESELA_A_MESSI.cliente
    )



CREATE TABLE DEVOLVESELA_A_MESSI.hotelRegimen
    (idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel,
    codRegimen int REFERENCES DEVOLVESELA_A_MESSI.regimen
    )


CREATE TABLE DEVOLVESELA_A_MESSI.tarjeta
    (nroTarjeta int PRIMARY KEY,
    banco varchar(20),
    marca varchar(10),
    fechaVencimiento date,
    cvv smallint
    )


CREATE TABLE DEVOLVESELA_A_MESSI.factura
    (numFactura int PRIMARY KEY,
    idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel,
    idEstadia int REFERENCES DEVOLVESELA_A_MESSI.estadia,
    mail varchar(40) REFERENCES DEVOLVESELA_A_MESSI.cliente,
    numID int REFERENCES DEVOLVESELA_A_MESSI.cliente,
    formaDePago varchar(10),
    nroTarjeta int REFERENCES DEVOLVESELA_A_MESSI.tarjeta,
    fecha date,
    itemDescuentoPorAllInclusive numeric(18,2),
    total numeric(18,2)
    )
	
CREATE TABLE DEVOLVESELA_A_MESSI.consumible
    (codConsumible numeric(18,0) PRIMARY KEY,
    descripcion nvarchar(255),
    precioUnitario numeric(18,2)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.item
    (numFactura int REFERENCES DEVOLVESELA_A_MESSI.factura,
    codConsumible int REFERENCES DEVOLVESELA_A_MESSI.consumible
    )


CREATE TABLE DEVOLVESELA_A_MESSI.consumiblesPorEstadia
    (idEstadia int REFERENCES DEVOLVESELA_A_MESSI.estadia,
    codConsumible int REFERENCES DEVOLVESELA_A_MESSI.consumible
    )

CREATE TABLE DEVOLVESELA_A_MESSI.clientesInhabilitados
    (mail varchar(40) REFERENCES DEVOLVESELA_A_MESSI.cliente,
    numID int REFERENCES DEVOLVESELA_A_MESSI.cliente,
    idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel
    )

CREATE TABLE DEVOLVESELA_A_MESSI.hotelBaja
    (idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel,
    fechaInicioBaja date,
    fechaFinBaja date,
    razonBaja varchar(50)
    )

CREATE TABLE DEVOLVESELA_A_MESSI.hotelHabitacion
    (idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel,
    idHabitacion int REFERENCES DEVOLVESELA_A_MESSI.habitacion
    )

CREATE TABLE DEVOLVESELA_A_MESSI.usuarioRol
    (idUsuario int REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    rol varchar(20) REFERENCES DEVOLVESELA_A_MESSI.rolFuncionalidad,
    idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel,
    estado bit
    )
    
CREATE TABLE DEVOLVESELA_A_MESSI.rolFuncionalidad
    (rol varchar(20) PRIMARY KEY,
    codFunc int REFERENCES DEVOLVESELA_A_MESSI.funcionalidadNombre
    )
    
CREATE TABLE DEVOLVESELA_A_MESSI.funcionalidadNombre
    (codFunc int PRIMARY KEY,
    nombreFunc varchar(30)
    )
    

CREATE TABLE DEVOLVESELA_A_MESSI.hotelesPorUsuario
    (idUsuario int REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    idHotel int REFERENCES DEVOLVESELA_A_MESSI.hotel
    )
    
CREATE TABLE DEVOLVESELA_A_MESSI.usuarioDatosPersonales
    (idUsuario int REFERENCES DEVOLVESELA_A_MESSI.usuarioLogin,
    nombre varchar(20),
    apellido varchar(20),
    tipoDoc varchar(10),
    numDoc int,
    mail varchar(40),
    telefono int,
    direccion varchar(30),
    fechaNac date
    )




	
--Consumibles cargados:
BEGIN TRANSACTION
INSERT INTO DEVOLVESELA_A_MESSI.consumible
	SELECT distinct Consumible_Codigo, Consumible_Descripcion, Consumible_Precio
	FROM gd_esquema.Maestra
	WHERE Consumible_Codigo IS NOT NULL
	ORDER BY Consumible_Codigo
select * from DEVOLVESELA_A_MESSI.consumible
ROLLBACK TRANSACTION
