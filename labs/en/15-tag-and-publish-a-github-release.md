---
chapter: 15
title: "Tag and Publish a GitHub Release"
related_notebook: "GitHub Releases"
related_exercise: "Prepare a GitHub Release"
level: Beginner
estimated_time: 35 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/en/15-github-releases.md) | [Exercise](../../exercises/en/15-prepare-a-github-release.md) | [Quiz](../../quizzes/en/15-github-releases-quiz.md) | [Roadmap](../../ROADMAP.md)

# Tag and Publish a GitHub Release

## Objective

Practice creating an annotated version tag, preparing release notes, and publishing a GitHub Release.

## Requirements

- A GitHub repository where you can push tags and create releases
- A clean working tree
- A validated commit on the intended release branch

## Tasks

### Task 1 - Check the Release Commit

```bash
git status
git switch main
git pull origin main
git log --oneline -5
```

Confirm that the target commit contains the intended changes.

### Task 2 - Create an Annotated Tag

```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git show v1.0.0
git push origin v1.0.0
```

Use a version appropriate for the project’s versioning policy.

### Task 3 - Create the Release

On GitHub, open the repository’s **Releases** page and choose **Draft a new release**. Select the tag, write a title, and add release notes.

### Task 4 - Add or Review Assets

Attach a suitable archive or project artifact if the project distributes one. Generate a checksum when downloads need verification.

### Task 5 - Publish the Release

Review the target tag, notes, release type, and assets. Publish only when the version is ready for its intended audience.

## Expected Outcome

You can create a version tag and publish a release whose notes and assets match the intended source state.

## Troubleshooting

| Problem                            | Resolution                                                                            |
| ---------------------------------- | ------------------------------------------------------------------------------------- |
| Tag already exists                 | Choose a new version; do not silently move a published tag.                           |
| Release points to the wrong commit | Delete the draft release, inspect the tag, and correct the process before publishing. |
| Asset is unclear                   | Name it with the version and platform or format.                                      |
| Users cannot verify a download     | Publish a trusted checksum and explain how to calculate it.                           |

### Related Content

- Notebook: [GitHub Releases](../../notebooks/en/15-github-releases.md)
- Exercise: [Prepare a GitHub Release](../../exercises/en/15-prepare-a-github-release.md)
- Quiz: [GitHub Releases Quiz](../../quizzes/en/15-github-releases-quiz.md)
