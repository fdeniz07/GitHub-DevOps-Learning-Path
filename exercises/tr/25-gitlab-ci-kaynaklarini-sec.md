---
chapter: 25
title: "GitLab CI Kaynaklarını Seç"
related_notebook: "Runnerlar, Değişkenler, Cache ve Artifactlar"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md) | [Laboratuvar](../../labs/tr/25-gitlab-ci-pipelineini-iyilestir.md) | [Quiz](../../quizzes/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab CI Kaynaklarını Seç

## Amaç

Küçük bir web projesi için güvenli runner, değişken, cache ve artifact seçmek.

## Senaryo

Node.js projesinde lint, test, build ve özel deployment jobı var. `dist/` build çıktısıdır, `.npm/` yeniden kullanılabilir ve deployment tokenı güvenilmeyen branch pipelineında görünmemelidir.

## Görevler

### Görev 1

Doğrulama ve deployment jobları için runner seç. Farklı güven gereksinimlerini açıkla.

**Beklenen Sonuç:** Deployment yalnızca korumalı, güvenilen runnerda çalışır.

### Görev 2

`NODE_ENV`, deployment tokenı, `.npm/` ve `dist/` öğelerini değişken, korumalı-maskelenmiş değişken, cache veya artifact olarak sınıflandır.

**Beklenen Sonuç:** Cachein build çıktısının yerine geçmeyeceğini açıklarsın.

### Görev 3

`package-lock.json` kullanan cache keyi ve yedi günlük artifact saklama süresi tasarla.

**Beklenen Sonuç:** Bağımlılık değişimi cachei yeniler, build çıktısı incelenebilir kalır.

## Öz Değerlendirme

- [ ] Runner güven sınırını anlayabilirim.
- [ ] Secret değişkenleri loga yazdırmam.
- [ ] Amacına göre cache veya artifact seçebilirim.

### İlgili İçerik

- Notebook: [Runnerlar, Değişkenler, Cache ve Artifactlar](../../notebooks/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md)
- Laboratuvar: [GitLab CI Pipelineını İyileştir](../../labs/tr/25-gitlab-ci-pipelineini-iyilestir.md)
- Quiz: [Runnerlar, Değişkenler, Cache ve Artifactlar Quiz'i](../../quizzes/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar-quiz.md)
