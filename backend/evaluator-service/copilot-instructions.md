# Copilot Instructions — Evaluator Service

## Language & Framework

- Java 17, Spring Boot 3.x
- Spring Web
- Spring Data JPA
- Spring AMQP
- Resilience4J circuit breaker
- Eureka Client

## Coding conventions for this service

- Class names: PascalCase. Event handlers prefixed with on, such as onStudentAnswered()
- DTOs live in shared/ — never redefine them here
- Log every RabbitMQ event received with log.info("[EVALUATOR] Event received: {}", eventId)
- All Ollama calls must have a @CircuitBreaker fallback method defined
- Transactions: use @Transactional on service layer, publish RabbitMQ events only in afterCommit()

## Preferred patterns

```java
@RabbitListener(queues = "${rabbitmq.queue.student-answered}")
public void onStudentAnswered(StudentAnsweredEvent event) {
    log.info("[EVALUATOR] Processing event: {}", event.getId());
    evaluationService.process(event);
}

@CircuitBreaker(name = "ollama", fallbackMethod = "fallbackEvaluate")
public EvaluationResult evaluateAnswer(StudentAnsweredEvent event) {
    return ollamaClient.evaluate(event);
}
```

## Test conventions

- Use @ExtendWith(MockitoExtension.class)
- Mock RabbitTemplate, OllamaClient, and all repositories
- Test naming: shouldPublishEvaluationCompletedWhenEvaluationSucceeds

## Dependencies available in this service

- spring-boot-starter-web
- spring-boot-starter-data-jpa
- spring-boot-starter-amqp
- spring-cloud-starter-circuitbreaker-resilience4j
- ojdbc11
- spring-cloud-starter-netflix-eureka-client
- spring-boot-starter-actuator
- spring-boot-starter-test

## Snippets Copilot should suggest in this folder

- RabbitMQ @RabbitListener with proper logging
- @CircuitBreaker with fallback
- @Transactional with afterCommit() event publishing
- JPQL @Query annotations for Oracle-backed reads

## Things Copilot must avoid suggesting here

- Do not suggest RestTemplate calls to other internal microservices
- Do not suggest @Transactional on controller layer
- Do not suggest hardcoded queue names — use @Value("${rabbitmq.queue.{name}}")
- Do not suggest MongoDB documents or Solr code in this service