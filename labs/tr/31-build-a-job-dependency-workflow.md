---
chapter: 31
title: "İş Bağımlılığı İş Akışı Oluşturma"
related_notebook: "GitHub Actions İşleri ve Adımları"
related_exercise: "GitHub Actions İşlerini ve Adımlarını Tasarlama"
level: Beginner
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/30-yaml-fundamentals.md) | [Not Defteri](../../notebooks/tr/31-github-actions-jobs-and-steps.md) | [Alıştırma](../../exercises/tr/31-design-github-actions-jobs-and-steps.md) | [Kısa Sınav](../../quizzes/tr/31-github-actions-jobs-and-steps-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# İş Bağımlılığı İş Akışı Oluşturma

## Amaç

Bağımsız kontrolleri paralel çalıştıran ve yalnızca ikisi de başarılı olduktan sonra yayımlayan bir iş akışı oluşturun.

## Gereksinimler

- Bir iş akışı dosyası oluşturabileceğiniz bir GitHub deposu.
- Lint ve test komutu ya da zararsız yer tutucu komutlar içeren küçük bir proje.
- YAML ve GitHub Actions ifadelerine aşinalık.

## Görevler

### Görev 1 — Grafiği oluşturma

`prepare`, `lint`, `test` ve `package` işlerini oluşturun. `lint` ve `test` işlerini `prepare` işine bağımlı yapın; `package` işini her iki kontrole bağımlı yapın.

### Görev 2 — Metadata aktarma

`prepare` içinde bir adım çıktısı oluşturun, bunu bir iş çıktısına eşleyin ve `package` içinde yazdırın. Çıktıya kimlik bilgileri koymayın.

### Görev 3 — Davranışı doğrulama

İş akışı çalıştırma özetini açın ve grafiği, çıktı değerini ve kontrollerden biri başarısız olduğundaki davranışı doğrulayın.

## Beklenen Sonuç

Çalıştırma özeti paralel kontrolleri, açık bir package geçidini ve `needs` aracılığıyla aktarılan küçük bir çıktıyı gösterir.

## Doğrulama Kontrol Listesi

- [ ] İş bağımlılıkları açıkça belirtilmiştir.
- [ ] Çıktı doğru şekilde eşlenmiştir.
- [ ] Başarısız bir ön koşul paketlemeyi engeller.
- [ ] İzinler ve günlükler gereksiz gizli bilgi içermez.

## Sorun Giderme

| Sorun                    | Neden                                           | Çözüm                                                   |
| ------------------------ | ----------------------------------------------- | ------------------------------------------------------- |
| Çıktı boş                | Adımda `id` yoktur veya yanlış dosyaya yazılır. | Bir `id` ayarlayın ve `$GITHUB_OUTPUT` dosyasına yazın. |
| Package çok erken başlar | `needs` eksiktir.                               | Gerçek her ön koşulu ekleyin.                           |

### İlgili İçerik

- Not Defteri: [GitHub Actions İşleri ve Adımları](../../notebooks/tr/31-github-actions-jobs-and-steps.md)
- Alıştırma: [GitHub Actions İşlerini ve Adımlarını Tasarlama](../../exercises/tr/31-design-github-actions-jobs-and-steps.md)
- Kısa Sınav: [GitHub Actions İşleri ve Adımları Kısa Sınavı](../../quizzes/tr/31-github-actions-jobs-and-steps-quiz.md)
