rm -r ./target
mvn package

java -Dota.exporter.jar=lightstep-opentelemetry-auto-exporter-0.3.0.jar \
-Dota.exporter.lightstep.access.token=qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV \
-Dota.exporter.lightstep.service.version=forrest \
-Dota.exporter.lightstep.service.name=two \
-javaagent:opentelemetry-auto-0.3.0.jar \
-jar ./target/level-two-1.jar
