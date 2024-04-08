FROM maven:3.6.3-jdk-11 as build
COPY . . 
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim



COPY --from=build /target/Lab2_Jv5-0.0.1-SNAPSHOT.jar Lab2_Jv5.jar
EXPOSE 8080
ENTRYPOINT [ "java","-jar","Lab2_Jv5.jar" ]
