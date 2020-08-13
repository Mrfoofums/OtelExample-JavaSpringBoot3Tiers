## Description
This repository is a working example in how to instrument 3 Java Spring Boot services with Open Telemetry. The scripts assume you have maven installed as they rebuild the artifact each time. 

These services are VERY simple. All they do is return a simple greeting object(basically verbatim what is in the Spring Docs).

### Where to define our Data
There are a number of environment variables and meta data that we need to define, and there are two primary places to define it, assuming you are using a collector which we are here.
1) At application startup
2) Within the Collector

In general, we want to avoid restarting our services to update values, but some values should be updated on service restart such as `service.version`.

Keeping that generally in mind

YOU should definitely learn about distributed tracing, its not nearly as complicated as it seems, but conversely is exceptionally powerful in providing insights to us as software engineers of increasing complex platforms!

Level One is a Spring cloud app instrumented using the Otel Agent
* Do `./one.sh` to run within /one
* Navigate to (http://localhost:8081)
* Or, hit this directly via `localhost:8081/api`
* This calls layer 2 

Level Two is instrumented using the Otel Special Agent and manual spans
* Do `./two.sh` to run within /two
*  Hit this via `localhost:8082/api`
*  This calls layer 3 

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

Or File an issue and I'll get on it.

# Known issues
An exception is thrown due to the way the manual and auto instrumentation mixing changes from 0.2.0 to 0.3.0, but it functionally works. Will fix soon






