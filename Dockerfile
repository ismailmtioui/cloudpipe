# Use an official Maven image to build the application
FROM maven:3.9.0-eclipse-temurin-17 as builder

# Set the working directory
WORKDIR /app

# Copy the pom.xml and the source code to the container
COPY pom.xml .
COPY src ./src

# Run Maven to build the application and package it as a JAR file
RUN mvn clean package -DskipTests

# Now, use an official OpenJDK image to run the application
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file built in the previous step
COPY --from=builder /app/target/cloudpipe-0.0.1-SNAPSHOT.jar /app/cloudpipe.jar

# Expose the port the app will run on
EXPOSE 8080

# Define the command to run the JAR file
ENTRYPOINT ["java", "-jar", "cloudpipe.jar"]
