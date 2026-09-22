---
chapter: 25
title: "Runnerlar, Değişkenler, Cache ve Artifactlar Quiz'i"
related_notebook: "Runnerlar, Değişkenler, Cache ve Artifactlar"
related_exercise: "GitLab CI Kaynaklarını Seç"
related_lab: "GitLab CI Pipelineını İyileştir"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md) | [Alıştırma](../../exercises/tr/25-gitlab-ci-kaynaklarini-sec.md) | [Laboratuvar](../../labs/tr/25-gitlab-ci-pipelineini-iyilestir.md) | [Yol Haritası](../../ROADMAP.md)

# Runnerlar, Değişkenler, Cache ve Artifactlar Quiz'i

### Soru 1

Hangisi normalde artifacttır?

- A. İndirilen npm paketleri
- B. `dist/` build çıktısı
- C. Deployment tokenı
- D. Runner etiketi

**Cevap:** B. Artifact belirli job çıktısını saklar; cache tekrar üretilebilen girdiyi hızlandırır.

### Soru 2

Runner neden güvenlik açısından önemlidir?

**Cevap:** Job kodunu çalıştırır ve güven sınırı oluşturur.

### Doğru veya yanlış

Maskelenmiş değişkende `echo $DEPLOY_TOKEN` güvenlidir.

**Cevap:** Yanlış. Secretları kasıtlı olarak loga yazdırma.

### Kısa yanıt

Cache keyi neden lock dosyasını içermelidir?

**Beklenen Yanıt:** Bağımlılıklar değişince cache yeniden kullanılmasın diye.

### Senaryo

`dist/` artifactı bulunamadı.

**Beklenen Yanıt:** Build çıktısını ve göreli artifact yolunu kontrol et; artifactı cache ile değiştirme.

### İlgili İçerik

- Notebook: [Runnerlar, Değişkenler, Cache ve Artifactlar](../../notebooks/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md)
- Alıştırma: [GitLab CI Kaynaklarını Seç](../../exercises/tr/25-gitlab-ci-kaynaklarini-sec.md)
- Laboratuvar: [GitLab CI Pipelineını İyileştir](../../labs/tr/25-gitlab-ci-pipelineini-iyilestir.md)
