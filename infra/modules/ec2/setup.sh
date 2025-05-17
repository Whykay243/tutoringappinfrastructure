#!/bin/bash
set -e

echo "Updating packages..."
sudo apt-get update -y

echo "Installing prerequisites..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release

echo "Setting up Docker repository..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "Installing Docker Engine..."
sudo apt-get update -y
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "Adding ubuntu user to docker group..."
sudo usermod -aG docker ubuntu

echo "Restarting Docker service..."
sudo systemctl enable docker
sudo systemctl restart docker

echo "Pulling Docker image from DockerHub..."
sudo docker pull yajibola0011/python-app:latest



echo "Removing any old container..."
sudo docker rm -f python-app || true

echo "Starting new container..."
sudo docker run -d --name python-app -p 80:80 yajibola0011/python-app:latest

echo "Setup complete!"
