---
chapter: 51
title: "Eine Enterprise-Auslieferungspipeline prüfen"
related_notebook: "Enterprise-CI/CD-Pipelines und Plattform-Governance"
related_exercise: "Eine Enterprise-CI/CD-Pipeline entwerfen"
level: Fortgeschritten
estimated_time: 120 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/51-enterprise-cicd-pipeline.md) | [Übung](../../exercises/de/51-design-an-enterprise-cicd-pipeline.md) | [Roadmap](../../ROADMAP.md)

# Eine Enterprise-Auslieferungspipeline prüfen

## Ziel

Bewerte eine gemeinsame CI/CD-Pipeline hinsichtlich Governance, Zuständigkeit, sicherer Promotion und Auditierbarkeit.

## Ergebnisse

- Lücken bei Berechtigungen, Umgebungskontrollen und Artefakt-Promotion erkennen.
- Plattform-, Produkt-, Sicherheits- und Release-Zuständigkeiten abbilden.
- Einen nachweisbasierten Verbesserungsplan erstellen.

## Voraussetzungen

- Notebook und Übung abgeschlossen.
- Ein repräsentativer Workflow oder eine bereitgestellte Pipeline-Definition.
- Erfahrung mit geschützten Umgebungen, wiederverwendbaren Workflows und Release-Aufzeichnungen.

## Szenario

Eine Organisation hat Pipelines über viele Teams kopiert. Manche bauen für Produktion neu, manche genehmigen erst nach dem Deployment, und kein gemeinsamer Datensatz verbindet Commit und deploytes Image. Prüfe das Design vor einem regulierten Release.

## Umgebung

| Anforderung    | Wert                                                       |
| -------------- | ---------------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                                  |
| Software       | Git-Repository, CI-Plattform, Workflow- und Auditansichten |
| Beteiligte     | Plattform-, Produkt-, Sicherheits- und Release-Rollen      |
| Ergebnis       | Befunde und priorisierter Behebungsplan                    |

## Aufgaben

### Aufgabe 1 - Artefakt verfolgen

Verfolge eine Änderung vom Commit über Prüfung, Artefakterstellung, Scannen, Staging, Freigabe, Produktionspromotion und Rollback. Zeichne jeden Punkt auf, an dem sich das Artefakt ändert.

**Erwartetes Ergebnis:** Die Prüfung zeigt, ob Produktion dasselbe getestete Artefakt erhält.

### Aufgabe 2 - Governance und Zuständigkeit prüfen

Untersuche Berechtigungen, Umgebungsschutz, Versionen wiederverwendbarer Vorlagen, Ausnahmebehandlung und Aufgabentrennung. Weise jede Kontrolle einem verantwortlichen Eigentümer zu.

**Erwartetes Ergebnis:** Befunde enthalten konkrete Nachweise und einen Eigentümer, nicht nur eine allgemeine Empfehlung.

### Aufgabe 3 - Auditdatensatz erstellen

Sammle Commit-SHA, Workflow-Lauf, Image-Digest, Test- und Scan-Ergebnisse, genehmigende Person, Umgebung, Deployment-Zeit und Ergebnis. Erkenne fehlende Aufbewahrungs- oder Zugriffskontrollen.

**Erwartetes Ergebnis:** Ein Prüfer kann ein Deployment und seine Entscheidungshistorie rekonstruieren.

## Validierungscheckliste

- [ ] Artefaktidentität wird über Umgebungen verfolgt.
- [ ] Produktionszugriff und Freigaberegeln sind explizit.
- [ ] Wiederverwendbare Vorlagen und Versionen werden aufgezeichnet.
- [ ] Plattform- und Produktzuständigkeit sind klar getrennt.
- [ ] Auditnachweise unterstützen Rekonstruktion und Rollback.

## Fehlerbehebung

| Problem                              | Mögliche Ursache                                 | Lösung                                                     |
| ------------------------------------ | ------------------------------------------------ | ---------------------------------------------------------- |
| Nachweise sind über Systeme verteilt | Keine gemeinsame Deployment-ID                   | Workflow-Lauf, Digest und Umgebungsrevision korrelieren.   |
| Teams umgehen die Vorlage            | Vorlage ist zu starr oder schlecht betreut       | Sichere Parameter und dokumentierten Ausnahmeweg anbieten. |
| Freigabe hat keine Identität         | Manueller Prozess liegt außerhalb des CI-Systems | Auditierbare Umgebungsfreigaben verlangen.                 |

## Best Practices

- Technische Kontrollen und menschliches Zuständigkeitsmodell gemeinsam prüfen.
- Vorlagen als Produkte mit Tests, Versionen, Support und Ausmusterung behandeln.
- Befunde nach Produktionsauswirkung und Behebungsaufwand priorisieren.

## Zusammenfassung

Eine Enterprise-Pipeline-Prüfung verbindet Artefakt, Kontrollen, Menschen und Nachweise, die für verantwortbare Auslieferung im großen Maßstab nötig sind.

## Weiterführende Links

- Notebook: [Enterprise-CI/CD-Pipelines](../../notebooks/de/51-enterprise-cicd-pipeline.md)
- Übung: [Eine Enterprise-CI/CD-Pipeline entwerfen](../../exercises/de/51-design-an-enterprise-cicd-pipeline.md)
- Quiz: [Quiz zur Enterprise-CI/CD-Pipeline](../../quizzes/de/51-enterprise-cicd-pipeline-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
