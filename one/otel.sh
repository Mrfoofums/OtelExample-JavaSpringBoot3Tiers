# rm -r ./target
# mvn package


java -javaagent:opentelemetry-javaagent-all.jar \
-Dotel.resource.attributes=service.name="Ally 1" \
-Dotel.otlp.endpoint="localhost:55680" \
-jar ./target/level-one-0.0.1-SNAPSHOT.jar