---
chapter: 50
title: "Monitoring and Observability Quiz"
related_notebook: "Monitoring and Observability: Metrics, Logs, and Traces"
related_exercise: "Define Service Monitoring Signals"
related_lab: "Instrument and Monitor a Service"
level: Intermediate
estimated_time: 20 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/50-monitoring-and-observability.md) | [Exercise](../../exercises/en/50-define-service-monitoring-signals.md) | [Lab](../../labs/en/50-instrument-and-monitor-a-service.md) | [Roadmap](../../ROADMAP.md)

# Monitoring and Observability Quiz

## Learning Objectives

- Select useful metrics, logs, and traces.
- Define SLIs, SLOs, and error budgets.
- Create alerts that operators can act on.

## Questions

### Question 1

Which signal is best for understanding one request across services?

- A. A distributed trace
- B. A CPU gauge only
- C. A release tag only
- D. A retention policy

**Answer:** A. A trace connects timed spans across service boundaries.

### Question 2

What is the difference between an SLI and an SLO?

**Expected Answer:** An SLI is a measured indicator, such as successful requests. An SLO is the target for that indicator over a defined time window.

### Question 3

True or false: Average latency always describes user experience well.

**Answer:** False. Percentiles and distributions reveal slow outliers that averages can hide.

### Question 4

Name four golden signals.

**Expected Answer:** Latency, traffic, errors, and saturation.

### Question 5

What should an actionable alert include?

**Expected Answer:** A user-impacting condition, threshold and duration, severity, owner, routing, and a runbook or response path.

### Question 6

Which data should normally be excluded from application logs?

**Answer:** Passwords, access tokens, payment secrets, and unnecessary personal data. Use safe identifiers and redaction.

## Practical Scenario

CPU is normal, but checkout p95 latency and payment-provider span duration rise together. The error rate then exceeds the SLO threshold. Describe the investigation and alert response.

**Expected Answer:** Use the trace to confirm dependency delay, correlate request and structured logs, page the checkout owner using the SLO alert, follow the runbook, and consider rollback or dependency mitigation while preserving evidence.

## Review Checklist

- [ ] I can choose between metrics, logs, and traces.
- [ ] I can define an SLI and SLO.
- [ ] I understand error budgets.
- [ ] I can avoid sensitive logging.
- [ ] I can write an owned alert with a runbook.

## Related Links

- Notebook: [Monitoring and Observability](../../notebooks/en/50-monitoring-and-observability.md)
- Exercise: [Define service monitoring signals](../../exercises/en/50-define-service-monitoring-signals.md)
- Lab: [Instrument and monitor a service](../../labs/en/50-instrument-and-monitor-a-service.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
