# Use the official Maven image to build the application
FROM maven:3.8.4-openjdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the pom.xml and download the dependencies
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code and build the application
COPY src ./src
RUN mvn package

# Use the official OpenJDK image to run the application
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/splunk-demo-0.0.1-SNAPSHOT.jar /app/splunk-demo.jar

# Expose the port the app runs on
EXPOSE 9090

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app/splunk-demo.jar"]

