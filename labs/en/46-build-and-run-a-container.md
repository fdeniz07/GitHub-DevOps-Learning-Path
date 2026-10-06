---
chapter: 46
title: "Build and Run a Container"
related_notebook: "Docker Fundamentals: Images, Containers, and Networks"
related_exercise: "Containerize an Application"
level: Beginner
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/46-docker-fundamentals.md) | [Exercise](../../exercises/en/46-containerize-an-application.md) | [Roadmap](../../ROADMAP.md)

# Build and Run a Container

## Objective

Build a small service image, run it as a non-root container, and demonstrate network and volume behavior.

## Outcomes

- Produce a working Dockerfile and image.
- Verify port publishing, non-root execution, and health behavior.
- Persist selected data with a named volume.

## Prerequisites

Before starting this lab, you should have:

- Completed the related notebook and exercise.
- Docker Desktop or Docker Engine.
- A terminal and a local HTTP service with a start command.

## Scenario

You are preparing a service for a shared development environment. The lab produces a repeatable image and evidence that its runtime assumptions are explicit.

## Environment

| Requirement      | Value                                             |
| ---------------- | ------------------------------------------------- |
| Operating System | Windows, Linux, or macOS                          |
| Software         | Docker Engine or Docker Desktop, Git, HTTP client |
| Image            | `demo-service:1.0`                                |
| Host port        | `8080`                                            |

## Tasks

### Task 1 - Build the image

Create `.dockerignore` and a Dockerfile with a dedicated non-root user. Build with `docker build --tag demo-service:1.0 .`.

**Expected Result:** The image builds without including local secrets or unnecessary output.

### Task 2 - Run and inspect

Run `docker run --detach --name demo-service --publish 8080:8080 demo-service:1.0`. Call the health endpoint, inspect logs, and run `docker exec demo-service id`.

**Expected Result:** The endpoint responds and the process identity is not root.

### Task 3 - Test network and storage

Create `docker network create demo-network` and `docker volume create demo-data`. Attach the service to the network and mount the volume at its documented data path. Remove and recreate the container.

**Expected Result:** The named volume survives container replacement and network communication uses the intended boundary.

## Validation Checklist

- [ ] The image has the expected tag.
- [ ] The health endpoint responds on port 8080.
- [ ] The container process is non-root.
- [ ] The container logs contain no credentials.
- [ ] Required data survives container replacement in the named volume.

## Troubleshooting

| Problem                            | Possible Cause                          | Solution                                                 |
| ---------------------------------- | --------------------------------------- | -------------------------------------------------------- |
| Port is already allocated          | Another process uses 8080               | Stop it or publish a different host port.                |
| Permission denied in the container | Files are owned by root                 | Use `COPY --chown` and a writable application directory. |
| Data disappears                    | Data was written to the container layer | Mount `demo-data` at the correct path.                   |

## Best Practices

- Remove test containers with `docker rm --force demo-service` after the lab.
- Keep images immutable and use explicit tags.
- Never copy `.env` files containing secrets into the build context.

## Summary

This lab turns Docker concepts into evidence: a non-root process, intentional connectivity, and durable data outside the container layer.

## Related Links

- Notebook: [Docker Fundamentals](../../notebooks/en/46-docker-fundamentals.md)
- Exercise: [Containerize an application](../../exercises/en/46-containerize-an-application.md)
- Quiz: [Docker fundamentals quiz](../../quizzes/en/46-docker-fundamentals-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
