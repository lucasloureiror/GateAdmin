# Nome da imagem Docker
IMAGE_NAME:=postgres

# Nome do container
CONTAINER_NAME:=db

# Porta padrão do PostgreSQL
PORT:=5432

# Build da imagem Docker
docker-build:
	docker build -t $(IMAGE_NAME) .

# Executa o container Docker
docker-run:
	docker run --name $(CONTAINER_NAME) -p $(PORT):$(PORT) -d $(IMAGE_NAME)

docker-restart:
	docker restart $(CONTAINER_NAME)

docker-stop:
	docker stop $(CONTAINER_NAME)

clean:
	docker rm $(CONTAINER_NAME)
	docker rmi $(IMAGE_NAME)
