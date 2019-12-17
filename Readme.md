## Description
Level One is a Spring cloud app instrumented using the SDK
* mvn spring-boot:run

Level Two is instrumented using the DD agent
* ./magic.sh

Level Three is instrumented using the SDK again
* mvn spring-boot:run

Run the satellite
* docker-compose up -d 

B3 propagation should tie everything together, but it's only working from level 2 to 3.

This means either
1. The DD tracer is throwing an exception during extraction in B3HttpCodex ln 142. Captured in Jira.


