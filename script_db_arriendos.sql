# crear base de datos db_arriendos
create database db_arriendos;
# usar base de datos
use db_arriendos;
# borrar base de datos

drop database db_arriendos;
# crear tabla departamento
create table departamento(
	id_departamento int primary key not null,
    nom_departamento varchar(100) not null
);
# crear tabla ciudad
create table ciudad(
	id_ciudad int primary key not null,
    nom_ciudad varchar(100) not null,
    cod_departamento int not null,
    foreign key(cod_departamento) references departamento(id_departamento)
);

#crear tabla vivienda
drop table vivienda;
create table vivienda(
	id_vivienda int not null primary key,
    direccion varchar(100) not null,
    cant_habitantes smallint not null,
    descripcion text not null,
  identificacion int not null,
    cod_ciudad int not null,
    foreign key(cod_ciudad) references ciudad(id_ciudad)
    );
    

# modificar tabla
#alter table vivienda add constraint fk_vivienda_propietario foreign key(id_propietario) references propietario(identificacion);
drop table propietario;
# crear tabla propietario
create table propietario(
	identificacion	int not null primary key,
    primer_nombre varchar(100) not null,
    segundo_nombre varchar(100) not null,
    primer_apellido varchar(100) not null,
    segundo_apellido varchar(100) not null,
    telefono_fijo varchar(7) not null,
    celular varchar(10) not null,
    email varchar(100) not null    
);

# alterar campo celular
alter table propietario modify column celular int(10);
alter table propietario add column celular_segundo integer(10);
alter table propietario add column celular_segundo double;
alter table propietario drop column celular_segundo;
alter table propietario add constraint uk_email unique(email);
alter table vivienda drop column id_propietario;
alter table propietario drop column id_propietario;

;


#crear tabla arriendo
create table arriendo (
id_arriendo int primary key not null,
f_inicio date not null,
f_fin date not null, 
valor_mensual bigint not null,
cod_vivienda int not null
);

drop table vivienda;
#crear tabla arriendo_inquilinos
create table arriendo_inquilinos (
    cod_arriendo int not null,
    cod_inquilino int not null,
    primary key(cod_arriendo, cod_inquilino),
    foreign key(cod_arriendo) references arriendo(id_arriendo),
   foreign key(cod_inquilino) references inquilino(identificacion_inquilino)
);

#crear tabla inquilino
create table inquilino (
	identificacion_inquilino int not null primary key,
    primer_nombre varchar(100)not null,
    segundo_nombre varchar(100) not null,
    primer_apellido varchar(100) not null,
    segundo_apellido varchar(100) not null,
    email varchar(100) not null,
	celular varchar(10) not null
);

# Comando para visualizar tablas en la bases de datos
show tables;

# Visualizar composicion de la tabla
describe departamento;
describe ciudad;
describe propietario;
describe vivienda;
describe inquilino;
describe arriendo;
describe arriendo_inquilinos;

#insetar registros de la tablas creadas
insert into departamento() values (1, 'Qundio');
insert into departamento () values ( 2, 'Tolima');
insert into departamento () values (3, 'Amazonas'), (4,'Arauca'), (5,'Cordoba'), (6,'Casanare'), (7,'Risaralda'), (8,'Caldas'), (9,'Meta'), (10,'Huila');
insert into ciudad(id_ciudad, nom_ciudad, cod_departamento) values (1,'armenia',1);
insert into ciudad(id_ciudad, nom_ciudad, cod_departamento) values (2,'calarca',1), (3, 'circasia',1), (4, 'filandia',1), (5, 'la tebaida',1), (6, 'pijao',1), (7, 'salento',1), (8,'quimbaya',1);

