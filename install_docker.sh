#!/bin/bash

# Update the package list and install dependencies
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's APT repository
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again to include Docker packages
sudo apt-get update -y

# Install Docker
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Add your user to the docker group to avoid needing sudo for Docker commands
sudo usermod -aG docker $USER

# Enable Docker to start on boot
sudo systemctl enable docker

# Start Docker
sudo systemctl start docker

# Verify Docker installation
docker --version

# Print completion message
echo "Docker installation completed successfully! Please log out and log back in for group changes to take effect."

