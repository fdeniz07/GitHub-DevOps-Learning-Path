---
chapter: 50
title: "Monitoring and Observability: Metrics, Logs, and Traces"
part: "DevOps"
level: Intermediate
estimated_time: 75 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Previous Chapter](49-cloud-deployments.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- Choose useful metrics, structured logs, and distributed traces for a service.
- Define SLIs and SLOs that describe user-visible reliability.
- Create actionable alerts with context, ownership, and escalation paths.

## Introduction

Monitoring reports known signals such as CPU utilization or request count. Observability helps a team explain an unknown system state by combining metrics, logs, traces, and deployment context. Good instrumentation connects technical behavior to the user experience.

## Why This Matters

A service can be up while users experience slow or failed requests. Signals make those failures visible, help operators find the responsible dependency, and provide evidence for release decisions. Without clear objectives, teams either miss incidents or create alert fatigue.

## Key Terms

| Term         | Definition                                              |
| ------------ | ------------------------------------------------------- |
| Metric       | A numeric measurement recorded over time.               |
| Log          | A timestamped event describing something that happened. |
| Trace        | A path of one request through multiple services.        |
| Span         | A timed operation within a trace.                       |
| SLI          | A measured indicator of a service behavior.             |
| SLO          | A target for an SLI over a defined time window.         |
| Error budget | The tolerated unreliability implied by an SLO.          |

## Theory

Metrics are efficient for dashboards and alerts. Counters measure totals such as requests and failures; gauges measure current values; histograms describe distributions such as latency. Prefer rates and percentiles over averages when user experience varies widely.

Structured logs should include a timestamp, severity, service, environment, request or trace ID, event name, and safe context. Never log passwords, access tokens, or personal data without an approved reason. Traces connect spans across service boundaries and help identify where time or errors accumulate.

An SLI is the measurement, such as the proportion of successful requests. An SLO is the target, such as 99.9% successful requests over 30 days. Alerts should fire when a user-impacting condition needs action, not merely whenever a resource changes.

## Practical Examples

### Instrument an HTTP request

```python
from time import perf_counter
import logging

logger = logging.getLogger(__name__)


def handle_request(request, metrics, tracer):
    with tracer.start_as_current_span("checkout.request") as span:
        started = perf_counter()
        try:
            response = process_checkout(request)
            metrics.requests_total.add(1, {"route": "/checkout", "status": str(response.status)})
            return response
        except Exception as error:
            span.record_exception(error)
            logger.exception("checkout_failed", extra={"request_id": request.id})
            metrics.failures_total.add(1, {"route": "/checkout"})
            raise
        finally:
            metrics.request_duration.record(perf_counter() - started, {"route": "/checkout"})
```

The request produces a duration metric, success or failure counters, a trace span, and a structured error event. The `request_id` supports correlation without exposing secrets.

### Define an SLO and alert

```yaml
slo:
  name: checkout-availability
  sli: successful_requests / valid_requests
  target: 99.9%
  window: 30d
alert:
  name: CheckoutHighErrorRate
  condition: error_rate > 1% for 10m
  owner: checkout-oncall
  runbook: docs/runbooks/checkout-high-error-rate.md
```

The SLO expresses a user-facing target. The alert includes a duration, owner, and runbook so it leads to a response rather than a notification nobody can act on.

## Try It Yourself

1. Define three user-facing SLIs for a checkout or API service.
2. Add structured logging with a correlation ID and remove sensitive fields.
3. Draw a trace across an API, database, and external payment provider.
4. Write one warning and one critical alert with owners and runbook links.

## Best Practices

- Instrument the golden signals: latency, traffic, errors, and saturation.
- Use consistent names, labels, trace IDs, and retention policies.
- Alert on symptoms and SLO risk, not every low-level fluctuation.
- Keep dashboards focused on decisions and link alerts to runbooks.
- Review telemetry after releases and remove noisy or unused signals.

## Common Mistakes

| Mistake                        | Why it causes problems                   | How to avoid it                     |
| ------------------------------ | ---------------------------------------- | ----------------------------------- |
| Alerting on CPU alone          | Users can fail while CPU appears normal. | Alert on user-visible SLIs.         |
| Logging raw request bodies     | Secrets or personal data may leak.       | Log safe structured fields only.    |
| Using averages for latency     | Slow outliers disappear in the mean.     | Use percentiles and histograms.     |
| Creating alerts without owners | No one knows who should respond.         | Assign an on-call team and runbook. |

## Summary

- Metrics show trends, logs explain events, and traces connect distributed work.
- SLIs measure user-visible behavior; SLOs make reliability targets explicit.
- Actionable alerts need meaningful thresholds, duration, ownership, and response guidance.

## Related Links

- Previous chapter: [Cloud deployments](49-cloud-deployments.md)
- Exercise: [Define service monitoring signals](../../exercises/en/50-define-service-monitoring-signals.md)
- Lab: [Instrument and monitor a service](../../labs/en/50-instrument-and-monitor-a-service.md)
- Quiz: [Monitoring and observability quiz](../../quizzes/en/50-monitoring-and-observability-quiz.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
