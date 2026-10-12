---
chapter: 48
title: "Container-Registries, Tags, Digests und Authentifizierung"
part: "DevOps"
level: Fortgeschritten
estimated_time: 60 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](47-docker-build-pipelines.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- veränderliche Tags von unveränderlichen Image-Digests unterscheiden.
- eine sinnvolle Tag-Strategie für Branches, Releases und Rollbacks entwerfen.
- CI und Entwickler authentifizieren, ohne Registry-Zugangsdaten im Quellcode abzulegen.

## Einführung

Eine Container-Registry speichert Images und stellt sie Build- und Deployment-Systemen bereit. Öffentliche und private Registries verwenden dasselbe grundlegende Image-Referenzformat, doch Produktionsabläufe ergänzen Zugriffskontrolle, Aufbewahrung, Signierung, Scans und Audit-Anforderungen.

## Warum das wichtig ist

Eine Image-Referenz ist Teil des Deployment-Vertrags. Ein frei beweglicher Tag kann unbemerkt ändern, was in Produktion läuft, während ein Digest den exakten Inhalt identifiziert. Klare Tags helfen Menschen beim Navigieren durch Releases, und sichere Authentifizierung trennt Berechtigungen zum Veröffentlichen und Abrufen.

## Schlüsselbegriffe

| Begriff           | Definition                                                                                                     |
| ----------------- | -------------------------------------------------------------------------------------------------------------- |
| Repository        | Eine benannte Sammlung verwandter Image-Versionen in einer Registry.                                           |
| Tag               | Ein veränderlicher, menschenlesbarer Zeiger wie `v1.4.2`.                                                      |
| Digest            | Ein unveränderlicher, inhaltsadressierter Bezeichner wie `sha256:...`.                                         |
| Pull              | Ein Image aus einer Registry herunterladen.                                                                    |
| Push              | Ein Image in eine Registry hochladen.                                                                          |
| Credential Helper | Ein Werkzeug, das Registry-Zugangsdaten speichert oder bereitstellt, ohne sie in der Shell-Historie abzulegen. |

## Theorie

Eine vollständig qualifizierte Image-Referenz enthält Registry-Host, Repository und Tag oder Digest: `registry.example.com/team/service:v1.4.2`. Tags sind bequeme Aliase und können verschoben werden. Ein Digest ist für ein bestimmtes Manifest stabil und die richtige Deployment-Eingabe, wenn Reproduzierbarkeit zählt.

Verwende getrennte Identitäten für Pull und Push. Ein CI-Token zum Veröffentlichen sollte auf ein Repository und eine Umgebung beschränkt sein. Deployment-Agenten benötigen oft nur Pull-Zugriff. Speichere Zugangsdaten in einem Secret Manager oder im geschützten Secret-Speicher der CI-Plattform und nutze, wo möglich, kurzlebige Föderation.

Versehe Releases mit einer semantischen Version und gegebenenfalls einer Commit-Kennung. Überschreibe niemals einen Release-Tag, außer die Release-Richtlinie erlaubt es ausdrücklich. Konfiguriere die Aufbewahrung sorgfältig: Das Löschen alter Images kann Rollback oder Notfallwiederherstellung verhindern.

## Praktische Beispiele

### Anmelden, taggen und pushen

```bash
docker login registry.example.com
docker build --tag registry.example.com/platform/service:1.4.2 .
docker tag registry.example.com/platform/service:1.4.2 registry.example.com/platform/service:git-a1b2c3d
docker push registry.example.com/platform/service:1.4.2
docker push registry.example.com/platform/service:git-a1b2c3d
docker image inspect registry.example.com/platform/service:1.4.2 --format '{{index .RepoDigests 0}}'
```

Der zurückgegebene Repository-Digest identifiziert das exakt gepushte Manifest. Das Deployment kann statt des veränderlichen Tags `registry.example.com/platform/service@sha256:...` verwenden.

### Geschütztes CI-Publishing

```yaml
- name: Log in to registry
  uses: docker/login-action@v3
  with:
    registry: registry.example.com
    username: ${{ secrets.REGISTRY_USER }}
    password: ${{ secrets.REGISTRY_TOKEN }}
- name: Push immutable image
  run: docker push registry.example.com/platform/service:${{ github.sha }}
```

Das Token muss auf das erforderliche Repository beschränkt und vor nicht vertrauenswürdigen Pull-Request-Jobs geschützt werden. Gib das Token niemals aus und übergib es nicht als Kommandozeilenargument, das in Logs erscheinen könnte.

## Selbst ausprobieren

1. Erstelle ein lokales Image mit einem Tag für die semantische Version und einem Commit-Tag.
2. Pushe es mit einem Token mit geringsten Rechten in ein privates Test-Repository.
3. Speichere den Digest und pulle das Image auf einem anderen Rechner per Digest.
4. Schreibe eine Aufbewahrungsregel, die Release-Images und die letzten fünf Rollback-Kandidaten bewahrt.

## Best Practices

- Deploye per Digest und behalte lesbare Release-Tags zur Auffindbarkeit.
- Verwende getrennte Push- und Pull-Identitäten mit möglichst kleinem Geltungsbereich.
- Schütze Registries mit TLS, Audit-Logs, Scans und Aufbewahrungsrichtlinien.
- Speichere Zugangsdaten niemals in Dockerfiles, der Git-Historie oder ungeschützten Workflow-Ausgaben.
- Speichere zu jedem Release Digest, Quell-Commit, Scan-Ergebnis und Freigabe.

## Häufige Fehler

| Fehler                                           | Warum er Probleme verursacht                               | So vermeidest du ihn                                  |
| ------------------------------------------------ | ---------------------------------------------------------- | ----------------------------------------------------- |
| Einen Tag als unveränderlich behandeln           | Ein späterer Push kann die deployten Bytes ändern.         | Löse auf und deploye per Digest.                      |
| Ein Administrator-Token teilen                   | Ein Leck gewährt unnötigen Schreibzugriff.                 | Nutze beschränkte Identitäten und Föderation.         |
| Alle alten Images löschen                        | Rollback und Untersuchung von Vorfällen werden schwierig.  | Definiere Aufbewahrung nach Wiederherstellungsbedarf. |
| In jedem nicht vertrauenswürdigen Build anmelden | Pull-Request-Code könnte Veröffentlichungszugang erhalten. | Trenne Prüfungs- und Veröffentlichungsjobs.           |

## Zusammenfassung

- Tags sind navigierbare Aliase; Digests identifizieren exakten Image-Inhalt.
- Registry-Zugriff sollte nach Aktion, Repository und Umgebung beschränkt werden.
- Sicheres Publishing verbindet Authentifizierung, Scans, Aufbewahrung, Auditierbarkeit und unveränderliche Deployment-Referenzen.

## Weiterführende Links

- Vorheriges Kapitel: [Reproduzierbare Docker-Build-Pipelines](47-docker-build-pipelines.md)
- Übung: [Ein Image in einer Container-Registry veröffentlichen](../../exercises/de/48-publish-an-image-to-a-container-registry.md)
- Lab: [Ein Container-Image pushen und scannen](../../labs/de/48-push-and-scan-a-container-image.md)
- Quiz: [Quiz zu Container-Registries](../../quizzes/de/48-container-registries-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
