rm -r ./target
./mvnw package

export OTEL_SERVICE_NAME="Forrest-One"


java -javaagent:opentelemetry-javaagent.jar \
     -jar ./target/level-one-0.0.1-SNAPSHOT.jar   