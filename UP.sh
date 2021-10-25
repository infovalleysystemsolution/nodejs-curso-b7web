#!/bin/bash

docker stop postgresql-db

docker rm  postgresql-db

docker stop nodejs-curso-b7web-app

docker rm  nodejs-curso-b7web-app

echo ""
echo ""
echo ""
echo ""
echo "Iniciando o processo de execução dos containers... "
echo ""
echo ""
echo ""
echo ""

echo ""
echo ""
echo "Criando a rede para os Containers Docker"
echo ""

docker network create --subnet '192.168.100.0/24' --gateway '192.168.100.1' --label 'com.docker.compose.network=default' --label 'com.docker.compose.project=allapps' allapps_default

echo ""
echo ""
echo ""
rm  docker-compose.log
echo "Starting SISTEMA: 4004"
docker-compose up -d  >> docker-compose.log

echo ""
echo "Conectando a rede principal o container postgresql-db"
echo ""
echo ""
docker network connect principal postgresql-db

echo ""
echo ""
echo "Conectando container nodejs-curso-b7web-app na rede principal... "
echo ""
echo ""
echo ""
docker network connect principal nodejs-curso-b7web-app