insert into	vivienda(id_vivienda, direccion, cant_habitantes, descripcion, identificacion, cod_ciudad) values
(1, 'Barrio 7 de agosto mz 1 casa 5', 2,'vivienda con buena vista', 1, 1),
(2, 'edificio laureles apartamento 203 piso 2 torre 2', 3,'aparta estudio',2, 1),
(3, 'Urbanizacion lomaverde casa 3 mano izquierda de la entrada', 3,'casa para una familia de 3 personas',3,1),
(4, 'barrio cruzverde sede el portal piso 2 edificio patas 34 apartamento 89', 3, 'acogedor hogar',4, 1),
(5, 'barrio zuldemaida34 manzana k casa	23', 12,' casa con 5 habitaciones con 2 baños mas jacuzzi',5,1),
(6, 'Barrio 3 esquinas manzana 2 casa 4', 4, 'casa acogedora con jacuzzi',6, 2),
(7, 'torres rio piso2 apartamento 34c', 3, 'apartamento familiar',7,1),
(8, 'torres rio piso 1 apartamento 23a', 8,'apartamento comodo familiar',8, 1),
(9, 'torres rio piso 1 apartamento 2a', 4, 'apartamento comodo familiar',9, 1),
(10, 'torres rio piso 1 apartamento 1',4, 'apartamento comodo familiar',10,1);



insert into propietario (identificacion, Primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, telefono_fijo, celular, email) values
(1,'aaron','sia','rojas','perez',7414513,3174870989,'sia34@gmail.com '),
(2,'santiago','arturo','takeuchi','montes',7417845,3517896945,'ss78@gmail.com'),
(3,'Mauricio',' Andres', 'soto','atristizabal',7328745,3127858889,'soto74@gmail.com '),
(4,'rigo','uran', 'caicedo','lopez', 7458914,3127862574,'el89@gmail.com'), 				
(5,'jose','fernando','roa','sierra', 7851425,3217836414,'jj02@hotmail.com'),             
(6, 'luis','eduardo','moreno','smith',7894578,3034578536,'76ludo@yohaoo.com'),
(7, 'emily','elizabeth','howard','monteiro',7215623, 3107892084,'em67@gmail.com'),
(8,'jorge' ,'antonio','suarez','lopera',7851024,3154789003,'ja21@outlook.com'),
(9, 'maria','antonela','jones','brown',7456523,3127845478,'ma89@gmail.com'),
(10, 'deisy','paola','monroy', 'rodríguez',7845127,3007845200,'pao45@hotmail.com');

insert into inquilino (identificacion_inquilino, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, email, celular) values
(1,'Vanessa', 'valentina', 'gomez', 'aguirre', 'van45@gmail.com' ,3126783427),
(2,'camilo' , 'andres', 'guevara', 'granados', 'cam33@gmail.com', 3451285232),
(3,'julian' , 'andres', 'rojas', 'rivas',  'cam33@gmail.com',   3127845636),
(4,'leyla' , 'rangel', 'gomez', 'agudelo', 'agu78@utlook.com', 3127888914),
(5,'lisa' , 'andrea', 'jay', 'simpson',  'simp67@gmail.com', 3124512823),
(6,'camila' , 'andrea', 'restrepo', 'cardona', 'camila23@hotmail.com', 3124754423),
(7,'niki' , 'yulieth', 'kavner', 'echavarria', 'niki78@gmail.com', 314789024),
(8,'dana' , 'paola ', 'montalvo', 'rios', 'pao89@gmail.com', 3114572124),
(9,'carlos' , 'homero', 'hernandez', 'velez', 'h2007@gmail.com', 3004573214),
(10,'juan' , 'miguel', 'duque', 'rojas', 'rojas74@gmail.com', 3074572233);

insert into arriendo (id_arriendo,f_inicio, f_fin, valor_mensual, cod_vivienda ) values
(11,'2008-07-24','2012-12-23', 455.000,1),
(12,'2007-06-23','2019-11-02',120.000,2),
(13,'2006-04-02','2014-11-02',140.000,3),
(14,'2002-06-28','2020-01-12',170.000,4),
(15,'2003-12-31','2023-02-14',125.200,5),
(16,'2004-04-14','2005-06-06',178.700,6),
(17,'2004-07-02','2022-02-02',145.000,7),
(18,'1999-02-05','2023-02-05',780.000,8),
(19,'2002-07-11','2012-07-14',110.000,9),
(20,'2003-01-01','2019-08-12',230.000,10);

insert into arriendo_inquilinos (cod_inquilino, cod_arriendo) values(1,11),(2,12),(3,13),(4,14),(5,15),(6,16),(7,17),(8,18),(9,19),(10,20);

# insertar tablas
select * from departamento;
select * from ciudad;
select * from vivienda;
select * from propietario;
select * from inquilino;
select * from arriendo;
select * from arriendo_inquilinos;


