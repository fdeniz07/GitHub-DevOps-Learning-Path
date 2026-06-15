---
chapter: 51
title: "Enterprise CI/CD Pipeline Quiz"
related_notebook: "Enterprise CI/CD Pipelines and Platform Governance"
related_exercise: "Design an Enterprise CI/CD Pipeline"
related_lab: "Review an Enterprise Delivery Pipeline"
level: Advanced
estimated_time: 25 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/en/51-enterprise-cicd-pipeline.md) | [Exercise](../../exercises/en/51-design-an-enterprise-cicd-pipeline.md) | [Lab](../../labs/en/51-review-an-enterprise-delivery-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Enterprise CI/CD Pipeline Quiz

## Learning Objectives

- Explain governed environments, promotion, and separation of duties.
- Distinguish platform ownership from product-team ownership.
- Define reusable templates and auditable deployment evidence.

## Questions

### Question 1

What does build-once promotion mean?

- A. Rebuilding an artifact in every environment
- B. Promoting the same immutable artifact through environments
- C. Skipping staging
- D. Allowing every team to change policy

**Answer:** B. The tested artifact remains the artifact deployed later.

### Question 2

Why are reusable templates valuable?

**Expected Answer:** They provide tested common controls and reduce workflow drift while exposing safe parameters for legitimate service differences.

### Question 3

True or false: The platform team should own every service's business logic and SLO.

**Answer:** False. The platform team owns shared delivery capabilities; product teams own service behavior and operational objectives.

### Question 4

Name four fields in an auditable deployment record.

**Expected Answer:** Commit SHA, workflow run, artifact digest, test and scan results, approver, environment, deployment time, and outcome.

### Question 5

Where should production approvals occur?

**Expected Answer:** At a protected environment or other explicit risk boundary, with an auditable identity and required evidence.

### Question 6

What is separation of duties intended to reduce?

**Answer:** The chance that one person or process can change, approve, and deploy a risky production change without independent control.

## Practical Scenario

One team rebuilds its image in production, another copies an old workflow template, and a third uses manual approvals recorded in chat. Identify the governance response.

**Expected Answer:** Require build-once digest promotion, migrate teams to a versioned reusable template with safe parameters, and move approvals into protected auditable environments. Define owners, evidence retention, exception handling, and rollback.

## Review Checklist

- [ ] I can explain build-once promotion.
- [ ] I can define platform and product responsibilities.
- [ ] I can place an approval at a risk boundary.
- [ ] I can list deployment evidence.
- [ ] I understand template versioning and exceptions.

## Related Links

- Notebook: [Enterprise CI/CD Pipelines](../../notebooks/en/51-enterprise-cicd-pipeline.md)
- Exercise: [Design an enterprise CI/CD pipeline](../../exercises/en/51-design-an-enterprise-cicd-pipeline.md)
- Lab: [Review an enterprise delivery pipeline](../../labs/en/51-review-an-enterprise-delivery-pipeline.md)
- Roadmap: [Course roadmap](../../ROADMAP.md)
