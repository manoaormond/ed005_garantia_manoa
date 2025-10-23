## 4.3 Consultas SQL - Análise de Dados

As consultas a seguir foram desenvolvidas para extrair informações gerenciais e de alerta do sistema, utilizando JOINs, funções de agregação e filtros de data.

### 1. Quais equipamentos estão vinculados a cada loja?
**Código SQL:**
```sql
SELECT
    L.nome AS Loja,
    E.nome AS Equipamento,
    E.data_compra
FROM Loja L
JOIN Equipamento E ON L.id_loja = E.id_loja
ORDER BY L.nome, E.nome;