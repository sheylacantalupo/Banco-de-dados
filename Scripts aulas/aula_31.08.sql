create database empresa3;
use empresa3;

-- Sintaxe para criar a tabela pessoa
create table pessoa(
cod int,
nome varchar(30),
sexo char(1),
check (sexo in ('m', 'f')),
primary key(cod)
);

-- Sintaxe para criar a tabela produto
create table produto(
id int,
descricao varchar(50),
codigo int,
primary key (id), -- toda tabela tem chave primária
constraint FK_PESSOA_PRODUTO foreign key (codigo) references pessoa(cod) on delete cascade
);

-- Inserindo dados na tabela pessoa
insert into pessoa (cod,nome,sexo) values(1, 'Ana', 'f');
insert into pessoa (cod,nome,sexo) values(2, 'Maria', 'f');
insert into pessoa (cod,nome,sexo) values(3, 'Paulo', 'm');
select * from pessoa;
select * from produto;


-- Inserindo dados na tabela produto
insert into produto values(101,'mouse', 1),(102,'teclado', 3), 
(103,'monitor', 1);
-- tentar apagar item referenciado
delete from pessoa where cod=3;

drop table produto;
drop database empresa3;


