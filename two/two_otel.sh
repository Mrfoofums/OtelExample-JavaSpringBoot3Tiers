rm -r ./target
./mvnw package


export OTEL_SERVICE_NAME="Forrest-Two"
export OTEL_RESOURCE_ATTRIBUTES=service.version=2.2.2.2

java -javaagent:opentelemetry-javaagent.jar \
     -jar ./target/level-two-1.jar 
