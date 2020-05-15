## Description
This repository is a working example in how to instrument 3 Java Spring Boot services with Open Telemetry. The scripts assume you have maven installed as they rebuild the artifact each time. 

These services are VERY simple. All they do is return a simple greeting object(basically verbatim what is in the Spring Docs).

YOU should definitely learn about distributed tracing, its not nearly as complicated as it seems, but conversely is exceptionally powerful in providing insights to us as software engineers of increasing complex platforms!

Level One is a Spring cloud app instrumented using the Otel Agent
* Do `./one.sh` to run within /one
* Hit this via `localhost:8081/api`
* This calls layer 2 and doesn't have exception handling so make sure 2 is running!

Level Two is instrumented using the Otel Special Agent and manual spans
* Do `./two.sh` to run within /two
*  Hit this via `localhost:8082/api`
*  This calls layer 3 and doesn't have exception handling so make sure 3 is running!

Level Three is instrumented using the Otel Agent
* Do `./three.sh` to run within /three
* Hit this via `localhost:8083/api`
* This just exist, feel free to run it solo!

### Things you need to know
1) Have a lightstep account. Create a free trial account here: [lightstep](https://go.lightstep.com/trial)
2) Swap out the accessTokens in each service with your token otherwise you will be sending me (your friendly neighborhood lightstepper) your telemetry data :)
3) Random stuff is commented out, it isn't important. I'm just a very busy guy and miss stuff.

## I NEED HELP
Send me an email at forrest@Lightstep.com

I will provide the help.






