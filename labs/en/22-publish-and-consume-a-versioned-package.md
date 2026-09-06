---
chapter: 22
title: "Publish and Consume a Versioned Package"
related_notebook: "Releases, Packages, and Container Registry"
related_exercise: "Plan a Versioned Release"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/22-releases-packages-and-container-registry.md) | [Exercise](../../exercises/en/22-plan-a-versioned-release.md) | [Quiz](../../quizzes/en/22-releases-packages-and-container-registry-quiz.md) | [Roadmap](../../ROADMAP.md)

## Publish and Consume a Versioned Package

## Objective

Practice the planning and verification steps for publishing and consuming one immutable package or container image version.

## Requirements

- A training project with a package or container registry enabled.
- Permission to publish a test artifact and read it from a separate consumer project or workspace.
- Platform-managed CI authentication. Do not paste tokens or passwords into files, commands, or notes.

## Tasks

### Task 1 - Prepare a release

1. Select a tested commit and choose a semantic version such as `1.0.0`.
2. Create the matching tag and draft release notes covering the user-visible change and verification.
3. Confirm the project or group namespace and the people or automation authorized to publish.

### Task 2 - Publish once

1. Configure the platform's approved CI publishing method outside source control.
2. Build the package or image and publish version `1.0.0`.
3. Confirm the registry shows its name, version or tag, owner, and creation time.

### Task 3 - Consume explicitly

1. In the consumer, request exactly `1.0.0` rather than `latest`.
2. Run the consumer's relevant verification step.
3. Attempt to plan a correction without replacing `1.0.0`; choose a new patch version instead.

## Expected Outcome

The consumer uses the exact artifact linked to the release, and the original published version remains unchanged.

## Validation Checklist

- [ ] Tag, release, and registry version agree.
- [ ] Release notes state meaningful user impact.
- [ ] Publishing access is limited to an approved owner or automation.
- [ ] Consumption uses a fixed version or digest.
- [ ] No credential was stored in the repository.

## Related Content

- [Notebook](../../notebooks/en/22-releases-packages-and-container-registry.md)
- [Exercise](../../exercises/en/22-plan-a-versioned-release.md)
- [Quiz](../../quizzes/en/22-releases-packages-and-container-registry-quiz.md)
