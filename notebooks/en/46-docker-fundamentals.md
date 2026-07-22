---
chapter: 46
title: "Docker Fundamentals: Images, Containers, and Networks"
part: "DevOps"
level: Beginner
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](45-security-best-practices.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Explain how images, containers, layers, volumes, and networks fit together.
- Build and run a small image with predictable configuration and port mapping.
- Run a container as a non-root user and choose an appropriate storage strategy.

## Introduction

Docker packages an application and its runtime dependencies into an image. A container is a running process created from that image. This gives developers and delivery systems a repeatable unit that can run on a laptop, a CI runner, or a cloud platform.

## Why This Matters

A container image makes the runtime contract explicit: base operating system libraries, application files, startup command, and exposed interfaces are described together. Understanding the boundaries between immutable image layers and writable container state helps you avoid lost data, fragile builds, and insecure defaults.

## Key Terms

| Term          | Definition                                                                              |
| ------------- | --------------------------------------------------------------------------------------- |
| Image         | An immutable, layered package used to create containers.                                |
| Container     | An isolated process with a filesystem and network view derived from an image.           |
| Volume        | Docker-managed persistent storage mounted into one or more containers.                  |
| Network       | A virtual connection that lets containers communicate by name and policy.               |
| Registry      | A service that stores and distributes images.                                           |
| Non-root user | A process identity that cannot modify the host or protected container paths by default. |

## Theory

An image is built from layers. Each Dockerfile instruction may add a layer, so ordering stable dependency steps before frequently changing application files can improve cache reuse. Containers add a writable layer above the image, but that layer is disposable. Data that must survive replacement belongs in a volume or an external service.

A bridge network provides container-to-container communication through service names. Published ports connect a container port to the host, for example `-p 8080:8080`. Publishing is different from exposing a port in a Dockerfile: `EXPOSE` documents an intended port, while `-p` creates the host connection.

Run application processes as a dedicated non-root user. A non-root default reduces the impact of a process compromise and makes file ownership problems visible early. The application directory must be readable, and any writable directory must be owned by that user.

## Practical Examples

### Build a small image

```dockerfile
FROM python:3.12-slim

WORKDIR /app
RUN useradd --create-home --uid 10001 appuser
COPY --chown=appuser:appuser requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY --chown=appuser:appuser . .
USER appuser
EXPOSE 8080
CMD ["python", "app.py"]
```

Build and run it:

```bash
docker build --tag demo-service:1.0 .
docker run --rm --name demo-service --publish 8080:8080 demo-service:1.0
```

The image records the application and its dependencies. The container is disposable, and the process runs as `appuser` rather than root.

### Use a volume and a network

```bash
docker network create demo-network
docker volume create demo-data
docker run -d --name database --network demo-network --mount source=demo-data,target=/var/lib/data busybox sleep 3600
docker run --rm --network demo-network demo-service:1.0
```

The named volume survives container removal. The user-defined network gives containers a stable DNS name such as `database`.

## Try It Yourself

1. Create a minimal HTTP service with a `/health` endpoint.
2. Add a non-root user to its Dockerfile and verify with `docker exec <container> id`.
3. Run two containers on a user-defined network and connect to one by service name.
4. Stop and remove a container, then confirm which data survived in the volume.

## Best Practices

- Use small, maintained base images and pin important runtime versions.
- Keep images immutable; inject environment-specific configuration at runtime.
- Use `.dockerignore` to exclude credentials, build output, and local caches.
- Give containers explicit names, health checks, resource limits, and non-root users.
- Use volumes only for state that must persist; prefer managed databases for production data.

## Common Mistakes

| Mistake                                 | Why it causes problems                                       | How to avoid it                                   |
| --------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------- |
| Storing data only in the writable layer | Data disappears when the container is replaced.              | Mount a volume or use an external data service.   |
| Publishing every port                   | Internal services become reachable from the host or network. | Publish only required entry points.               |
| Running as root by default              | A compromise has a larger impact.                            | Create and select a dedicated `USER`.             |
| Confusing `EXPOSE` with port publishing | Documentation does not create connectivity.                  | Use `--publish` or a platform service definition. |

## Summary

- Images are immutable layered packages; containers are disposable runtime processes.
- Volumes hold state outside a container writable layer, and networks provide controlled service communication.
- Non-root execution and explicit port and storage choices are foundational container security practices.

## Related Links

- Previous chapter: [Security Best Practices](45-security-best-practices.md)
- Exercise: [Containerize an application](../../exercises/en/46-containerize-an-application.md)
- Lab: [Build and run a container](../../labs/en/46-build-and-run-a-container.md)
- Quiz: [Docker fundamentals quiz](../../quizzes/en/46-docker-fundamentals-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
