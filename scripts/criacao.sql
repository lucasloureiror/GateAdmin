-- Utilizar os comandos abaixo para mudar o nome do esquema
--show search_path;
--set search_path to stargate; -- Se o nome do esquema for "stargate"

------------------------------------------- GALAXIA -------------------------------------------
create table Galaxia(
	nome varchar(100) not null,
	tipo varchar(20),
	constraint PK_GALAXIA primary key(nome)
);

--------------------------------------- SISTEMA_ESTELAR ---------------------------------------
create table Sistema_Estelar(
	galaxia varchar(100) not null,
	nome varchar(100) not null,
	tipo varchar(20),
	constraint PK_SISTEMA primary key(galaxia, nome),
	constraint FK_SISTEMA_GALAXIA foreign key(galaxia) references Galaxia(nome)
);

------------------------------------------- PLANETA -------------------------------------------
create table Planeta(
	id_planeta int not null,
	galaxia varchar(100) not null,
	sistema varchar(100) not null,
	nome varchar(100) not null,
	tipo varchar(20),
	habitabilidade varchar(20),
	status varchar(20),
	constraint PK_PLANETA primary key(id_planeta),
	constraint FK_PLANETA_SISTEMA foreign key(galaxia, sistema) references Sistema_Estelar(galaxia, nome),
	constraint UK_PLANETA_SISTEMA unique(galaxia, sistema, nome)
);

create sequence SEQ_PLANETA
    start with 1
    increment by 1;

------------------------------------------ STARGATE -------------------------------------------
create table Stargate(
	endereco char(8) not null,
	status varchar(20),
	planeta int,
	constraint PK_STARGATE primary key(endereco),
	constraint FK_STARGATE_PLANETA foreign key(planeta) references Planeta(id_planeta),
	constraint UK_STARGATE_PLANETA unique(planeta)
);