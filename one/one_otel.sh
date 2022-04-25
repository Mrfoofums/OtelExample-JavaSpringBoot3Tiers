rm -r ./target
./mvnw package

# The access Token is only necessary if you bypass the collector and send data directly to a satellite. To be clear, we are not doing that here. Reference: https://github.com/lightstep/otel-launcher-java
# export LS_ACCESS_TOKEN=
export LS_SERVICE_VERSION=0.1.0
export OTEL_SERVICE_NAME="Level-One"
export OTEL_TRACES_EXPORTER=otlp
export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:55680
export OTEL_EPORTER_OTLP_TRACES_PROTOCOL=http/protobuf
export OTEL_EPORTER_OTLP_METRICS_PROTOCOL=http/protobuf
# export OTEL_EXPORTER_OTLP_METRICS_ENDPOINT=http://localhost:4317
# export OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317

# export OTEL_TRACES_SAMPLER=parentbased_traceidratio
# export OTEL_TRACES_SAMPLER_ARG=1

java -javaagent:opentelemetry-javaagent.jar \
     -jar ./target/level-one-0.0.1-SNAPSHOT.jar   