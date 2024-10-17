create database vendas;
use vendas;

create table Produto (
id int not null auto_increment,
Codigo_produto int,
Descricao_Produto varchar(30),
Preco_produto float,
primary key(id)
) default charset = utf8mb4;

create table Nota_fiscal (
Numero_NF int,
Data_NF date,
Valor_NF float,
primary key (Numero_NF)
) default charset = utf8mb4;

create table Itens (
Produto_Codigo_Produto int,
Nota_fiscal_Numero_NF int,
Num_item int,
Qtde_item int,
primary key (Produto_Codigo_Produto, Nota_fiscal_Numero_NF)
) default charset = utf8mb4;

alter table Produto modify column Descricao_Produto varchar(50);
alter table Nota_fiscal add column ICMS float after Numero_NF;
alter table Produto add column Peso float;
alter table Itens drop primary key;
alter table Itens add primary key (Num_item);

describe Produto;
describe Nota_Fiscal;
describe Itens;

alter table Nota_fiscal change column Valor_NF ValorTotal_NF float;
alter table Nota_fiscal drop Data_NF;

drop table itens;

alter table Nota_fiscal rename to Venda;
describe Venda
