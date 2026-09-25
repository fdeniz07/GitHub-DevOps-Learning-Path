---
chapter: 30
title: "YAML Fundamentals for GitHub Actions"
part: "GitHub Actions"
level: Beginner
estimated_time: 90 min
language: EN
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Previous Chapter](27-gitlab-devsecops-security-scans-and-compliance.md) | [Exercise](../../exercises/en/30-practice-github-actions-yaml.md) | [Lab](../../labs/en/30-build-a-valid-actions-workflow.md) | [Quiz](../../quizzes/en/30-yaml-fundamentals-quiz.md) | [Roadmap](../../ROADMAP.md)

## Learning Objectives

By the end of this chapter, you will be able to:

- distinguish YAML maps, lists, scalars, and comments;
- use indentation to express nested GitHub Actions configuration;
- recognize common YAML mistakes before they reach a workflow run;
- read basic GitHub Actions expressions and keep them separate from YAML structure.

## Introduction

YAML is a human-readable data-serialization format. GitHub Actions uses YAML to describe workflows, so whitespace and punctuation are part of the configuration's meaning. A file can look visually plausible and still parse into a different structure than intended.

## Key Terms

| Term        | Meaning                                             |
| ----------- | --------------------------------------------------- |
| Map         | Key-value pairs written as `key: value`.            |
| List        | An ordered collection whose entries begin with `-`. |
| Scalar      | One value, such as a string, number, or boolean.    |
| Indentation | Leading spaces that express parent-child structure. |
| Expression  | An Actions value written with `${{ ... }}`.         |

## Theory

### Maps and Lists

Maps describe named properties:

```yaml
job:
  runs-on: ubuntu-latest
  timeout-minutes: 10
```

Lists describe ordered entries:

```yaml
steps:
  - name: Checkout
    uses: actions/checkout@v4
  - name: Test
    run: ./scripts/test.sh
```

The two steps are list items. Each item contains its own map of properties. The indentation shows that `name`, `uses`, and `run` belong to the item rather than to the document root.

### Indentation

Use spaces consistently. YAML does not use braces to show nesting, and tabs are not valid indentation in standard YAML. In the following example, `branches` belongs to `push`:

```yaml
on:
  push:
    branches:
      - main
```

Changing the indentation can move `branches` to a different parent or produce a parser error.

### Scalars, Quotes, and Comments

Strings may be plain or quoted. Quote values when punctuation or YAML keywords could make the intended type unclear. A `#` begins a comment when it is not inside a quoted string:

```yaml
name: "Build #1"
timeout-minutes: 10
# This comment explains the validation boundary.
```

Do not hide required workflow configuration in comments. Comments help a reviewer; they do not configure Actions.

### Expressions

GitHub Actions expressions are embedded in YAML values:

```yaml
if: ${{ github.ref == 'refs/heads/main' }}
```

The map key is `if`; the expression is its scalar value. Expressions can read contexts and functions, but they do not replace YAML indentation. Keep shell interpolation and Actions expressions distinct when writing `run` commands.

## Practical Example

This valid workflow combines maps, lists, a comment, and an expression:

```yaml
name: YAML practice
on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: read

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout source
        uses: actions/checkout@v4
      - name: Run validation on the default branch
        if: ${{ github.ref == 'refs/heads/main' }}
        run: echo "Validation branch is main"
```

The workflow map contains a list-like `on` configuration and a `jobs` map. The `steps` list contains two maps. The second step is skipped when the ref is not `main`; the workflow itself can still start for other configured events.

## Try It Yourself

1. Convert the inline `branches: [main]` list to a block list.
2. Add a second branch without changing the parent indentation.
3. Add a step with both `uses` and `run`, then explain why a step should normally choose one execution mechanism.
4. Mark every indentation level with two spaces and compare the resulting hierarchy.

## Best Practices

- Use two spaces per level and never tabs for indentation.
- Keep maps and lists visually aligned so reviewers can see ownership.
- Quote ambiguous strings and keep comments short and useful.
- Validate YAML structure before investigating an Actions runtime failure.

## Common Mistakes

| Mistake                                                   | Why it causes problems                              | How to avoid it                                       |
| --------------------------------------------------------- | --------------------------------------------------- | ----------------------------------------------------- |
| Using tabs for indentation                                | YAML parsers may reject the file.                   | Configure the editor to insert spaces.                |
| Misaligning a list item                                   | A step or trigger becomes a child of the wrong key. | Compare every `-` with its parent key.                |
| Writing `if: github.ref == ...` without expression syntax | The value may not be evaluated as intended.         | Use the documented `${{ ... }}` form for expressions. |
| Treating `#` as data outside quotes                       | The remaining text becomes a comment.               | Quote values that contain a literal `#`.              |
| Mixing inline and block styles carelessly                 | The resulting structure becomes hard to review.     | Choose the clearest style for each small collection.  |

## Summary

YAML represents Actions configuration through indentation-based maps and lists. Expressions are values inside that structure. Consistent spaces, clear nesting, and deliberate quoting prevent many workflow failures before a run starts.

### Related Content

- Exercise: [Practice GitHub Actions YAML](../../exercises/en/30-practice-github-actions-yaml.md)
- Lab: [Build a Valid Actions Workflow](../../labs/en/30-build-a-valid-actions-workflow.md)
- Quiz: [YAML Fundamentals Quiz](../../quizzes/en/30-yaml-fundamentals-quiz.md)
