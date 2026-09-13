---
chapter: 12
title: "Pull Requests Quiz"
related_notebook: "Pull Requests"
related_exercise: "Pull-Request-Workflow prüfen"
related_lab: "Pull Request erstellen und mergen"
level: Einsteiger
estimated_time: 15 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Navigation:** [Notebook](../../notebooks/de/12-pull-requests.md) | [Übung](../../exercises/de/12-pull-request-workflow-pruefen.md) | [Labor](../../labs/de/12-pull-request-erstellen-und-mergen.md) | [Roadmap](../../ROADMAP.md)

# Pull-Requests-Quiz

## Zweck

Dieses Quiz prüft, ob du den Ablauf eines Pull Requests erklären und typische Entscheidungen vor einem Merge begründen kannst.

---

## Hinweise

- Lies jede Frage sorgfältig.
- Beantworte die Fragen möglichst ohne das Notebook.
- Begründe Entscheidungen mit Base-Branch, Head-Branch, Review und Statusprüfungen.
- Wiederhole falsche Antworten, bevor du mit Kapitel 13 fortfährst.

---

## Lernziele

Nach diesem Quiz kannst du:

- einen Pull Request als überprüfbaren Änderungsvorschlag einordnen;
- Base- und Head-Branch unterscheiden;
- Reviews, Statusprüfungen und Änderungsanforderungen in einem Merge-Ablauf bewerten.

---

## Abschnitt A - Multiple Choice

### Frage 1

Was ist der wichtigste Zweck eines Pull Requests?

- A. Einen lokalen Branch zu löschen
- B. Eine Änderung vor dem Merge sichtbar zu machen und prüfen zu lassen
- C. Ein neues GitHub-Konto anzulegen
- D. Git auf dem eigenen Computer zu installieren

**Antwort:** B

**Erklärung:** Ein Pull Request stellt die Änderungen eines Branches zur Diskussion und Prüfung bereit. Erst danach kann das Team bewusst über einen Merge entscheiden.

---

### Frage 2

Welche Aussage beschreibt den Base-Branch richtig?

- A. Er enthält die vorgeschlagenen neuen Commits.
- B. Er ist immer der zuletzt erstellte Branch.
- C. Er ist der Ziel-Branch, in den die Änderung gemergt werden soll.
- D. Er ist die lokale Arbeitskopie auf dem Computer.

**Antwort:** C

**Erklärung:** Der Base-Branch ist das Ziel eines Pull Requests, zum Beispiel `main`. Der Head-Branch enthält die vorgeschlagene Änderung.

---

## Abschnitt B - Richtig oder falsch

### Frage 3

Nach dem Öffnen eines Pull Requests werden neue Commits auf dem Head-Branch automatisch im selben Pull Request angezeigt.

- Richtig
- Falsch

**Antwort:** Richtig

**Erklärung:** Der Pull Request bleibt mit seinem Head-Branch verbunden. Pushst du neue Commits auf diesen Branch, wird der Diff im Pull Request aktualisiert.

---

### Frage 4

Ein Pull Request kann sofort gemergt werden, sobald mindestens ein Review-Kommentar vorhanden ist.

- Richtig
- Falsch

**Antwort:** Falsch

**Erklärung:** Ein Kommentar ist keine Freigabe. Vor dem Merge müssen angeforderte Änderungen geklärt und die für das Repository erforderlichen Statusprüfungen erfolgreich sein.

---

## Abschnitt C - Kurzantworten

### Frage 5

Warum sollten Pull Requests klein und auf eine Aufgabe fokussiert sein?

**Erwartete Antwort:** Kleine Pull Requests sind leichter zu verstehen, schneller zu prüfen und einfacher zu testen. Ein klarer Umfang macht außerdem Review-Kommentare und die spätere Fehlersuche nachvollziehbarer.

---

### Frage 6

Welche Informationen sollte eine gute Pull-Request-Beschreibung mindestens enthalten?

**Erwartete Antwort:** Sie beschreibt das Problem oder den Kontext, die umgesetzte Lösung und die durchgeführten Tests. Bekannte Einschränkungen oder offene Punkte sollten ebenfalls genannt werden.

---

## Abschnitt D - Praxisszenario

### Szenario

Du hast einen Branch `feature/profile-page` erstellt und daraus einen Pull Request nach `main` geöffnet. Ein Reviewer fordert eine verständlichere Fehlermeldung. Die Statusprüfung `tests` ist noch nicht erfolgreich.

### Frage

Wie gehst du vor, bevor der Pull Request gemergt wird?

**Erwartete Antwort:** Prüfe zuerst, dass `main` der richtige Base-Branch und `feature/profile-page` der Head-Branch ist. Aktualisiere dann die Fehlermeldung auf dem Feature-Branch, teste die Änderung lokal und pushe den neuen Commit. Der Pull Request wird automatisch aktualisiert. Warte auf eine erfolgreiche Statusprüfung und die erneute Freigabe des Reviews, bevor du mergst.

---

## Bewertungsleitfaden

| Ergebnis   | Einschätzung                                                                 |
| ---------- | ---------------------------------------------------------------------------- |
| 90-100 %   | Sehr gut: Du kannst Pull-Request-Entscheidungen sicher begründen.            |
| 75-89 %    | Gut: Wiederhole einzelne Begriffe und den Review-Ablauf.                     |
| 60-74 %    | Ausreichend: Lies das Notebook und bearbeite die Übung erneut.               |
| Unter 60 % | Wiederhole Notebook und Labor, bevor du mit dem nächsten Kapitel fortfährst. |

---

## Selbstkontrolle

- [ ] Ich kann Base- und Head-Branch unterscheiden.
- [ ] Ich weiß, warum Reviews und Statusprüfungen vor dem Merge wichtig sind.
- [ ] Ich kann auf eine Änderungsanforderung angemessen reagieren.
- [ ] Ich bin bereit für das nächste Kapitel.

---

## Nächster Schritt

Wenn du die Lernziele erreicht hast, fahre mit Kapitel 13 zu GitHub Projects fort. Wiederhole andernfalls das Notebook und die praktische Übung.

### Verwandte Inhalte

- Notebook: [Pull Requests](../../notebooks/de/12-pull-requests.md)
- Übung: [Pull-Request-Workflow prüfen](../../exercises/de/12-pull-request-workflow-pruefen.md)
- Labor: [Pull Request erstellen und mergen](../../labs/de/12-pull-request-erstellen-und-mergen.md)
- Nächstes Kapitel: GitHub Projects (wird vorbereitet)
