rm -r ./target
mvn package

java -javaagent:lightstep-opentelemetry-javaagent-0.7.1.jar \
     -Dls.service.name="Level One" \
     -jar ./target/level-one-0.0.1-SNAPSHOT.jar
    #  -Dotel.exporter.otlp.span.endpoint=ingest.lightstep.com \