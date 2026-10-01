---
chapter: 50
title: "Define Service Monitoring Signals"
related_notebook: "Monitoring and Observability: Metrics, Logs, and Traces"
level: Intermediate
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/50-monitoring-and-observability.md) | [Lab](../../labs/en/50-instrument-and-monitor-a-service.md) | [Roadmap](../../ROADMAP.md)

# Define Service Monitoring Signals

## Objective

Design a small, actionable observability model for an HTTP service.

## Outcomes

- Select metrics, structured log fields, and trace spans.
- Define an SLI and SLO from user-visible behavior.
- Write alerts with thresholds, owners, and runbook links.

## Prerequisites

- Read [Monitoring and Observability](../../notebooks/en/50-monitoring-and-observability.md).
- Understand HTTP status codes, latency, and basic telemetry concepts.
- Know how to protect credentials and personal data in logs.

## Scenario

A payment API reports only CPU utilization. Customers report intermittent slow requests, but the team cannot identify whether the API, database, or payment provider is responsible.

## Tasks

### Task 1 - Choose signals

Define request rate, error rate, latency distribution, saturation, structured events, and trace spans for the API and its dependencies.

**Expected Result:** The signal set explains user impact and supports dependency analysis.

### Task 2 - Define reliability objectives

Write an availability SLI and a 30-day SLO. State which requests are valid and which errors should count against the objective.

**Expected Result:** The objective is measurable and meaningful to users.

### Task 3 - Create alerts

Write warning and critical alerts with a duration, owner, severity, runbook URL, and escalation path. List fields that must never be logged.

**Expected Result:** Alerts lead to an operator action and do not expose secrets or personal data.

## Challenge

Define a burn-rate alert that detects rapid error-budget consumption while avoiding a page for a single short-lived failure.

## Self-Assessment

- [ ] I can distinguish metrics, logs, and traces.
- [ ] I can define an SLI instead of a raw infrastructure metric.
- [ ] I can create an actionable alert.
- [ ] I can identify sensitive log content.

## Common Mistakes

| Mistake                          | Solution                                          |
| -------------------------------- | ------------------------------------------------- |
| Alerting only on CPU             | Add user-visible latency and error signals.       |
| Logging tokens or request bodies | Log safe identifiers and redact sensitive fields. |
| Omitting owners and runbooks     | Add response metadata to every alert.             |

## Summary

Useful observability connects service behavior to user impact and gives operators enough context to act safely.

## Related Links

- Notebook: [Monitoring and Observability](../../notebooks/en/50-monitoring-and-observability.md)
- Lab: [Instrument and monitor a service](../../labs/en/50-instrument-and-monitor-a-service.md)
- Quiz: [Monitoring and observability quiz](../../quizzes/en/50-monitoring-and-observability-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
