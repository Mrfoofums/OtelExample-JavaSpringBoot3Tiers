package com.forrest.leveltwo;

import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.opentelemetry.OpenTelemetry;
import io.opentelemetry.sdk.OpenTelemetrySdk;
import io.opentelemetry.sdk.trace.SpanProcessor;
import io.opentelemetry.sdk.trace.export.BatchSpansProcessor;
import io.opentelemetry.sdk.trace.export.SimpleSpansProcessor;
import io.opentelemetry.trace.Tracer;
import io.opentelemetry.exporters.logging.*;

import com.lightstep.opentelemetry.exporter.LightstepSpanExporter;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;

@Configuration
@EnableAutoConfiguration (exclude={DataSourceAutoConfiguration.class, HibernateJpaAutoConfiguration.class})
public class OtelConfig {

    @Bean
    public Tracer otelTracer() throws Exception{
        final Tracer tracer = OpenTelemetry.getTracerFactory().get("com.otel.woo");

        SpanProcessor logProcessor = SimpleSpansProcessor.newBuilder(new LoggingExporter()).build();

       SpanProcessor lightstepProcessor = BatchSpansProcessor.newBuilder(LightstepSpanExporter.newBuilder()
        .setAccessToken("qYVqBuZ2QCMskFNzwPC0HjWUx1tADk0XJhZ35YGv276BEWn6tEWSOpgqFu2e7W+jw+HbSaTL3r3x3SO96qNGxhRPh+gjoupgmIYhb1mV")
        .setCollectorHost("collector-grpc.lightstep.com")
        .setCollectorPort(443)
        .setCollectorProtocol("https")
        .setComponentName("aComponent")
        .build()).build();

        // SimpleSpansProcessor lightstepProcessor = SimpleSpansProcessor.newBuilder(LightstepSpanExporter.Builder.fromEnv().build()).build();

        // OpenTelemetrySdk.getTracerFactory().addSpanProcessor(logProcessor);
        OpenTelemetrySdk.getTracerFactory().addSpanProcessor(lightstepProcessor);
        // OpenTelemetrySdk.getTracerFactory().addSpanProcessor(jaegerProcessor);

        return tracer;
    }
}