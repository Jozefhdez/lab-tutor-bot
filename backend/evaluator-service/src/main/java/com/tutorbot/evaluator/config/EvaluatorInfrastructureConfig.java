package com.tutorbot.evaluator.config;

import org.springframework.amqp.core.Queue;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@ConditionalOnProperty(name = "tutorbot.messaging.enabled", havingValue = "true")
public class EvaluatorInfrastructureConfig {

    @Bean
    public Queue studentAnsweredQueue() {
        return new Queue("student.answered", true);
    }

    @Bean
    public Queue evaluationCompletedQueue() {
        return new Queue("evaluation.completed", true);
    }
}
