USE aula_consultas_parte1;

select codigo, nome, endereco, cpf, telefone, tipo from tb_cliente;
select nome, cpf, telefone from tb_cliente;
select tipo, codigo, nome from tb_cliente;
select * from tb_cliente;

select tb_cliente.codigo from tb_cliente;

select tb_cliente.codigo, tb_cliente.CPF from tb_cliente;

select c.codigo, c.CPF, c.nome from tb_cliente c;

select * from tb_produto;

select nome, preco from tb_produto;

select nome as NOME, preco as PREÇO from tb_produto;

select * from tb_fabricante;

select nome, salario, salario*1.15 from tb_vendedor;

select nome Nome, salario Salário, salario*1.15 'Novo Salário' from tb_vendedor;

select nome, preco from tb_produto where codigo  = 1020;

select * from tb_produto where preco is null and codigo = 1004;

select * from tb_produto where preco is not null;

select nome, salario from tb_vendedor where salario < 5000;

select tipo from tb_pedido;

select distinct tipo from tb_pedido;

select * from tb_produto;
select nome, preco from tb_produto where codigo = 1010 or codigo = 1111 
or codigo = 1104;

select nome, preco from tb_produto where codigo in (1010, 1111, 1104);

select nome, preco from tb_produto where codigo not in (1111, 1104);





