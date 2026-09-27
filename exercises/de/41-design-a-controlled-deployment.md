---
chapter: 41
title: "Ein kontrolliertes Deployment entwerfen"
related_notebook: "Kontinuierliches Deployment"
related_lab: "Ein kontrolliertes Deployment ausführen"
related_quiz: "Quiz zum kontinuierlichen Deployment"
level: Intermediate
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/41-continuous-deployment.md) | [Lab](../../labs/de/41-run-a-controlled-deployment.md) | [Roadmap](../../ROADMAP.md)

# Ein kontrolliertes Deployment entwerfen

## Ziel

Entwirf Kontrollen für die automatische Produktionsbeförderung, die den Wirkungsradius begrenzen und fehlerhafte Deployments wiederherstellen.

## Ergebnisse

Du wirst in der Lage sein:

- Health-Signale und Rollout-Schwellenwerte zu identifizieren.
- `concurrency` und eine geschützte Umgebung `production` angemessen zu verwenden.
- automatisches Rollback-Verhalten zu beschreiben.

## Voraussetzungen

- Lies [Kontinuierliches Deployment](../../notebooks/de/41-continuous-deployment.md).
- Verstehe Release-Artefakte und Umgebungsschutz.
- Kenne grundlegende HTTP-Health-Checks und Deployment-Begriffe.

## Szenario

Ein Team möchte kontinuierliches Deployment für einen Service mit einer großen Nutzerbasis. Jede erfolgreiche Auslieferung soll einen Canary mit 10 % starten, den Zustand prüfen und den Datenverkehr erst dann weiterleiten, wenn Fehlerrate und Latenz innerhalb der Grenzen bleiben.

## Aufgaben

### Aufgabe 1 — Beförderungsschranken definieren

Wähle Health-Signale, Beobachtungszeit und Stop-Schwellenwerte für den Canary.

**Erwartetes Ergebnis:** Die Beförderungsentscheidung ist messbar statt subjektiv.

### Aufgabe 2 — Konkurrierende Releases verhindern

Füge eine `concurrency`-Gruppe für die Produktion hinzu und erkläre, warum `cancel-in-progress: false` während eines Deployments angemessen sein kann.

**Erwartetes Ergebnis:** Zwei Produktions-Deployments können die Umgebung nicht gleichzeitig verändern.

### Aufgabe 3 — Rollback entwerfen

Beschreibe, was der Workflow tut, wenn die Health-Validierung fehlschlägt. Beziehe das bekannte funktionierende Artefakt und die aufzubewahrenden Audit-Informationen ein.

**Erwartetes Ergebnis:** Ein Fehler stoppt die Beförderung und stellt den Service vorhersehbar wieder her.

## Herausforderung

Vergleiche Canary- und Blue-Green-Deployment für diesen Service. Entscheide dich für eine Variante und begründe die betrieblichen Kosten.

## Selbstprüfung

- [ ] Ich kann Auslieferung und Deployment unterscheiden.
- [ ] Ich habe objektive Health-Schwellenwerte definiert.
- [ ] Ich habe Produktions-Concurrency einbezogen.
- [ ] Ich kann ein automatisches Rollback beschreiben.

## Häufige Fehler

| Fehler                                        | Lösung                                                  |
| --------------------------------------------- | ------------------------------------------------------- |
| Unmittelbar nach dem Upload befördern         | Zuerst einen Canary beobachten.                         |
| Zwei Versionen gleichzeitig deployen          | Eine `concurrency`-Gruppe für die Produktion verwenden. |
| Darauf vertrauen, dass Benutzer Fehler melden | Health Checks und Alarme automatisieren.                |

## Zusammenfassung

Kontinuierliches Deployment ist nur dann sicher, wenn die automatische Beförderung messbare Schranken, begrenzte Auswirkung und einen getesteten Rollback-Pfad besitzt.

## Weiterführende Links

- Notebook: [Kontinuierliches Deployment](../../notebooks/de/41-continuous-deployment.md)
- Lab: [Ein kontrolliertes Deployment ausführen](../../labs/de/41-run-a-controlled-deployment.md)
- Quiz: [Quiz zum kontinuierlichen Deployment](../../quizzes/de/41-continuous-deployment-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
