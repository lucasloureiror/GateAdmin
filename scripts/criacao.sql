-- Utilizar os comandos abaixo para mudar o nome do esquema
--show search_path;
--set search_path to stargate; -- Se o nome do esquema for "stargate"

------------------------------------------- GALAXIA -------------------------------------------
create table Galaxia(
	nome varchar(100) not null,
	tipo varchar(20),
	constraint PK_GALAXIA primary key(nome)
);