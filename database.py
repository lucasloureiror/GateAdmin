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
        return conn


def consulta(conexao, query, valor):
    cursor = conexao.cursor()
    try:
        cursor.execute(query,(valor,))
        registros = cursor.fetchall()
        conexao.commit()
        return registros, None
    
    except psycopg2.Error as e:
        conexao.rollback()
        return None, e

    finally:
        cursor.close()

def insercao(conexao, query, valor): 
    cursor = conexao.cursor()
    try:
        cursor.execute(query, valor)
        conexao.commit()
        return True
    
    except psycopg2.Error as e:
        conexao.rollback()
        return e
    
    finally:
        cursor.close()