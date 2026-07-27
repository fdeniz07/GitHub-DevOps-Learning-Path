---
chapter: 49
title: "Cloud Deployment Models, Configuration, and Rollback"
part: "DevOps"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](48-container-registries.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Compare virtual machines, managed container services, and orchestrators.
- Separate configuration and secrets from an application image.
- Design health checks, rollout gates, and a practical rollback plan.

## Introduction

Cloud deployment is the controlled movement of a tested artifact into an environment operated by a cloud provider. The provider may manage virtual machines, a container runtime, a cluster scheduler, or the complete application platform. Your choice should match operational needs, team capability, and the required control over networking and runtime behavior.

## Why This Matters

A successful deployment is more than an upload. It must receive configuration safely, expose a health signal, handle traffic, and provide a fast recovery path. Explicit deployment models and rollback procedures reduce guesswork during an incident.

## Key Terms

| Term                      | Definition                                                                            |
| ------------------------- | ------------------------------------------------------------------------------------- |
| VM deployment             | Running an application on virtual machines managed by the team or provider.           |
| Managed container service | A platform that runs containers while managing much of the host infrastructure.       |
| Orchestrator              | A scheduler that manages placement, scaling, networking, and lifecycle of containers. |
| Readiness check           | A signal that determines whether an instance may receive traffic.                     |
| Liveness check            | A signal that determines whether an unhealthy process should be restarted.            |
| Rollback                  | Returning service to a previously known-good version or configuration.                |

## Theory

Virtual machines provide broad control but require patching, capacity planning, and host operations. Managed container services reduce host work and suit stateless services with moderate platform requirements. Orchestrators provide advanced scheduling, service discovery, and progressive delivery, but require stronger platform expertise and governance.

Configuration such as URLs, feature flags, resource limits, and environment names should be injected by the deployment system. Secrets belong in a managed secret store and should be exposed only to the process that needs them. The image should be identical across environments whenever possible.

Health checks must answer different questions. Readiness says whether traffic should arrive. Liveness says whether restarting may recover the process. A deployment should wait for readiness, observe error rate and latency, and stop or roll back when the release violates its gates.

## Practical Examples

### Container service configuration

```yaml
service: checkout-api
image: registry.example.com/platform/checkout@sha256:abc123
port: 8080
environment:
  ASPNETCORE_ENVIRONMENT: Production
  ORDERS_API_URL: https://orders.internal
secrets:
  - name: DATABASE_PASSWORD
    ref: secret://prod/checkout/database-password
health:
  readiness: /health/ready
  liveness: /health/live
resources:
  cpu: 500m
  memory: 512Mi
```

The image is selected by digest, while environment configuration and secrets are supplied by the platform. The service must not embed the production password in its image.

### Rollout and rollback outline

```bash
cloud deploy checkout-api --image registry.example.com/platform/checkout@sha256:abc123 --wait-for-ready
cloud observe checkout-api --window 10m --signals error-rate,p95-latency
cloud rollback checkout-api --to revision checkout-api-2026-09-22
```

The command names are illustrative platform operations. The important sequence is immutable artifact, readiness gate, observable window, and a rehearsed previous revision.

## Try It Yourself

1. Choose a deployment model for a stateless HTTP service and justify the operational trade-off.
2. List all configuration values and classify each as public configuration or secret.
3. Define readiness and liveness endpoints and a startup grace period.
4. Write rollback triggers based on error rate, latency, and failed health checks.

## Best Practices

- Promote the same tested image through environments and deploy by digest.
- Keep infrastructure and application configuration versioned, with secrets externalized.
- Use readiness gates before sending traffic and liveness checks that avoid restart loops.
- Make deployments observable, bounded, and reversible.
- Test rollback and document who can approve or execute it.

## Common Mistakes

| Mistake                           | Why it causes problems                                        | How to avoid it                        |
| --------------------------------- | ------------------------------------------------------------- | -------------------------------------- |
| Rebuilding for each environment   | Artifacts differ between test and production.                 | Promote one immutable image.           |
| Putting secrets in image layers   | Anyone with the image may recover them.                       | Inject secrets at runtime.             |
| Using one check for every purpose | Traffic may reach an unready app or healthy work may restart. | Separate readiness and liveness.       |
| Planning rollback only on paper   | Operators lose time during an incident.                       | Rehearse rollback with real revisions. |

## Summary

- Cloud models trade operational control for managed responsibility.
- Runtime configuration and secrets should remain outside immutable images.
- Health checks, rollout gates, observability, and rehearsed rollback make deployment recoverable.

## Related Links

- Previous chapter: [Container registries](48-container-registries.md)
- Exercise: [Plan a cloud deployment](../../exercises/en/49-plan-a-cloud-deployment.md)
- Lab: [Deploy an application to the cloud](../../labs/en/49-deploy-an-application-to-the-cloud.md)
- Quiz: [Cloud deployments quiz](../../quizzes/en/49-cloud-deployments-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
