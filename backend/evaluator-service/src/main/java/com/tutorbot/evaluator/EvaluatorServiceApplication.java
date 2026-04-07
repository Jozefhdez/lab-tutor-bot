package com.tutorbot.evaluator;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;

@EnableDiscoveryClient
@SpringBootApplication
public class EvaluatorServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(EvaluatorServiceApplication.class, args);
    }
}
