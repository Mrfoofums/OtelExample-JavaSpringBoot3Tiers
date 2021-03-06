# Description
This repository is a working example in how to instrument 3 Java Spring Boot services with Open Telemetry using the Otel-Launchers lightstep has created. The launchers wrap Open Telemetry directly with the only goal of making it super clear as to what data you should include at start up. https://github.com/lightstep/otel-launcher-java 

These services are VERY simple. All they do is return a simple greeting object(basically verbatim what is in the Spring Docs).

Data is first sent to an Otel Collector and then sent into two endpoints:
1) a local Jaeger instance at 0.0.0.0:16686
2) A project within lightstep. To send it into your project change the access token in the collector

### Where to define our Data
There are a number of environment variables and meta data that we need to define, and there are two primary places to define it, assuming you are using a collector which we are in this case. Those two places are:
1) At application startup within it's context
2) Within the Collector

In general, we want to avoid restarting our services to update values, but some values should be updated on service restart such as `service.version`.

With that in mind, we will set everything about our service within our service startup scripts and put the `ACCESS_TOKEN` in the collector config. check out `otel-collector-config` for reference.

# How to run
1) Run layers one, two, and three with their respective scripts. These scripts can be found in each service directory. Each of them can run independently but just throw errors when the downstream service isn't running.(You will see this errors in lightstep as well on the spans).

2) Run the collector with `docker-compose up`
3) Make sure you have an in lightstep and update the access token to see traces in your project!

### Level One
* Do `./one.sh` to run within /one
* Navigate to (http://localhost:8081)
* Or, hit this directly via `localhost:8081/api`
* This calls layer 2 

### Level Two
* Do `./two.sh` to run within /two
*  Hit this via `localhost:8082/api`
*  This calls layer 3 

### Level Three 
* Do `./three.sh` to run within /three
* Hit this via `localhost:8083/api`
* This just exist, feel free to run it solo!


# Things you need to know
1) Have a lightstep account. Create a free trial account here: [lightstep](https://go.lightstep.com/trial)


## NEED HELP?
Send me an email at forrest@Lightstep.com

I will provide the help.

Or File an issue and I'll get on it.

# TODO
1) Possible dockerize the services







