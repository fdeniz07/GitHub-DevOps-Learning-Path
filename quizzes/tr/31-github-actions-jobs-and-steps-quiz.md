---
chapter: 31
title: "GitHub Actions Job'ları ve Step'leri Quiz'i"
related_notebook: "GitHub Actions Job'ları ve Step'leri"
related_exercise: "GitHub Actions Job'larını ve Step'lerini Tasarla"
related_lab: "Job Bağımlılığı Olan Bir Workflow Oluştur"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Notebook](../../notebooks/tr/30-yaml-fundamentals.md) | [Notebook](../../notebooks/tr/31-github-actions-jobs-and-steps.md) | [Alıştırma](../../exercises/tr/31-design-github-actions-jobs-and-steps.md) | [Laboratuvar](../../labs/tr/31-build-a-job-dependency-workflow.md) | [Yol Haritası](../../ROADMAP.md)

# GitHub Actions Job'ları ve Step'leri Quiz'i

### Soru 1

`needs` neyi ifade eder?

**Cevap:** Sıralamayı ve bağımlı bir job'un çalışıp çalışamayacağını kontrol eden bir job bağımlılığını.

### Soru 2

Bir step, çıktıya dönüşmesi amaçlanan bir değeri nereye yazmalıdır?

**Cevap:** Step `id`'si kullanarak bir job çıktısıyla eşleştirilebilmesi için `$GITHUB_OUTPUT` dosyasına.

### Soru 3

Doğru mu, yanlış mı: Job'lar YAML'da göründükleri sıra nedeniyle ardışık çalışır.

**Cevap:** Yanlış. Bağımlılığı olmayan job'lar paralel çalışabilir.

### Soru 4

Secret'lar neden normal job çıktıları olarak aktarılmamalıdır?

**Cevap:** Çıktılar secret aktarımı için tasarlanmamıştır ve workflow metadatası veya log'lar üzerinden açığa çıkabilir.

### İlgili İçerik

- Notebook: [GitHub Actions Job'ları ve Step'leri](../../notebooks/tr/31-github-actions-jobs-and-steps.md)
- Alıştırma: [GitHub Actions Job'larını ve Step'lerini Tasarla](../../exercises/tr/31-design-github-actions-jobs-and-steps.md)
- Laboratuvar: [Job Bağımlılığı Olan Bir Workflow Oluştur](../../labs/tr/31-build-a-job-dependency-workflow.md)
