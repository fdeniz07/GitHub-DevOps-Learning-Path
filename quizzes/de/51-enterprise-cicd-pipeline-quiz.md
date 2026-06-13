---
chapter: 51
title: "Quiz zur Enterprise-CI/CD-Pipeline"
related_notebook: "Enterprise-CI/CD-Pipelines und Plattform-Governance"
related_exercise: "Eine Enterprise-CI/CD-Pipeline entwerfen"
related_lab: "Eine Enterprise-Auslieferungspipeline prüfen"
level: Fortgeschritten
estimated_time: 25 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/51-enterprise-cicd-pipeline.md) | [Übung](../../exercises/de/51-design-an-enterprise-cicd-pipeline.md) | [Lab](../../labs/de/51-review-an-enterprise-delivery-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Quiz zur Enterprise-CI/CD-Pipeline

## Lernziele

- Gesteuerte Umgebungen, Promotion und Aufgabentrennung erklären.
- Plattformzuständigkeit von Produktteamzuständigkeit unterscheiden.
- Wiederverwendbare Vorlagen und auditierbare Deployment-Nachweise definieren.

## Fragen

### Frage 1

Was bedeutet Promotion nach dem Prinzip „einmal bauen“?

- A. Ein Artefakt in jeder Umgebung neu bauen
- B. Dasselbe unveränderliche Artefakt durch Umgebungen fördern
- C. Staging überspringen
- D. Jedes Team Richtlinien ändern lassen

**Antwort:** B. Das getestete Artefakt bleibt das später deployte Artefakt.

### Frage 2

Warum sind wiederverwendbare Vorlagen wertvoll?

**Erwartete Antwort:** Sie stellen getestete gemeinsame Kontrollen bereit, verringern Workflow-Abweichungen und bieten sichere Parameter für berechtigte Dienstunterschiede.

### Frage 3

Richtig oder falsch: Das Plattformteam sollte Geschäftslogik und SLO jedes Dienstes besitzen.

**Antwort:** Falsch. Das Plattformteam besitzt gemeinsame Auslieferungsfunktionen; Produktteams besitzen Dienstverhalten und betriebliche Ziele.

### Frage 4

Nenne vier Felder eines auditierbaren Deployment-Datensatzes.

**Erwartete Antwort:** Commit-SHA, Workflow-Lauf, Artefakt-Digest, Test- und Scan-Ergebnisse, genehmigende Person, Umgebung, Deployment-Zeit und Ergebnis.

### Frage 5

Wo sollten Produktionsfreigaben erfolgen?

**Erwartete Antwort:** In einer geschützten Umgebung oder an einer anderen expliziten Risikogrenze, mit auditierbarer Identität und erforderlichen Nachweisen.

### Frage 6

Was soll die Aufgabentrennung verringern?

**Antwort:** Die Wahrscheinlichkeit, dass eine Person oder ein Prozess eine riskante Produktionsänderung ohne unabhängige Kontrolle ändern, genehmigen und deployen kann.

## Praktisches Szenario

Ein Team baut sein Image in Produktion neu, ein anderes kopiert eine alte Workflowvorlage und ein drittes hält manuelle Freigaben im Chat fest. Benenne die Governance-Reaktion.

**Erwartete Antwort:** Promotion desselben Digests nach einmaligem Build verlangen, Teams auf eine versionierte wiederverwendbare Vorlage mit sicheren Parametern umstellen und Freigaben in geschützte auditierbare Umgebungen verschieben. Eigentümer, Nachweisaufbewahrung, Ausnahmebehandlung und Rollback definieren.

## Prüfcheckliste

- [ ] Ich kann Promotion nach dem Prinzip „einmal bauen“ erklären.
- [ ] Ich kann Plattform- und Produktverantwortung definieren.
- [ ] Ich kann eine Freigabe an einer Risikogrenze platzieren.
- [ ] Ich kann Deployment-Nachweise aufzählen.
- [ ] Ich verstehe Vorlagenversionierung und Ausnahmen.

## Weiterführende Links

- Notebook: [Enterprise-CI/CD-Pipelines](../../notebooks/de/51-enterprise-cicd-pipeline.md)
- Übung: [Eine Enterprise-CI/CD-Pipeline entwerfen](../../exercises/de/51-design-an-enterprise-cicd-pipeline.md)
- Lab: [Eine Enterprise-Auslieferungspipeline prüfen](../../labs/de/51-review-an-enterprise-delivery-pipeline.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
