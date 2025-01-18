# Use a Java 17 base image instead of Java 11
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

# Expose any necessary port (e.g., for a web server or application)
# EXPOSE <PORT_NUMBER>

# Set the default command to run your application, if applicable
# CMD ["java", "-jar", "build/libs/your-app.jar"]

# Alternatively, if you want to run tests or tasks:
# CMD ["./gradlew", "run"]
