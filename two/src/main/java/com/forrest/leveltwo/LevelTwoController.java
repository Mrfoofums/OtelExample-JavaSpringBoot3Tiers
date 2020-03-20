package com.forrest.leveltwo;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class LevelTwoController {

    private static final String layer = "layer2";
    
    private static final String template = layer+", %s!";
    private final AtomicLong counter = new AtomicLong();
   
    String url = "http://localhost:8083/api"; // TODO: env config

    @Autowired
    private RestTemplate restTemplate; 
    
    @RequestMapping("/api")
    public Greeting greeting(@RequestParam(value="name", defaultValue="level2Default") String name) {

        // Return the response from all of the other layers
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, callNextLayer().getContent()));
    }

    public Greeting callNextLayer(){
        Greeting response = restTemplate.getForObject(url, Greeting.class);
        return response;
    }
}