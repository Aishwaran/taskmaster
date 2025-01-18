# Use a Java 17 base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Gradle wrapper and project files into the container
COPY . /app

# Make sure the gradlew script is executable
RUN chmod +x gradlew

# Install Gradle wrapper dependencies if needed
RUN ./gradlew --version

# Build the project using the Gradle wrapper
RUN ./gradlew build

# Expose port 8080 (common for Spring Boot applications)
EXPOSE 8080

# Set the default command to run your application
CMD ["java", "-jar", "build/libs/your-app.jar"]
