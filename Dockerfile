FROM openjdk:11
COPY /target/Lab2_Jv5-0.0.1-SNAPSHOT.jar Lab2_Jv5-0.0.1-SNAPSHOT.jar
COPY /src/main/resources resources
COPY /src/main/webapp wedapp
ENTRYPOINT [ "java","-jar","Lab2_Jv5-0.0.1-SNAPSHOT.jar" ]