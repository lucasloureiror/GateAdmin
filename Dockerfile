FROM postgres:latest

# Defina as variáveis de ambiente para o usuário e senha
ENV POSTGRES_USER admin
ENV POSTGRES_PASSWORD usp123

# O banco de dados padrão pode ser definido com a variável POSTGRES_DB
# ENV POSTGRES_DB meubancodedados
