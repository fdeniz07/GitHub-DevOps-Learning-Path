---
chapter: 18
title: "GitLab-Projektzugriff planen"
related_notebook: "GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen"
level: Einsteiger
estimated_time: 25 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md) | [Labor](../../labs/de/18-gitlab-projektzugriff-konfigurieren.md) | [Quiz](../../quizzes/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Projektzugriff planen

## Ziel

Entwirf einen Zugriffsplan nach dem Prinzip der geringsten Berechtigung für eine GitLab-Gruppe und ihre Projekte.

## Lernergebnisse

- Gruppen- und Projektmitgliedschaften unterscheiden;
- Rollen anhand einer dokumentierten Aufgabe auswählen;
- Zugriffsprüfung und Branch-Schutz einplanen.

## Voraussetzungen

- Das [Notebook zu Kapitel 18](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md) wurde bearbeitet.
- Du kannst ein GitLab-Projekt oder eine Beispielhierarchie ansehen.

## Szenario

Die Gruppe `acme/plattform` enthält die Projekte `shop` und `zahlungen`. Dana betreut beide Projekte, Lee aktualisiert nur die Shop-Dokumentation und ein Dienstleister benötigt zwei Wochen Lesezugriff auf `zahlungen`. Die Branches `main` dürfen nur nach Review gemergt werden.

## Aufgaben

### Aufgabe 1 - Mitgliedschaft modellieren

Entscheide, wer eine Gruppenmitgliedschaft und wer nur eine Projektmitgliedschaft erhält. Begründe jede Entscheidung.

**Erwartetes Ergebnis:** Danas projektübergreifende Verantwortung ist abgedeckt; engere Bedarfe werden nicht unnötig erweitert.

### Aufgabe 2 - Geringste Berechtigung anwenden

Wähle für Dana, Lee und den Dienstleister die niedrigste passende konfigurierte Rolle. Beschreibe, was jede Person tun darf und nicht verwalten darf.

**Erwartetes Ergebnis:** Jede Rolle ist durch eine Aufgabe statt nur durch einen Titel begründet.

### Aufgabe 3 - Kontrollen festlegen

Formuliere drei Fragen für die Zugriffsprüfung und eine kurze Regel für den geschützten Branch `main`.

**Erwartetes Ergebnis:** Die Prüfung bezieht geerbten Zugriff und abgelaufenen Dienstleisterzugriff ein; direkte normale Pushes sind ausgeschlossen.

## Zusatzaufgabe (optional)

Erkläre, wann eine Untergruppe wie `acme/plattform/zahlungen` die Verantwortung klarer abbildet als eine flache Gruppe.

## Selbstkontrolle

- [ ] Ich unterscheide Sichtbarkeit und Mitgliedschaft.
- [ ] Ich habe Rollen nach geringster Berechtigung gewählt.
- [ ] Ich habe eine Zugriffsprüfung und Branch-Regel festgelegt.

## Häufige Fehler

| Fehler                                                          | Lösung                                                                              |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| Gruppenmitgliedschaft für eine einzelne Projektaufgabe vergeben | Direkte Projektmitgliedschaft nutzen, wenn gemeinsamer Zugriff nicht begründet ist. |
| Temporären Zugriff dauerhaft behandeln                          | Prüf- oder Entfernungsdatum festlegen.                                              |

## Zusammenfassung

- Gruppenmitgliedschaft skaliert gemeinsamen Zugriff; Projektmitgliedschaft löst enge Ausnahmen.
- Rollen und geschützte Branches müssen bewusst gewählt und geprüft werden.

### Verwandte Inhalte

- Notebook: [GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md)
- Labor: [GitLab-Projektzugriff konfigurieren](../../labs/de/18-gitlab-projektzugriff-konfigurieren.md)
- Quiz: [GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen Quiz](../../quizzes/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen-quiz.md)
- [Roadmap](../../ROADMAP.md)
