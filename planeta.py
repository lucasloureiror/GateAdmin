import database, main, menu as m
from prettytable import PrettyTable

class Planeta:
    def __init__(self, id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta):
        self.id_planeta  = id_planeta
        self.galaxia = galaxia
        self.sistema = sistema
        self.nome = nome
        self.tipo = tipo
        self.habitabilidade = habitabilidade
        self.status_planeta = status_planeta
    
    def validar(self):
         # Verifica se as strings não estão vazias e têm o tamanho adequado
        campos_e_limites = {
            "galaxia": 100,
            "sistema": 100,
            "nome": 100,
            "tipo": 20,
            "habitabilidade": 20,
            "status_planeta": 20
        }

        for campo, limite in campos_e_limites.items():
            valor = getattr(self, campo)
            if not valor or len(valor) > limite:
                print(38*"=")
                print(f"{campo.capitalize()} inválido ou muito longo (máximo de {limite} caracteres).")
                print(38*"=")
                return False

        return True

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
        listar(conexao)
        m.limpar_tela()
        menu(conexao)

    elif escolha == 2:
        m.limpar_tela()
        print("Você escolheu buscar um planeta.")
        # Aqui você pode solicitar ao usuário mais informações para a busca
        parametro = input("Digite o parâmetro de busca (id_planeta, galaxia, sistema, nome): ")
        valor = input(f"Digite o valor para {parametro}: ")
        m.limpar_tela()
        buscar_planeta(conexao, parametro, valor)
        m.limpar_tela()
        menu(conexao)

    elif escolha == 3:
        m.limpar_tela()
        print("Você escolheu inserir um novo planeta.")
        # Aqui você solicita os dados do planeta ao usuário
        galaxia = input("Digite o nome da galáxia: ")
        sistema = input("Digite o nome do sistema: ")
        nome = input("Digite o nome do planeta: ")
        tipo = input("Digite o tipo do planeta: ")
        habitabilidade = input("Digite a habitabilidade do planeta: ")
        status_planeta = input("Digite o status do planeta: ")
        novo_planeta = Planeta(-1, galaxia, sistema, nome, tipo, habitabilidade, status_planeta)
        inserir_planeta(conexao, novo_planeta)
        menu(conexao)

    elif escolha == 4:
        m.limpar_tela()
        m.start(conexao)

    elif escolha == 5:
        print("Saindo do programa.")
        main.sair(conexao)
       

def listar(conexao):
    query = "SELECT * FROM Planeta;"
    registros, erro = database.consulta(conexao, query, None)
    if erro is not None:
        print("Ocorreu um erro na listagem:", erro)
        input("Aperte enter para continuar")
        return
    planetas = [Planeta(*registro) for registro in registros]
    imprimir_planetas(planetas)

def buscar_planeta(conexao, parametro, valor):
    query = f"SELECT * FROM Planeta WHERE {parametro} = %s"
    registros, erro = database.consulta(conexao, query, valor)
    if erro is not None:
        print("Ocorreu um erro na busca:", erro)
        input("Aperte enter para continuar")
        return
    planetas = [Planeta(*registro) for registro in registros]
    imprimir_planetas(planetas)

def inserir_planeta(conexao, planeta):
    if not planeta.validar():
        input("Aperte enter para sair")
        return
    valores = (planeta.galaxia, planeta.sistema, planeta.nome, planeta.tipo, planeta.habitabilidade, planeta.status_planeta)
    query = "insert into planeta(id_planeta, galaxia, sistema, nome, tipo, habitabilidade, status_planeta) values(nextval('seq_planeta'), %s, %s, %s, %s, %s, %s);"
    resultado = database.insercao(conexao, query, valores)
    if resultado is not True:
        print("Ocorreu um erro na inserção do planeta: ", resultado)
        input("Aperte enter para continuar")
        return
    
    print("\nPlaneta inserido com sucesso!")
    input("Aperte enter para continuar")


def imprimir_planetas(planetas):
    tabela = PrettyTable()
    tabela.field_names = ["ID", "Galáxia", "Sistema", "Nome", "Tipo", "Habitabilidade", "Status"]
    for planeta in planetas:
        tabela.add_row([planeta.id_planeta, planeta.galaxia, planeta.sistema, planeta.nome, planeta.tipo, planeta.habitabilidade, planeta.status_planeta])
    print(tabela)
    print("Faça a análise dos dados, anote o que for necessário e aperte enter para retornar ao menu.")
    input()


    
