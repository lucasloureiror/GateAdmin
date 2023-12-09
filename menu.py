import database, main
import stargate as stargate

def start(conexao):
    mostrar_menu()
    escolha = obter_escolha_usuario()
    processar_escolha(escolha, conexao)
    

def mostrar_menu():
    print(38 * "=")
    print("    SISTEMA DE CONSULTA GATE ADMIN    ")
    print(38 * "=")
    print("Escolha uma entidade para obter informações:")
    print("1. Stargates")
    print("2. Planetas")
    print("3. Recursos")
    print("4. Tecnologias")
    print("5. Civilizações")
    print("6. Sair")
    print(38 * "=")
    print("Digite o número da sua escolha e pressione Enter:")

def obter_escolha_usuario():
    while True:
        try:
            escolha = int(input())
            if 1 <= escolha <= 6:
                return escolha
            else:
                print("Por favor, insira um número entre 1 e 5.")
        except ValueError:
            print("Entrada inválida. Por favor, insira um número.")

def processar_escolha(escolha, conexao):
    if escolha == 1:
        print("Você escolheu Stargates.")
        stargate.menu(conexao)
        # Adicione sua lógica aqui
    elif escolha == 2:
        print("Você escolheu Planetas.")
        # Adicione sua lógica aqui
    elif escolha == 3:
        print("Você escolheu Recursos.")
        # Adicione sua lógica aqui
    elif escolha == 4:
        print("Você escolheu Tecnologias.")
        # Adicione sua lógica aqui
    elif escolha == 5:
        print("Você escolheu Civilizações.")
    elif escolha == 6:
        main.sair(conexao)
    elif escolha == 42:
        database.init_data(conexao)
        print("Dados inicializados!")

def limpar_tela():
    # Limpa a tela (funciona em sistemas Unix e Windows)
    import os
    os.system('cls' if os.name == 'nt' else 'clear')