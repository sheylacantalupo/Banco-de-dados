use locadora_veiculos;

-- 1) Recuperar o nome e telefone dos clientes, o número de contrato de locação de veículo, 
-- além do modelo e placa do veículo. Ordene os contratos pela data de saída mais recente.

select c.nome, t.numero, ct.numero, ct.dataSaida, v.placa, v.modelo 
from contrato ct inner join cliente c inner join veiculo v inner join telefone t
on ct.codigoCliente = c.codigo and ct.idVeiculo = v.id and c.codigo = t.codigoCliente
order by ct.dataSaida desc;


-- 2) 
select filial.codigo, cidade.nome, cidade.anoFundacao, sum(veiculo.codFilial) as 'Total Veículos' 
from cidade
inner join filial inner join veiculo
on cidade.codigo = filial.idCidade AND filial.codigo = veiculo.codFilial
group by veiculo.codFilial;

-- 3)
select c.nome, ct.numero as 'Número Contrato', ct.dataSaida, ct.dataDevolucao, v.placa, v.modelo 
from contrato ct inner join cliente c inner join veiculo v inner join telefone t
on ct.codigoCliente = c.codigo and ct.idVeiculo = v.id and c.codigo = t.codigoCliente
where c.nome like 'Filomena' and v.placa like 'MAB0002';

-- 4) 
select cidade.nome AS Filial, filial.rua as Rua, veiculo.modelo as Modelo, veiculo.placa as Placa, veiculo.numPortas as 'Quantidade de Portas'
from veiculo
inner join cidade inner join filial
on veiculo.codFilial = filial.codigo and filial.idCidade = cidade.codigo
where veiculo.numPortas = 4 and cidade.populacao < 100000;

-- 5) 
select veiculo.modelo as Modelo, count(*)
from veiculo inner join filial inner join cidade
on veiculo.codFilial = filial.codigo and filial.idCidade = cidade.codigo
where cidade.populacao > 500000 and veiculo.valorDiaria > 100
group by veiculo.modelo;

-- 6) 
select veiculo.modelo, veiculo.placa, avg(contrato.valorReserva) as 'Média valor'
from veiculo inner join contrato
on veiculo.id = contrato.idVeiculo
group by veiculo.placa
order by avg(contrato.valorReserva) desc;

-- 7) 
select veiculo.placa as Placa, veiculo.modelo as Modelo, veiculo.valorDiaria as 'Valor Diária'
from veiculo inner join contrato
on veiculo.id = contrato.idVeiculo
where contrato.multa = (select MAX(contrato.multa) from contrato)
group by veiculo.modelo;

-- 8)
select veiculo.modelo as Modelo, veiculo.placa as Placa
from veiculo 
where veiculo.id not in (select contrato.idVeiculo from contrato);




