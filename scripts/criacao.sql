set search_path to public;

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
		on update cascade on delete cascade
);

------------------------------------------- PLANETA -------------------------------------------
create table Planeta(
	id_planeta int not null,
	galaxia varchar(100) not null,
	sistema varchar(100) not null,
	nome varchar(100) not null,
	tipo varchar(20),
	habitabilidade varchar(20),
	status_planeta varchar(20),
	constraint PK_PLANETA primary key(id_planeta),
	constraint UK_PLANETA_SISTEMA unique(galaxia, sistema, nome),
	constraint FK_PLANETA_SISTEMA foreign key(galaxia, sistema) references Sistema_Estelar(galaxia, nome)
		on update cascade on delete cascade
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
    origem varchar(20) not null,
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

