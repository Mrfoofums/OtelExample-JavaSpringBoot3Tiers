java -javaagent:opentracing-special.jar \
-Ddd.agent.host=localhost -Ddd.trace.agent.port=9111 \
-Ddd.propagation.style.extract=B3 \
-Ddd.propagation.style.inject=B3 \
-Ddd.trace.global.tags='lightstep.service_name:Level 2 Auto Instrumented,lightstep.access_token:qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV' \
-jar level-two-1.jar

-Dsa.tracer=lightstep
-Dls.collectorHost=$(your_load_balancer_DNS_name_or_IP_address)
-Dls.collectorProtocol=$(your_satellite_protocol)
-Dls.collectorPort=9180
-Dls.accessToken=`qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV`
-Dls.componentName=`level2`