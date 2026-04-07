package com.tutorbot.gapdetector.config;

import org.springframework.amqp.core.Queue;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(name = "tutorbot.messaging.enabled", havingValue = "true")
public class GapDetectorMessagingConfig {

    @Bean
    public Queue evaluationCompletedQueue() {
        return new Queue("evaluation.completed", true);
    }

    @Bean
    public Queue gapDetectedQueue() {
        return new Queue("gap.detected", true);
    }
}
