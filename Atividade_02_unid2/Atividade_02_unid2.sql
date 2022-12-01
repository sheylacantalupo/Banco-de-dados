use livraria2;

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
