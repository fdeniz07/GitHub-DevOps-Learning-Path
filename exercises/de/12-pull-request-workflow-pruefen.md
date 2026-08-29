---
chapter: 12
title: "Pull-Request-Workflow prüfen"
related_notebook: "Pull Requests"
level: Einsteiger
estimated_time: 20 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/12-pull-requests.md) | [Labor](../../labs/de/12-pull-request-erstellen-und-mergen.md) | [Quiz](../../quizzes/de/12-pull-requests-quiz.md) | [Roadmap](../../ROADMAP.md)

# Pull-Request-Workflow prüfen

## Ziel

Bewerte einen Pull Request anhand von Branches, Diff, Statusprüfungen und Review-Kommentaren und triff eine begründete Merge-Entscheidung.

---

## Lernergebnisse

Nach dieser Übung kannst du:

- Base- und Head-Branch in einem Pull Request korrekt prüfen;
- einen Diff und Statusprüfungen als Grundlage für ein Review verwenden;
- einen konkreten, sachlichen Review-Kommentar formulieren und eine Merge-Entscheidung begründen.

---

## Voraussetzungen

- Das Notebook [Pull Requests](../../notebooks/de/12-pull-requests.md) wurde bearbeitet.
- Du kennst Feature-Branches und Commits.
- Du kannst ein GitHub-Repository im Browser öffnen.

---

## Szenario

Ein Teammitglied hat den Branch `feature/profile-page` erstellt und einen Pull Request nach `main` geöffnet. Der Pull Request enthält eine neue Profilseite. In der Beschreibung steht, dass die Seite lokal getestet wurde. Ein Statuscheck ist erfolgreich, ein weiterer Check wartet noch. Im Diff fällt dir auf, dass eine Fehlermeldung für ungültige Eingaben schwer verständlich ist.

---

## Aufgaben

### Aufgabe 1 - Kontext und Branches prüfen

1. Lies Titel und Beschreibung des Pull Requests.
2. Bestimme den Base-Branch und den Head-Branch.
3. Prüfe, ob die Änderung in den Branch `main` gemergt werden soll.

**Erwartetes Ergebnis:** Du kannst erklären, dass `main` der Base-Branch und `feature/profile-page` der Head-Branch ist. Der Titel und die Beschreibung machen den Zweck der Änderung verständlich.

---

### Aufgabe 2 - Diff und Statusprüfungen bewerten

1. Öffne den Tab mit dem Diff.
2. Prüfe, ob die Änderungen nur zur Profilseite gehören.
3. Prüfe den Zustand aller Statusprüfungen.

**Erwartetes Ergebnis:** Du erkennst, ob der Pull Request fokussiert ist. Du hältst fest, dass ein wartender Check vor dem Merge abgeschlossen werden muss.

---

### Aufgabe 3 - Review und Merge-Entscheidung formulieren

1. Schreibe einen sachlichen Kommentar zur unklaren Fehlermeldung.
2. Fordere bei Bedarf Änderungen an.
3. Begründe, warum der Pull Request noch nicht gemergt werden sollte.

**Erwartetes Ergebnis:** Dein Kommentar nennt die betroffene Stelle und schlägt eine verständliche Fehlermeldung vor. Deine Entscheidung berücksichtigt sowohl die Änderungsanforderung als auch den wartenden Statuscheck.

---

## Zusatzaufgabe (optional)

Schreibe eine kurze Pull-Request-Beschreibung für die Profilseite. Nenne darin Problem, Lösung und durchgeführte Tests.

---

## Selbstkontrolle

- [ ] Ich kann den Base-Branch vom Head-Branch unterscheiden.
- [ ] Ich habe den Diff auf fachfremde Änderungen geprüft.
- [ ] Ich kann erklären, warum ein wartender Check den Merge verhindert.
- [ ] Ich kann einen hilfreichen Review-Kommentar schreiben.

---

## Häufige Fehler

| Fehler                                                                 | Lösung                                                                |
| ---------------------------------------------------------------------- | --------------------------------------------------------------------- |
| Nur den Titel lesen und den Diff überspringen                          | Prüfe immer die tatsächlichen Änderungen im Diff.                     |
| Einen Kommentar ohne konkrete Stelle schreiben                         | Nenne die Datei, die betroffene Änderung und den gewünschten Effekt.  |
| Einen Pull Request trotz wartender oder fehlgeschlagener Checks mergen | Warte auf erfolgreiche erforderliche Checks und kläre deren Ergebnis. |

---

## Zusammenfassung

- Ein Review betrachtet Kontext, Branches, Diff und Statusprüfungen gemeinsam.
- Konkrete Kommentare helfen dem Autor, eine Änderung gezielt zu verbessern.
- Ein Merge ist erst sinnvoll, wenn notwendige Änderungen erledigt und erforderliche Checks erfolgreich sind.

---

## Nächster Schritt

Bearbeite das Labor, um den vollständigen Pull-Request-Ablauf selbst durchzuführen.

### Verwandte Inhalte

- Notebook: [Pull Requests](../../notebooks/de/12-pull-requests.md)
- Labor: [Pull Request erstellen und mergen](../../labs/de/12-pull-request-erstellen-und-mergen.md)
- Quiz: [Pull-Requests-Quiz](../../quizzes/de/12-pull-requests-quiz.md)
