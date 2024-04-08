# Stage 1: Build
FROM maven:3.8.4-openjdk-17 as build
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src
RUN mvn package -DskipTests

# Stage 2: Run
FROM openjdk:17-jdk-slim
COPY target/Lab2_Jv5-0.0.1-SNAPSHOT.jar Lab2_Jv5.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "Lab2_Jv5-0.0.1-SNAPSHOT.jar"]
