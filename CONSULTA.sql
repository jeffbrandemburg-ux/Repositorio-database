USE restaurante;

SELECT nome, categoria
FROM PRODUTOS
WHERE preco > 30
LIMIT 100;

SELECT nome, telefone, data_nascimento
FROM CLIENTES
WHERE YEAR(data_nascimento) < 1985
LIMIT 100;

SELECT id_produto, ingredientes
FROM INFO_PRODUTOS
WHERE ingredientes LIKE 'carne'
LIMIT 100;

SELECT nome, categoria
FROM PRODUTOS
ORDER BY categoria ASC, nome ASC
LIMIT 100;

SELECT preco
FROM PRODUTOS
ORDER BY preco DESC
LIMIT 5;

SELECT categotia
FROM PRODUTOS
WHERE categoria = 'Prato Principal'
LIMIT 2 OFFSET 6;

CREATE TABLE BACKUP_PEDIDOS AS
SELECT * FROM PEDIDOS;
