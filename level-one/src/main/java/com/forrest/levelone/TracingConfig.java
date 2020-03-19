package com.forrest.levelone;

import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.lightstep.tracer.shared.B3Propagator;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

import io.opentracing.Tracer;
import io.opentracing.propagation.Format;

@Configuration
@EnableAutoConfiguration (exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
public class TracingConfig {

    @Bean
    public Tracer lightstepTracer() throws Exception {
        B3Propagator propagator = new B3Propagator();
        return new com.lightstep.tracer.jre.JRETracer(
                new com.lightstep.tracer.shared.Options.OptionsBuilder()
                        .withComponentName("l1-service")
                        .withAccessToken("<access_token>")
                         .withPropagator(Format.Builtin.TEXT_MAP_INJECT, propagator)
                         .withPropagator(Format.Builtin.TEXT_MAP_EXTRACT, propagator)
                         .withVerbosity(4)
                       .withCollectorHost("localhost")
                       .withCollectorPort(9111)
                       .withCollectorProtocol("http")
                        .build());
    }
}
