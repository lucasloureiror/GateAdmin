import database, main, menu as m
from prettytable import PrettyTable

class Stargate:
    def __init__(self, endereco, status_stargate, planeta):
        self.endereco = endereco
        self.status_stargate = status_stargate
        self.planeta = planeta

    def validar(self):
        # Verifica se o endereço tem 8 caracteres
        if len(self.endereco) != 8:
            return False
        
    def __repr__(self):
        return f"Stargate(endereco='{self.endereco}', status_stargate='{self.status_stargate}', planeta={self.planeta})"

def menu(conexao):
    m.limpar_tela()
    print(38 * "=")
    print("Menu do Stargate")
    print(38 * "=")
    print("Escolha uma operação:")
    print("1. Listar todos os Stargates")
    print("2. Buscar Stargate")
    print("3. Inserir Stargate")
    print("4. Retornar")
    print("5. Sair")
    print(38 * "=")
    print("Digite o número da sua escolha e pressione Enter:")
    while True:
        try:
            escolha = int(input())
            if 1 <= escolha <= 5:
                processar_escolha(escolha, conexao)
            else:
                print("Por favor, insira um número entre 1 e 3.")
        except ValueError:
            print("Entrada inválida. Por favor, insira um número.")


def processar_escolha(escolha, conexao):
    if escolha == 1:
        print("Você escolheu listar todos os stargates.")
        query = "SELECT * FROM STARGATE;"
        registros = database.consulta(conexao, query)
        stargates = [Stargate(*registro) for registro in registros]
        m.limpar_tela()
        print("Listando todos os stargates")
        imprimir_stargates(stargates)
        menu(conexao)

    elif escolha == 2:
        m.limpar_tela()
        print("Escolha o parâmetro de busca:")
        print("1. Endereço")
        print("2. Status do Stargate")
        print("3. Planeta")
        escolha = input("Digite o número do parâmetro: ")

        parametro = ""
        if escolha == "1":
            parametro = "endereco"
        elif escolha == "2":
            parametro = "status_stargate"
        elif escolha == "3":
            parametro = "planeta"
        else:
            print("Escolha inválida")
            return

        valor = input(f"Digite o valor para {parametro}: ")
        buscar(conexao, parametro, valor)
        menu(conexao)
    elif escolha == 3:
        print("Você escolheu inserir Stargate.")
    elif escolha == 4:
        m.start(conexao)
        
        # Adicione sua lógica aqui
    elif escolha == 5:
        main.sair(conexao)
        


def imprimir_stargates(stargates):
    #Usando o pretty table para a impressão
    tabela = PrettyTable()
    tabela.field_names = ["Endereço", "Status", "Planeta"]

    for stargate in stargates:
        tabela.add_row([stargate.endereco, stargate.status_stargate, stargate.planeta])
    print(tabela)
    print("Faça a análise dos dados, anote o que for necessário e aperte qualquer tecla para retornar ao menu.")
    input()

def buscar(conexao, parametro, valor):
    # Verifica se o valor é uma instância de string
    if isinstance(valor, str):
        # Query agnóstica ao tipo de case da string
        query = f"SELECT * FROM Stargate WHERE upper({parametro}) = upper(%s)"
    else:
        query = f"SELECT * FROM Stargate WHERE {parametro} = %s"
    cursor = conexao.cursor()
    cursor.execute(query, (valor,))
    registros = cursor.fetchall()

    stargates = [Stargate(*registro) for registro in registros]
    m.limpar_tela()
    print(f"Exibindo resultados da busca de Stargate com {parametro} igual a {valor}")
    imprimir_stargates(stargates)

    # Fecha o cursor após o uso (a conexão pode ser fechada em outro local)
    cursor.close()

        
