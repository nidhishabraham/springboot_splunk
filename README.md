# Sping Boot Splunk 

# Install Java / Git / Maven / Spring Boot
install_java_git_maven_spring.sh

# Install Docker
install_docker.sh

# Install Splunk Enterprise
install_splunk.sh

# Running a Spring Boot Application with Docker
docker build -t splunk-demo:latest .

docker run -p 9090:9090 splunk-demo:latest

# Connect Both Containers to a Custom Network
# Create a custom network:
docker network create my_network

# Connect both containers to the new network:
docker network connect my_network <container-id>

docker network connect my_network <container-id>

# Now, both containers should be able to resolve each other's hostnames.
