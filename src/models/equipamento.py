class Equipamento:
    """Representa um equipamento vendido por uma loja, com informações de compra."""
    def __init__(self, id_equipamento, id_loja, nome, data_compra, preco):
        self.id_equipamento = id_equipamento
        self.id_loja = id_loja  # FK
        self.nome = nome
        self.data_compra = data_compra
        self.preco = preco

    def __str__(self):
        # Exibição dos dados do equipamento
        return f"Equipamento {self.id_equipamento}: {self.nome} (Comprado em {self.data_compra}, R${self.preco:.2f})"