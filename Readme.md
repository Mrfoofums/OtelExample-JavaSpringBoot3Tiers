## Description
Level One is a Spring cloud app instrumented using the SDK
* mvn spring-boot:run

Level Two is instrumented using the DD agent
* ./magic.sh

Level Three is instrumented using the SDK again
* mvn spring-boot:run

Run the satellite
* docker-compose up -d 



