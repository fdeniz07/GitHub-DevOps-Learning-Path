---
chapter: 31
title: "GitHub Actions Job'larını ve Adımlarını Tasarlayın"
related_notebook: "GitHub Actions Job'ları ve Adımları"
level: Başlangıç
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/30-yaml-fundamentals.md) | [Not Defteri](../../notebooks/tr/31-github-actions-jobs-and-steps.md) | [Lab](../../labs/tr/31-build-a-job-dependency-workflow.md) | [Kısa Sınav](../../quizzes/tr/31-github-actions-jobs-and-steps-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitHub Actions Job'larını ve Adımlarını Tasarlayın

## Amaç

Paralel çalışmayı, bağımlılıkları ve küçük bir job çıktısını görünür kılan bir iş akışı grafiği tasarlayın.

## Öğrenme Kazanımları

- doğru job sınırını belirlemek;
- `needs` bağımlılıklarını tanımlamak;
- bir adım çıktısını job çıktısına eşlemek.

## Senaryo

Ekibiniz, lint ve unit test'lerin checkout işleminden sonra bağımsız olarak çalışmasını; package job'ının ise her iki kontrolü beklemesini ve oluşturulan bir artifact adını kullanmasını istiyor.

## Görevler

### Görev 1

`lint`, `test` ve `package` adlarını taşıyan job'ların taslağını çıkarın. Hangi job'ların paralel çalışabileceğine ve hangisinin beklemesi gerektiğine karar verin.

### Beklenen Sonuç

`lint` ve `test` bağımsızdır; `package`, `needs: [lint, test]` tanımlar.

### Görev 2

`artifact_name=app-${GITHUB_SHA::7}` değerini `$GITHUB_OUTPUT` dosyasına yazan bir `prepare` adımı ekleyin, ardından bunu bir job çıktısı olarak dışa aktarın.

### Beklenen Sonuç

Package job'ı bir secret kullanmadan `needs.<job-id>.outputs.artifact_name` değerini okuyabilir.

### Görev 3

İş akışını kazara oluşan bağımlılıklar, belirsiz adlar ve gereğinden fazla izinler açısından inceleyin.

### Beklenen Sonuç

Grafik okunabilirdir, yalnızca gerçek bağımlılıklar tanımlanır ve izinler en az ayrıcalık ilkesine uygundur.

## Öz Değerlendirme

- [ ] Bir job'ı bir adımdan ayırt edebilirim.
- [ ] `needs` ifadesinin neden gerekli olduğunu açıklayabilirim.
- [ ] Küçük ve hassas olmayan bir değeri job'lar arasında aktarabilirim.

## Özet

Bağımlılık grafiğini açıkça modelleyin ve job'lar arasında aktarılan veriyi küçük ve hassas olmayan değerlerle sınırlayın.

### İlgili İçerik

- Not Defteri: [GitHub Actions Job'ları ve Adımları](../../notebooks/tr/31-github-actions-jobs-and-steps.md)
- Lab: [Bir Job Bağımlılığı İş Akışı Oluşturma](../../labs/tr/31-build-a-job-dependency-workflow.md)
- Kısa Sınav: [GitHub Actions Job'ları ve Adımları Kısa Sınavı](../../quizzes/tr/31-github-actions-jobs-and-steps-quiz.md)
