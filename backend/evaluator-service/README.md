# Evaluator Service

## Purpose
The Evaluator Service scores student answers using local Ollama-backed AI assistance and stores structured evaluation outcomes for downstream recommendation and gap analysis.

## Responsibilities
- Consume student.answered events from the tutoring workflow
- Evaluate answers with AI-assisted scoring and feedback generation
- Persist evaluation records in Oracle-backed storage
- Emit evaluation.completed events to downstream services

## Tech Stack
| Technology | Usage |
|------------|-------|
| Java 21 | Runtime baseline |
| Spring Boot 3 | Service framework |
| Spring Web | REST endpoints and Ollama client support |
| Spring Data JPA | Oracle persistence layer |
| RabbitMQ | Event consumption and publishing |
| Circuit breaker | Protect AI and persistence dependencies |
| Eureka Client | Service discovery registration |

## Key Files
| File | Description |
|------|-------------|
| pom.xml | Maven build with Oracle, messaging, and resilience dependencies |
| Dockerfile | Container build definition |
| src/main/java/com/tutorbot/evaluator/EvaluatorServiceApplication.java | Service bootstrap class |
| src/main/java/com/tutorbot/evaluator/agent/EvaluatorAgent.java | Main evaluation agent placeholder |
| src/main/java/com/tutorbot/evaluator/config/EvaluatorInfrastructureConfig.java | Messaging and resilience starter configuration |
| src/main/java/com/tutorbot/evaluator/controller/EvaluatorController.java | REST endpoints for evaluation operations |
| src/main/java/com/tutorbot/evaluator/service/EvaluationService.java | Business logic and AI evaluation flow |
| src/main/java/com/tutorbot/evaluator/model/EvaluationResult.java | JPA evaluation entity |
| src/main/java/com/tutorbot/evaluator/repository/EvaluationResultRepository.java | JPA repository interface |

## RabbitMQ Events
- **Listens to:** student.answered
- **Emits:** evaluation.completed

## How to Run
```bash
# Start dependencies first
docker compose -f ../../infrastructure/docker-compose.dev.yml up -d

# Run service
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
```
