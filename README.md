# Sping Boot Splunk 

# Connect Both Containers to a Custom Network

# Create a custom network:

docker network create my_network

# Connect both containers to the new network:

docker network connect my_network 131838040e0d

docker network connect my_network 01b5190a3eff

Now, both containers should be able to resolve each other's hostnames.
