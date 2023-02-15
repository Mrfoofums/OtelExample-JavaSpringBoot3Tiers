rm -r ./target
./mvnw package

export OTEL_SERVICE_NAME="Forrest-Three"
export OTEL_RESOURCE_ATTRIBUTES=service.version=2.2.2.2


java -javaagent:opentelemetry-javaagent.jar \
     -jar ./target/level-three-0.0.1-SNAPSHOT.jar

