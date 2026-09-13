---
chapter: 18
title: "GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen Quiz"
related_notebook: "GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen"
related_exercise: "GitLab-Projektzugriff planen"
related_lab: "GitLab-Projektzugriff konfigurieren"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md) | [Übung](../../exercises/de/18-gitlab-projektzugriff-planen.md) | [Labor](../../labs/de/18-gitlab-projektzugriff-konfigurieren.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen Quiz

## Zweck

Prüfe, ob du ein einfaches GitLab-Zugriffsmodell nach geringster Berechtigung entwerfen kannst.

## Abschnitt A - Multiple Choice

### Frage 1

Warum ist eine Gruppenmitgliedschaft nützlich?

- A. Sie gibt automatisch Owner-Rechte.
- B. Sie kann gemeinsamen Zugriff auf verwandte Projekte geben.
- C. Sie ersetzt die Sichtbarkeitseinstellung.
- D. Sie deaktiviert Branch-Schutz.

**Antwort:** B

**Erklärung:** Eine Gruppe kann Zugriff auf verwandte Projekte bündeln. Die Rolle muss trotzdem passend gewählt werden.

### Frage 2

Welche Kontrolle verhindert normale direkte Pushes auf `main` am besten?

- A. Eine Regel für geschützte Branches
- B. Eine Projektbeschreibung
- C. Ein Issue-Label
- D. Öffentliche Sichtbarkeit

**Antwort:** A

**Erklärung:** Geschützte Branches begrenzen Push- und Merge-Aktionen nach der konfigurierten Regel.

## Abschnitt B - Richtig oder Falsch

### Frage 3

Ein privates Projekt und die Rolle Developer sind dieselbe Art von Zugriffskontrolle.

- Richtig
- Falsch

**Antwort:** Falsch

**Erklärung:** Sichtbarkeit steuert Auffindbarkeit und Lesbarkeit; Mitgliedschaft und Rollen steuern erlaubte Aktionen.

### Frage 4

Eine Zugriffsprüfung sollte geerbte Gruppenmitgliedschaften und direkte Projektmitgliedschaften berücksichtigen.

- Richtig
- Falsch

**Antwort:** Richtig

**Erklärung:** Zugriff kann über eine übergeordnete Gruppe bestehen bleiben.

## Abschnitt C - Kurzantwort

### Frage 5

Was bedeutet geringste Berechtigung bei einer GitLab-Rollenzuweisung?

**Erwartete Antwort:** Vergib nur die niedrigste Rolle und den engsten Bereich für die dokumentierte Aufgabe. Prüfe oder entferne den Zugriff, wenn der Bedarf endet.

### Frage 6

Wann ist eine Projektmitgliedschaft besser als eine Gruppenmitgliedschaft?

**Erwartete Antwort:** Wenn Zugriff nur für ein Projekt oder als enge Ausnahme nötig ist, nicht dauerhaft für mehrere verwandte Projekte.

## Abschnitt D - Praxisszenario

### Szenario

Morgan benötigt für ein kurzes Audit Lesezugriff auf ein privates Projekt. Die zugehörige Gruppe enthält auch Produktions-Repositories.

### Frage

Welche Zugriffsentscheidung ist am sichersten?

**Erwartete Antwort:** Vergib direkt im geprüften Projekt die niedrigste verfügbare Leserolle, dokumentiere Ablauf oder Prüftermin und vermeide breite Gruppenmitgliedschaft. Der Branch-Schutz bleibt unverändert.

## Bewertung

| Ergebnis  | Einordnung                                                 |
| --------- | ---------------------------------------------------------- |
| 90-100%   | Sehr gut: Du wendest GitLab-Zugriffskontrollen bewusst an. |
| 75-89%    | Gut: Wiederhole Mitgliedschaftsbereich und Branch-Schutz.  |
| Unter 75% | Notebook wiederholen und Labor erneut durchführen.         |

### Verwandte Inhalte

- Notebook: [GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md)
- Übung: [GitLab-Projektzugriff planen](../../exercises/de/18-gitlab-projektzugriff-planen.md)
- Labor: [GitLab-Projektzugriff konfigurieren](../../labs/de/18-gitlab-projektzugriff-konfigurieren.md)
- [Roadmap](../../ROADMAP.md)
