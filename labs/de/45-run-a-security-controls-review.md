---
chapter: 45
title: "Eine Prüfung der Sicherheitskontrollen durchführen"
related_notebook: "Security Best Practices für Auslieferungs-Workflows"
related_exercise: "Einen sicheren Auslieferungs-Workflow prüfen"
related_quiz: "Quiz zu Security Best Practices"
level: Intermediate
estimated_time: 90 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/45-security-best-practices.md) | [Übung](../../exercises/de/45-audit-a-secure-delivery-workflow.md) | [Roadmap](../../ROADMAP.md)

# Eine Prüfung der Sicherheitskontrollen durchführen

## Ziel

Führe eine Defense-in-Depth-Prüfung der Repository-, Workflow-, Dependency- und Produktionskontrollen durch.

## Ergebnisse

Du wirst in der Lage sein:

- geringste Rechte und geschützte Deployment-Pfade zu prüfen.
- CodeQL, Dependabot, Branch Protection und Audit-Nachweise zu prüfen.
- priorisierte Maßnahmen zur Behebung zu erstellen.

## Voraussetzungen

- Schließe Notebook und Übung ab.
- Administrations- oder Lesezugriff auf die relevanten Einstellungen des Repositories.
- Einen zu prüfenden Workflow und ein Dependency-Manifest.

## Szenario

Vor einem Produktionsstart bittet ein Team um eine unabhängige Prüfung der Kontrollen. Du untersuchst Workflow, Repository-Einstellungen, Abhängigkeiten, Secrets und Audit-Ereignisse und meldest Lücken nach Priorität.

## Umgebung

| Anforderung    | Wert                                                                     |
| -------------- | ------------------------------------------------------------------------ |
| Betriebssystem | Windows, Linux oder macOS                                                |
| Software       | GitHub-Repository, Git, Dependency-Tools                                 |
| Zugriff        | Actions, Umgebungen, Branch Protection, Sicherheits- und Audit-Ansichten |

## Aufgaben

### Aufgabe 1 — Workflow-Berechtigungen prüfen

Untersuche `permissions` auf Workflow- und Job-Ebene, Action-Referenzen, nicht vertrauenswürdige Eingaben, `environment` und `concurrency`. Halte übermäßigen Zugriff und Supply-Chain-Bedenken fest.

**Erwartetes Ergebnis:** Workflow-Risiken besitzen konkrete Nachweise aus Datei oder Einstellung.

### Aufgabe 2 — Repository-Kontrollen prüfen

Prüfe geschützte Branches, erforderliche Reviews, erforderliche Statusprüfungen, geschützte Umgebungen, Secret-Gültigkeitsbereich, CodeQL-Status und Dependabot-Konfiguration.

**Erwartetes Ergebnis:** Präventive und detektive Kontrollen werden gemeinsam geprüft.

### Aufgabe 3 — Den Bericht erstellen

Nutze Audit-Log und Deployment-Historie, um kürzliche Änderungen zu bestätigen. Ordne Findings nach Auswirkung, Wahrscheinlichkeit und Behebungsaufwand. Weise Verantwortliche und Fälligkeiten zu.

**Erwartetes Ergebnis:** Der Bericht unterstützt einen praktischen Behebungsplan.

## Validierungs-Checkliste

- [ ] Workflow-Berechtigungen wurden geprüft.
- [ ] Referenzen auf Drittanbieter-Actions wurden geprüft.
- [ ] Secrets und Umgebungsschutz wurden geprüft.
- [ ] Branch Protection und erforderliche Prüfungen wurden verifiziert.
- [ ] CodeQL- und Dependabot-Nachweise wurden geprüft.
- [ ] Findings haben Verantwortliche und Prioritäten.

## Fehlerbehebung

| Problem                                            | Mögliche Ursache                  | Lösung                                            |
| -------------------------------------------------- | --------------------------------- | ------------------------------------------------- |
| Einstellung ist nicht verfügbar                    | Unzureichender Repository-Zugriff | Schreibgeschützten Audit-Zugriff anfordern.       |
| Eine Kontrolle ist dokumentiert, aber inaktiv      | Konfigurationsabweichung          | Die aktive Repository-Einstellung prüfen.         |
| Viele wenig wertvolle Findings verdecken dringende | Keine Risikoeinstufung            | Nach Wirkungsradius und Ausnutzbarkeit sortieren. |

## Best Practices

- Bewahre bei jedem Fund Links und Zeitstempel zu Nachweisen auf.
- Prüfe Kontrollen nach Workflow-Änderungen erneut.
- Behandle Sicherheitsreviews als wiederkehrende Aktivität und nicht als einmaliges Launch-Ritual.

## Zusammenfassung

Ein Review der sicheren Auslieferung prüft, ob Kontrollen aktiv und geschichtet sind und durch Nachweise gestützt werden. Es verwandelt Prinzipien in verantwortbare Arbeit.

## Weiterführende Links

- Notebook: [Security Best Practices für Auslieferungs-Workflows](../../notebooks/de/45-security-best-practices.md)
- Übung: [Einen sicheren Auslieferungs-Workflow prüfen](../../exercises/de/45-audit-a-secure-delivery-workflow.md)
- Quiz: [Quiz zu Security Best Practices](../../quizzes/de/45-security-best-practices-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
