set search_path to public;

-- CONSULTAS
-- Mostra todos os recursos associados com sua origem e tipo, ordenados por ordem crescente de origem:
select rec.planeta, rec.codigo, rec.nome, rec.origem, nat.tipo, ttec.tipo
from recurso rec
left join recurso_natural nat 
	on rec.planeta = nat.planeta and rec.codigo = nat.recurso
left join recurso_tecnologico tec
	on rec.planeta = tec.planeta and rec.codigo = tec.recurso
left join tipo_tecnologico ttec 
	on tec.planeta = ttec.planeta and tec.recurso = ttec.recurso
order by rec.origem asc;

-- Mostra todos os recursos naturais com seus tipos, ordenados por ordem crescente de tipo:
select rec.planeta, rec.codigo, rec.nome, rec.abundancia, rec.origem, nat.tipo
from recurso rec
inner join recurso_natural nat 
	on rec.planeta = nat.planeta and rec.codigo = nat.recurso
order by nat.tipo;

-- Mostra todos os recursos tecnológicos com seus tipos, ordenados por ordem crescente de tipo:
select rec.planeta, rec.codigo, rec.nome, rec.abundancia, rec.origem, ttec.tipo
from recurso rec
inner join recurso_tecnologico tec
	on rec.planeta = tec.planeta and rec.codigo = tec.recurso
inner join tipo_tecnologico ttec 
	on tec.planeta = ttec.planeta and tec.recurso = ttec.recurso
order by ttec.tipo asc;


-- Visualização de todas as tabelas separadas
select * from galaxia;

select * from sistema_estelar;

select * from planeta;

select * from recurso;

select * from stargate;

select * from conexao;

select * from remessa;

select * from civilizacao;

select * from especie;

select * from civilizacao_vive_planeta;

select * from recurso_natural;

select * from mineral;

select * from animal;

select * from vegetal;

select * from recurso_tecnologico;

select * from tipo_tecnologico;

select * from militar;

select * from medica;

select * from computacional;

select * from tecnologico_natural;

select * from processamento;
