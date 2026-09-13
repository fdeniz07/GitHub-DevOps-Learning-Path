---
chapter: 17
title: "GitLab-Grundlagen-Quiz"
related_notebook: "GitLab-Grundlagen"
related_exercise: "GitLab-Projektgrundlagen erkunden"
related_lab: "GitLab-Änderung erstellen und prüfen"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Navigation:** [Notebook](../../notebooks/de/17-gitlab-grundlagen.md) | [Übung](../../exercises/de/17-gitlab-projektgrundlagen-erkunden.md) | [Labor](../../labs/de/17-gitlab-aenderung-erstellen-und-pruefen.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Grundlagen-Quiz

## Zweck

Dieses Quiz prüft die wichtigsten GitLab-Objekte, Zugriffsentscheidungen und den grundlegenden Änderungsablauf.

## Hinweise

- Antworte aus Verständnis, nicht nur aus Erinnerung.
- Verwende die Begriffe Namespace, Gruppe, Projekt und Rolle präzise.

## Lernziele

- Gruppen und Projekte unterscheiden;
- Sichtbarkeit, Rollen und geringste Berechtigung erklären;
- Issues, Merge Requests und Pipelines in einem Ablauf einordnen.

## Abschnitt A - Multiple Choice

### Frage 1

Wozu dient eine GitLab-Gruppe hauptsächlich?

- A. Sie ersetzt jedes Repository.
- B. Sie organisiert verwandte Projekte und kann gemeinsame Mitgliedschaften verwalten.
- C. Sie merged Branches automatisch.
- D. Sie ist eine lokale Git-Datei.

**Antwort:** B

**Erklärung:** Eine Gruppe bündelt Projekte und kann Zugriff für ein Team zentral organisieren.

### Frage 2

Was beschreibt einen Merge Request am genauesten?

- A. Einen Vorschlag, einen Source-Branch in einen Target-Branch zu übernehmen.
- B. Einen Ersatz für einen Commit.
- C. Eine Liste aller Projektmitglieder.
- D. Einen Befehl zum Löschen eines Branches.

**Antwort:** A

**Erklärung:** Ein Merge Request verbindet Diff, Beschreibung, Review, Freigaben und Pipeline-Status einer vorgeschlagenen Änderung.

## Abschnitt B - Richtig oder falsch

### Frage 3

Projektsichtbarkeit und Rolle eines Mitglieds sind dieselbe Einstellung.

**Antwort:** Falsch

**Erklärung:** Sichtbarkeit regelt Auffindbarkeit und Lesbarkeit. Die Rolle regelt Aktionen eines berechtigten Mitglieds.

### Frage 4

Ein neuer Commit auf dem Source-Branch kann einen offenen Merge Request und dessen Pipeline aktualisieren.

**Antwort:** Richtig

**Erklärung:** Der Merge Request bleibt mit seinem Source-Branch verbunden.

## Abschnitt C - Kurzantworten

### Frage 5

Warum ist die geringste Berechtigung beim Einladen von Mitgliedern wichtig?

**Erwartete Antwort:** Sie begrenzt Aktionen auf das für die Aufgabe Nötige und verringert das Risiko durch Fehler oder kompromittierte Konten.

### Frage 6

Worin unterscheiden sich Issue und Merge Request?

**Erwartete Antwort:** Ein Issue erklärt Arbeit und gewünschtes Ergebnis. Ein Merge Request stellt die Umsetzung für Review, Prüfungen und Merge-Entscheidung bereit.

## Abschnitt D - Praxisszenario

### Szenario

Eine README-Änderung liegt auf `docs/setup-befehl`. Die Pipeline schlägt fehl und ein Reviewer möchte eine klarere Erklärung.

### Frage

Was ist vor dem Merge zu tun?

**Erwartete Antwort:** Lies den Job-Log, verbessere die README auf demselben Branch, teste, committe und pushe. Warte anschließend auf erfolgreiche erforderliche Prüfungen und die Freigabe.

## Bewertungsleitfaden

| Ergebnis   | Einschätzung                                             |
| ---------- | -------------------------------------------------------- |
| 90-100 %   | Sehr gut: Du kannst den GitLab-Workflow sicher erklären. |
| 75-89 %    | Gut: Wiederhole unklare Begriffe.                        |
| 60-74 %    | Ausreichend: Bearbeite Notebook und Übung erneut.        |
| Unter 60 % | Wiederhole Notebook und Labor vor dem nächsten Kapitel.  |

## Selbstkontrolle

- [ ] Ich kann Namespace, Gruppe, Projekt und Repository unterscheiden.
- [ ] Ich verstehe Rollen, Sichtbarkeit und geringste Berechtigung.
- [ ] Ich kann Issue, Merge Request und Pipeline verbinden.

## Nächster Schritt

Kapitel 18 vertieft Gruppen, Projekte, Mitglieder und Berechtigungen.

### Verwandte Inhalte

- Notebook: [GitLab-Grundlagen](../../notebooks/de/17-gitlab-grundlagen.md)
- Übung: [GitLab-Projektgrundlagen erkunden](../../exercises/de/17-gitlab-projektgrundlagen-erkunden.md)
- Labor: [GitLab-Änderung erstellen und prüfen](../../labs/de/17-gitlab-aenderung-erstellen-und-pruefen.md)
