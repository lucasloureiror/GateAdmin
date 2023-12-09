import psycopg2
def start_connection():
    try:
        conn = psycopg2.connect(
        dbname="postgres",
        user="gate_admin",
        password="usp123",
        host="localhost" # ou o endereço do servidor de banco de dados
    )
    except psycopg2.Error as e:
        print("Erro ao conectar ao banco de dados PostgreSQL: ", e)
        exit()
  
    else:
        print("Conexão estabelecida com sucesso.")
        return conn
    
def init_data(conexao):
    cursor = conexao.cursor()
    try: 
            cursor.execute(open("scripts/criacao.sql", "r").read())
            conexao.commit()  # Garante que as alterações sejam salvas
    except psycopg2.Error as e:
        print("Erro ao executar o script SQL: ", e)
    try:
            cursor.execute(open("scripts/insercao.sql", "r").read())
            conexao.commit()  # Garante que as alterações sejam salvas
    except psycopg2.Error as e:
        print("Erro ao executar o script SQL: ", e)
    cursor.close()

def consulta(conexao, query):
     cursor = conexao.cursor()
     cursor.execute(query)
     registros = cursor.fetchall()
     cursor.close()
     return registros

def insercao(conexao, query, valor): 
    ...