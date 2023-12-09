set search_path to public;

------------------------------------------- GALAXIA -------------------------------------------
insert into galaxia(nome, tipo)
values('Via Láctea', 'ESPIRAL');

insert into galaxia(nome, tipo)
values('Pegasus', 'IRREGULAR');

--------------------------------------- SISTEMA_ESTELAR ---------------------------------------
insert into sistema_estelar(galaxia, nome, tipo)
values('Via Láctea', 'Sistema Solar', 'SOLITARIO');

insert into sistema_estelar(galaxia, nome, tipo)
values('Pegasus', 'Sistema Lantean', 'TRIPLO');

------------------------------------------- PLANETA -------------------------------------------
insert into planeta(id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta)
values(nextval('seq_planeta'), 'Via Láctea', 'Sistema Solar', 'Terra', 'ROCHOSO', 'HABITAVEL', 'intacto');

insert into planeta(id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta)
values(nextval('seq_planeta'), 'Via Láctea', 'Sistema Solar', 'Marte', 'ROCHOSO', 'INABITAVEL', 'intacto');

insert into planeta(id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta)
values(nextval('seq_planeta'), 'Pegasus', 'Sistema Lantean', 'Lantea', 'ROCHOSO', 'HABITAVEL', 'abandonado');

------------------------------------------ STARGATE -------------------------------------------
insert into stargate(endereco, status_stargate, planeta)
values('32157860', 'ativo', 1);

insert into stargate(endereco, status_stargate, planeta)
values('57892141', 'ativo', 3);

insert into stargate(endereco, status_stargate, planeta)
values('45341350', 'ativo', 2);

insert into stargate(endereco, status_stargate)
values('15378528', 'danificado');

------------------------------------------- CONEXAO -------------------------------------------
insert into conexao(data_hora_ativacao, data_hora_desativacao, stargate_origem, stargate_destino)
values(
	TO_TIMESTAMP('10/12/2023 15:01', 'DD/MM/YYYY HH24:MI'),
	TO_TIMESTAMP('10/12/2023 15:30', 'DD/MM/YYYY HH24:MI'),
	'32157860', 
	'57892141'
);

insert into conexao(data_hora_ativacao, data_hora_desativacao, stargate_origem, stargate_destino)
values(
	TO_TIMESTAMP('10/12/2023 17:23', 'DD/MM/YYYY HH24:MI'),
	TO_TIMESTAMP('10/12/2023 18:05', 'DD/MM/YYYY HH24:MI'),
	'32157860', 
	'57892141'
);

insert into conexao(data_hora_ativacao, stargate_origem, stargate_destino)
values(
	TO_TIMESTAMP('10/12/2023 18:30', 'DD/MM/YYYY HH24:MI'),
	'57892141',
	'15378528'
);

