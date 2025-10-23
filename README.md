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

## 4.6 Reflexão Final e Aprendizado

Esta seção consolida o aprendizado e as lições técnicas extraídas deste Estudo Dirigido.
### 1. O que aprendi neste estudo?
* Aprendi o fluxo completo de desenvolvimento, desde a modelagem física (DDL no PostgreSQL) até a integração com POO em Python.
* Aprendi bastante sobre o uso do DBeaver comunity e como utilizar ele do zero e para database, graças a esse estudo consegui entender muito sobre o programa e estou melhorando bastante
**Técnica:** Aprendi e dominei a aplicação de regras de integridade (NOT NULL, UNIQUE, CHECK) e a diferença prática entre `ON DELETE RESTRICT` e `ON DELETE CASCADE`.
* Entendi como isolar a lógica de conexão com o banco de dados (`Database` class) usando `psycopg2`, separando-a da lógica de negócio.
* **POO** Mapeei entidades SQL em classes Python (`Loja`, `Equipamento`, `Garantia`), demonstrando a camada de modelos.


### 2. Que erros enfrentei e como resolvi?

** ERROS INICIAIS** Como eu disse anteriormente eu nao sabia utilizar do DBeaver, entao enfrentei muitos erros e problemas no começo e tive que pesquisar muito pra entender oq estava me me impedindo, porem com bastante estudo consegui entender bem o DBeaver e melhorei bastante nesse quesito e com o tempo fiquei bem menos preso
**Erros de Sintaxe em INSERTs:** Os comandos `INSERT INTO` davam erro por causa de comentários. Resolvi executando apenas as linhas SQL de inserção no DBeaver.
* **Problemas com o Git:** Encontrei o erro `fatal: pathspec did not match any files` devido à duplicação da pasta `sql/sql/` e erros de caminho. Resolvi corrigindo a estrutura de pastas e usando `git add <pasta>/` para garantir o caminho correto.
* **Conexão Python/Postgres:** A conexão falhava no `main.py` porque a senha do PostgreSQL estava incorreta ou esquecida. Resolvi redefinindo a senha no DBeaver e atualizando o arquivo `src/database.py`.


### 3. Como este exercício se conecta ao projeto integrador?

* Este exercício estabelece o alicerce para qualquer projeto back-end. Ele criou a **Camada de Persistência** (o `database.py`) e a **Camada de Modelos** (as classes POO)
* Em um futuro framework web (como Flask ou Django), essas classes seriam essenciais para o **Mapeamento Objeto-Relacional (ORM)**, permitindo que a aplicação manipule dados como objetos Python em vez de comandos SQL complexos, garantindo a integridade dos dados (Regras de integridade: UNIQUE, CHECK e FK corretos.)
*Desenvolvi inumeras taticas, experiencias e Codigos novos que com certeza me deixaram muito melhor nessa area em si