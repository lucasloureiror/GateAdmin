def mostrar_menu():
    print(38 * "=")
    print("    SISTEMA DE CONSULTA GATE ADMIN    ")
    print("======================================")
    print("Escolha uma entidade para obter informações:")
    print("1. Stargates")
    print("2. Planetas")
    print("3. Recursos")
    print("4. Tecnologias")
    print("5. Civilizações")
    print("======================================")
    print("Digite o número da sua escolha e pressione Enter:")

def obter_escolha_usuario():
    while True:
        try:
            escolha = int(input())
            if 1 <= escolha <= 5:
                return escolha
            else:
                print("Por favor, insira um número entre 1 e 5.")
        except ValueError:
            print("Entrada inválida. Por favor, insira um número.")

def processar_escolha(escolha):
    if escolha == 1:
        print("Você escolheu Stargates.")
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