---
chapter: 45
title: "Einen sicheren Auslieferungs-Workflow prüfen"
related_notebook: "Security Best Practices für Auslieferungs-Workflows"
related_lab: "Eine Prüfung der Sicherheitskontrollen durchführen"
related_quiz: "Quiz zu Security Best Practices"
level: Intermediate
estimated_time: 40 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/45-security-best-practices.md) | [Lab](../../labs/de/45-run-a-security-controls-review.md) | [Roadmap](../../ROADMAP.md)

# Einen sicheren Auslieferungs-Workflow prüfen

## Ziel

Prüfe einen CI/CD-Workflow auf Defense in Depth und empfehle praktische Maßnahmen zur Risikoreduzierung.

## Ergebnisse

Du wirst in der Lage sein:

- übermäßige Berechtigungen und ungeschützte Release-Pfade zu erkennen.
- Action-Pinning, Secrets, Branch Protection und Dependency-Kontrollen zu prüfen.
- Nachweise festzuhalten und Behebungen zu priorisieren.

## Voraussetzungen

- Lies [Security Best Practices für Auslieferungs-Workflows](../../notebooks/de/45-security-best-practices.md).
- Verstehe GitHub-Actions-`permissions`, Umgebungen und `concurrency`.
- Kenne den Zweck von CodeQL und Dependabot.

## Szenario

Ein Workflow verwendet `write-all`, deployt direkt von jedem Branch, speichert ein Cloud-Token in einer Repository-Variable und hat keine Concurrency-Regel. Prüfe das Design, bevor es Produktions-Deployments ausführen darf.

## Aufgaben

### Aufgabe 1 — Kontrolllücken finden

Liste jedes Problem auf und ordne es den Prinzipien geringster Rechte, geschützter Umgebungen, Branch Protection, Secret-Verarbeitung, Concurrency oder Dependency-Hygiene zu.

**Erwartetes Ergebnis:** Jeder Fund besitzt ein Sicherheitsprinzip und beobachtbare Nachweise.

### Aufgabe 2 — Die minimalen Änderungen vorschlagen

Schreibe Berechtigungen, Produktionsbedingung, Umgebung und Secret-Referenz um. Füge eine Concurrency-Gruppe für die Produktion hinzu.

**Erwartetes Ergebnis:** Der Deployment-Job hat engere Berechtigungen und einen geschützten Weg in die Produktion.

### Aufgabe 3 — Audit-Nachweise definieren

Wähle Audit-Log-Ereignisse, erforderliche Prüfungen, CodeQL-Ergebnisse, Dependabot-Status und Deployment-Aufzeichnungen, die beweisen, dass die Kontrollen aktiv sind.

**Erwartetes Ergebnis:** Eine andere prüfende Person kann die Änderungen überprüfen, ohne einer mündlichen Behauptung vertrauen zu müssen.

## Herausforderung

Ordne die Findings nach Ausnutzbarkeit und Wirkungsradius. Erkläre, warum ein Problem mit geringer Wahrscheinlichkeit dennoch dringend behandelt werden kann, wenn es Produktionszugangsdaten betrifft.

## Selbstprüfung

- [ ] Ich kann Defense in Depth anwenden.
- [ ] Ich kann einen Berechtigungssatz `write-all` reduzieren.
- [ ] Ich kann ein Secret von einer Variable unterscheiden.
- [ ] Ich kann Nachweise aus Audit-Logs und erforderlichen Prüfungen benennen.

## Häufige Fehler

| Fehler                                            | Lösung                                                      |
| ------------------------------------------------- | ----------------------------------------------------------- |
| Nur den Scanner reparieren                        | Scanning mit Prävention und Zugriffskontrollen kombinieren. |
| Branch Protection als Deployment-Schutz behandeln | Auch die Produktionsumgebung schützen.                      |
| Empfehlungen ohne Nachweise festhalten            | Definieren, wie jede Kontrolle geprüft wird.                |

## Zusammenfassung

Ein Sicherheits-Audit verbindet Workflow-Konfiguration mit echten Kontrollen, Nachweisen und Risikoreduzierung. Defense in Depth macht einen einzelnen Fehler weniger folgenschwer.

## Weiterführende Links

- Notebook: [Security Best Practices für Auslieferungs-Workflows](../../notebooks/de/45-security-best-practices.md)
- Lab: [Eine Prüfung der Sicherheitskontrollen durchführen](../../labs/de/45-run-a-security-controls-review.md)
- Quiz: [Quiz zu Security Best Practices](../../quizzes/de/45-security-best-practices-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
