-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 17-Maio-2017 às 18:31
-- Versão do servidor: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `novoatualizado`
--

-- --------------------------------------------------------
CREATE DATABASE aula_consultas_parte1;
USE aula_consultas_parte1;
--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `tb_cliente` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `CPF` char(11) NOT NULL,
  `telefone` char(11) DEFAULT NULL,
  `tipo` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `tb_cliente` (`codigo`, `nome`, `endereco`, `CPF`, `telefone`, `tipo`) VALUES
(101, 'Ana Cláudia', 'R. Alfa, João Pessoa, PB', '03097668715', '83999891165', 'VIP'),
(102, 'Ana Maria', 'Rua Beta, Timbaúba, PE', '78965412309', '81987891435', NULL),
(103, 'João Paulo', 'Av. Gama, Sr. Do Bonfim, BA', '87656789001', '74979891699', 'VIP'),
(124, 'Maria José', 'Av. Alfa, João Pessoa, PB', '87614265291', '83998769665', 'VIP'),
(126, 'João José', 'Av. Pedro II, Natal, RN', '76512389062', '84978991887', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `fabricante`
--

CREATE TABLE `tb_fabricante` (
  `id` char(4) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `fabricante`
--

INSERT INTO `tb_fabricante` (`id`, `nome`) VALUES
('F001', 'HP'),
('F002', 'Compaq'),
('F003', 'Dell'),
('F004', 'LG'),
('F005', 'Sony'),
('F006', 'Tramontina');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itempedido`
--

CREATE TABLE `tb_itempedido` (
  `numPedido` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `itempedido`
--

INSERT INTO `tb_itempedido` (`numPedido`, `idProduto`, `quantidade`) VALUES
(1, 1001, 1),
(2, 1002, 2),
(3, 1001, 1),
(3, 1010, 2),
(3, 1020, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `tb_pedido` (
  `numPedido` int(11) NOT NULL,
  `codigoCliente` int(11) DEFAULT NULL,
  `codigoVendedor` int(11) DEFAULT NULL,
  `tipo` varchar(40) DEFAULT NULL,
  `dataEmbarque` date DEFAULT NULL,
  `dataEntrega` date DEFAULT NULL,
  `valorTotal` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pedido`
--

INSERT INTO `tb_pedido` (`numPedido`, `codigoCliente`, `codigoVendedor`, `tipo`, `dataEmbarque`, `dataEntrega`, `valorTotal`, `desconto`) VALUES
(1, 101, 5, 'à vista', '2017-01-12', '2017-02-12', '3000.00', '10.00'),
(2, 102, 5, 'a prazo 30 dias', '2017-02-15', '2017-03-20', '7001.39', NULL),
(3, 124, 1, 'à vista', '2016-12-22', '2017-01-25', '8549.99', '5.00'),
(4, 101, 2, 'a prazo 30 dias', '2016-11-18', '2016-12-29', NULL, NULL),
(5, 101, 1, 'à vista', '2017-02-12', '2017-02-12', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `tb_produto` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `preco` decimal(10,2) DEFAULT NULL,
  `codigoFabricante` char(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `tb_produto` (`codigo`, `nome`, `preco`, `codigoFabricante`) VALUES
(1001, 'TV', '3500.00', 'F004'),
(1002, 'Laptop', '3500.69', 'F001'),
(1004, 'Faqueiro', NULL, 'F006'),
(1010, 'Impressora', '295.50', 'F001'),
(1020, 'Laptop', '5000.99', 'F003'),
(1111, 'TV', NULL, 'F005');

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendedor`
--

CREATE TABLE `tb_vendedor` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `salario` decimal(7,2) DEFAULT NULL,
  `telefone` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `vendedor`
--

INSERT INTO `tb_vendedor` (`id`, `nome`, `salario`, `telefone`) VALUES
(1, 'Radigondes', '4000.00', '8399779154'),
(2, 'Barenice', '3500.00', '8399879650'),
(3, 'Gildete', '7000.00', '8198998150'),
(4, 'Astrogildo', '5500.00', '8199876096'),
(5, 'Rivelino', '1850.00', '8399008598');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `CPF` (`CPF`);

--
-- Indexes for table `fabricante`
--
ALTER TABLE `tb_fabricante`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itempedido`
--
ALTER TABLE `tb_itempedido`
  ADD PRIMARY KEY (`numPedido`,`idProduto`),
  ADD KEY `FK_produtoItem` (`idProduto`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `tb_pedido`
  ADD PRIMARY KEY (`numPedido`),
  ADD KEY `FK_clientePedido` (`codigoCliente`),
  ADD KEY `FK_vendedorPedido` (`codigoVendedor`);

--
-- Indexes for table `produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `codigoFabricante` (`codigoFabricante`);

--
-- Indexes for table `vendedor`
--
ALTER TABLE `tb_vendedor`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `itempedido`
--
ALTER TABLE `tb_itempedido`
  ADD CONSTRAINT `FK_pedidoItem` FOREIGN KEY (`numPedido`) REFERENCES `tb_pedido` (`numPedido`),
  ADD CONSTRAINT `FK_produtoItem` FOREIGN KEY (`idProduto`) REFERENCES `tb_produto` (`codigo`);

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `tb_pedido`
  ADD CONSTRAINT `FK_clientePedido` FOREIGN KEY (`codigoCliente`) REFERENCES `tb_cliente` (`codigo`),
  ADD CONSTRAINT `FK_vendedorPedido` FOREIGN KEY (`codigoVendedor`) REFERENCES `tb_vendedor` (`id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `tb_produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`codigoFabricante`) REFERENCES `tb_fabricante` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
