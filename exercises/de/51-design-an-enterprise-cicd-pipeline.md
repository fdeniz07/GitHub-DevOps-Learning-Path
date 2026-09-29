---
chapter: 51
title: "Eine Enterprise-CI/CD-Pipeline entwerfen"
related_notebook: "Enterprise-CI/CD-Pipelines und Plattform-Governance"
level: Fortgeschritten
estimated_time: 50 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/51-enterprise-cicd-pipeline.md) | [Lab](../../labs/de/51-review-an-enterprise-delivery-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Eine Enterprise-CI/CD-Pipeline entwerfen

## Ziel

Entwirf einen gesteuerten Auslieferungsweg, der Teamautonomie bewahrt und gleichzeitig Sicherheits-, Qualitäts- und Auditkontrollen erzwingt.

## Ergebnisse

- Umgebungen, Freigaben und Promotions-Gates an sinnvollen Risikogrenzen platzieren.
- Plattform- und Produktteam-Zuständigkeiten definieren.
- Einen auditierbaren Deployment-Datensatz und eine wiederverwendbare Vorlagenschnittstelle spezifizieren.

## Voraussetzungen

- Lies [Enterprise-CI/CD-Pipelines](../../notebooks/de/51-enterprise-cicd-pipeline.md).
- Verstehe geschützte Umgebungen, Artefakt-Promotion und wiederverwendbare CI-Workflows.
- Kannst betriebliche Zuständigkeit und Eskalation beschreiben.

## Szenario

Eine Organisation hat 40 Dienste mit kopierten Workflows. Produktions-Releases sind schwer zu auditieren, und jedes Team hat einen anderen Freigabeprozess. Schlage einen Standardweg mit sicheren dienstspezifischen Parametern vor.

## Aufgaben

### Aufgabe 1 - Auslieferungsfluss modellieren

Zeichne Pull-Request-Prüfung, Artefakterstellung, Scan und Signierung, Staging-Deployment, Verifikation, Produktionsfreigabe, Promotion und Rollback.

**Erwartetes Ergebnis:** Die Pipeline baut einmal und fördert denselben Digest durch die Umgebungen.

### Aufgabe 2 - Zuständigkeit definieren

Weise Plattform-, Produkt-, Sicherheits- und Release-Rollen Verantwortlichkeiten zu. Berücksichtige Eigentümer von Vorlage, Dienst-SLO, Richtlinienausnahme und Vorfallreaktion.

**Erwartetes Ergebnis:** Kein kritischer Schritt hängt von einem unbenannten Team ab.

### Aufgabe 3 - Auditnachweise definieren

Liste Commit, Workflow-Lauf, Artefakt-Digest, Test- und Scan-Ergebnisse, genehmigende Person, Umgebung, Deployment-Zeit und Ergebnis auf.

**Erwartetes Ergebnis:** Ein Auditor kann ein Produktionsdeployment aus aufbewahrten Nachweisen rekonstruieren.

## Herausforderung

Entwirf eine Richtlinie für Vorlagenversionierung und -ausmusterung, die sichere Upgrades erlaubt, ohne dass alte Vorlagen neue Sicherheitskontrollen umgehen.

## Selbsteinschätzung

- [ ] Ich kann Plattform- und Dienstzuständigkeit unterscheiden.
- [ ] Ich kann Promotion nach dem Prinzip „einmal bauen“ entwerfen.
- [ ] Ich kann Freigaben an Risikogrenzen platzieren.
- [ ] Ich kann nützliche Auditnachweise definieren.

## Häufige Fehler

| Fehler                                 | Lösung                                                         |
| -------------------------------------- | -------------------------------------------------------------- |
| Pro Umgebung neu bauen                 | Ein einzelnes unveränderliches Artefakt fördern.               |
| Jede Dienstentscheidung zentralisieren | Dienstverhalten und SLO-Zuständigkeit bei Produktteams lassen. |
| Workflowdefinitionen kopieren          | Versionierte, wiederverwendbare Vorlagen verwenden.            |

## Zusammenfassung

Enterprise-Auslieferung funktioniert, wenn gemeinsame Kontrollen wiederverwendbar, Verantwortlichkeiten sichtbar und Nachweise vom Commit bis zur Produktion verknüpft sind.

## Weiterführende Links

- Notebook: [Enterprise-CI/CD-Pipelines](../../notebooks/de/51-enterprise-cicd-pipeline.md)
- Lab: [Eine Enterprise-Auslieferungspipeline prüfen](../../labs/de/51-review-an-enterprise-delivery-pipeline.md)
- Quiz: [Quiz zur Enterprise-CI/CD-Pipeline](../../quizzes/de/51-enterprise-cicd-pipeline-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
