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

------------------------------------------- RECURSO -------------------------------------------
insert into recurso(planeta, codigo, nome, abundancia, origem)
values(1, '1784', 'Arma de fogo', 'ABUNDANTE', 'TECNOLOGICO');

insert into recurso(planeta, codigo, nome, abundancia, origem)
values(1, '2690', 'Dispositivo de comunicação para longas distâncias', 'ESCASSO', 'TECNOLOGICO');

insert into recurso(planeta, codigo, nome, abundancia, origem)
values(1, '301', 'Carvão vegetal', 'ABUNDANTE', 'NATURAL');

insert into recurso(planeta, codigo, nome, abundancia, origem)
values(1, '562', 'Diamante', 'ESCASSO', 'NATURAL');

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
	'32157860', '57892141'
);

insert into conexao(data_hora_ativacao, data_hora_desativacao, stargate_origem, stargate_destino)
values(
	TO_TIMESTAMP('10/12/2023 17:23', 'DD/MM/YYYY HH24:MI'),
	TO_TIMESTAMP('10/12/2023 18:05', 'DD/MM/YYYY HH24:MI'),
	'32157860', '57892141'
);

insert into conexao(data_hora_ativacao, stargate_origem, stargate_destino)
values(
	TO_TIMESTAMP('10/12/2023 18:30', 'DD/MM/YYYY HH24:MI'),
	'57892141', '15378528'
);

------------------------------------------- REMESSA -------------------------------------------
insert into remessa(data_hora_envio, planeta, recurso, data_hora_conexao, origem_conexao, 
					quantidade, valor_unitario, valor_total)
values(
	TO_TIMESTAMP('10/12/2023 15:08', 'DD/MM/YYYY HH24:MI'),
	1, '2690',
	TO_TIMESTAMP('10/12/2023 15:01', 'DD/MM/YYYY HH24:MI'), '32157860',
	5, 1522.90, 7614.50
);

insert into remessa(data_hora_envio, planeta, recurso, data_hora_conexao, origem_conexao, 
					quantidade, valor_unitario, valor_total)
values(
	TO_TIMESTAMP('10/12/2023 17:35', 'DD/MM/YYYY HH24:MI'),
	1, '301',
	TO_TIMESTAMP('10/12/2023 17:23', 'DD/MM/YYYY HH24:MI'), '32157860',
	500, 5, 2500
);

insert into remessa(data_hora_envio, planeta, recurso, data_hora_conexao, origem_conexao, 
					quantidade, valor_unitario, valor_total)
values(
	TO_TIMESTAMP('10/12/2023 17:35', 'DD/MM/YYYY HH24:MI'),
	1, '562',
	TO_TIMESTAMP('10/12/2023 17:23', 'DD/MM/YYYY HH24:MI'), '32157860',
	3, 60000, 180000
);

----------------------------------------- CIVILIZACAO -----------------------------------------
insert into civilizacao(nome, lingua, nivel_tecnologico, nivel_agressividade, status_civilizacao)
values('Humanos', 'inglês', 'MEDIANO', 'MEDIANO', 'existente');

insert into civilizacao(nome, lingua, nivel_tecnologico, nivel_agressividade, status_civilizacao)
values('Lantianos', 'ancient', 'AVANÇADO', 'BAIXO', 'destruída');

------------------------------------------- ESPECIE -------------------------------------------
insert into especie(nome, civilizacao, forma_locomocao, simetria, alimentacao)
values('Humana', 'Humanos', 'BIPEDE TERRESTRE', 'BILATERAL', 'ONIVORO');

insert into especie(nome, civilizacao, forma_locomocao, simetria, alimentacao)
values('Ancients', 'Lantianos', 'BIPEDE TERRESTRE', 'BILATERAL', 'ONIVORO');

---------------------------------- CIVILIZACAO_VIVE_PLANETA -----------------------------------
insert into civilizacao_vive_planeta(civilizacao, planeta, localizacao, populacao)
values('Humanos', 1, 'Estados Unidos', '331.9 milhões');

insert into civilizacao_vive_planeta(civilizacao, planeta, localizacao, populacao)
values('Humanos', 3, 'Atlantis', '423');

------------------------------------------- NATURAL -------------------------------------------
insert into recurso_natural(planeta, recurso, tipo)
values(1, '301', 'VEGETAL');

insert into recurso_natural(planeta, recurso, tipo)
values(1, '562', 'MINERAL');

----------------------------------------- TECNOLOGICO -----------------------------------------
insert into recurso_tecnologico(planeta, recurso)
values(1, '1784');

insert into recurso_tecnologico(planeta, recurso)
values(1, '2690');

-------------------------------------- TIPO_TECNOLOGICO ---------------------------------------
insert into tipo_tecnologico(planeta, recurso, tipo)
values(1, '1784', 'MILITAR');

insert into tipo_tecnologico(planeta, recurso, tipo)
values(1, '2690', 'COMPUTACIONAL');

------------------------------------- TECNOLOGICO_NATURAL -------------------------------------
--insert into tecnologico_natural(planeta_tec, recurso_tec, planeta_nat, recurso_nat)
--values();

