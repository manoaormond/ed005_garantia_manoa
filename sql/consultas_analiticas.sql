-- #################################################################
-- ITEM 4.3: CONSULTAS SQL - ANÁLISE DE DADOS
-- #################################################################

-- 1. Quais equipamentos estão vinculados a cada loja?
-- Uso: Relatório gerencial de estoque por filial.
SELECT
    L.nome AS Loja,
    E.nome AS Equipamento,
    E.data_compra
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
ORDER BY L.nome, E.nome;

-- 2. Quais garantias vencem nos próximos 30 dias?
-- Uso: Alerta proativo para equipe de vendas ou cliente sobre a expiração iminente da garantia.
SELECT
    E.nome AS Equipamento,
    G.data_vencimento
FROM Garantia G
JOIN Equipamento E ON G.id_equipamento = E.id_equipamento
-- Filtra as garantias cuja data de vencimento está entre a data atual e 30 dias no futuro
WHERE G.data_vencimento BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY G.data_vencimento;

-- 3. Qual loja possui o maior número de garantias vencidas?
-- Uso: Relatório de performance para identificar a Loja com maior passivo de suporte ou maior risco.
SELECT
    L.nome AS Loja,
    COUNT(G.id_garantia) AS Total_Garantias_Vencidas
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
JOIN Garantia G ON E.id_equipamento = G.id_equipamento
-- Filtra garantias que já venceram (data de vencimento é menor que a data atual)
WHERE G.data_vencimento < CURRENT_DATE
GROUP BY L.nome
ORDER BY Total_Garantias_Vencidas DESC
LIMIT 1;

-- 4. Qual o tempo médio de garantia por loja?
-- Uso: Relatório estratégico para avaliar a política de garantia e o risco médio por filial.
SELECT
    L.nome AS Loja,
    -- Calcula a média do tempo_meses e arredonda para duas casas decimais
    ROUND(AVG(G.tempo_meses), 2) AS Media_Meses_Garantia
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
JOIN Garantia G ON E.id_equipamento = G.id_equipamento
GROUP BY L.nome
ORDER BY Media_Meses_Garantia DESC; 
SELECT
    E.nome AS Equipamento,
    G.data_vencimento
FROM Garantia G
JOIN Equipamento E ON G.id_equipamento = E.id_equipamento
WHERE G.data_vencimento BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '30 days'
ORDER BY G.data_vencimento;
SELECT
    L.nome AS Loja,
    COUNT(G.id_garantia) AS Total_Garantias_Vencidas
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
JOIN Garantia G ON E.id_equipamento = G.id_equipamento
WHERE G.data_vencimento < CURRENT_DATE
GROUP BY L.nome
ORDER BY Total_Garantias_Vencidas DESC
LIMIT 1;
SELECT
    L.nome AS Loja,
    ROUND(AVG(G.tempo_meses), 2) AS Media_Meses_Garantia
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
JOIN Garantia G ON E.id_equipamento = G.id_equipamento
GROUP BY L.nome
ORDER BY Media_Meses_Garantia DESC;