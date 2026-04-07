# AI Agents Guide — TutorBot Campus Monorepo

## What this module does

This folder is the root orchestration point for TutorBot Campus. It ties together the infrastructure, backend microservices, frontend application, and documentation that make up the university tutoring platform.

## Bounded Context

This root owns monorepo-wide conventions, service boundaries, and cross-module coordination. It must never become a place for service-specific business logic, duplicate DTO definitions, or undocumented cross-service shortcuts.

## Key concepts for AI to understand

- bounded context: the ownership boundary for each service and module in the monorepo
- event-driven workflow: the RabbitMQ-based flow that moves tutoring state between services without tight coupling
- shared contract: DTO, event, and documentation artifacts that more than one module depends on

## Before Making Changes
Read .github/copilot-instructions.md in full.

## When working in this folder, AI should

- [ ] Always respect the RabbitMQ event contract and preserve service boundaries across the monorepo
- [ ] Keep cross-cutting guidance in root-level docs, not inside service code
- [ ] Route any new cross-service request path through the API gateway rather than suggesting direct service-to-service REST calls
- [ ] Check the affected module README, agents.md, and copilot-instructions.md before editing code
- [ ] Update docs and infrastructure references when a service contract or runtime dependency changes

## RabbitMQ contract for this service

| Direction | Event                | Description                                                  |
| --------- | -------------------- | ------------------------------------------------------------ |
| Listens   | student.answered     | Answer intake event routed to evaluator-service              |
| Emits     | evaluation.completed | Evaluation completion event consumed by downstream services  |
| Emits     | gap.detected         | Gap detection event for remediation workflows                |
| Emits     | path.updated         | Learning path update event for notifier-service              |

## What AI should NOT do here

- Do not add new dependencies to a module pom.xml without noting it in that module guidance file
- Do not blur service ownership by moving domain logic into the repository root
- Do not redefine event payloads differently in multiple services
- Do not introduce direct internal REST coupling where the platform already uses RabbitMQ

## Related files to always check before editing

- README.md
- docs/architecture.md
- infrastructure/docker-compose.dev.yml
- backend/shared/

## Bug Fixes
When I report a bug:

First, write a failing test that reproduces it
Confirm the test fails before attempting any fix
Then fix the bug
The fix is complete only when the test passes without modifying the test itself