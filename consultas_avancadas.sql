USE restaurante;

-- 1. Criação da VIEW resumo_pedido
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT
    pe.id AS pedido_id,
    pe.quantidade,
    pe.data,
    c.nome AS cliente,
    c.email,
    f.nome AS funcionario,
    p.nome AS produto,
    p.preco
FROM pedidos AS pe
INNER JOIN clientes AS c ON pe.id_cliente = c.id
INNER JOIN funcionarios AS f ON pe.id_funcionario = f.id
INNER JOIN produtos AS p ON pe.id_produto = p.id;

-- 2. ID do pedido, cliente e total
SELECT
    pedido_id,
    cliente,
    quantidade * preco AS total
FROM resumo_pedido;

-- 3. Atualização da VIEW adicionando o campo total
CREATE OR REPLACE VIEW resumo_pedido AS
SELECT
    pe.id AS pedido_id,
    pe.quantidade,
    pe.data,
    c.nome AS cliente,
    c.email,
    f.nome AS funcionario,
    p.nome AS produto,
    p.preco,
    pe.quantidade * p.preco AS total
FROM pedidos AS pe
INNER JOIN clientes AS c ON pe.id_cliente = c.id
INNER JOIN funcionarios AS f ON pe.id_funcionario = f.id
INNER JOIN produtos AS p ON pe.id_produto = p.id;

-- 4. Consulta utilizando o campo total da VIEW
SELECT
    pedido_id,
    cliente,
    total
FROM resumo_pedido;

-- 5. EXPLAIN para analisar a execução da VIEW e seus JOINs
EXPLAIN
SELECT
    pedido_id,
    cliente,
    total
FROM resumo_pedido;

-- 6. Função BuscaIngredientesProduto
DROP FUNCTION IF EXISTS BuscaIngredientesProduto;

DELIMITER $$

CREATE FUNCTION BuscaIngredientesProduto(p_id_produto INT)
RETURNS TEXT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_ingredientes TEXT;

    SELECT ip.ingredientes
    INTO v_ingredientes
    FROM info_produtos AS ip
    WHERE ip.id_produto = p_id_produto
    LIMIT 1;

    RETURN v_ingredientes;
END$$

DELIMITER ;

-- 7. Executa a função com o produto 10
SELECT BuscaIngredientesProduto(10) AS ingredientes;

-- 8. Função mediaPedido
DROP FUNCTION IF EXISTS mediaPedido;

DELIMITER $$

CREATE FUNCTION mediaPedido(p_id_pedido INT)
RETURNS VARCHAR(100)
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE v_total_pedido DECIMAL(10,2);
    DECLARE v_media_pedidos DECIMAL(10,2);

    SELECT pe.quantidade * p.preco
    INTO v_total_pedido
    FROM pedidos AS pe
    INNER JOIN produtos AS p ON pe.id_produto = p.id
    WHERE pe.id = p_id_pedido
    LIMIT 1;

    SELECT AVG(pe.quantidade * p.preco)
    INTO v_media_pedidos
    FROM pedidos AS pe
    INNER JOIN produtos AS p ON pe.id_produto = p.id;

    IF v_total_pedido > v_media_pedidos THEN
        RETURN 'O total do pedido está acima da média.';
    ELSEIF v_total_pedido < v_media_pedidos THEN
        RETURN 'O total do pedido está abaixo da média.';
    ELSE
        RETURN 'O total do pedido é igual à média.';
    END IF;
END$$

DELIMITER ;

-- 9. Executa mediaPedido para os pedidos 5 e 6
SELECT mediaPedido(5) AS resultado_pedido_5;
SELECT mediaPedido(6) AS resultado_pedido_6;
