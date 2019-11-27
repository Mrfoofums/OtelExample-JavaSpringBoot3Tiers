## For our agent
java -javaagent:dd-java-agent.jar -dd.agent.host=<localhost> -dd.trace.agent.port=<9111> -Ddd.propagation.style.inject=B3 -Ddd.propagation.style.extract=B3 -jar target/level-two-1.jar