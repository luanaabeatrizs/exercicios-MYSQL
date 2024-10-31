-- Exercício 01 --
select * from produto;
select Codigo_produto, Descricao_Produto, Preco_produto from produto;

-- Exercício 02 --
select * from Venda;
select Numero_NF, ValorTotal_NF from Venda;

-- ALIMENTANDO A TABELA PARA AS CONSULTAS DOS EXERCÍCIOS ABAIXO --
insert into produto (Codigo_produto, Descricao_Produto, Preco_produto, Peso)
values (1546, 'Teclado mecânico', 250.00, 300);

alter table venda
add column idProduto int;

alter table venda
add foreign key (idProduto)
references produto(id);

insert into venda (Numero_NF, ICMS, ValorTotal_NF, idProduto)
values (101, 57, 250.00, 1);

-- Exercício 03 --
select p.Codigo_produto, p.Preco_produto, v.ValorTotal_NF, idProduto
from produto as p join venda as v 
where v.Numero_NF = 101;

-- Exercício 04 --
select sum(ValorTotal_NF) as Total_Vendas from venda;

-- Exercício 05 --
select sum(ICMS) as Total_ICMS from venda;

-- Exercício 06 --
select p.Descricao_Produto, v.ValorTotal_NF
from produto as p join venda as v;

-- Exercício 07 --
select p.Descricao_Produto, sum(p.Peso) as Total_Peso
from produto as p join venda as v
where v.Numero_NF = 101
GROUP BY p.Descricao_Produto;
