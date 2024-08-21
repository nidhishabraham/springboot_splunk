#!/bin/bash

# Define variables
SPLUNK_IMAGE="splunk/splunk:latest"  # Use the latest Splunk Docker image
WEB_PORT=8000                       # Port for Splunk web interface
MANAGEMENT_PORT=8088                # Port for Splunk management interface

# Pull the latest Splunk Docker image
echo "Pulling the Splunk Docker image..."
docker pull $SPLUNK_IMAGE

# Run the Splunk Docker container
echo "Starting the Splunk container..."
docker run -d \
  --name splunk \
  -p $WEB_PORT:8000 \
  -p $MANAGEMENT_PORT:8088 \
  -e SPLUNK_START_ARGS="--accept-license" \
  -e SPLUNK_PASSWORD="password" \
  $SPLUNK_IMAGE

# Wait for Splunk to initialize
echo "Waiting for Splunk to initialize..."
sleep 60  # Wait time may vary based on instance performance

# Verify if Splunk is running
echo "Verifying if Splunk is running..."
docker ps | grep splunk

echo "Splunk Enterprise (Free Edition) is now running on ports $WEB_PORT and $MANAGEMENT_PORT."
echo "You can access the web interface at http://<your_ec2_instance_ip>:$WEB_PORT"

