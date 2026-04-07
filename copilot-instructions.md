# Copilot Instructions — TutorBot Campus Monorepo

## Language & Framework

- Java 17, Spring Boot 3.x for backend services
- React + Vite for the frontend
- Docker Compose for local infrastructure
- RabbitMQ, Redis, Oracle, MongoDB, Solr, and Ollama across the platform

## Coding conventions for this service

- Preserve each service as an independent bounded context
- DTOs and reusable contracts belong in shared/ once that module is implemented, not duplicated across services
- Keep event names stable and documented in code plus docs
- Favor asynchronous integration between services; use API Gateway for client-facing orchestration
- When a change impacts more than one module, update the corresponding agents.md and copilot-instructions.md files together

## Preferred patterns

```java
// Service boundary reminder
public interface DomainService {
    void handle(EventPayload payload);
}

// Event contract reminder
record EventEnvelope(String id, String type, String source) {
}
```

## Test conventions

- Add tests next to the service being changed instead of centralizing tests at the root
- Keep unit tests inside each module test tree
- Use explicit names such as shouldPublishGapDetectedWhenThresholdExceeded

## Dependencies available in this service

- Spring Boot, Spring Cloud, Spring Security, Spring Data, RabbitMQ clients, Redis, Oracle JDBC, MongoDB, SolrJ
- React and Vite in frontend/
- Docker Compose definitions in infrastructure/

## Snippets Copilot should suggest in this folder

- Service-specific event flow notes
- README and architecture updates when contracts change
- Module-local test scaffolding instead of root-level test utilities

## Things Copilot must avoid suggesting here

- Do not suggest direct internal microservice REST calls that bypass the event contract or API Gateway
- Do not suggest adding shared code at the repository root
- Do not suggest changing persistence technology in one module without updating that module's guidance files
- Do not add Maven packages without team discussion
- Do not suggest changes to infrastructure without updating the corresponding documentation and agents.md files
- Do not suggest changes to the RabbitMQ event contract without updating all affected services and documentation
- Do not suggest changes to the frontend that bypass the API Gateway or violate service boundaries
- Do not suggest adding new dependencies to a module pom.xml without noting it in that module guidance file
- Do not blur service ownership by moving domain logic into the repository root
- Do not redefine event payloads differently in multiple services
- Do not introduce direct internal REST coupling where the platform already uses RabbitMQ
- Do not suggest changes to the event flow that are not reflected in the architecture documentation and service READMEs
- Do not commit plaintext credentials or connection strings in infrastructure or service configuration files