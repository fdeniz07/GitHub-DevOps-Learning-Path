---
chapter: 18
title: "GitLab-Projektzugriff konfigurieren"
related_notebook: "GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen"
related_exercise: "GitLab-Projektzugriff planen"
level: Einsteiger
estimated_time: 45 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Navigation:** [Notebook](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md) | [Übung](../../exercises/de/18-gitlab-projektzugriff-planen.md) | [Quiz](../../quizzes/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitLab-Projektzugriff konfigurieren

## Ziel

Konfiguriere und überprüfe ein kleines GitLab-Zugriffsmodell, ohne unnötige Verwaltungsrechte zu vergeben.

## Lernergebnisse

- direkte und geerbte Mitgliedschaften prüfen;
- einem Mitglied im Übungsprojekt die niedrigste passende Rolle geben;
- den Standard-Branch für einen Merge-Request-Workflow schützen.

## Szenario

Du verwaltest ein erlaubtes Trainingsprojekt in einer Teamgruppe. Eine Person soll Dokumentationsänderungen vorschlagen können, während der Standard-Branch vor normalen direkten Pushes geschützt bleibt.

## Voraussetzungen

- Das [Notebook zu Kapitel 18](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md) und die [Übung](../../exercises/de/18-gitlab-projektzugriff-planen.md) wurden bearbeitet.
- Du darfst Zugriff und Branch-Regeln eines GitLab-Trainingsprojekts verwalten.

## Umgebung

| Voraussetzung | Wert                                                  |
| ------------- | ----------------------------------------------------- |
| Plattform     | GitLab-Weboberfläche                                  |
| Zugriff       | Berechtigung zur Verwaltung des Übungsprojekts        |
| Sicherheit    | Keine Produktionsmitgliedschaften oder -regeln ändern |

## Aufgaben

### Aufgabe 1 - Aktuelles Modell prüfen

1. Notiere Projektpfad, Sichtbarkeit und Standard-Branch.
2. Liste sichtbare direkte und geerbte Mitglieder auf.
3. Ordne jeder Person die notwendige Mitgliedschaft zu.

**Erwartetes Ergebnis:** Du kannst erklären, wie jede Person Zugriff erhält.

### Aufgabe 2 - Contributor konfigurieren

1. Füge einen Trainingsbenutzer im engsten passenden Bereich hinzu.
2. Wähle die niedrigste Rolle für Branch- und Merge-Request-Arbeit.
3. Dokumentiere Aufgabe, verantwortliche Person und Prüftermin.

**Erwartetes Ergebnis:** Der Contributor kann mitarbeiten, aber keine Projekteinstellungen verwalten.

### Aufgabe 3 - Standard-Branch schützen

1. Öffne die Einstellungen für geschützte Branches.
2. Konfiguriere `main` für Merge Requests sowie die im Team geforderten Freigaben oder Prüfungen.
3. Prüfe anschließend die angezeigten Push- und Merge-Rechte.

**Erwartetes Ergebnis:** Branch-Regel und Mitgliedschaft unterstützen einen überprüfbaren Workflow.

## Validierungscheckliste

- [ ] Die Sichtbarkeit des Übungsprojekts ist bewusst gewählt.
- [ ] Kein Mitglied erhielt eine zu breite Rolle.
- [ ] Direkter und geerbter Zugriff wurden geprüft.
- [ ] Der Standard-Branch besitzt eine passende Schutzregel.

## Fehlerbehebung

| Problem                               | Mögliche Ursache                                            | Lösung                                                                             |
| ------------------------------------- | ----------------------------------------------------------- | ---------------------------------------------------------------------------------- |
| Ein Mitglied hat unerwarteten Zugriff | Mitgliedschaft wird von einer übergeordneten Gruppe geerbt. | Gruppenmitgliedschaft vor einer Projektrollenänderung prüfen.                      |
| Branch-Regel ist nicht änderbar       | Die eigene Rolle darf diese Einstellung nicht verwalten.    | Zugelassene Projektverantwortliche einbeziehen; nicht leichtfertig Rechte erhöhen. |

## Best Practices

- Teste Zugriffsänderungen zuerst im Trainingsprojekt.
- Notiere für temporären Zugriff Verantwortliche und Prüftermin.
- Prüfe Branch-Schutz nach Änderungen an Mitgliedschaften oder Regeln.

## Zusammenfassung

- Wirksamer Zugriff kann aus Gruppen oder direkter Projektmitgliedschaft stammen.
- Branch-Schutz hält wichtige Änderungen im Review-Prozess.

### Verwandte Inhalte

- Notebook: [GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen](../../notebooks/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen.md)
- Übung: [GitLab-Projektzugriff planen](../../exercises/de/18-gitlab-projektzugriff-planen.md)
- Quiz: [GitLab-Gruppen, Projekte, Mitglieder und Berechtigungen Quiz](../../quizzes/de/18-gitlab-gruppen-projekte-mitglieder-und-berechtigungen-quiz.md)
- [Roadmap](../../ROADMAP.md)
