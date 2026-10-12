---
chapter: 47
title: "Reproduzierbare Docker-Build-Pipelines"
part: "DevOps"
level: Fortgeschritten
estimated_time: 75 Min.
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Navigation:** [Vorheriges Kapitel](46-docker-fundamentals.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

Am Ende dieses Kapitels kannst du:

- einen reproduzierbaren, cachefähigen und leicht prüfbaren Docker-Build entwerfen.
- Abhängigkeits-, Test- und Laufzeitstufen mit einem mehrstufigen Dockerfile trennen.
- Image-Scans und Herkunftsprüfungen zu einer CI-Build-Pipeline hinzufügen.

## Einführung

Eine Docker-Build-Pipeline verwandelt Quellcode in ein versioniertes Image und Nachweise darüber, wie dieses Image erzeugt wurde. Reproduzierbarkeit bedeutet, dass dieselben geprüften Eingaben ein gleichwertiges Ergebnis liefern. Nachverfolgbarkeit verbindet das Image mit einem Commit, einem Abhängigkeitssatz und einem Build-Lauf.

## Warum das wichtig ist

Ein Build, der von frei beweglichen Basis-Tags, veränderlichen Downloads oder lokalen Dateien eines Entwicklers abhängt, kann sich ohne Quellcodeänderung verändern. CI sollte aus einem sauberen Checkout bauen, kontrollierte Eingaben verwenden, Tests vor der Veröffentlichung ausführen und genau das zu deployende Image scannen.

## Schlüsselbegriffe

| Begriff             | Definition                                                                     |
| ------------------- | ------------------------------------------------------------------------------ |
| Mehrstufiger Build  | Ein Dockerfile mit getrennten Build- und Laufzeitstufen.                       |
| Build-Kontext       | Dateien, die an den Docker-Daemon oder Builder gesendet werden.                |
| Cache-Schlüssel     | Eingaben, mit denen ein vorheriges Build-Ergebnis sicher wiederverwendet wird. |
| SBOM                | Eine Software-Stückliste, die Image-Komponenten aufführt.                      |
| Schwachstellen-Scan | Eine Analyse, die Komponenten mit Sicherheitshinweisen vergleicht.             |
| Herkunft            | Nachweise darüber, wo und wie ein Artefakt gebaut wurde.                       |

## Theorie

Verwende eine Lockdatei und ein gepinntes oder per Digest referenziertes Basis-Image, wenn Reproduzierbarkeit wichtig ist. Ein mehrstufiger Build hält Compiler und Paketmanager aus dem Laufzeit-Image heraus. Kopiere mit `COPY` nur die für die jeweilige Stufe benötigten Dateien und verhindere mit `.dockerignore`, dass Geheimnisse und nicht benötigte Dateien in den Kontext gelangen.

Eine gesunde Pipeline folgt dieser Reihenfolge: Checkout, Abhängigkeiten wiederherstellen, bauen, Unit-Tests, Image bauen, Image scannen und erst nach bestandenen Richtlinienprüfungen veröffentlichen. Ein Scan des Quellbaums ersetzt keinen Scan des finalen Images, da dieses zusätzlich Pakete des Basisbetriebssystems enthält.

Caching ist nur nützlich, wenn seine Eingaben stimmen. Cache Abhängigkeitsdownloads anhand des Hashes der Lockdatei, aber invalidiere den Cache, wenn sich die Lockdatei ändert. Tags kennzeichnen eine gut lesbare Version, während unveränderliche Digests die exakten Bytes identifizieren.

## Praktische Beispiele

### Mehrstufiges Dockerfile

```dockerfile
FROM node:22-bookworm-slim AS build
WORKDIR /src
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm test && npm run build

FROM nginx:1.27-alpine AS runtime
COPY --from=build /src/dist /usr/share/nginx/html
USER 101
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
```

Die Laufzeitstufe enthält die gebaute Website und den Webserver, aber weder die Node.js-Werkzeuge noch Testabhängigkeiten.

### CI-Übersicht mit Scan-Gate

```yaml
name: Build container
on:
  pull_request:
  push:
    branches: [main]
permissions:
  contents: read
  packages: write
jobs:
  build-test-scan:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Build image
        run: docker build --tag app:${{ github.sha }} .
      - name: Test image
        run: docker run --rm app:${{ github.sha }} npm test
      - name: Scan image
        uses: aquasecurity/trivy-action@0.28.0
        with:
          image-ref: app:${{ github.sha }}
          severity: CRITICAL,HIGH
          exit-code: "1"
```

Der Scan zielt auf den unveränderlichen Commit-Tag, der im selben Job erstellt wurde. In Produktion pinne Drittanbieter-Actions nach der Richtlinie deiner Organisation und veröffentliche erst nach bestandenem Gate.

## Selbst ausprobieren

1. Wandle ein einstufiges Dockerfile in Build- und Laufzeitstufen um.
2. Füge eine Lockdatei hinzu und prüfe, dass die Installation der Abhängigkeiten deterministisch ist.
3. Baue mit einem Commit-basierten Tag, führe einen Schwachstellen-Scan aus und speichere den Bericht als CI-Artefakt.
4. Ändere die Lockdatei und beobachte, dass der Abhängigkeits-Cache invalidiert wird.

## Best Practices

- Baue aus sauberem, geprüftem Quellcode und speichere die Commit-SHA in Image-Labels.
- Verwende mehrstufige Builds, `.dockerignore` und Nicht-Root-Laufzeitbenutzer.
- Scanne das finale Image auf Schwachstellen und erzeuge eine SBOM.
- Schlage bei vereinbarten Schweregrenzen fehl und dokumentiere Ausnahmen mit Ablaufdatum.
- Trenne Pull-Request-Prüfung von geschützten Zugangsdaten zur Veröffentlichung.

## Häufige Fehler

| Fehler                                    | Warum er Probleme verursacht                                              | So vermeidest du ihn                                  |
| ----------------------------------------- | ------------------------------------------------------------------------- | ----------------------------------------------------- |
| `latest` als Deployment-Eingabe verwenden | Derselbe Tag kann auf unterschiedliche Bytes zeigen.                      | Deploye einen unveränderlichen Digest.                |
| Nur Quellabhängigkeiten scannen           | Schwachstellen im Basis-Image bleiben verborgen.                          | Scanne das gebaute Laufzeit-Image.                    |
| Das gesamte Repository früh kopieren      | Cache-Invalidierung tritt häufig auf und Geheimnisse können durchsickern. | Kopiere zuerst Lockdateien und nutze `.dockerignore`. |
| Vor Tests und Scans veröffentlichen       | Fehlerhafte oder verwundbare Artefakte werden vertrauenswürdig.           | Erzwinge geordnete Qualitäts-Gates.                   |

## Zusammenfassung

- Reproduzierbare Builds benötigen kontrollierte Eingaben, saubere Kontexte und Lockdateien.
- Mehrstufige Dockerfiles verringern Laufzeitgröße und Angriffsfläche.
- Build-, Test-, Scan- und Veröffentlichungs-Gates sollten auf derselben unveränderlichen Image-Referenz arbeiten.

## Weiterführende Links

- Vorheriges Kapitel: [Docker-Grundlagen](46-docker-fundamentals.md)
- Übung: [Eine Docker-Build-Pipeline entwerfen](../../exercises/de/47-design-a-docker-build-pipeline.md)
- Lab: [Eine Docker-Build-Pipeline ausführen](../../labs/de/47-run-a-docker-build-pipeline.md)
- Quiz: [Quiz zu Docker-Build-Pipelines](../../quizzes/de/47-docker-build-pipelines-quiz.md)
- Roadmap: [Kurs-Roadmap](../../ROADMAP.md)
