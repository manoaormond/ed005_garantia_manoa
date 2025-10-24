
SELECT
    L.nome AS Loja,
    E.nome AS Equipamento,
    E.data_compra
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
ORDER BY L.nome, E.nome;

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