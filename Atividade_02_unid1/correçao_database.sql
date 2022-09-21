create database correcao_codigo;
use correcao_codigo;

create table canteiro (
canteiro_id int not null auto_increment,
nome char(20) default null,
luz_diaria int(2) default null,
agua_diaria int(3) default null,
primary key (canteiro_id)
);
 
create table funcionario (
funcionario_id int not null auto_increment,
nome varchar(80) not null ,
idade int(2) default null,
primary key (funcionario_id)
);

create table  planta (
id int(11) not null auto_increment,
nome char(20) not null,
luz_diaria int(2) default null,
agua int(2) default null,
peso int(2) default null,
PRIMARY KEY (id)
);

create table plantio (
plantio_id int(11) not null AUTO_INCREMENT,
planta_id int(11) not null,
func_id int(11) not null ,
canteiro_id int(11) not null,
data_plantio date default null,
sementes int(4) not null,
PRIMARY KEY (plantio_id),
foreign key(planta_id) REFERENCES planta(id),
foreign key(func_id) REFERENCES funcionario(funcionario_id)
);

CREATE TABLE colhido (
colhido_id int(11) not null auto_increment,
planta_id int(11) not null,
func_id int(11) not null,
canteiro_id int(11) not null,
data_colhido date default null,
quantidade int(4) default null,
peso double(4,3) default null,
PRIMARY KEY (colhido_id),
FOREIGN KEY(planta_id) references planta(id),
FOREIGN KEY(func_id) references funcionario(funcionario_id),
FOREIGN KEY(canteiro_id) references canteiro(canteiro_id)
);



insert into canteiro values(1,'tomateiro', 20, 30),(2,'hortaliças', 10, 40), 
(3,'raízes', 10, 25);

insert into funcionario values (1,'João', 30),(2,'Maria', 40), 
(3,'Heitor', 25);

insert into planta values(1, "tomate", 20, 10, 2),(2, "tomate", 20, 10, 2), 
(3, "tomate", 20, 10, 2);

insert into plantio values(6, 1, 1,1, 12-05-2020, 20), (7, 1, 3,1, 13-04-2020, 20), 
(8, 2, 1,1, 02-07-2020, 20);

insert into colhido values(1, 2, 3, 2,'25-12-2021', 12, 30),(2, 2, 3, 2,'05-02-2021', 12, 30), 
(3, 2, 3, 2,'05-12-2020', 12, 30);





