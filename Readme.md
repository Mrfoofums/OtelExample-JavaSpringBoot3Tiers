## Description
This repository is a working example in how to instrument 3 Java Spring Boot services with Open Telemetry. The scripts assume you have maven installed as they rebuild the artifact each time. 

These services are VERY simple. All they do is return a simple greeting object(basically verbatim what is in the Spring Docs).

Data is sent into two places
1) a local Jaeger instance at 0.0.0.0:16686
2) A project within lightstep. To send it into your project change the access token in the collector

### Where to define our Data
There are a number of environment variables and meta data that we need to define, and there are two primary places to define it, assuming you are using a collector which we are here.
1) At application startup
2) Within the Collector

In general, we want to avoid restarting our services to update values, but some values should be updated on service restart such as `service.version`.

With that in mind, we will set everything about our service within our service startup scripts, and put the `ACCESS_TOKEN` in the collector config. check out `otel-collector-config` for reference.

# How to run
Run layer one two and three with their respective scripts. These scripts can be found in each service directory. Each of them can run independently but just throw errors when the downstream service isn't running.(You will see this errors in lightstep as well on the spans).

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

## Things you need to know
1) Have a lightstep account. Create a free trial account here: [lightstep](https://go.lightstep.com/trial)


## NEED HELP?
Send me an email at forrest@Lightstep.com

I will provide the help.

Or File an issue and I'll get on it.

# TODO
1) Possible dockerize the services so you don't need maven







