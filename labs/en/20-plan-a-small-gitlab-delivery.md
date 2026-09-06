---
chapter: 20
title: "Plan a Small GitLab Delivery"
related_notebook: "GitLab Work Items, Issues, and Planning"
related_exercise: "Triage GitLab Work Items"
level: Beginner
estimated_time: 45 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md) | [Exercise](../../exercises/en/20-triage-gitlab-work-items.md) | [Quiz](../../quizzes/en/20-gitlab-work-items-issues-and-planning-quiz.md) | [Roadmap](../../ROADMAP.md)

## Plan a Small GitLab Delivery

## Objective

Plan and trace a small documentation improvement from a GitLab work item or issue to a reviewable merge request.

## Scenario

New contributors cannot find the command that runs project checks. Your team wants to add it to the README during the current documentation milestone.

## Prerequisites

- Completed the [notebook](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md) and [exercise](../../exercises/en/20-triage-gitlab-work-items.md).
- Access to a GitLab project where you may create issues, branches, and merge requests.
- Git and a web browser.

## Tasks

### Task 1 - Create a delivery-ready item

1. Create a work item or issue with an outcome-focused title.
2. Describe the missing information, intended audience, and non-goal.
3. Add acceptance criteria, labels, an assignee, and the current milestone.

**Expected Result:** The item can be accepted or rejected using its criteria and is visible in the team's planning view where available.

### Task 2 - Connect implementation

1. Create a focused branch, such as `123-document-check-command`.
2. Make and locally review the smallest complete README change.
3. Push the branch and open a merge request to the correct target branch.

**Expected Result:** The branch and merge request clearly identify the work item they implement.

### Task 3 - Complete the review record

1. Link the merge request to the work item and use the project's supported closing reference if appropriate.
2. State what changed and how you checked it.
3. Review comments, pipeline status, and acceptance criteria before merging.

**Expected Result:** The delivery record connects planned work, implementation, verification, and closure.

## Validation Checklist

- [ ] The title describes an outcome.
- [ ] Acceptance criteria are observable.
- [ ] Labels and milestone match the shared taxonomy.
- [ ] The branch and merge request link to the item.
- [ ] Review and required checks are complete before merge.

## Troubleshooting

| Problem                            | Possible Cause                                          | Solution                                                                                    |
| ---------------------------------- | ------------------------------------------------------- | ------------------------------------------------------------------------------------------- |
| No planning board is visible       | The project edition or permissions do not provide it.   | Use labels and milestones, then confirm available planning features with the project owner. |
| The item did not close after merge | The reference or target-branch rule was not recognized. | Check the project documentation and close it manually only after criteria are met.          |

## Related Content

- Notebook: [GitLab Work Items, Issues, and Planning](../../notebooks/en/20-gitlab-work-items-issues-and-planning.md)
- Exercise: [Triage GitLab Work Items](../../exercises/en/20-triage-gitlab-work-items.md)
- Quiz: [GitLab Work Items, Issues, and Planning Quiz](../../quizzes/en/20-gitlab-work-items-issues-and-planning-quiz.md)
