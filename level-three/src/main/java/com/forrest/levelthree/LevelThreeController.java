package com.forrest.levelthree;

import java.util.concurrent.atomic.AtomicLong;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LevelThreeController {

    private static final String template = "Level3, %s!";
    private final AtomicLong counter = new AtomicLong();
   
    @RequestMapping("/api")
    public Greeting greeting(@RequestParam(value="name", defaultValue="level3Default") String name) {

        // Return the response from all of the other layers
        return new Greeting(counter.incrementAndGet(),
                            String.format(template, name));

}
}