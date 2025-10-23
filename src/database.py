import psycopg2

class Database:
    def __init__(self):
        self.host = "localhost"
        self.dbname = "app_garantia"
        self.user = "postgres"
        self.password = "manoa5780" 
        self.port = "5432"
        self.conn = None

        try:
            self.conn = psycopg2.connect(
                dbname=self.dbname,
                user=self.user,
                password=self.password,
                host=self.host,
                port=self.port
            )
            print("Conexão com o PostgreSQL estabelecida com sucesso.")
        except Exception as e:
            print(f"Erro ao conectar ao PostgreSQL: {e}")
            self.conn = None

    def execute_query(self, query, params=None, fetch_results=True):
        if self.conn is None:
            print("Erro: Conexão com o banco de dados não está ativa.")
            return None

        cur = None
        results = None
        
        try:
            cur = self.conn.cursor()
            cur.execute(query, params)
            
           
            if not query.strip().upper().startswith("SELECT"):
                self.conn.commit()
                print("Comando SQL executado com sucesso e commit realizado.")
                return True
            
          
            elif fetch_results:
                results = cur.fetchall()
                column_names = [desc[0] for desc in cur.description]
                return column_names, results
            
            return None

        except Exception as e:
            print(f"Erro na execução da query: {e}")
            if self.conn:
                self.conn.rollback()
            return None
        
        finally:
            if cur:
                cur.close()

    def close(self):
        if self.conn:
            self.conn.close()
            print("Conexão com o PostgreSQL fechada.")
            self.conn = None