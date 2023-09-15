#crear base de datos
create database db_hotel;
#usar base de datos
use db_hotel;
drop database db_hotel;

#crear tabla huesped
create table huesped (
id_huesped bigint primary  key not null,
nombre_nombres text not null,
nombre_apellidos text not null,
telefonos varchar(30)not null,
Email varchar(100) not null,
cod_reservacion bigint not null,
foreign key(cod_reservacion) references reservacion(cod_reservacion)
    );

drop table reservacion;
#crear tabla reservación
create table reservacion (
cod_reservacion bigint primary key not null,
disponibilidad boolean not null,
f_inicio date not null,
f_fin date not null
);

alter table reservacion modify disponibilidad boolean;

#crear tabla habitacion
create table habitacion (
numero_unico integer primary key not null,
tipo_sencillo char (100) not null,
tipo_doble char (100) not null,
tipo_suite char (100) not null
);

alter table habitacion modify tipo_sencillo boolean;
alter table habitacion modify tipo_doble boolean;
alter table habitacion modify tipo_suite boolean;

 drop table habitacion_reservacion;
# crear tabla habitacion_reservacion
create table habitacion_reservacion (
cod_reservacion bigint primary key not null,
numero_unico integer not null
);
-

#crear tabla servicio 
create table servicio(
cod_servicio integer primary key not null,
nombre_servicio text not null,
descripcion_servicio text not null,
costo_servicio bigint not null
);


drop table habitacion_servicio;
#crear tablahabitacion_servicio
create table habitacion_servicio (
numero_unico bigint  primary key  not null ,
cod_servicio integer not null
);

#mostrar tablas
show tables;

#visualizar composicion de las tablas
describe huesped;
describe reservacion;
describe habitacion;
describe servicio;
describe habitacion_servicio;
describe habitacion_servicio;

#insertar registros tablas

insert into huesped (id_huesped, nombre_nombres, nombre_apellidos, telefonos, email, cod_reservacion) values
(1, 'santiago mauricio', 'Piñeda arias', 3208975609-3114785625,'sa23@gmail.com', 11),
(2, 'jose armando ','piñeda arias',3127455588-3127891205,'jo12@outlook.com', 12),
(3, 'maria guadalupe','garcia lopez',3147891245-3208891021,'ma12@gmail.com', 13),
(4, 'Jesus barrero','navarri díaz',3107458912-315762324,'je12@hotmail.fr', 14),
(5, 'martha elena','ruiz hernandez',3127650236-3185697844,'mateo77@gmail.com', 15),
(6, 'sergio joaquin', 'mendoz perez',3147859610-3147890233,'mj89@gmail.com', 16),
(7,'ken ramon', 'valdez montoya',3124758961-3107552879 ,'keni78@gmail.com', 17),
(8,'Juan Carlos', 'Pérez Rodríguez', 12345678908-3207881245, 'juan.perez@gmail.com', 18),
(9, 'María Fernanda', 'Gómez López',  3127487247-3127810456, 'maria.gomez@gmail.com', 19),
(10, 'Carlos Andrés', 'Ramírez sanchez' , 3178122204-3004752211, 'carlos.ramirez@gmail.com',20);


 insert into reservacion  (cod_reservacion, disponibilidad, f_inicio, f_fin) values 
 (11, true, '2002-12-01','2002-12-24'),
 (12, true, '2001-01-12','2001-03-05'),
 (13, false,'2012-02-15','2012-12-25'),
 (14,true, '2011-12-01','2011-03-21'),
 (15, true, '2010-01-01','2010-06-01'),
 (16, false, '2016-01-30','2016-03-25'),
 (17, true, '2016-02-25','2016-03-25'),
 (18, true, '2003-01-12','2003-05-06'),
 (19, false, '2004-05-10','2004-06-11'),
 (20, true, '1999-12-12','2000-01-01');


insert  into habitacion (numero_unico,tipo_sencillo, tipo_doble, tipo_suite)  values
(21, true,false,false),
(22, false,true,false),
(23, false,false,false),
(24, false,false,true),
(25,false,true,false),
(26, false,false,false),
(27, true,false,false),
(28, false,false,true),
(29,false,false,false),
(30,true,false,false);


insert into servicio (cod_servicio , nombre_servicio, descripcion_servicio, costo_servicio) values
(31,'normal','comida mas camas',12000),
(32,'normal doble','doble comida y camas',24000),
(33,'no hay habitacion reservada','no hay habitacion resevada',000000),
(34,'VIP','comida,camas,piscina',60000),
(35,'normal doble','doble comida y camas',24000),
(36,'no hay habitacion reservada','no hay habitacion resevada',000000),
(37,'normal','comida mas camas',12000),
(38,'VIP','comida,camas,piscina',60000),
(39,'no hay habitacion reservada','no hay habitacion resevada',000000),
(40,'normal doble','doble comida y camas',24000);

insert into habitacion_reservacion ( numero_unico, cod_reservacion) values
(21,11),
(22,12),
(23,13),
(24,14),
(25,15),
(26,16),
(27,17),
(28,18),
(29,19),
(30,20);


insert into habitacion_servicio (numero_unico, cod_servicio) values
(21,31),
(22,32),
(23,33),
(24,34),
(25,35),
(26,36),
(27,37),
(28,38),
(29,39),
(30,40);

# insertar tablas con registro
select * from huesped;
select * from reservacion;
select * from habitacion;
select * from servicio;
select * from habitacion_reservacion;
select * from habitacion_servicio;
