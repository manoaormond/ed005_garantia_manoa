from database import Database
from models.equipamento import Equipamento
from models.garantia import Garantia

def main():

    db = Database()
    
    if db.conn is None:
        print("Não foi possível continuar devido à falha de conexão.")
        return
    query_equipamentos_garantias = """
        SELECT 
            E.id_equipamento, 
            E.nome, 
            G.data_vencimento
        FROM Equipamento E
        JOIN Garantia G ON E.id_equipamento = G.id_equipamento;
    """

    print("\n--- Executando Consulta de Equipamentos e Garantias ---")
    
    result = db.execute_query(query_equipamentos_garantias, fetch_results=True)
    
    if result:
        column_names, rows = result
        print(f"Colunas: {column_names}")
        print("-" * 40)
        
        for row in rows:
            id_equipamento, nome_equipamento, data_vencimento = row
            
            print(f"Equipamento: {nome_equipamento:<20} | Vencimento: {data_vencimento}")
    db.close()

if __name__ == "__main__":
    main()