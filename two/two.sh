rm -r ./target
./mvnw package

# The access Token is only necessary if you bypass the collector and send data directly to a satellite. To be clear, we are not doing that here. Reference: https://github.com/lightstep/otel-launcher-java
# export LS_ACCESS_TOKEN=
export LS_SERVICE_VERSION=0.1.0
export LS_SERVICE_NAME="Level-Two"
export OTEL_EXPORTER_OTLP_SPAN_ENDPOINT=0.0.0.0:55680
export OTEL_EXPORTER_OTLP_SPAN_INSECURE=true

java -javaagent:lightstep-opentelemetry-javaagent-0.7.1.jar \
     -jar ./target/level-two-1.jar
