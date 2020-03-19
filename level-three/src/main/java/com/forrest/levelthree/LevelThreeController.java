package com.forrest.levelthree;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import io.opentracing.Span;
import io.opentracing.Tracer;

@RestController
public class LevelThreeController {

    private static final String layer = "layer3";
    
    private static final String template = layer+", %s!";
    private final AtomicLong counter = new AtomicLong();

    @Autowired
    private Tracer tracer;   
   
    @RequestMapping("/api")
    public Greeting greeting(@RequestParam(value="name", defaultValue="level3Default") String name) {
       
        Span span = tracer.scopeManager().activeSpan();
        span.setTag("layer",layer);
        // Return the response from all of the other layers
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, name));

}
}