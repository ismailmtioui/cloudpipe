# Use an official OpenJDK image as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file from your local machine into the container
COPY target/cloudpipe-0.0.1-SNAPSHOT.jar /app/cloudpipe.jar

# Expose the port the app runs on
EXPOSE 8080

# Define the command to run the JAR file
ENTRYPOINT ["java", "-jar", "cloudpipe.jar"]
