---
chapter: 45
title: "Quiz zu Security Best Practices"
related_notebook: "Security Best Practices für Auslieferungs-Workflows"
related_exercise: "Einen sicheren Auslieferungs-Workflow prüfen"
related_lab: "Eine Prüfung der Sicherheitskontrollen durchführen"
level: Intermediate
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/45-security-best-practices.md) | [Übung](../../exercises/de/45-audit-a-secure-delivery-workflow.md) | [Lab](../../labs/de/45-run-a-security-controls-review.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Security Best Practices

## Lernziele

- Defense in Depth und geringste Rechte anwenden.
- Die Rolle von Pinning, Branch Protection und Umgebungen erkennen.
- Sicherheitsnachweise zur Prüfung der Auslieferungssicherheit verwenden.

## Fragen

### Frage 1

Was bedeutet Defense in Depth?

- A. Ein perfekter Scanner
- B. Mehrere unabhängige Kontrollen
- C. Jede Automatisierung entfernen
- D. Ein gemeinsames Zugangsdaten verwenden

**Antwort:** B.

### Frage 2

Warum sollten Deployment-Berechtigungen jobspezifisch sein?

**Erwartete Antwort:** Ein kompromittierter Testschritt sollte nicht automatisch die Möglichkeit erhalten, zu deployen oder andere nicht verbundene Ressourcen zu verändern.

### Frage 3

Richtig oder falsch: Branch Protection allein schützt Produktions-Deployment-Zugangsdaten.

**Antwort:** Falsch. Produktionsumgebungen und der Secret-Gültigkeitsbereich liefern zusätzliche Deployment-Kontrollen.

### Frage 4

Nenne drei Sicherheitskontrollen, die sich gegenseitig verstärken.

**Erwartete Antwort:** Beispiele sind Berechtigungen nach dem Prinzip der geringsten Rechte, gepinnte Actions, Branch Protection, geschützte Umgebungen, CodeQL, Dependabot und Audit-Logs.

### Frage 5 — Praxisszenario

Ein Workflow hat `write-all`, akzeptiert Code aus Pull Requests und deployt mit einem repositoryweiten Cloud-Token. Was sollte priorisiert werden?

**Erwartete Antwort:** Berechtigungen reduzieren, verhindern, dass nicht vertrauenswürdiger Code Produktions-Secrets erhält, das Token auf eine geschützte Umgebung begrenzen, Branch-Prüfungen und Reviews verlangen und aktuelle Aktivitäten prüfen.

## Checkliste zur Wiederholung

- [ ] Ich kann Defense in Depth erklären.
- [ ] Ich kann geringste Rechte anwenden.
- [ ] Ich verstehe geschützte Umgebungen und Branches.
- [ ] Ich kann nützliche Audit-Nachweise benennen.

## Weiterführende Links

- Notebook: [Security Best Practices für Auslieferungs-Workflows](../../notebooks/de/45-security-best-practices.md)
- Übung: [Einen sicheren Auslieferungs-Workflow prüfen](../../exercises/de/45-audit-a-secure-delivery-workflow.md)
- Lab: [Eine Prüfung der Sicherheitskontrollen durchführen](../../labs/de/45-run-a-security-controls-review.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
