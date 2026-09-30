---
chapter: 46
title: "Containerize an Application"
related_notebook: "Docker Fundamentals: Images, Containers, and Networks"
level: Beginner
estimated_time: 40 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/46-docker-fundamentals.md) | [Lab](../../labs/en/46-build-and-run-a-container.md) | [Roadmap](../../ROADMAP.md)

# Containerize an Application

## Objective

Package a small HTTP application as a non-root Docker image and run it with explicit port, network, and storage choices.

## Outcomes

- Write a focused Dockerfile and `.dockerignore`.
- Build and run an image with a predictable tag and published port.
- Explain which data belongs in a volume and verify the container user.

## Prerequisites

- Read [Docker Fundamentals](../../notebooks/en/46-docker-fundamentals.md).
- Docker Desktop or Docker Engine installed.
- A small application with a documented start command.

## Scenario

A team has a local service that works on one developer machine but is difficult to reproduce. Create a container contract that another developer can build and run without installing the application runtime.

## Tasks

### Task 1 - Create the build context

Add a Dockerfile, `.dockerignore`, and a health endpoint. Exclude `.git`, local secrets, caches, and test output from the build context.

**Expected Result:** The build context contains only files required to build and run the service.

### Task 2 - Build and run

Build `demo-service:1.0` and run it with `--publish 8080:8080`. Verify the endpoint with a browser or HTTP client.

**Expected Result:** The service responds on port 8080 and the container can be removed without deleting source files.

### Task 3 - Verify isolation choices

Run `docker exec <container> id`, inspect the port mapping, and mount a named volume at the application data directory if state is required.

**Expected Result:** The process is not root, the published port is intentional, and persistent data is stored outside the writable container layer.

## Challenge

Add a user-defined network and a second test container. Connect to the service by container name, then explain why the service should not publish its internal port to the host in production.

## Self-Assessment

- [ ] I can explain the difference between an image and a container.
- [ ] I can build and run an image with an explicit tag.
- [ ] I can verify non-root execution.
- [ ] I can choose between a volume and disposable container storage.

## Common Mistakes

| Mistake                            | Solution                                          |
| ---------------------------------- | ------------------------------------------------- |
| Copying secrets into the image     | Use `.dockerignore` and runtime secret injection. |
| Running as root                    | Create a dedicated user and set `USER`.           |
| Assuming `EXPOSE` publishes a port | Use `--publish` when host access is required.     |

## Summary

A good container exercise makes the runtime contract visible: small build context, explicit port mapping, non-root execution, and deliberate persistence.

## Related Links

- Notebook: [Docker Fundamentals](../../notebooks/en/46-docker-fundamentals.md)
- Lab: [Build and run a container](../../labs/en/46-build-and-run-a-container.md)
- Quiz: [Docker fundamentals quiz](../../quizzes/en/46-docker-fundamentals-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
