# AI Agents Guide — Infrastructure

## What this module does

This folder defines the local and future deployment runtime for TutorBot Campus. It contains Docker Compose stacks and the placeholder Kubernetes area for infrastructure automation.

## Bounded Context

This module owns service wiring, local dependency topology, and deployment scaffolding. It must never become a place for application business logic or undocumented service contract changes.

## Key concepts for AI to understand

- local dependency stack: the Redis, RabbitMQ, MongoDB, Oracle, Solr, Ollama, and ELK services required for development
- runtime topology: the way application services and dependencies are connected for local or cluster execution

## When working in this folder, AI should

- [ ] Keep service ports, container names, and dependency wiring aligned with backend documentation
- [ ] Reflect any infrastructure change in relevant README and docs files
- [ ] Preserve separation between dev and full-stack compose files
- [ ] Keep k8s/ as the place for future deployment manifests
- [ ] Validate that any new service dependency is documented in root and service READMEs

## RabbitMQ contract for this service

| Direction | Event | Description |
| --- | --- | --- |
| Listens | — | Infrastructure does not consume domain events |
| Emits | — | Infrastructure does not publish domain events |

## What AI should NOT do here

- Do not add new dependencies without noting it in this file
- Do not change ports casually without updating docs and service guidance
- Do not place application code or business logic in infrastructure/

## Related files to always check before editing

- docker-compose.dev.yml
- docker-compose.full.yml
- ../docs/architecture.md
