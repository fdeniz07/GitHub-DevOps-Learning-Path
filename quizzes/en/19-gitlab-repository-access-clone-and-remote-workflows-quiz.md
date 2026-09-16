---
chapter: 19
title: "GitLab Repository Access, Clone and Remote Workflows Quiz"
related_notebook: "GitLab Repository Access, Clone and Remote Workflows"
related_exercise: "Inspect a GitLab Remote"
related_lab: "Clone, Contribute and Sync a GitLab Project"
level: Beginner
estimated_time: 15 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/en/19-gitlab-repository-access-clone-and-remote-workflows.md) | [Exercise](../../exercises/en/19-inspect-a-gitlab-remote.md) | [Lab](../../labs/en/19-clone-contribute-and-sync-a-gitlab-project.md) | [Roadmap](../../ROADMAP.md)

## GitLab Repository Access, Clone and Remote Workflows Quiz

## Purpose

Check whether you can choose safe GitLab remote operations based on their effect.

## Section A - Multiple Choice

### Question 1

Which command normally shows the fetch and push addresses configured for a clone?

- A. `git remote -v`
- B. `git pull --ff-only`
- C. `git commit`
- D. `git switch`

**Answer:** A

**Explanation:** `git remote -v` displays named remote URLs, including the conventional `origin` created by cloning.

### Question 2

What is the safest first command when you want to learn about remote changes without changing your current files?

- A. `git push`
- B. `git fetch origin`
- C. `git pull`
- D. `git clone`

**Answer:** B

**Explanation:** Fetch downloads remote information and updates remote-tracking references without integrating it into the current branch.

## Section B - True or False

### Question 3

HTTPS and SSH are two transport choices for contacting GitLab, and credentials should never be committed or documented in commands.

**Answer:** True

**Explanation:** Use an approved access method, but keep secrets out of repositories and learning material.

### Question 4

Every GitLab project uses `main` as its default branch and allows forks.

**Answer:** False

**Explanation:** Default branch names and fork availability are configured per project.

## Section C - Short Answer

### Question 5

What is the difference between `fetch` and `pull`?

**Expected Answer:** Fetch obtains remote information without integrating it into the current branch. Pull fetches and then integrates updates into the current branch according to its configuration or options.

### Question 6

Why should you check `origin` before a first push?

**Expected Answer:** It confirms the branch will be published to the intended project or fork instead of an incorrect destination.

## Section D - Practical Scenario

### Scenario

You cloned a project, created `docs/remote-note`, and discover that the project's default branch has new commits. Your project protects the default branch.

### Question

What should you do before proposing the change?

**Expected Answer:** Verify the remotes, fetch the remote state, inspect the default branch changes, update the appropriate base branch deliberately, and push only the feature branch. Open a merge request according to project rules rather than pushing directly to the protected default branch.

## Next Step

Review the [notebook](../../notebooks/en/19-gitlab-repository-access-clone-and-remote-workflows.md), [exercise](../../exercises/en/19-inspect-a-gitlab-remote.md), and [lab](../../labs/en/19-clone-contribute-and-sync-a-gitlab-project.md) before continuing in the [roadmap](../../ROADMAP.md).
