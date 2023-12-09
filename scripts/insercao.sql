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