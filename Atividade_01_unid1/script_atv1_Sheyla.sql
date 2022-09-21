create database atv1;
use atv1;
-- Criando tabela cliente
create table cliente(
codigo int not null,
nome varchar(50),
endereco varchar(100),
CPF char(11) not null,
telefone char(11),
primary key(codigo)
);

-- Criando tabela vendedor
create table vendedor(
codigo int not null,
nome varchar(50),
salario decimal(7,2),
primary key(codigo)
);

-- Criando tabela produto
create table produto(
id int not null,
unidade char(3),
descricao varchar(50),
valorUnitario decimal(7,2),
primary key(id)
);

-- Criando tabela pedido
create table pedido(
numPedido int not null,
prazoEntrega date,
codigoCliente int,
codigoVendedor int,
primary key(numPedido),
constraint FK_CLIENTE_PEDIDO foreign key (codigoCliente) references cliente(codigo) on delete cascade,
constraint FK_VENDEDOR_PEDIDO foreign key (codigoVendedor) references vendedor(codigo) on delete cascade
);

-- Criando tabela itemPedido
create table itemPedido(
numeroPedido int not null,
idProduto int not null,
quantidade int,
constraint PK_ItemPedido primary key (numeroPedido,idProduto),
constraint FK_PEDIDO_ItemPedido foreign key (numeroPedido) references pedido(numPedido) on delete cascade,
constraint FK_PRODUTO_ItemPedido foreign key (idProduto) references produto(id) on delete cascade
);

