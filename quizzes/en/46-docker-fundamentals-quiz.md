---
chapter: 46
title: "Docker Fundamentals Quiz"
related_notebook: "Docker Fundamentals: Images, Containers, and Networks"
related_exercise: "Containerize an Application"
related_lab: "Build and Run a Container"
level: Beginner
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/46-docker-fundamentals.md) | [Exercise](../../exercises/en/46-containerize-an-application.md) | [Lab](../../labs/en/46-build-and-run-a-container.md) | [Roadmap](../../ROADMAP.md)

# Docker Fundamentals Quiz

## Learning Objectives

- Explain images, containers, volumes, and networks.
- Choose explicit ports and storage behavior.
- Apply non-root container execution.

## Questions

### Question 1

What is a Docker image?

- A. A running process only
- B. An immutable, layered package used to create containers
- C. A host firewall rule
- D. A registry credential

**Answer:** B. An image is the layered package from which a container is created.

### Question 2

What happens to data written only to a container writable layer when the container is removed?

**Answer:** It is lost. Use a named volume or external data service for state that must survive replacement.

### Question 3

True or false: `EXPOSE 8080` automatically publishes port 8080 on the host.

**Answer:** False. `EXPOSE` documents intent; `--publish 8080:8080` creates the host mapping.

### Question 4

Why should an application normally run as a non-root user?

**Answer:** It reduces the impact of a compromise and makes ownership and permission assumptions explicit.

### Question 5

How can two containers communicate without publishing their ports to the host?

**Answer:** Attach them to the same user-defined Docker network and use the other container's service name.

### Question 6

Which storage choice is appropriate for a temporary cache?

- A. The container writable layer or a disposable volume
- B. A production database password in the image
- C. A public registry tag
- D. A host port

**Answer:** A. A cache does not require durable storage, provided the application can recreate it.

## Practical Scenario

A service writes uploads to `/app/uploads`, runs as root, and is started with `-p 8080:8080`. Recommend three changes for a safer deployment.

**Expected Answer:** Create a dedicated user, mount `/app/uploads` to a named volume or external storage, and publish only the required host port. Also add health behavior and avoid copying secrets into the image.

## Review Checklist

- [ ] I can distinguish image and container.
- [ ] I can explain volume persistence.
- [ ] I can use a user-defined network.
- [ ] I can verify a non-root process.
- [ ] I understand `EXPOSE` versus `--publish`.

## Related Links

- Notebook: [Docker Fundamentals](../../notebooks/en/46-docker-fundamentals.md)
- Exercise: [Containerize an application](../../exercises/en/46-containerize-an-application.md)
- Lab: [Build and run a container](../../labs/en/46-build-and-run-a-container.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
