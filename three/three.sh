rm -r ./target
mvn package

java -javaagent:lightstep-opentelemetry-javaagent-0.7.1.jar \
     -Dls.service.name="Level Three" \
     -jar ./target/level-three-0.0.1-SNAPSHOT.jar