FROM openjdk:11
COPY /target/Lab2_Jv5-0.0.1-SNAPSHOT.jar Lab2_Jv5-0.0.1-SNAPSHOT.jar
ENTRYPOINT [ "java","-jar","Lab2_Jv5-0.0.1-SNAPSHOT.jar" ]