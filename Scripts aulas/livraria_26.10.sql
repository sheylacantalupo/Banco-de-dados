create database livraria2;
use livraria2;


CREATE TABLE `assunto` (

`sigla` char(2) NOT NULL,

`nome` varchar(40) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;


INSERT INTO `assunto` (`sigla`, `nome`) VALUES

('BD', 'Banco de Dados'),

('ES', 'Engenharia de Software'),

('GP', 'Gerência de Projetos'),

('PR', 'Programação'),

('RC', 'Redes de Computadores');



CREATE TABLE `editora` (

`codigo` int(11) NOT NULL,

`nome` varchar(20) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `editora` (`codigo`, `nome`) VALUES

(1, 'Pearson'),

(2, 'Saraiva'),

(3, 'Bookman'),

(4, 'Unipê');


CREATE TABLE `livro` (

`codigo` int(11) NOT NULL,

`titulo` varchar(50) DEFAULT NULL,

`valor` decimal(6,2) DEFAULT NULL,

`ano` int(11) DEFAULT NULL,

`assunto` char(2) DEFAULT NULL,

`editora` int(11) DEFAULT NULL

) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO `livro` (`codigo`, `titulo`, `valor`, `ano`, `assunto`, `editora`) VALUES

(1, 'MySQL', '100.00', 2014, 'BD', 1),

(2, 'Introdução ao PMBOK', '88.00', 2014, 'GP', 2),

(3, 'JAVA', '75.00', 2014, 'PR', 2),

(4, 'Engenharia de Software', '120.00', 2013, 'ES', 3),

(5, 'Pyhton', '65.00', 2015, 'PR', 4),

(6, 'Oracle', '150.00', 2016, 'BD', 4),

(7, 'Redes de Computadores', '99.00', 2016, 'RC', 1);


ALTER TABLE `assunto`

ADD PRIMARY KEY (`sigla`);


ALTER TABLE `editora`

ADD PRIMARY KEY (`codigo`);



ALTER TABLE `livro`

ADD PRIMARY KEY (`codigo`),

ADD KEY `assunto` (`assunto`),

ADD KEY `editora` (`editora`);


ALTER TABLE `livro`

ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`assunto`) REFERENCES `assunto` (`sigla`),

ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`editora`) REFERENCES `editora` (`codigo`);


use livraria2;

select * from assunto;
select * from editora;
select * from livro;

select assunto from livro group by assunto;

select  assunto,count(*) as quantidade from livro group by assunto;

select assunto, max(valor) from livro group by assunto;

select assunto from livro group by assunto having avg(valor)>85;

-- Subconsultas

select * from livro;
select valor from livro;
select titulo, max(valor) as Valor from livro;
select titulo, valor from livro where valor>=150;
select titulo, ano from livro where valor <=  (select max(valor) from livro);

-- Consulta em duas ou mais tabelas
select * from livro;
select * from editora;
select a.nome, e.nome ,
l.titulo , l.valor, l.ano 
from assunto a, editora e, livro l 
where a.sigla=l.assunto 
and e.codigo = l.editora 
and l.valor>80;








