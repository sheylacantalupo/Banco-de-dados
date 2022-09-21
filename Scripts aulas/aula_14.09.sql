create database dml1;

use dml1;

--  Criar tabela salário

create table salario(
cod int auto_increment,
descricao varchar(30),
valor decimal(7,2),
primary key(cod)
);

create table colaborador(
id int not null auto_increment,
cpf int,
noeme varchar(10) not null,
nascimento date,
sexo char(1),
codigo_salario int,
primary key(id),
unique (cpf), -- não aceita valores repetidos
check (sexo in ('m', 'f')),
foreign key(codigo_salario) references salario(cod)
);

-- Trabalhando com DML

select * from salario;
select * from colaborador;

insert into salario values(1,'DBA', 6000.00);
insert into salario values(2,'Modelador', 5400.00);
insert into salario values(3,'Analista', 7400.00);
insert into salario values(4,'PO', 6800.00);

insert into salario (cod, descricao) values(15,'Estagiario');

insert into colaborador values (101, 987, 'Fernando', '2001-09-11', 'm',1);

-- Atualizando dados (update)

update colaborador set nascimento = '2002-05-12' where id=101;

-- Apagar dados nas tabelas

delete from salario where cod=1;





