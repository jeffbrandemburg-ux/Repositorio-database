CREATE DATABASE RESTAURANTE;
CREATE TABLE FUNCIONARIOS(
id_funcionario INT PRIMARY KEY AUTO_INCREMENT, 
nome varchar(255),
CPF VARCHAR(14),
data_nascimento date,
endereco VARCHAR(255),
telefone VARCHAR(15),
email VARCHAR(100),
cargo VARCHAR(100),
salario DECIMAL(10,2),
data_admissao DATE
);
CREATE TABLE CLIENTES(
id_cliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255),
CPF VARCHAR(14),
data_nascimento DATE,
endereco VARCHAR(255),
telefone VARCHAR(15),
email VARCHAR(100),
data_cadastro DATE
);
CREATE TABLE PRODUTOS(
id_produto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(255),
DESCRICAO TEXT,
preco DECIMAL(10,2),
categoria VARCHAR(100)
);
CREATE TABLE PEDIDOS(
id_pedido INT PRIMARY KEY AUTO_INCREMENT,
quantidade INT,
preco DECIMAL(10,2),
data_pedido DATE,
status VARCHAR(50),
FOREIGN KEY (id_cliente) references id_cliente,
FOREIGN KEY(id_funcionario) references id_funcionario,
FOREIGN KEY(id_produto) references id_produto
);
CREATE TABLE INFO_PRODUTOS(
id_info INT PRIMARY KEY AUTO_INCREMENT,
ingredientes TEXT,
fornecedor VARCHAR(255),
FOREIGN KEY(id_produto) references id_produto
);
show tables;