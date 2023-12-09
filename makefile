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

docker-stop:
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
# Remove a imagem Docker
clean:
	docker rmi $(IMAGE_NAME)
