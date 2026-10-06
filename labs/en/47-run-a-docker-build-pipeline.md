---
chapter: 47
title: "Run a Docker Build Pipeline"
related_notebook: "Reproducible Docker Build Pipelines"
related_exercise: "Design a Docker Build Pipeline"
level: Intermediate
estimated_time: 100 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/47-docker-build-pipelines.md) | [Exercise](../../exercises/en/47-design-a-docker-build-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Run a Docker Build Pipeline

## Objective

Implement a local or CI pipeline that builds, tests, scans, and records one immutable container artifact.

## Outcomes

- Use a multi-stage Dockerfile and dependency lock file.
- Run tests against the built image.
- Produce scan and build evidence before publication.

## Prerequisites

- Completed the notebook and exercise.
- Docker and a project with reproducible dependency installation.
- A vulnerability scanner such as Trivy, installed locally or available in CI.

## Scenario

A service image has grown large and is published before tests. Improve the pipeline so the runtime image is smaller and publication is blocked by test or scan failure.

## Environment

| Requirement      | Value                                            |
| ---------------- | ------------------------------------------------ |
| Operating System | Windows, Linux, or macOS                         |
| Software         | Docker, project test runner, Trivy or equivalent |
| Image tag        | `service:${GIT_COMMIT}`                          |
| Evidence         | Test log, scan report, SBOM                      |

## Tasks

### Task 1 - Create build and runtime stages

Move compilation and test dependencies into a build stage. Copy only runtime output into the final stage and set a non-root user.

**Expected Result:** The runtime image does not contain compilers or source-control metadata.

### Task 2 - Test the image

Build with a commit-based tag, start the image, run its tests or smoke checks, and save the output as an artifact.

**Expected Result:** Tests exercise the same image that will be scanned and published.

### Task 3 - Scan and gate

Run `trivy image --severity HIGH,CRITICAL --exit-code 1 service:${GIT_COMMIT}`. Generate an SBOM and document any approved, expiring exception.

**Expected Result:** A failing policy prevents publication and a passing run retains evidence.

## Validation Checklist

- [ ] Build context excludes secrets and local artifacts.
- [ ] Multi-stage output contains only runtime requirements.
- [ ] Tests run against the final image.
- [ ] Scan targets the exact commit tag.
- [ ] SBOM and logs are retained.

## Troubleshooting

| Problem                              | Possible Cause                         | Solution                                                |
| ------------------------------------ | -------------------------------------- | ------------------------------------------------------- |
| Cache hides a dependency change      | Lock file is absent from the cache key | Include lock-file content in the key.                   |
| Scanner reports base vulnerabilities | Runtime base image is outdated         | Update the base image or record a time-bound exception. |
| Publication runs after failure       | Jobs are not connected by dependencies | Require test and scan jobs before publish.              |

## Best Practices

- Pin inputs that affect the artifact and record the source commit.
- Keep scan policy separate from the image build code but enforce it in the pipeline.
- Make exceptions owned, justified, and automatically expire.

## Summary

A trustworthy build pipeline produces one tested runtime image, scans it, and keeps evidence before any registry push.

## Related Links

- Notebook: [Reproducible Docker Build Pipelines](../../notebooks/en/47-docker-build-pipelines.md)
- Exercise: [Design a Docker build pipeline](../../exercises/en/47-design-a-docker-build-pipeline.md)
- Quiz: [Docker build pipelines quiz](../../quizzes/en/47-docker-build-pipelines-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
