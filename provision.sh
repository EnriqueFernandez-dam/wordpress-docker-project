#!/bin/bash

echo "Actualizando sistema..."
apt-get update

echo "Instalando Docker..."
apt-get install -y docker.io docker-compose git

systemctl enable docker
systemctl start docker

echo "Clonando repositorio GitHub..."

cd /home/vagrant

if [ ! -d "wordpress-docker-project" ]; then
    git clone https://github.com/EnriqueFernandez-dam/wordpress-docker-project.git 
else
    cd wordpress-docker-project
    git pull
fi

cd /home/vagrant/wordpress-docker-project

echo "Levantando Docker Compose..."
docker-compose down
docker-compose up -d