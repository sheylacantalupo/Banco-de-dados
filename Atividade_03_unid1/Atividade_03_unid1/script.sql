create database sistema_bancario;

use sistema_bancario;

create table banco(
codigo int not null,
nome varchar(30) not null,
primary key(codigo)
);

create table agencia(
cod_banco int not null,
numero_agencia int not null,
endereco varchar(40) not null,
primary key(cod_banco),
foreign key(cod_banco) REFERENCES banco(codigo)
);

create table cliente(
cpf int not null,
nome int not null,
sexo char(1), 
endereco varchar(40) not null,
check (sexo in('M', 'F')),
primary key(cpf),
foreign key(cod_banco) REFERENCES banco(codigo)
);

create table conta(
numero_conta char(8) not null,
saldo decimal(10,2) not null,
tipo_conta char(1), 
num_agencia varchar(5) not null,
primary key(numero_conta),
foreign key(num_agencia) REFERENCES agencia(numero_agencia)
);



