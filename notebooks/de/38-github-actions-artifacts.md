---
chapter: 38
title: "Artefakte in GitHub Actions"
part: "GitHub Actions"
level: Intermediate
estimated_time: 75 min
language: DE
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Navigation:** [Vorheriges Kapitel](37-github-actions-dependency-caching.md) | [Übung](../../exercises/de/38-publish-and-consume-workflow-artifacts.md) | [Lab](../../labs/de/38-share-build-artifacts-between-jobs.md) | [Quiz](../../quizzes/de/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

## Lernziele

- Artefakte von Caches und Job-Ausgaben unterscheiden;
- Dateien aus einem Job hochladen und in einem anderen herunterladen;
- Aufbewahrungs- und Benennungsrichtlinien bewusst auswählen;
- Artefaktinhalte und Berechtigungen an Job-Grenzen schützen.

## Einführung

Artefakte sind Dateien, die von einem Workflow erzeugt und mit einer Workflow-Ausführung aufbewahrt werden. Sie eignen sich für Testberichte, Binärdateien, Coverage-Ausgaben und Release-Pakete. Da getrennte Jobs auf getrennten Runnern laufen, bieten Artefakte eine ausdrückliche Möglichkeit, Dateien über Job-Grenzen hinweg zu übertragen.

## Wichtige Begriffe

| Begriff      | Bedeutung                                                                               |
| ------------ | --------------------------------------------------------------------------------------- |
| Artefakt     | Eine benannte Sammlung von Dateien, die aus einer Workflow-Ausführung hochgeladen wird. |
| Aufbewahrung | Wie lange ein Artefakt verfügbar bleibt.                                                |
| Upload       | Der Vorgang, der Dateien mit der Ausführung speichert.                                  |
| Download     | Der Vorgang, der ein Artefakt in einem späteren Job abruft.                             |
| Job-Grenze   | Der isolierte Übergang zwischen Jobs und ihren Runnern.                                 |

## Theorie

### Hochladen und Herunterladen

Ein Upload-Schritt benennt das Artefakt und wählt Dateien aus. Ein späterer Job deklariert mit `needs` eine Abhängigkeit und lädt das benannte Artefakt herunter:

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - run: mkdir -p dist && printf 'build output\n' > dist/app.txt
      - uses: actions/upload-artifact@v4
        with:
          name: app-${{ github.sha }}
          path: dist/
          retention-days: 7

  inspect:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - uses: actions/download-artifact@v4
        with:
          name: app-${{ github.sha }}
          path: received/
      - run: cat received/app.txt
```

Die `needs`-Beziehung stellt sicher, dass der Erzeuger fertig ist, bevor der Verbraucher startet. Der Artefaktname sollte den Inhalt identifizieren und versehentliche Kollisionen zwischen Matrix-Jobs vermeiden.

### Aufbewahrung und Lebenszyklus

Die Aufbewahrung sollte zum Zweck des Artefakts passen. Kurzlebige Testberichte benötigen weniger Aufbewahrung als ein Release-Paket, aber eine lange Aufbewahrung erhöht Speicherbedarf und Offenlegung. Repository- oder Organisationsrichtlinien können den Wert begrenzen. Nehmen Sie nicht an, ein Artefakt sei ein unveränderliches Archivsystem; bewahren Sie Release-Aufzeichnungen nach der tatsächlichen Release-Richtlinie des Projekts auf.

### Artefakte, Caches und Ausgaben

Artefakte sind für Dateien gedacht, die später geprüft oder verwendet werden müssen. Caches sind für sichere wiederverwendbare Abhängigkeiten gedacht und können entfernt werden. Job-Ausgaben sind kleine benannte Werte zur Steuerung der Workflow-Logik. Die falsche Mechanik erschwert den Datenfluss und kann Sicherheits- oder Zuverlässigkeitsprobleme erzeugen.

### Sicherheit an Job-Grenzen

Behandeln Sie heruntergeladene Artefakte als nicht vertrauenswürdige Eingaben, bis sie validiert wurden. Begrenzen Sie Berechtigungen, prüfen Sie Prüfsummen oder Signaturen für Release-kritische Dateien und führen Sie keine beliebigen heruntergeladenen Skripte aus. Vermeiden Sie das Hochladen von Secrets, Zugangsdaten oder vollständigen Workspaces. Ein Job, der ein Release veröffentlichen kann, sollte nur die benötigten Berechtigungen und Dateien erhalten.

## Best Practices

- Geben Sie Artefakten beschreibende, kollisionsarme Namen.
- Laden Sie nur Dateien hoch, die Reviewer oder nachgelagerte Jobs benötigen.
- Setzen Sie die Aufbewahrung entsprechend Wert, Sensibilität und Richtlinie.
- Validieren Sie heruntergeladene Inhalte, bevor Sie sie ausführen oder veröffentlichen.
- Verwenden Sie für Erzeuger- und Verbraucherjobs Berechtigungen nach dem Prinzip der geringsten Rechte.

## Häufige Fehler

| Fehler                                            | Auswirkung                                            | Korrektur                                              |
| ------------------------------------------------- | ----------------------------------------------------- | ------------------------------------------------------ |
| Erwartung, Dateien blieben zwischen Jobs erhalten | Der nächste Runner startet ohne sie.                  | Ein Artefakt hochladen und ausdrücklich herunterladen. |
| Einen Cache für Release-Pakete verwenden          | Daten können entfernt oder veraltet sein.             | Artefakte mit Validierung und Aufbewahrung verwenden.  |
| Secrets zusammen mit Logs hochladen               | Sensible Daten werden über die Ausführung zugänglich. | Secrets ausschließen und Pfade prüfen.                 |
| Einen Namen in Matrix-Jobs wiederverwenden        | Dateien können kollidieren oder mehrdeutig werden.    | Matrixwerte in Namen aufnehmen.                        |

## Zusammenfassung

Artefakte machen die Dateiübertragung zwischen isolierten Jobs ausdrücklich. Verwenden Sie sie für Berichte und Build-Ausgaben, wählen Sie die Aufbewahrung bewusst und validieren Sie alles, was über eine Job-Grenze hinweg verwendet wird.

### Verwandte Inhalte

- Vorheriges Kapitel: [Abhängigkeits-Caching](37-github-actions-dependency-caching.md)
- Übung: [Workflow-Artefakte veröffentlichen und verwenden](../../exercises/de/38-publish-and-consume-workflow-artifacts.md)
- Lab: [Build-Artefakte zwischen Jobs teilen](../../labs/de/38-share-build-artifacts-between-jobs.md)
- Quiz: [Quiz zu Artefakten](../../quizzes/de/38-artifacts-quiz.md)
