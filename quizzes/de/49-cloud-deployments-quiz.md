---
chapter: 49
title: "Quiz zu Cloud-Deployments"
related_notebook: "Cloud-Deployment-Modelle, Konfiguration und Rollback"
related_exercise: "Ein Cloud-Deployment planen"
related_lab: "Eine Anwendung in die Cloud deployen"
level: Fortgeschritten
estimated_time: 20 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/49-cloud-deployments.md) | [Übung](../../exercises/de/49-plan-a-cloud-deployment.md) | [Lab](../../labs/de/49-deploy-an-application-to-the-cloud.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Cloud-Deployments

## Lernziele

- Cloud-Deployment-Modelle vergleichen.
- Konfiguration und Geheimnisse auslagern.
- Healthchecks, Promotions-Gates und Rollback verwenden.

## Fragen

### Frage 1

Wofür ist ein Readiness-Check da?

- A. Entscheiden, ob eine Instanz Traffic erhält
- B. Ein Datenbankpasswort speichern
- C. Ein Image bauen
- D. Alte Revisionen löschen

**Antwort:** A. Readiness zeigt an, dass die Instanz sicher Traffic erhalten kann.

### Frage 2

Wie unterscheidet sich Liveness von Readiness?

**Erwartete Antwort:** Liveness zeigt, ob ein Prozess neu gestartet werden muss; Readiness steuert den Traffic. Sie beantworten unterschiedliche Betriebsfragen.

### Frage 3

Richtig oder falsch: Dasselbe Image sollte für Staging und Produktion normalerweise separat neu gebaut werden.

**Antwort:** Falsch. Fördere dasselbe getestete unveränderliche Image und ändere nur die externe Konfiguration nach Bedarf.

### Frage 4

Wo sollte ein Produktionsdatenbankpasswort gespeichert werden?

**Erwartete Antwort:** In einem verwalteten Secret Store oder geschützten Secret-Mechanismus, zur Laufzeit mit geringsten Rechten referenziert.

### Frage 5

Nenne drei nützliche Rollback-Auslöser.

**Erwartete Antwort:** Fehlgeschlagene Readiness, anhaltender Anstieg der Fehlerrate, SLO-Verletzung, unzulässige Latenz oder fehlgeschlagener Abhängigkeitscheck.

### Frage 6

Warum sollte ein Rollout ein Beobachtungsfenster enthalten?

**Antwort:** Einige Fehler erscheinen erst unter echtem Traffic. Das Beobachten ermöglicht den Vergleich von Health- und Benutzersignalen vor der vollständigen Promotion.

## Praktisches Szenario

Eine neue Revision startet erfolgreich, liefert aber nach Erhalt von Produktions-Traffic 20 % Fehler. Was sollte das Team tun?

**Erwartete Antwort:** Die Promotion nach dem Gate stoppen oder umkehren, Nachweise bewahren, Traffic auf die vorherige bekannte gute Revision verschieben, Health prüfen und mit Logs, Metriken und Traces untersuchen. Kein nicht nachvollziehbares Notfallartefakt neu bauen.

## Prüfcheckliste

- [ ] Ich kann VM-, verwaltete Container- und Orchestrator-Modelle vergleichen.
- [ ] Ich kann Geheimnisse von Konfiguration trennen.
- [ ] Ich kann Readiness und Liveness erklären.
- [ ] Ich kann Rollback-Auslöser definieren.
- [ ] Ich kann Promotionsnachweise beschreiben.

## Weiterführende Links

- Notebook: [Cloud-Deployment-Modelle](../../notebooks/de/49-cloud-deployments.md)
- Übung: [Ein Cloud-Deployment planen](../../exercises/de/49-plan-a-cloud-deployment.md)
- Lab: [Eine Anwendung in die Cloud deployen](../../labs/de/49-deploy-an-application-to-the-cloud.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
