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