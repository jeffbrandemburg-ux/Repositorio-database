SELECT *
FROM PEDIDOS
WHERE id_funcionario = 4
  AND status = 'Pendente';
  
SELECT *
FROM PEDIDOS
WHERE status <> 'Concluído';

SELECT *
FROM PEDIDOS
WHERE id_produto IN (1, 3, 5, 7, 8);

SELECT *
FROM CLIENTES
WHERE nome LIKE 'C%';

SELECT *
FROM INFO_PRODUTOS
WHERE ingredientes LIKE '%carne%'
   OR ingredientes LIKE '%frango%';
   
SELECT *
FROM PRODUTOS
WHERE preco BETWEEN 20 AND 30;

UPDATE PEDIDOS
SET status = NULL
WHERE id_pedido = 6;

SELECT *
FROM PEDIDOS
WHERE status IS NULL;

SELECT
    id_pedido,
    IFNULL(status, 'Cancelado') AS status
FROM PEDIDOS;

SELECT
    nome, cargo, salario,
    CASE
        WHEN salario > 3000 THEN 'Acima da média'
        ELSE 'Abaixo da média'
    END AS media_salario
FROM funcionarios;

SHOW tables;