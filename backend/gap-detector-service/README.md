# Gap Detector Service

## Purpose
The Gap Detector Service analyzes evaluation outcomes to identify missing concepts, weak mastery areas, and intervention candidates for each student.

## Responsibilities
- Consume evaluation.completed events
- Persist detected learning gaps in Oracle-backed storage
- Model query-friendly analytics using JPA and JPQL
- Emit gap.detected events for downstream learning-path and notification flows

## Tech Stack
| Technology | Usage |
|------------|-------|
| Java 21 | Runtime baseline |
| Spring Boot 3 | Service framework |
| Spring Web | REST endpoints |
| Spring Data JPA | Oracle persistence and JPQL-based analytics |
| RabbitMQ | Event consumption and publishing |
| Eureka Client | Service discovery registration |

## Key Files
| File | Description |
|------|-------------|
| pom.xml | Maven build with Oracle and RabbitMQ dependencies |
| Dockerfile | Container build definition |
| src/main/java/com/tutorbot/gapdetector/GapDetectorServiceApplication.java | Service bootstrap class |
| src/main/java/com/tutorbot/gapdetector/agent/GapDetectorAgent.java | Main gap detection agent placeholder |
| src/main/java/com/tutorbot/gapdetector/config/GapDetectorMessagingConfig.java | Messaging configuration starter |
| src/main/java/com/tutorbot/gapdetector/controller/GapDetectorController.java | REST endpoints for learning-gap inspection |
| src/main/java/com/tutorbot/gapdetector/service/GapDetectorService.java | Business logic for gap detection |
| src/main/java/com/tutorbot/gapdetector/model/LearningGap.java | JPA gap entity |
| src/main/java/com/tutorbot/gapdetector/repository/LearningGapRepository.java | JPA repository interface |

## RabbitMQ Events
- **Listens to:** evaluation.completed
- **Emits:** gap.detected

## How to Run
```bash
# Start dependencies first
docker compose -f ../../infrastructure/docker-compose.dev.yml up -d

# Run service
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
```
