FROM postgres:latest

# Defina as variáveis de ambiente para o usuário e senha
ENV POSTGRES_USER gate_admin
ENV POSTGRES_PASSWORD usp123
#COPY ./scripts/criacao.sql /docker-entrypoint-initdb.d/
#COPY ./scripts/insercao.sql /docker-entrypoint-initdb.d/

EXPOSE 5432

# O banco de dados padrão pode ser definido com a variável POSTGRES_DB
# ENV POSTGRES_DB meubancodedados
