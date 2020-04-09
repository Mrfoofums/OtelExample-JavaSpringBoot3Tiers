## Description
Level One is a Spring cloud app instrumented using the SDK
* `./run.sh` to run

Level Two is instrumented using the Otel Special Agent
* `./magic.sh` to run

Level Three is instrumented using the SDK again
* `./run.sh` to run

Run the satellite
* `docker-compose up -d ` to run the satellite

### Thins you need to do
1) Make sure you swap out the respective keys for each component. For layer `one` and `three` you need make sure your `.withAccessToken()` is passed your `access token fo`r your project. This can be created and found in the settings pane in Lightstep.
2) To utilize the local satellite, you need to create a satellite key for your project and change our the satellite key in the `docker-compose.yml` file. This is passed as an environment variable called `COLLECTOR_API_KEY`
3) You will notice that the automatic instrumentation is pointing to the public ingestion point. This is exemplify that you can send parts of any transaction to any number of differing satellites, and the SaSS will assemble them.
4) If you have questions, file an issue in this repo or send an email to Forrest@lightstep.com





