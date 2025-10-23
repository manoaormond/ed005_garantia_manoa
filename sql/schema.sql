-- ITEM 4.2.2: Construção do script schema.sql
-- Inclui restrições: NOT NULL, CHECK, UNIQUE, FOREIGN KEY (FK)
-- Tabela LOJA (Entidade principal)
CREATE TABLE Loja (
    id_loja SERIAL PRIMARY KEY, -- Chave Primária autoincremental
    nome VARCHAR(100) NOT NULL UNIQUE, -- NOT NULL e UNIQUE para o nome
    endereco VARCHAR(255)
    );
-- Tabela EQUIPAMENTO (Relação 1:N com Loja)
CREATE TABLE Equipamento (
    id_equipamento SERIAL PRIMARY KEY,
    id_loja INTEGER NOT NULL, -- Chave Estrangeira (FK) para Loja
    nome VARCHAR(100) NOT NULL,
    data_compra DATE NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco > 0), -- CHECK: garante que o preco é positivo
    -- Definição da Chave Estrangeira (FK)
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)
    ON DELETE RESTRICT -- Impede a exclusão de uma Loja se ela tiver Equipamentos vinculados
    );
    -- Tabela GARANTIA (Relação 1:1 com Equipamento)
    CREATE TABLE Garantia (
        id_garantia SERIAL PRIMARY KEY,
        id_equipamento INTEGER NOT NULL UNIQUE, -- UNIQUE: Garante que cada Equipamento tem apenas UMA Garantia
        tempo_meses INTEGER NOT NULL CHECK (tempo_meses > 0),
        data_vencimento DATE NOT NULL,
        -- Definição da Chave Estrangeira e ON DELETE CASCADE (Atividade Investigativa) [cite: 102]
        FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento)
        ON DELETE CASCADE -- Se o Equipamento for deletado, a Garantia associada também é deletada
        );