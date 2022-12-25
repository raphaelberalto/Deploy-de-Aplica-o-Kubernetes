echo "Criando as imagens..."

docker build -t raphaelberalto/projeto-backend:1.0 backend/.
docker build -t raphaelberalto/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push raphaelberalto/projeto-backend:1.0
docker push raphaelberalto/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml

