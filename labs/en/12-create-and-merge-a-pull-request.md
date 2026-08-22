---
chapter: 12
title: "Create and Merge a Pull Request"
related_notebook: "Pull Requests"
related_exercise: "Review a Pull Request Workflow"
level: Beginner
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/12-pull-requests.md) | [Exercise](../../exercises/en/12-review-a-pull-request-workflow.md) | [Quiz](../../quizzes/en/12-pull-requests-quiz.md) | [Roadmap](../../ROADMAP.md)

# Create and Merge a Pull Request

## Objective

Practice the essential team workflow for creating a feature branch, opening a pull request, resolving review feedback, and merging the result.

## Requirements

- Git installed locally
- A GitHub repository with access to create branches and PRs
- A small feature change to propose

## Tasks

### Task 1 - Create a Feature Branch

```bash
git switch main
git pull origin main
git switch -c feature/add-status-note
```

Create a small but meaningful change for the branch.

### Task 2 - Commit and Push the Change

```bash
echo "Status: in review" >> STATUS.md
git add STATUS.md
git commit -m "Add status note"
git push origin feature/add-status-note
```

### Task 3 - Open the Pull Request

Open the repository on GitHub and choose **Compare & pull request**. Add a clear title and description.

### Task 4 - Review the PR

Read the diff and leave at least one review comment or request a change if needed.

### Task 5 - Merge the PR

After approval or final fix, merge the PR into the target branch using the team’s preferred strategy.

## Expected Outcome

You can explain the sequence of branch creation, review, and merge that forms the standard GitHub collaboration workflow.

## Troubleshooting

| Problem             | Resolution                                                                    |
| ------------------- | ----------------------------------------------------------------------------- |
| PR cannot be opened | Verify that the branch was pushed and the target branch is correct.           |
| Merge is blocked    | Review the branch protection or requested changes before retrying.            |
| Diff is confusing   | Keep changes small and focused; split unrelated edits into separate branches. |

### Related Content

- Notebook: [Pull Requests](../../notebooks/en/12-pull-requests.md)
- Exercise: [Review a Pull Request Workflow](../../exercises/en/12-review-a-pull-request-workflow.md)
- Quiz: [Pull Requests Quiz](../../quizzes/en/12-pull-requests-quiz.md)
