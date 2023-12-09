import database, main, menu as m
from prettytable import PrettyTable

class Planeta:
    def __init__(self, id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta):
        self.galaxia = galaxia
        self.sistema = sistema
        self.nome = nome
        self.tipo = tipo
        self.habitabilidade = habitabilidade
        self.status_planeta = status_planeta

    def __repr__(self):
        return (f"Planeta(id_planeta={self.id_planeta}, galaxia='{self.galaxia}', "
                f"sistema='{self.sistema}', nome='{self.nome}', tipo='{self.tipo}', "
                f"habitabilidade='{self.habitabilidade}', status_planeta='{self.status_planeta}')")
    

def menu(conexao):
    m.limpar_tela()
    print(38 * "=")
    print("Menu dos Planetas")
    print(38 * "=")
    print("Escolha uma operação:")
    print("1. Listar todos os Planetas")
    print("2. Buscar Planetas")
    print("3. Inserir Planeta")
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
        m.limpar_tela()
        print("Você escolheu listar todos os planetas.")
        listar_planetas(conexao)
        m.limpar_tela()
        menu(conexao)

    elif escolha == 2:
        print("Você escolheu buscar um planeta.")
        # Aqui você pode solicitar ao usuário mais informações para a busca
        parametro = input("Digite o parâmetro de busca (id_planeta, galaxia, sistema, nome): ")
        valor = input(f"Digite o valor para {parametro}: ")
        m.limpar_tela()
        buscar_planeta(conexao, parametro, valor)
        m.limpar_tela()
        menu(conexao)

    elif escolha == 3:
        print("Você escolheu inserir um novo planeta.")
        # Aqui você solicita os dados do planeta ao usuário
        id_planeta = input("Digite o ID do planeta: ")
        galaxia = input("Digite o nome da galáxia: ")
        sistema = input("Digite o nome do sistema: ")
        nome = input("Digite o nome do planeta: ")
        tipo = input("Digite o tipo do planeta: ")
        habitabilidade = input("Digite a habitabilidade do planeta: ")
        status_planeta = input("Digite o status do planeta: ")
        novo_planeta = Planeta(id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta)
        #inserir_planeta(conexao, novo_planeta)

    elif escolha == 4:
        print("Retornando ao menu principal.")
        m.start(conexao)

    elif escolha == 5:
        print("Saindo do programa.")
        main.sair(conexao)
       

def listar_planetas(conexao):
    query = "SELECT * FROM Planeta;"
    cursor = conexao.cursor()
    cursor.execute(query)
    registros = cursor.fetchall()
    planetas = [Planeta(*registro) for registro in registros]
    imprimir_planetas(planetas)
    cursor.close()

def buscar_planeta(conexao, parametro, valor):
    query = f"SELECT * FROM Planeta WHERE {parametro} = %s"
    cursor = conexao.cursor()
    cursor.execute(query, (valor,))
    registros = cursor.fetchall()
    planetas = [Planeta(*registro) for registro in registros]
    imprimir_planetas(planetas)
    cursor.close()

def imprimir_planetas(planetas):
    tabela = PrettyTable()
    tabela.field_names = ["ID", "Galáxia", "Sistema", "Nome", "Tipo", "Habitabilidade", "Status"]
    for planeta in planetas:
        tabela.add_row([planeta.id_planeta, planeta.galaxia, planeta.sistema, planeta.nome, planeta.tipo, planeta.habitabilidade, planeta.status_planeta])
    print(tabela)
    print("Faça a análise dos dados, anote o que for necessário e aperte qualquer tecla para retornar ao menu.")
    input()


    

