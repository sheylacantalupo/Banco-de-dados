use atv1;

-- TABELA CLIENTE
-- a) Inserir coluna “tipo” do tipo varchar(40)
alter table cliente add tipo varchar(40);


-- b) Altere o tipo da coluna nome para varchar(100)
alter table cliente change column nome nome varchar(100);

-- TABELA VENDEDOR
-- c) Alterar o nome da coluna “código” para “id”
alter table vendedor change column codigo id int(11) ;

-- d) Inserir coluna telefone
alter table vendedor add column telefone varchar(14);

-- TABELA PEDIDO
-- e) Alterar o nome da coluna “numeroPedido” para “numPedido”
-- o nome da coluna já é numPedido

-- f) Excluir coluna “prazoEntrega”
alter table pedido drop prazoEntrega;

-- g) Incluir colunas “tipo”, “dataEmbarque”, “dataEntrega”, “valorTotal” e “desconto”
alter table pedido add column tipo varchar(30);
alter table pedido add column dataEmbarque varchar(12);
alter table pedido add column dataEntrega varchar(12);
alter table pedido add column valorTotal decimal(7,2);
alter table pedido add column desconto decimal(7,2);

-- TABELA PRODUTO
-- h) Alterar o nome da coluna “id” para “codigo"
alter table produto change column id codigo int(11);

-- i) Excluir coluna “unidade”
alter table produto drop unidade;

-- j) alterar o nome da coluna “descricao” para “nome” e o tipo para varchar(100)
alter table produto change column descricao nome varchar(100);

-- k) Alterar o nome da coluna “valorUnitario” para “preco”
alter table produto change column valorUnitario preco decimal;

-- l) Criar Tabela Fabricante, sabendo-se que: um produto é exclusivo de um único fabricante e um fabricante pode produzir vários produtos
create table fabricante(
id int,
nome varchar(50),
primary key(id)
);

alter table produto add column fabricanteId int,
add constraint foreign key(fabricanteId) references fabricante(id);
