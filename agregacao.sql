USE ATIVIDADE_RESTAURANTE;

SELECT COUNT(*) AS quantidade
FROM PEDIDOS;

SELECT COUNT(DISTINCT id_cliente) AS clientes
FROM PEDIDOS;

SELECT AVG(preco) AS preco
FROM PRODUTOS;

SELECT 
    MIN(preco) AS preco,
    MAX(preco) AS preco
FROM PRODUTOS;

SELECT 
    nome,
    preco,
    DENSE_RANK() OVER (ORDER BY preco DESC) AS ranking
FROM PRODUTOS
ORDER BY preco DESC
LIMIT 5;

SELECT 
    categoria,
    AVG(preco) AS preco
FROM PRODUTOS
GROUP BY categoria;

SELECT 
    fornecedor,
    COUNT(id_produto) AS produtos
FROM INFO_PRODUTOS
GROUP BY fornecedor;

SELECT 
    fornecedor,
    COUNT(id_produto) AS produtos
FROM INFO_PRODUTOS
GROUP BY fornecedor
HAVING COUNT(id_produto) > 1;

SELECT 
    c.nome,
    COUNT(p.id_pedido) AS pedidos
FROM CLIENTES c
INNER JOIN PEDIDOS p 
    ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente, c.nome
HAVING COUNT(p.id_pedido) = 1;

show tables;