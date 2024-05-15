build jar: mvn package -DskipTests=true
run process: nohup java -jar target/Lab2_Jv5-0.0.1-SNAPSHOT.jar &
check procces: ps -f | grep java
kill -9 [id]
sudo kill -9 $(sudo lsof -t -i:80)