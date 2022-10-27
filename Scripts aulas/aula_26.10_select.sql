use aula_consultas_parte1;

select * from tb_cliente;
select nome, endereco from tb_cliente where nome like 'A%';
select nome, endereco from tb_cliente where nome like '%o';
select nome as Nome, endereco as Endereço from tb_cliente where nome like '%o%';
select nome, endereco from tb_cliente where nome like '%o__o%';
select nome, endereco from tb_cliente where nome not like '%o__o%';
select * from tb_pedido;
select count(*) tipo from tb_pedido;
select count(*), tipo from tb_pedido group by tipo;
select * from tb_produto;

-- quantidade de cada produto
select sum(preco) from tb_produto;
select avg(preco) from tb_produto;

-- Between vai incluso os limites
select * from tb_vendedor;
select nome, telefone from tb_vendedor where salario>3500 and salario<6000;
select nome, telefone from tb_vendedor where salario between 3500 and 6000;
select nome, telefone from tb_vendedor where salario not between 3500 and 6000;

-- group by
select count(*), nome from tb_produto group by nome;
select * from tb_pedido;
select tipo from tb_pedido group by tipo;


-- Order by (asc/desc)

select * from tb_produto;
select distinct nome from tb_produto
order by nome asc;
