# Copilot Instructions — Gap Detector Service

## Language & Framework

- Java 17, Spring Boot 3.x
- Spring Web
- Spring Data JPA
- Spring AMQP
- Eureka Client

## Coding conventions for this service

- Class names: PascalCase. Event handlers prefixed with on, such as onEvaluationCompleted()
- DTOs live in shared/ — never redefine them here
- Log every RabbitMQ event received with log.info("[GAP-DETECTOR] Event received: {}", eventId)
- Transactions: use @Transactional on service layer, publish RabbitMQ events only in afterCommit()
- Prefer JPQL projections and repository queries for analytical reads over manual SQL strings in controllers

## Preferred patterns

```java
@RabbitListener(queues = "${rabbitmq.queue.evaluation-completed}")
public void onEvaluationCompleted(EvaluationCompletedEvent event) {
    log.info("[GAP-DETECTOR] Processing event: {}", event.getId());
    gapDetectorService.process(event);
}

@Query("select gap from LearningGap gap where gap.studentId = :studentId")
List<LearningGap> findByStudentId(String studentId);
```

## Test conventions

- Use @ExtendWith(MockitoExtension.class)
- Mock RabbitTemplate and all repositories
- Test naming: shouldPublishGapDetectedWhenMasteryFallsBelowThreshold

## Dependencies available in this service

- spring-boot-starter-web
- spring-boot-starter-data-jpa
- spring-boot-starter-amqp
- ojdbc11
- spring-cloud-starter-netflix-eureka-client
- spring-boot-starter-actuator
- spring-boot-starter-test

## Snippets Copilot should suggest in this folder

- RabbitMQ @RabbitListener with proper logging
- @Transactional with afterCommit() event publishing
- JPQL @Query annotations

## Things Copilot must avoid suggesting here

- Do not suggest RestTemplate calls to other internal microservices
- Do not suggest @Transactional on controller layer
- Do not suggest hardcoded queue names — use @Value("${rabbitmq.queue.{name}}")
- Do not suggest MongoDB documents or Solr integration in this service