# export OTA_EXPORTER_JAR="lightstep-opentelemetry-auto-exporter-0.2.2.jar"
# # export LIGHTSTEP_COMPONENT_NAME="two"
# export LIGHTSTEP_SERVICE_NAME="two"
# export LIGHTSTEP_ACCESS_TOKEN="qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV"
# export LIGHTSTEP_SERVICE_VERSION="1"
# rm -r ./target
# mvn package
# java -javaagent:opentelemetry-auto-0.2.2.jar -jar ./target/level-two-1.jar
# java -jar ./target/level-two-1.jar


rm -r ./target
mvn package

java -Dota.exporter.jar=lightstep-opentelemetry-auto-exporter-0.2.2.jar \
-Dota.exporter.lightstep.access.token=qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV \
-Dota.exporter.lightstep.service.version=forrest \
-Dota.exporter.lightstep.service.name=two \
-javaagent:opentelemetry-auto-0.2.2.jar \
-jar ./target/level-two-1.jar
