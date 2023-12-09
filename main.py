import database, menu


def main():
    print("Bem vindo ao GateAdmin!")
    print("Tentando conexão com o banco de dados...")
    conexao = database.start_connection()
    menu.mostrar_menu()
    escolha = menu.obter_escolha_usuario()
    menu.processar_escolha(escolha, conexao)

def sair(conexao):
    conexao.close()
    print("Conexão encerrada")
    exit()
    

if __name__ == "__main__":
    main()