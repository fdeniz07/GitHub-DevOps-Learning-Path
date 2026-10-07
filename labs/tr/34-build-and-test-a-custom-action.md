---
chapter: 34
title: "Özel Bir Eylem Oluşturma ve Test Etme"
related_notebook: "Özel GitHub Actions Yazma"
related_exercise: "Özel Bir GitHub Actions Eylemi Tasarlama"
level: Intermediate
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/33-github-marketplace-actions.md) | [Not Defteri](../../notebooks/tr/34-writing-custom-github-actions.md) | [Alıştırma](../../exercises/tr/34-design-a-custom-github-action.md) | [Kısa Sınav](../../quizzes/tr/34-writing-custom-github-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Özel Bir Eylem Oluşturma ve Test Etme

## Amaç

Belgelenmiş bir metadata sözleşmesine, testlere ve sürümlenmiş bir yayın planına sahip küçük bir özel eylem uygulayın.

## Gereksinimler

- JavaScript eylemi için Node.js veya Docker eylemi için Docker.
- `action.yml` dosyasının eylem kökünde bulunabileceği bir depo.
- Eylemi `uses` aracılığıyla çağıran bir test iş akışı.

## Görevler

### Görev 1 — Sözleşmeyi tanımlama

Bir zorunlu girdi ve bir çıktı içeren `action.yml` oluşturun. Doğrulamayı ve hata davranışını belirtin.

### Görev 2 — Çalışma zamanını uygulama

Eylemi JavaScript veya Docker ile uygulayın. Günlükleri yararlı tutun, ancak token'ları, kimlik bilgilerini veya tam ortam dökümlerini hiçbir zaman yazdırmayın.

### Görev 3 — Genel arayüzü test etme

Geçerli ve geçersiz girdileri, çıktı değerlerini ve çağıran iş akışını test edin. JavaScript için runner'ın kullandığı dağıtım paketini oluşturun.

### Görev 4 — Eylemi sürümleme

Değişmez bir sürüm etiketi ve büyük sürüm uyumluluk etiketi için bir yayın planı oluşturun. Büyük sürüm gerektirecek değişikliği açıklayın.

## Beklenen Sonuç

Eylem temiz bir iş akışından çalışır, belgelenmiş çıktıyı üretir, geçersiz girdiler için açıkça başarısız olur ve tekrarlanabilir bir yayın sürecine sahiptir.

## Doğrulama Kontrol Listesi

- [ ] `action.yml` uygulamayla eşleşir.
- [ ] Birim veya odaklanmış çalışma zamanı testleri geçer.
- [ ] Çağıran iş akışı testi geçer.
- [ ] Oluşturulan dağıtım içeriği günceldir.
- [ ] Yayınlama ve geri alma davranışı belgelenmiştir.

### İlgili İçerik

- Önceki not defteri: [GitHub Marketplace Eylemleri](../../notebooks/tr/33-github-marketplace-actions.md)
- Not Defteri: [Özel GitHub Actions Yazma](../../notebooks/tr/34-writing-custom-github-actions.md)
- Alıştırma: [Özel Bir GitHub Actions Eylemi Tasarlama](../../exercises/tr/34-design-a-custom-github-action.md)
- Kısa Sınav: [Özel GitHub Actions Yazma Kısa Sınavı](../../quizzes/tr/34-writing-custom-github-actions-quiz.md)
