---
chapter: 12
title: "Pull Request erstellen und mergen"
related_notebook: "Pull Requests"
related_exercise: "Pull-Request-Workflow prüfen"
level: Einsteiger
estimated_time: 35 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/12-pull-requests.md) | [Übung](../../exercises/de/12-pull-request-workflow-pruefen.md) | [Quiz](../../quizzes/de/12-pull-requests-quiz.md) | [Roadmap](../../ROADMAP.md)

# Pull Request erstellen und mergen

## Ziel

Erstelle für eine kleine Änderung einen Pull Request und führe ihn nach Review und erfolgreichen Prüfungen kontrolliert zusammen.

---

## Lernergebnisse

Nach diesem Labor kannst du:

- einen Feature-Branch erstellen, committen und nach GitHub pushen;
- einen Pull Request mit passendem Base-Branch und verständlicher Beschreibung öffnen;
- einen Pull Request nach Review, erfolgreichen Checks und einer bewussten Merge-Entscheidung integrieren.

---

## Szenario

Dein Team möchte auf der Projektstartseite einen kurzen Hinweis zur Kontaktmöglichkeit ergänzen. Die Änderung soll nicht direkt auf `main` erfolgen. Du setzt sie auf einem Feature-Branch um, lässt sie per Pull Request prüfen und mergst erst nach der Freigabe.

---

## Voraussetzungen

- Das Notebook [Pull Requests](../../notebooks/de/12-pull-requests.md) und die zugehörige [Übung](../../exercises/de/12-pull-request-workflow-pruefen.md) wurden bearbeitet.
- Du hast Zugriff auf ein eigenes GitHub-Repository oder ein freigegebenes Übungsrepository.
- Git ist installiert und dein lokales Repository hat ein Remote namens `origin`.

---

## Umgebung

| Anforderung    | Wert                                              |
| -------------- | ------------------------------------------------- |
| Betriebssystem | Windows, Linux oder macOS                         |
| Software       | Git und ein aktueller Webbrowser                  |
| GitHub-Zugang  | Konto mit Schreibrechten für das Übungsrepository |

---

## Aufgaben

### Aufgabe 1 - Feature-Branch und Änderung erstellen

**Ziel**

Erstelle einen isolierten Branch für die Kontaktinformation.

**Schritte**

1. Aktualisiere deinen lokalen Stand und erstelle den Branch `feature/contact-hint`.
2. Ergänze in einer passenden Datei einen kurzen Kontakt-Hinweis.
3. Prüfe die Änderung mit `git diff`, stage sie und erstelle einen fokussierten Commit.

**Erwartetes Ergebnis**

Die Änderung liegt in genau einem verständlich benannten Feature-Branch. Der Commit beschreibt ausschließlich den neuen Kontakt-Hinweis.

---

### Aufgabe 2 - Pull Request öffnen

**Ziel**

Stelle die Änderung für Review und Statusprüfungen bereit.

**Schritte**

1. Pushe `feature/contact-hint` zu `origin`.
2. Öffne auf GitHub einen Pull Request mit `main` als Base-Branch und `feature/contact-hint` als Head-Branch.
3. Beschreibe Problem, Lösung und deinen Test im Pull Request.

**Erwartetes Ergebnis**

Der Pull Request zeigt nur die gewünschte Änderung. Die Beschreibung erklärt, warum die Änderung nötig ist und wie du sie geprüft hast.

---

### Aufgabe 3 - Review verarbeiten und mergen

**Ziel**

Treffe eine nachvollziehbare Merge-Entscheidung.

**Schritte**

1. Prüfe Diff, Review-Kommentare, Konfliktstatus und alle Statusprüfungen.
2. Falls Änderungen angefordert werden, aktualisiere denselben Feature-Branch, teste erneut und pushe den neuen Commit.
3. Merge den Pull Request erst nach Freigabe und erfolgreichen erforderlichen Checks. Lösche anschließend den Feature-Branch, wenn er nicht mehr benötigt wird.

**Erwartetes Ergebnis**

Die Änderung ist kontrolliert in `main` integriert. Der Pull Request dokumentiert den Review- und Merge-Ablauf.

---

## Prüfliste

- [ ] Der Pull Request verwendet `main` als richtigen Base-Branch.
- [ ] Der Diff enthält nur die beabsichtigte Änderung.
- [ ] Die Pull-Request-Beschreibung nennt Problem, Lösung und Test.
- [ ] Review-Kommentare wurden geklärt.
- [ ] Alle erforderlichen Statusprüfungen sind erfolgreich.
- [ ] Der Merge erfolgte erst nach Freigabe.

---

## Fehlerbehebung

| Problem                                                      | Mögliche Ursache                                                            | Lösung                                                                       |
| ------------------------------------------------------------ | --------------------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| Der Branch erscheint nicht beim Erstellen des Pull Requests. | Der Branch wurde noch nicht gepusht.                                        | Führe `git push -u origin feature/contact-hint` aus und aktualisiere GitHub. |
| Im Pull Request werden unerwartete Dateien angezeigt.        | Der Branch enthält zusätzliche Commits oder die falsche Base wurde gewählt. | Prüfe Base- und Head-Branch sowie den Commit-Verlauf, bevor du fortfährst.   |
| Der Merge-Button ist deaktiviert.                            | Erforderliche Checks, Reviews oder Konflikte sind noch offen.               | Kläre die angezeigten Anforderungen und warte auf erfolgreiche Checks.       |

---

## Best Practices

- Halte den Pull Request auf eine fachliche Änderung begrenzt.
- Schreibe Titel und Beschreibung so, dass ein Reviewer die Absicht ohne Rückfragen versteht.
- Prüfe Statuschecks und Konflikte selbst, bevor du um ein Review bittest.

---

## Zusatzaufgabe (optional)

Erstelle einen zweiten, noch kleineren Pull Request und vergleiche, wie viel schneller sich dessen Diff und Beschreibung prüfen lassen.

---

## Zusammenfassung

- Feature-Branches schützen den Ziel-Branch vor unüberprüften Änderungen.
- Ein Pull Request verbindet Änderung, Beschreibung, Review und automatisierte Checks.
- Erfolgreiche Checks und eine Freigabe sind eine Grundlage für einen kontrollierten Merge.

---

## Nächster Schritt

Bearbeite das Quiz, um die Begriffe und Merge-Entscheidungen aus diesem Labor zu überprüfen.

### Verwandte Inhalte

- Notebook: [Pull Requests](../../notebooks/de/12-pull-requests.md)
- Übung: [Pull-Request-Workflow prüfen](../../exercises/de/12-pull-request-workflow-pruefen.md)
- Quiz: [Pull-Requests-Quiz](../../quizzes/de/12-pull-requests-quiz.md)
