create database livraria;
use livraria;


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


ALTER TABLE `assunto` ADD PRIMARY KEY (`sigla`);

ALTER TABLE `editora` ADD PRIMARY KEY (`codigo`);

ALTER TABLE `livro` ADD PRIMARY KEY (`codigo`),

ADD KEY `assunto` (`assunto`),

ADD KEY `editora` (`editora`);


ALTER TABLE `livro`

ADD CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`assunto`) REFERENCES `assunto` (`sigla`),

ADD CONSTRAINT `livro_ibfk_2` FOREIGN KEY (`editora`) REFERENCES `editora` (`codigo`);









