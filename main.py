import psycopg2

print("Bem vindo ao GateAdmin!")
print("Tentando conexão com o banco de dados...")
import psycopg2

try:
    conn = psycopg2.connect(
        dbname="postgres",
        user="gate_admin",
        password="usp123",
        host="localhost" # ou o endereço do servidor de banco de dados
    )
except psycopg2.Error as e:
    print("Erro ao conectar ao banco de dados PostgreSQL: ", e)
