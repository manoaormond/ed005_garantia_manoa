class Loja:
    """Representa uma loja que vende equipamentos."""
    def __init__(self, id_loja, nome, endereco):
        self.id_loja = id_loja
        self.nome = nome
        self.endereco = endereco

    def __str__(self):
        return f"Loja {self.id_loja}: {self.nome} ({self.endereco})"