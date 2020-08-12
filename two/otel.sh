rm -r ./target
mvn package


java -javaagent:opentelemetry-javaagent-all.jar \
-Dotel.resource.attributes=service.name="Ally 2" \
-Dotel.otlp.endpoint="localhost:55680" \
-jar ./target/level-two-1.jar