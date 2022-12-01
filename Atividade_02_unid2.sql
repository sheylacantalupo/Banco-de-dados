-- Atividade 02 da 2ª unidade
-- Sheyla Cantalupo

use livraria;

show tables;

select * from assunto;
select * from livro;
select * from editora;
SET SQL_SAFE_UPDATES = 0;

-- Criar um procedimento armazenado atualizar os valores de todos os livros em 10% 
-- Toda vez que o procedimento for chamado. Em seguida realize o teste do procedimento armazenado.
DELIMITER $$
CREATE PROCEDURE atualizar_valores()
BEGIN
	UPDATE livro SET valor = valor*1.1;
END $$

DELIMITER ;

call atualizar_valores();
SET SQL_SAFE_UPDATES = 1;


-- Criar um procedimento armazenado atualizar os valores de todos dos livros em 5% 
-- Para a editora Unipê toda vez que o procedimento for chamado. Em seguida realize o teste
-- do procedimento armazenado.
DELIMITER $$
CREATE PROCEDURE atualizar_valores2()
begin
	update livro set valor = valor*1.05
    where editora = 4;
end $$

DELIMITER ;

call atualizar_valores2();


--  Criar um procedimento armazenado consultar o título do livro, ano, nome da
-- editora e o nome do assunto toda vez que realizar o chamado do procedimento. Utilize o Join.
-- Em seguida realize o teste do procedimento armazenado.

DELIMITER $$
CREATE PROCEDURE consulta()
begin
	select l.titulo, l.ano, e.nome, a.nome
	from livro l
	inner join editora e
	on l.editora = e.codigo
	inner join assunto a
	on l.assunto = a.sigla;
	
end $$

DELIMITER ;

call consulta();
