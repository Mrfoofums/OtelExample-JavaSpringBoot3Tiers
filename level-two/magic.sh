java -javaagent:dd-java-agent.jar \
-Ddd.agent.host=localhost -Ddd.trace.agent.port=9111 \
-Ddd.propagation.style.extract=B3 \
-Ddd.propagation.style.inject=B3 \
-Ddd.trace.debug=true \
-Ddd.trace.global.tags='lightstep.service_name:l2-service,lightstep.access_token:<access_token>' \
-jar level-two-1.jar