---
chapter: 50
title: "Instrument and Monitor a Service"
related_notebook: "Monitoring and Observability: Metrics, Logs, and Traces"
related_exercise: "Define Service Monitoring Signals"
level: Intermediate
estimated_time: 110 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/50-monitoring-and-observability.md) | [Exercise](../../exercises/en/50-define-service-monitoring-signals.md) | [Roadmap](../../ROADMAP.md)

# Instrument and Monitor a Service

## Objective

Add useful metrics, structured logs, traces, SLOs, and actionable alerts to a small service.

## Outcomes

- Correlate one request across logs and trace spans.
- Build a dashboard for traffic, errors, latency, and saturation.
- Test an alert and connect it to a runbook.

## Prerequisites

- Completed the notebook and exercise.
- A service with an HTTP endpoint and a telemetry backend or local collector.
- Permission to create dashboards and alerts in a test environment.

## Scenario

The on-call team receives vague CPU alerts during payment incidents. Replace them with signals that show user impact and identify a slow dependency.

## Environment

| Requirement      | Value                                                                 |
| ---------------- | --------------------------------------------------------------------- |
| Operating System | Windows, Linux, or macOS                                              |
| Software         | Service runtime, OpenTelemetry-compatible collector, dashboard system |
| Signals          | Metrics, structured logs, traces                                      |
| Objective        | 99.9% successful valid requests over 30 days                          |

## Tasks

### Task 1 - Instrument a request

Add a request counter, duration histogram, error counter, structured event, and trace span. Include service, route, status, and correlation ID; exclude secrets and raw credentials.

**Expected Result:** One request can be followed from metric to log to trace.

### Task 2 - Build the dashboard

Create panels for request rate, error rate, p50 and p95 latency, saturation, dependency latency, and recent deployments.

**Expected Result:** The dashboard supports a decision during a customer-facing incident.

### Task 3 - Test alerting

Define an error-rate alert with owner and runbook, trigger it in a safe test window, acknowledge it, and record the response.

**Expected Result:** The alert is actionable, routed to the correct team, and linked to response guidance.

## Validation Checklist

- [ ] Metrics use stable names and bounded labels.
- [ ] Logs are structured and free of secrets.
- [ ] Traces include dependency spans and correlation.
- [ ] SLO and alert thresholds are documented.
- [ ] The alert test and response are recorded.

## Troubleshooting

| Problem                   | Possible Cause                       | Solution                                   |
| ------------------------- | ------------------------------------ | ------------------------------------------ |
| High-cardinality metrics  | User IDs or URLs used as labels      | Use bounded route and status labels.       |
| Missing trace correlation | Propagation is not configured        | Enable context propagation across calls.   |
| Alert does not page       | Wrong notification route or duration | Test routing and inspect alert evaluation. |

## Best Practices

- Keep telemetry useful, bounded, privacy-aware, and tied to service objectives.
- Link every page to an owner and runbook.
- Review signal quality after releases and remove noisy alerts.

## Summary

Instrumentation becomes operational value when signals are correlated, dashboards support decisions, and alerts result in a practiced response.

## Related Links

- Notebook: [Monitoring and Observability](../../notebooks/en/50-monitoring-and-observability.md)
- Exercise: [Define service monitoring signals](../../exercises/en/50-define-service-monitoring-signals.md)
- Quiz: [Monitoring and observability quiz](../../quizzes/en/50-monitoring-and-observability-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
