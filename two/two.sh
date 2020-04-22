export OTA_EXPORTER_JAR="lightstep-opentelemetry-auto-exporter-0.2.0.jar"
export LIGHTSTEP_COMPONENT_NAME="two"
export LIGHTSTEP_ACCESS_TOKEN="qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV"
java -javaagent:opentelemetry-auto-0.2.2.jar -jar level-two.jar
