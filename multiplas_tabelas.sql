USE restaurante;

-- 1. Produtos e seus ingredientes
SELECT
    p.id,
    p.nome,
    p.descricao,
    ip.ingredientes
FROM produtos AS p
INNER JOIN info_produtos AS ip
    ON p.id = ip.id_produto;

-- 2. Pedidos e clientes
SELECT
    pe.id,
    pe.quantidade,
    pe.data,
    c.nome,
    c.email
FROM pedidos AS pe
INNER JOIN clientes AS c
    ON pe.id_cliente = c.id;

-- 3. Pedidos, clientes e funcionários
SELECT
    pe.id,
    pe.quantidade,
    pe.data,
    c.nome AS cliente,
    c.email,
    f.nome AS funcionario
FROM pedidos AS pe
INNER JOIN clientes AS c
    ON pe.id_cliente = c.id
INNER JOIN funcionarios AS f
    ON pe.id_funcionario = f.id;

-- 4. Pedidos, clientes, funcionários e produtos
SELECT
    pe.id,
    pe.quantidade,
    pe.data,
    c.nome AS cliente,
    c.email,
    f.nome AS funcionario,
    p.nome AS produto,
    p.preco
FROM pedidos AS pe
INNER JOIN clientes AS c
    ON pe.id_cliente = c.id
INNER JOIN funcionarios AS f
    ON pe.id_funcionario = f.id
INNER JOIN produtos AS p
    ON pe.id_produto = p.id;

-- 5. Clientes com pedidos pendentes, em ordem decrescente do id do pedido
SELECT
    c.nome AS cliente,
    pe.id AS pedido_id
FROM clientes AS c
INNER JOIN pedidos AS pe
    ON c.id = pe.id_cliente
WHERE pe.status = 'Pendente'
ORDER BY pe.id DESC;

-- 6. Clientes sem pedidos
SELECT
    c.nome
FROM clientes AS c
LEFT JOIN pedidos AS pe
    ON c.id = pe.id_cliente
WHERE pe.id IS NULL;

-- 7. Nome do cliente e total de pedidos
SELECT
    c.nome,
    COUNT(pe.id) AS total_pedidos
FROM clientes AS c
LEFT JOIN pedidos AS pe
    ON c.id = pe.id_cliente
GROUP BY c.id, c.nome;

-- 8. Preço total de cada pedido (quantidade * preço)
SELECT
    pe.id AS pedido_id,
    pe.quantidade,
    p.preco,
    (pe.quantidade * p.preco) AS preco_total
FROM pedidos AS pe
INNER JOIN produtos AS p
    ON pe.id_produto = p.id;
