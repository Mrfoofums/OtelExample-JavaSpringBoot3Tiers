rm -r ./target
mvn package

java -javaagent:lightstep-opentelemetry-javaagent-0.7.1.jar \
     -Dls.service.name="Level Two" \
     -jar ./target/level-two-1.jar
