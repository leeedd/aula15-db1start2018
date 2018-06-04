insert into uf (nome) values('PR'), ('SC'),('RS'),('SP'), ('RJ')

insert into cidade (nome, uf_id) select 'chapecó',id from uf where nome = 'SC';
insert into cidade (nome, uf_id) select 'blumenau',id from uf where nome = 'SC';
insert into cidade (nome, uf_id) select 'joinville',id from uf where nome = 'SC';
insert into cidade (nome, uf_id) select 'Curitiba',id from uf where nome = 'PR';
insert into cidade (nome, uf_id) select 'Maringá',id from uf where nome = 'PR';
insert into cidade (nome, uf_id) select 'Lunardeli',id from uf where nome = 'PR';
insert into cidade (nome, uf_id) select 'Apucarana',id from uf where nome = 'PR';
insert into cidade (nome, uf_id) select 'Santa fé',id from uf where nome = 'PR';
insert into cidade (nome, uf_id) select 'Ribeirão preto',id from uf where nome = 'SP';

delete from uf where id in (select uf.id from uf left join cidade c on c.uf_id = uf.id where c.uf_id is null)

insert into cidade (nome, uf_id) select 'Santo André',id from uf where nome = 'SP';
insert into cidade (nome, uf_id) select 'Santos',id from uf where nome = 'SP';
insert into cidade (nome, uf_id) select 'Guarulhos',id from uf where nome = 'SP';

update cidade set nome = 'Cidade Canção' where nome like 'Maring%'

select cidade.nome, uf.nome from cidade 
inner join uf on (cidade.uf_id = uf.id)
order by uf.nome , cidade.nome 

select uf.nome, count(cidade.id) 
from cidade
inner join uf on uf.id = cidade.uf_id
group by uf.nome

insert into pessoa (nome, documento)
values('neymar', '10'), ('alisson', '1'),('gabriel jesus', '11')

insert into endereco (pessoa_id, cidade_id, tipologradouro, 
logradouro, numero, cep, tipo)
select
	(select id from pessoa where nome = 'neymar'),
	cidade.id,'AV', 'nosso coracao',1,87000000,1
from cidade 
inner join uf on uf.id = cidade.uf_id
where uf.nome ='PR' and cidade.nome = 'Curitiba'


 select pessoa.nome,endereco.logradouro, cidade.nome, uf.nome
from pessoa 
inner join endereco on pessoa.id = endereco.pessoa_id
inner join cidade on endereco.cidade_id = cidade.id
inner join uf on cidade.uf_id = uf.id
order by pessoa.nome, uf.nome, cidade.nome

delete from endereco where id in (
select endereco.id from pessoa 
inner join endereco on endereco.pessoa_id = pessoa.id
inner join cidade on cidade.id = endereco.cidade_id
where cidade.nome = 'Ribeirão preto')


alter table recibo
rename prestador_fk to cliente_fk















