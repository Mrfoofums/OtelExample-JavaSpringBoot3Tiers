java -javaagent:dd-java-agent.jar \
-Ddd.agent.host=192.168.1.3 -Ddd.trace.agent.port=9111 \
-Ddd.propagation.style.extract=B3 \
-Ddd.propagation.style.inject=B3 \
-Ddd.trace.global.tags='lightstep.service_name:Level 2 Auto Instrumented,lightstep.access_token:qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV' \
-jar target/level-two-1.jar