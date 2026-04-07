# Copilot Instructions — Infrastructure

## Language & Framework

- Docker Compose
- Kubernetes placeholders in k8s/
- Containerized Redis, RabbitMQ, MongoDB, Oracle Free, Solr, Ollama, Elasticsearch, Logstash, and Kibana

## Coding conventions for this service

- Keep YAML readable and environment-focused
- Match service names to backend module names where possible
- Keep local development defaults explicit and conservative
- Document any new exposed port or required volume
- Prefer additive changes to compose files over breaking renames

## Preferred patterns

```yaml
services:
  rabbitmq:
    image: rabbitmq:3.13-management
    ports:
      - '5672:5672'
```

## Test conventions

- Validate compose syntax and keep service names predictable
- Test naming for future infrastructure checks: shouldStartRabbitMqWhenDevStackBoots

## Dependencies available in this service

- Docker Compose v3.9 syntax
- Redis, RabbitMQ, MongoDB, Solr, Ollama, Oracle Free, Elasticsearch, Logstash, Kibana images

## Snippets Copilot should suggest in this folder

- Compose services with ports, volumes, and environment blocks
- Health-friendly dependency ordering
- Placeholder Kubernetes manifests under k8s/

## Things Copilot must avoid suggesting here

- Do not suggest hardcoded host machine paths unless necessary
- Do not suggest changing published ports without reflecting the backend contract
- Do not suggest embedding secrets directly in committed files for non-dev environments