---
chapter: 27
title: "GitLab Güvenlik Bulgusunu Triage Et"
related_notebook: "DevSecOps, Güvenlik Taramaları ve Uyumluluk"
level: Başlangıç
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk.md) | [Laboratuvar](../../labs/tr/27-devsecops-inceleme-akisi-tasarimla.md) | [Quiz](../../quizzes/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Güvenlik Bulgusunu Triage Et

## Amaç

Dependency scanning bulgusu için kanıta dayalı ve belgeli karar vermek.

## Senaryo

`example-lib` 2.3.1 bilinen zafiyete sahip. Paket yalnızca isteğe bağlı yerel geliştirme komutunda kullanılıyor ve yamalı sürüm mevcut.

## Görevler

1. Sürüm, kullanım, severity kaynağı, owner ve hedef tarih kaydet.
2. Erişilebilirlik ve etkiyi değerlendirecek kanıtı belirle.
3. Update, test, merge request ve doğrulamayı planla; istisna için gerekçe ve sona erme tarihi yaz.

**Beklenen Sonuç:** Bulgu görmezden gelinmez; düzeltilir veya süreli gerekçeyle ele alınır.

### İlgili İçerik

- Notebook: [DevSecOps, Güvenlik Taramaları ve Uyumluluk](../../notebooks/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk.md)
- Laboratuvar: [DevSecOps İnceleme Akışı Tasarla](../../labs/tr/27-devsecops-inceleme-akisi-tasarimla.md)
- Quiz: [DevSecOps, Güvenlik Taramaları ve Uyumluluk Quiz'i](../../quizzes/tr/27-gitlab-devsecops-guvenlik-taramalari-ve-uyumluluk-quiz.md)
