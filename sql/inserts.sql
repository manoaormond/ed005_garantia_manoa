- ITEM 4.2.3: Inserir ao menos 3 registros em cada tabela
INSERT INTO Loja (nome, endereco) VALUES
('Tech Store Alpha', 'Av. Central, 100'),
('Mega Eletronicos', 'Rua das Inovações, 20'),
('Garantia Certa Ltda', 'Av. Teste, 33');
INSERT INTO Equipamento (id_loja, nome, data_compra, preco) VALUES
(1, 'Notebook Pro X1', '2024-06-10', 5200.00),
(1, 'Monitor Curvo 4K', '2024-07-25', 1850.50),
(2, 'Smartphone Ultra', '2024-09-05', 3100.00);
INSERT INTO Garantia (id_equipamento, tempo_meses, data_vencimento) VALUES
(1, 12, '2025-06-10'),
(2, 6, '2025-01-25'),
(3, 24, '2026-09-05');