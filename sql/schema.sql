
CREATE TABLE Loja (
    id_loja SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE,
    endereco VARCHAR(255)
    );
CREATE TABLE Equipamento (
    id_equipamento SERIAL PRIMARY KEY,
    id_loja INTEGER NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_compra DATE NOT NULL,
    preco NUMERIC(10, 2) NOT NULL CHECK (preco > 0),
    FOREIGN KEY (id_loja) REFERENCES Loja(id_loja)
    ON DELETE RESTRICT
    );
    CREATE TABLE Garantia (
        id_garantia SERIAL PRIMARY KEY,
        id_equipamento INTEGER NOT NULL UNIQUE,
        tempo_meses INTEGER NOT NULL CHECK (tempo_meses > 0),
        data_vencimento DATE NOT NULL,
        FOREIGN KEY (id_equipamento) REFERENCES Equipamento(id_equipamento)
        ON DELETE CASCADE 
        );