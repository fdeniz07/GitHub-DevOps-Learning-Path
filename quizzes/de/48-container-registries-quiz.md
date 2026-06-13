---
chapter: 48
title: "Quiz zu Container-Registries"
related_notebook: "Container-Registries, Tags, Digests und Authentifizierung"
related_exercise: "Ein Image in einer Container-Registry veröffentlichen"
related_lab: "Ein Container-Image pushen und scannen"
level: Fortgeschritten
estimated_time: 20 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Notebook](../../notebooks/de/48-container-registries.md) | [Übung](../../exercises/de/48-publish-an-image-to-a-container-registry.md) | [Lab](../../labs/de/48-push-and-scan-a-container-image.md) | [Roadmap](../../ROADMAP.md)

# Quiz zu Container-Registries

## Lernziele

- Tags, Manifeste und Digests unterscheiden.
- Registry-Authentifizierung nach dem Prinzip der geringsten Rechte anwenden.
- Scanning, Aufbewahrung und Deployment-Identität verbinden.

## Fragen

### Frage 1

Welche Referenz identifiziert den exakten Image-Inhalt?

- A. `service:latest`
- B. `service:release`
- C. `service@sha256:...`
- D. `service:branch-main`

**Antwort:** C. Ein Digest ist inhaltsadressiert und für dieses Manifest unveränderlich.

### Frage 2

Was ist ein Tag?

**Erwartete Antwort:** Ein menschenlesbarer Zeiger auf ein Image-Manifest. Er ist bequem, kann aber verschoben werden, wenn die Registry Überschreiben nicht verhindert.

### Frage 3

Richtig oder falsch: Eine Deployment-Identität benötigt normalerweise die Berechtigung, neue Images zu pushen.

**Antwort:** Falsch. Eine Deployment-Identität benötigt üblicherweise Pull-Zugriff; Veröffentlichung gehört zu einer getrennten Build-Identität.

### Frage 4

Warum sollten Registry-Zugangsdaten nicht in einem Dockerfile übergeben werden?

**Antwort:** Dockerfile-Inhalt und Image-Layer können gespeichert und untersucht werden. Zugangsdaten sollten über geschützte Authentifizierungsmechanismen bereitgestellt werden.

### Frage 5

Nenne zwei Gründe, ältere Image-Versionen aufzubewahren.

**Erwartete Antwort:** Rollback, Notfallwiederherstellung, Vorfalluntersuchung, Compliance-Nachweise und Reproduzierbarkeit.

### Frage 6

Was sollte ein Release-Datensatz neben einem lesbaren Versionstag enthalten?

**Erwartete Antwort:** Image-Digest, Quell-Commit, Scan-Ergebnis, Build-Lauf, Freigabe und Deployment-Umgebung.

## Praktisches Szenario

Ein Produktionsdeployment verwendet `registry.example.com/team/api:stable`, während eine zweite Pipeline `stable` überschreiben kann. Schlage eine Korrektur vor.

**Erwartete Antwort:** Das gescannte Image in seinen Digest auflösen und mit `api@sha256:...` deployen. `stable` bei Bedarf als Auffindbarkeits-Tag behalten, aber schützen und den Digest speichern. Schreibzugriff vom Pull-only-Deployment-Zugriff trennen.

## Prüfcheckliste

- [ ] Ich kann erklären, warum sich Tags bewegen.
- [ ] Ich kann per Digest deployen.
- [ ] Ich kann Push- und Pull-Berechtigungen trennen.
- [ ] Ich kann Aufbewahrungsbedarf definieren.
- [ ] Ich kann Registry-Auditnachweise beschreiben.

## Weiterführende Links

- Notebook: [Container-Registries](../../notebooks/de/48-container-registries.md)
- Übung: [Ein Image in einer Container-Registry veröffentlichen](../../exercises/de/48-publish-an-image-to-a-container-registry.md)
- Lab: [Ein Container-Image pushen und scannen](../../labs/de/48-push-and-scan-a-container-image.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
