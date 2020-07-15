rm -r ./target
mvn package

java -Dota.exporter.jar=lightstep-opentelemetry-auto-exporter-0.3.1.jar \
-Dota.exporter.lightstep.access.token=qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV \
-Dota.exporter.lightstep.service.version=forrest \
-Dota.exporter.lightstep.collector.host=ingest.lightstep.com \
-Dota.exporter.lightstep.collector.port=443 \
-Dota.exporter.lightstep.service.name=three \
-javaagent:opentelemetry-auto-0.3.0.jar \
-jar ./target/level-three-0.0.1-SNAPSHOT.jar