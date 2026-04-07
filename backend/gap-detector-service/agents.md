# AI Agents Guide — Gap Detector Service

## What this module does

This service detects learning gaps from completed evaluations. It translates evaluation outcomes into explicit academic deficits that can drive personalized remediation.

## Bounded Context

This service owns gap inference rules and durable gap records in Oracle. It must never own exercise generation, session lifecycle state, or learning path storage in MongoDB.

## Key concepts for AI to understand

- learning gap: a concept or skill the student has not mastered sufficiently
- remediation trigger: the condition under which a gap should be published for downstream action
- JPQL projection: a query technique for reading relational gap analytics efficiently

## When working in this folder, AI should

- [ ] Always respect the RabbitMQ event contract and consume evaluation.completed asynchronously
- [ ] Use Oracle for persistence — not mix Oracle and MongoDB unless this service explicitly uses both
- [ ] Follow the existing package structure: agent/ config/ controller/ service/ model/ repository/
- [ ] Add tests in test/java/com/tutorbot/gapdetector/ for every new class in agent/ or service/
- [ ] Keep detection heuristics and JPQL query logic in service/ and repository/

## RabbitMQ contract for this service

| Direction | Event | Description |
| --- | --- | --- |
| Listens | evaluation.completed | Receives scored evaluation outcomes to infer learning deficits |
| Emits | gap.detected | Publishes structured gap records for pathing and notification workflows |

## What AI should NOT do here

- Do not add new dependencies to pom.xml without noting it in this file
- Do not call Ollama directly from controller layer — only from service layer
- Do not store gap data in MongoDB or Redis
- Do not turn this service into an exercise recommendation or notification module

## Related files to always check before editing

- src/main/java/com/tutorbot/gapdetector/config/GapDetectorMessagingConfig.java
- src/main/java/com/tutorbot/gapdetector/agent/GapDetectorAgent.java
- src/main/java/com/tutorbot/gapdetector/service/GapDetectorService.java
- ../shared/
