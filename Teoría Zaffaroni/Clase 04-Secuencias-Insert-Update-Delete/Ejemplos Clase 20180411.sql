
create table #prueba (
codigo int primary key,
descr varchar(60) NOT NULL,
estado char DEFAULT 'P' NOT NULL)

INSERT INTO #prueba 
     VALUES (1,'DESCR') --ERROR

INSERT INTO #prueba 
(codigo, descr)
VALUES (1,'DESCR')--OK

select * from #prueba

INSERT INTO #prueba VALUES (2,'DESCR','x') --OK

INSERT INTO #prueba VALUES (3,'DESCR',NULL)--OK

SELECT * FROM #prueba

INSERT INTO #prueba VALUES ('DESCR2',2,'y')  --error

INSERT INTO #prueba VALUES ('8',2,'y')  --OK

select * from #prueba



INSERT INTO #prueba 
(codigo, estado) 
VALUES (6,'X') 
			  
			  
			  --error x NOT NUL descr

INSERT INTO #prueba 
(codigo, descr)
 VALUES (7,'descr4') 
 
 -- OK Actúa el DEFAULT del estado

 select * from #prueba

 INSERT INTO #prueba (codigo, descr,estado)
 VALUES (9,'descr4',NULL) 
 
 -- eRROR NotNull del estado


SELECT * FROM #prueba

create table #ejemAuditoria (
codigo int primary key,
descr varchar(60) NOT NULL,
estado char DEFAULT 'P',
usuarioAlta VARCHAR(50) DEFAULT user,
fechaAlta  DATE DEFAULT getDate())

INSERT INTO #ejemAuditoria (codigo,descr,estado)
VALUES(10,'DDD','2')

select * from #ejemAuditoria

create table #prueba2 (
codigo int primary key,
descr varchar(60) NOT NULL,
otradescr varchar(60),
estado char DEFAULT 'P')

INSERT INTO #prueba2 (codigo, descr)
     VALUES (1,'DESCR') --OK

select * from #prueba2

---- EJEMPLOS UPDATE
create table #prueba3 (
codigo int primary key,
descr varchar(60) NOT NULL,
precio numeric(8,2),
estado char DEFAULT 'P')

alter table #prueba3 add total int
alter table #prueba3 add cant int

 select * from #prueba3 order by 1



INSERT INTO #prueba3 (codigo, descr, estado, precio )
     VALUES (5,'DESCR',NULL,10.5) --OK


INSERT INTO #prueba3 (codigo, descr, estado, precio )
     VALUES (6,'DESCR',NULL,15) --OK

INSERT INTO #prueba3 (codigo, descr, estado, precio )
     VALUES (7,'DESCR',NULL,20) --OK


--PRUEBA DE UPDATE


select * from #prueba3

update #prueba3 set cant=codigo*100

update #prueba3 set total=cant*precio where codigo=5

update #prueba3 set precio=precio*1.15

--por 2da forma normal elimino campo total x depender funcionalmente de cant y precio
SELECT * FROM #prueba3
alter table #prueba3 drop column total


update #prueba3 set descr=descr+'_tt' WHERE codigo=5
SELECT * FROM #prueba3

update #prueba3 
set precio=100,
    descr='DescripcionModificada' 
WHERE codigo=7



update #prueba3 set precio=100,
                    descr='DescripcionModificada' 
WHERE codigo=11  

-- no modifico nada por no encontrar filas

select * from #prueba3

-- pruebas DELETE
select * from #prueba

delete from #prueba --borra mayores a 3
where codigo >3

select * from #prueba

delete from #prueba --borra todo

select * from #prueba

DROP TABLE #prueba
select * from #prueba -- error no encuentra la tabla

select customer_num, company, address1,address2 from customer

select * from #prueba3

INSERT INTO #prueba
(codigo,descr)
SELECT codigo,descr
FROM #prueba3
WHERE estado IS NULL

INSERT INTO #prueba
(codigo,descr,estado)
SELECT codigo+100,descr,estado
FROM #prueba3
WHERE estado IS NOT NULL

delete from #prueba where codigo>3
select * from #prueba3
UPDATE #prueba3 SET estado='x' WHERE codigo=5

select * from #prueba
--PRUEBA DE IDENTITY


create table #prueba4 (
codigo int primary key identity (1,1),
descr varchar(60) NOT NULL,
precio numeric(8,2),
estado char DEFAULT 'P')

INSERT INTO #prueba4 (codigo, descr, estado, precio )
     VALUES (7,'DESCR',NULL,20) --error x IDENTITY

INSERT INTO #prueba4 ( descr, estado, precio )
     VALUES ('DESC0',NULL,20) --OK
begin tran

INSERT INTO #prueba4
     VALUES ('DESC1',20,NULL) --OK

rollback tran

INSERT INTO #prueba4
     VALUES ('DESC1',20,NULL) --OK

select * from #prueba4

INSERT INTO #prueba4
     VALUES ('DESC2',20) --error por falta de atributos


--EJEMPLO DE INSERT SELECT

CREATE TABLE #clientes(
	customer_num smallint NOT NULL,
	fnameYlname varchar(40),
	company varchar(20),
	address1 varchar(20),
	address2 varchar(20),
	city varchar(15),
	state char(2),
	zipcode char(5),
	phone varchar(18),
	status char(1)
)

INSERT INTO #clientes
(customer_num, fnameYlname, company, 
 address1, address2, city, state, zipcode, phone)
SELECT 155,fname+' '+lname,company,address1,address2,
       city,state,zipcode,phone
FROM customer
WHERE customer_num=103

INSERT INTO #clientes
(customer_num, fnameYlname, company, 
 address1, address2, city, state, zipcode, phone)
SELECT customer_num,fname+' '+lname,company,address1,address2,
       city,state,zipcode,phone
FROM customer

delete from #clientes
select * from #clientes
drop table #clientes


CREATE TABLE new_table AS SELECT * FROM customer;


select * 
into #customer
from customer
where 1=2

SELECT * FROM #customer
