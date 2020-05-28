package com.forrest.leveltwo;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import io.opentelemetry.context.Scope;
import io.opentelemetry.trace.Span;
import io.opentelemetry.trace.Tracer;


@RestController
public class LevelTwoController {

    private static final String layer = "layer2";
    
    private static final String template = layer+", %s!";
    private final AtomicLong counter = new AtomicLong();
   
    String url = "http://localhost:8083/api"; // TODO: env config

    @Autowired
    private RestTemplate restTemplate; 

    @Autowired
    Tracer tracer;
    
    @RequestMapping("/api")
    public Greeting greeting(@RequestParam(value="name", defaultValue="level2Default") String name) {
        Span span = tracer.spanBuilder("GreetingManualSpan").startSpan();
        tracer.withSpan(span);
        someLoop();
        AnAbstractClass();
        span.end();

        // Return the response from all of the other layers
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, callNextLayer().getContent()));
    }

    public Greeting callNextLayer(){
        Greeting response = restTemplate.getForObject(url, Greeting.class);
        return response;
    }

    public void AnAbstractClass(){
        Span span = tracer.spanBuilder("randomNestedSPan").startSpan();
        span.setAttribute("lightstep.component_name", "fakeComponent");
        span.addEvent("You can create services inline using the tag \"lighstep.component_name\"");
        span.end();
    }


    public void someLoop(){
        for(int i = 0; i<4; i++){
            Span span = tracer.spanBuilder("fastOperation").setParent(tracer.getCurrentSpan()).startSpan();

            span.setAttribute("iteration", i);
            span.end();
        }
    }
}