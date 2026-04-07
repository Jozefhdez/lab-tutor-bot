# AI Agents Guide — Evaluator Service

## What this module does

This service evaluates student answers and produces normalized scoring and feedback results. It is the AI-assisted academic evaluation boundary in TutorBot Campus.

## Bounded Context

This service owns answer scoring, feedback generation, and durable evaluation records. It must never own exercise recommendation storage, learning path planning, notifier fanout, or MongoDB-based adaptive content state.

## Key concepts for AI to understand

- evaluation result: the persisted score and feedback outcome for a submitted answer
- answer scoring: the process of turning student input into a structured academic assessment
- circuit breaker: the resilience boundary used around AI or remote dependency calls

## When working in this folder, AI should

- [ ] Always respect the RabbitMQ event contract and consume student.answered asynchronously
- [ ] Use Oracle for persistence — not mix Oracle and MongoDB unless this service explicitly uses both
- [ ] Follow the existing package structure: agent/ config/ controller/ service/ model/ repository/
- [ ] Add tests in test/java/com/tutorbot/evaluator/ for every new class in agent/ or service/
- [ ] Keep Ollama orchestration and fallback logic in service/ rather than controller/

## RabbitMQ contract for this service

| Direction | Event | Description |
| --- | --- | --- |
| Listens | student.answered | Receives submitted answer payloads for evaluation |
| Emits | evaluation.completed | Publishes scored evaluation output for downstream services |

## What AI should NOT do here

- Do not add new dependencies to pom.xml without noting it in this file
- Do not call Ollama directly from controller layer — only from service layer
- Do not persist evaluation state in MongoDB or Redis
- Do not publish evaluation.completed before the Oracle record is safely written

## Related files to always check before editing

- src/main/java/com/tutorbot/evaluator/config/EvaluatorInfrastructureConfig.java
- src/main/java/com/tutorbot/evaluator/agent/EvaluatorAgent.java
- src/main/java/com/tutorbot/evaluator/service/EvaluationService.java
- ../shared/

