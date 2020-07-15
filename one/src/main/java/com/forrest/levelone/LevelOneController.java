package com.forrest.levelone;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class LevelOneController {

    private static final String layer = "layer1";

    private static final String template = layer+", %s!";
    private final AtomicLong counter = new AtomicLong();
    
    String url = "http://localhost:8082/api"; // TODO: env config

    @Autowired
    private RestTemplate restTemplate; 
   
    
    @RequestMapping("/api")
    public Greeting greeting(@RequestParam(value="name", defaultValue="level1Default") String name) {

        // Return the response from all of the other layers
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, callNextLayer().getContent()));
    }

    public Greeting callNextLayer(){
        try{
             Greeting response = restTemplate.getForObject(url, Greeting.class);
             return response;
        }
        catch(Exception e){
            e.printStackTrace();
            return new Greeting(0, "Error communicating to downstream service, make sure it is running and check your logs");
        }
    }

}