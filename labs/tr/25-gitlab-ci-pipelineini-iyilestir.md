---
chapter: 25
title: "GitLab CI Pipelineını İyileştir"
related_notebook: "Runnerlar, Değişkenler, Cache ve Artifactlar"
related_exercise: "GitLab CI Kaynaklarını Seç"
level: Başlangıç
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md) | [Alıştırma](../../exercises/tr/25-gitlab-ci-kaynaklarini-sec.md) | [Quiz](../../quizzes/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab CI Pipelineını İyileştir

## Amaç

Secret açığa çıkarmadan güvenli Node.js pipelineına bağımlılık cachei ve build artifactı eklemek.

## Görevler

### Görev 1 - Runnerı incele

Job için uygun runnerı ve taglerini kontrol et. Runner kaydı veya secret değiştirme.

**Beklenen Sonuç:** Jobın neden bu runnerda çalışabileceğini açıklarsın.

### Görev 2 - Cache ekle

`.npm/` için `package-lock.json` tabanlı cache ekle ve `npm ci --cache .npm --prefer-offline` kullan.

**Beklenen Sonuç:** Cache miss doğru kurulumu engellemez.

### Görev 3 - Build çıktısını sakla

`dist/` oluştur, artifact olarak kaydet ve `expire_in: 7 days` ekle.

**Beklenen Sonuç:** Build sonucu indirilebilir olur.

## Doğrulama Listesi

- [ ] YAML veya logda secret yok.
- [ ] Cache keyi lock dosyasını kullanıyor.
- [ ] Artifact yolu buildten sonra var.

## Sorun Giderme

| Sorun        | Çözüm                                      |
| ------------ | ------------------------------------------ |
| Job bekliyor | Tagleri ve runner uygunluğunu incele.      |
| Artifact yok | `dist/` üretildiğini kontrol et.           |
| Cache miss   | Kuruluma devam et, keyi sonra değerlendir. |

### İlgili İçerik

- Notebook: [Runnerlar, Değişkenler, Cache ve Artifactlar](../../notebooks/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar.md)
- Alıştırma: [GitLab CI Kaynaklarını Seç](../../exercises/tr/25-gitlab-ci-kaynaklarini-sec.md)
- Quiz: [Runnerlar, Değişkenler, Cache ve Artifactlar Quiz'i](../../quizzes/tr/25-gitlab-runnerlar-degiskenler-cache-ve-artifactlar-quiz.md)
