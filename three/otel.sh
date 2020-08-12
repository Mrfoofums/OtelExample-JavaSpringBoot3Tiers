rm -r ./target
mvn package


java -javaagent:opentelemetry-javaagent-all.jar -Dotel.resource.attributes=service.name="level-three" -Dotel.otlp.endpoint="localhost:55680" -jar ./target/level-three-0.0.1-SNAPSHOT.jar