# export OTA_EXPORTER_JAR="lightstep-opentelemetry-auto-exporter-0.2.2.jar"
# # export LIGHTSTEP_COMPONENT_NAME="one"
# export LIGHTSTEP_SERVICE_NAME="one"
# export LIGHTSTEP_ACCESS_TOKEN="qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV"
# java -javaagent:opentelemetry-auto-0.2.2.jar -jar level-one.jar


rm -r ./target
mvn package

java -Dota.exporter.jar=lightstep-opentelemetry-auto-exporter-0.2.2.jar \
-Dota.exporter.lightstep.access.token=qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV \
-Dota.exporter.lightstep.service.version=forrest \
-Dota.exporter.lightstep.service.name=one \
-javaagent:opentelemetry-auto-0.2.2.jar \
-jar ./target/level-one-0.0.1-SNAPSHOT.jar