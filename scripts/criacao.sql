set search_path to public;

------------------------------------------- GALAXIA -------------------------------------------
create table Galaxia(
	nome varchar(100) not null,
	tipo varchar(9),
	constraint PK_GALAXIA primary key(nome),
	constraint CK_TIPO check(upper(tipo) in ('ELIPTICA', 'ESPIRAL', 'IRREGULAR'))
);

--------------------------------------- SISTEMA_ESTELAR ---------------------------------------
create table Sistema_Estelar(
	galaxia varchar(100) not null,
	nome varchar(100) not null,
	tipo varchar(20),
	constraint PK_SISTEMA primary key(galaxia, nome),
	constraint FK_SISTEMA_GALAXIA foreign key(galaxia) references Galaxia(nome)
		on update cascade on delete cascade
);

------------------------------------------- PLANETA -------------------------------------------
create table Planeta(
	id_planeta int not null,
	galaxia varchar(100) not null,
	sistema varchar(100) not null,
	nome varchar(100) not null,
	tipo varchar(7),
	habitabilidade varchar(20),
	status_planeta varchar(20),
	constraint PK_PLANETA primary key(id_planeta),
	constraint UK_PLANETA_SISTEMA unique(galaxia, sistema, nome),
	constraint FK_PLANETA_SISTEMA foreign key(galaxia, sistema) references Sistema_Estelar(galaxia, nome)
		on update cascade on delete cascade,
	constraint CK_TIPO check(upper(tipo) in ('ROCHOSO', 'GASOSO'))
);

create sequence SEQ_PLANETA
    start with 1
    increment by 1;
   
------------------------------------------- RECURSO -------------------------------------------
create table Recurso(
    planeta int not null,
    codigo varchar(9) not null,
    nome varchar(150),
    abundancia varchar(20),
    origem varchar(11) not null,
    constraint PK_RECURSO primary key(planeta, codigo),
    constraint FK_RECURSO_PLANETA foreign key(planeta) references Planeta(id_planeta) 
    	on update cascade on delete cascade,
    constraint CK_ORIGEM check(upper(origem) in ('NATURAL', 'TECNOLOGICO'))
);

------------------------------------------ STARGATE -------------------------------------------
create table Stargate(
	endereco char(8) not null,
	status_stargate varchar(20),
	planeta int,
	constraint PK_STARGATE primary key(endereco),
	constraint UK_STARGATE_PLANETA unique(planeta),
	constraint FK_STARGATE_PLANETA foreign key(planeta) references Planeta(id_planeta)
		on update cascade on delete cascade,
	constraint CK_ENDERECO check (endereco ~ '^[0-9]+$')
);

------------------------------------------- CONEXAO -------------------------------------------
create table Conexao(
	data_hora_ativacao timestamp not null,
	data_hora_desativacao timestamp,
	stargate_origem char(8) not null,
	stargate_destino char(8) not null,
	constraint PK_CONEXAO primary key(data_hora_ativacao, stargate_origem),
	constraint UK_CONEXAO_STARGATE_DESTINO unique(data_hora_ativacao, stargate_destino),
	constraint FK_CONEXAO_STARGATE_ORIGEM foreign key(stargate_origem) references Stargate(endereco)
		on update cascade on delete cascade,
	constraint FK_CONEXAO_STARGATE_DESTINO foreign key(stargate_destino) references Stargate(endereco)
		on update cascade on delete cascade,
	constraint CK_ORIGEM_DESTINO check (stargate_origem <> stargate_destino),
	constraint CK_ATIVACAO_DESATIVACAO check (data_hora_desativacao > data_hora_ativacao)
);

------------------------------------------- REMESSA -------------------------------------------
create table Remessa(
	data_hora_envio timestamp not null,
	planeta int not null,
	recurso varchar(9) not null,
	data_hora_conexao timestamp not null,
	origem_conexao char(8) not null,
	quantidade int,
	valor_unitario numeric(8,2),
	valor_total numeric(8,2),
	constraint PK_REMESSA primary key(data_hora_envio, planeta, recurso, data_hora_conexao, origem_conexao),
	constraint FK_REMESSA_RECURSO foreign key(planeta, recurso) references Recurso(planeta, codigo)
		on update cascade on delete cascade,
	constraint FK_REMESSA_CONEXAO foreign key(data_hora_conexao, origem_conexao)
		references Conexao(data_hora_ativacao, stargate_origem)
		on update cascade on delete cascade,
	constraint CK_DATA_HORA_ENVIO check(data_hora_envio > data_hora_conexao),
	constraint CK_QUANTIDADE check(quantidade > 0),
	constraint CK_VALOR_UNITARIO check(valor_unitario > 0),
	constraint CK_VALOR_TOTAL check(valor_total > 0)
);

----------------------------------------- CIVILIZACAO -----------------------------------------
create table Civilizacao(
	nome varchar(100) not null,
	lingua varchar(20),
	nivel_tecnologico varchar(20),
	nivel_agressividade varchar(20),
	status_civilizacao varchar(20),
	constraint PK_CIVILIZACAO primary key(nome)
);

------------------------------------------- ESPECIE -------------------------------------------
create table Especie(
	nome varchar(100) not null,
	civilizacao varchar(100) not null,
	forma_locomocao varchar(20),
	simetria varchar(12),
	alimentacao varchar(9),
	constraint PK_ESPECIE primary key(nome),
	constraint UK_ESPECIE_CIVILIZACAO unique(civilizacao),
	constraint CK_SIMETRIA check(upper(simetria) in ('BILATERAL', 'RADIAL', 'SEM SIMETRIA')),
	constraint CK_ALIMENTACAO check(upper(alimentacao) in ('HERBIVORO', 'CARNIVORO', 'ONIVORO', 'OUTRO'))
);

