-- Utilizar os comandos abaixo para mudar o nome do esquema
--show search_path;
--set search_path to stargate; -- Se o nome do esquema for "stargate"

------------------------------------------- GALAXIA -------------------------------------------
insert into galaxia(nome_galaxia, tipo_galaxia)
values('Via Láctea', 'ESPIRAL');

insert into galaxia(nome_galaxia, tipo_galaxia)
values('Pegasus', 'IRREGULAR');

--------------------------------------- SISTEMA_ESTELAR ---------------------------------------
insert into sistema_estelar(galaxia, nome_sistema, tipo_sistema)
values('Via Láctea', 'Sistema Solar', 'SOLITARIO');

insert into sistema_estelar(galaxia, nome_sistema, tipo_sistema)
values('Pegasus', 'Sistema Lantean', 'TRIPLO');

------------------------------------------- PLANETA -------------------------------------------
insert into planeta(id_planeta, galaxia, sistema, nome_planeta, tipo_planeta, habitabilidade, status_planeta)
values(1, 'Via Láctea', 'Sistema Solar', 'Terra', 'ROCHOSO', 'HABITAVEL', 'intacto');

insert into planeta(id_planeta, galaxia, sistema, nome_planeta, tipo_planeta, habitabilidade, status_planeta)
values(2, 'Via Láctea', 'Sistema Solar', 'Marte', 'ROCHOSO', 'INABITAVEL', 'intacto');

insert into planeta(id_planeta, galaxia, sistema, nome_planeta, tipo_planeta, habitabilidade, status_planeta)
values(3, 'Pegasus', 'Sistema Lantean', 'Lantea', 'ROCHOSO', 'HABITAVEL', 'abandonado');

------------------------------------------ STARGATE -------------------------------------------
insert into stargate(endereco, status_stargate, planeta)
values('3215786', 'ativo', 1);

insert into stargate(endereco, status_stargate, planeta)
values('5789214', 'ativo', 3);

insert into stargate(endereco, status_stargate, planeta)
values('4534135', 'ativo', 2);

insert into stargate(endereco, status_stargate)
values('1537852', 'danificado');