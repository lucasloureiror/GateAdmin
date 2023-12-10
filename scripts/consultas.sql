set search_path to public;

-- CONSULTAS
select rec.planeta, rec.codigo, rec.nome, rec.origem, nat.tipo, ttec.tipo, rec.abundancia
from recurso rec
left join recurso_natural nat 
	on rec.planeta = nat.planeta and rec.codigo = nat.recurso
left join recurso_tecnologico tec
	on rec.planeta = tec.planeta and rec.codigo = tec.recurso
left join tipo_tecnologico ttec 
	on tec.planeta = ttec.planeta and tec.recurso = ttec.recurso
order by rec.origem asc;

delete from recurso where planeta = 1;

select tt.planeta, tt.recurso, rec.nome, rec.abundancia, rec.origem, tt.tipo
from tipo_tecnologico tt
inner join recurso_tecnologico rt 
	on rt.planeta = tt.planeta and rt.recurso = tt.recurso
inner join recurso rec
	on rec.planeta = rt.planeta and rec.codigo = rt.recurso;


-- Visualização de todas as tabelas separadas
select * from galaxia g;

select * from sistema_estelar se;

select * from planeta p;

select * from recurso rec;

select * from stargate s;

select * from conexao con;

select * from remessa rem;

select * from civilizacao civ;

select * from especie e;

select * from civilizacao_vive_planeta cvp;

select * from recurso_natural rn;

select * from mineral;

select * from animal;

select * from vegetal;

select * from recurso_tecnologico rt;

select * from tipo_tecnologico tt;

select * from militar;

select * from medica;

select * from computacional;

select * from tecnologico_natural tn;

select * from processamento;
