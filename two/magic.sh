java -Dsa.tracer=lightstep \
-Dls.collectorHost=ingest.lightstep.com  \
-Dls.collectorProtocol=https \
-Dls.collectorPort=443 \
-Dls.accessToken=qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV \
-Dls.componentName=two \
-Dls.propagator=b3 \
-javaagent:opentracing-specialagent-1.5.8.jar \
-jar level-two-1.jar