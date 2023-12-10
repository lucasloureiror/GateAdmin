set search_path to public;

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

select * from recurso_tecnologico rt;

select * from tipo_tecnologico tt;

select * from tecnologico_natural tn;

select tt.planeta, tt.recurso, rec.nome, rec.abundancia, rec.origem, tt.tipo
from tipo_tecnologico tt
inner join recurso_tecnologico rt 
	on rt.planeta = tt.planeta and rt.recurso = tt.recurso
inner join recurso rec
	on rec.planeta = rt.planeta and rec.codigo = rt.recurso;