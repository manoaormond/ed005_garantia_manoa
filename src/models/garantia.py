class Garantia:
    """Representa a garantia de um equipamento específico."""
    def __init__(self, id_garantia, id_equipamento, tempo_meses, data_vencimento):
        self.id_garantia = id_garantia
        self.id_equipamento = id_equipamento  # FK
        self.tempo_meses = tempo_meses
        self.data_vencimento = data_vencimento

    def __str__(self):
        return f"Garantia {self.id_garantia} | Equipamento ID {self.id_equipamento} | Vencimento: {self.data_vencimento}"