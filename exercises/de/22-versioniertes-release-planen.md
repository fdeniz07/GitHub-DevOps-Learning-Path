---
chapter: 22
title: "Ein versioniertes Release planen"
related_notebook: "Releases, Packages und Container Registry"
level: Einsteiger
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/22-releases-packages-und-container-registry.md) | [Labor](../../labs/de/22-versioniertes-package-veroeffentlichen-und-nutzen.md) | [Quiz](../../quizzes/de/22-releases-packages-und-container-registry-quiz.md) | [Roadmap](../../ROADMAP.md)

## Ein versioniertes Release planen

## Ziel

Plane ein nachvollziehbares Release für ein kompatibles neues Feature und eine Fehlerkorrektur.

## Szenario

Aktuell ist `1.4.0`. Das Team ergänzt ein optionales Exportformat und korrigiert falsche Datumswerte in exportierten Berichten. Die öffentliche API wird nicht inkompatibel geändert.

## Aufgaben

### Aufgabe 1 - Versionen wählen

Wähle die nächste Version für das Feature und die spätere Korrektur. Begründe jeweils `MINOR` oder `PATCH`.

### Aufgabe 2 - Release-Nachweis erstellen

Schreibe einen Tag-Namen, drei Release-Note-Einträge und die zu veröffentlichende Package- oder Image-Version. Alle Versionen müssen übereinstimmen.

### Aufgabe 3 - Nutzung schützen

Beschreibe Besitz des Registry-Namensraums, Veröffentlichungs- und Leserechte sowie den Grund gegen `latest`.

## Erwartetes Ergebnis

Der Plan verbindet semantische Version, Quell-Tag, Release Notes, unveränderliches Artefakt und minimale Zugriffsrechte.

## Selbstkontrolle

- [ ] Ich unterscheide Feature- und Patch-Release.
- [ ] Ich kenne den Unterschied zwischen Tag und Release.
- [ ] Ich kann den Vorteil einer unveränderlichen Version erklären.

## Zugehörige Inhalte

- [Notebook](../../notebooks/de/22-releases-packages-und-container-registry.md)
- [Labor](../../labs/de/22-versioniertes-package-veroeffentlichen-und-nutzen.md)
- [Quiz](../../quizzes/de/22-releases-packages-und-container-registry-quiz.md)
