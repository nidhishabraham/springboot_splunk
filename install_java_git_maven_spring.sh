#!/bin/bash

# Update package list and install dependencies
sudo apt update -y
sudo apt upgrade -y

# Install Java 17
sudo apt install openjdk-17-jdk -y

# Verify Java installation
java -version

# Install Git
sudo apt install git -y

# Verify Git installation
git --version

# Install Maven
sudo apt install maven -y

# Verify Maven installation
mvn -version

# Install Spring Boot CLI (Optional)
# Note: Spring Boot CLI is optional; it helps with running Spring Boot commands directly.
# You can skip this if you don't need it.

# Download Spring Boot CLI
wget https://repo.spring.io/release/org/springframework/boot/spring-boot-cli/3.0.0/spring-boot-cli-3.0.0-bin.tar.gz

# Extract the archive
tar -xvf spring-boot-cli-3.0.0-bin.tar.gz

# Move to /usr/local for easy access
sudo mv spring-boot-3.0.0 /usr/local/spring-boot-cli

# Add Spring Boot to PATH
echo 'export PATH=$PATH:/usr/local/spring-boot-cli/bin' >> ~/.bashrc
source ~/.bashrc

# Verify Spring Boot installation
spring --version

# Clean up
rm spring-boot-cli-3.0.0-bin.tar.gz

# Print installation summary
echo "Installation Summary:"
java -version
git --version
mvn -version
spring --version

echo "Java 17, Git, Maven, and Spring Boot installation completed successfully!"

