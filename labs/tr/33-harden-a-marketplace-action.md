---
chapter: 33
title: "Marketplace Eylemini Güçlendirme"
related_notebook: "GitHub Marketplace Eylemleri"
related_exercise: "Bir Marketplace Eylemini İnceleme"
level: Intermediate
estimated_time: 70 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/32-github-runners.md) | [Not Defteri](../../notebooks/tr/33-github-marketplace-actions.md) | [Alıştırma](../../exercises/tr/33-review-a-marketplace-action.md) | [Kısa Sınav](../../quizzes/tr/33-github-marketplace-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Marketplace Eylemini Güçlendirme

## Amaç

Doğrulanmış kaynak, en az ayrıcalık ve test edilmiş girdiler ile çıktıları kullanarak üçüncü taraf bir eylemi benimseyin.

## Gereksinimler

- Genel metadata ve kaynak koduna sahip aday bir eylem.
- İş akışının güvenle çalıştırılabileceği bir test deposu veya dalı.
- İncelenen commiti ve güncelleme sahibini kaydetme yöntemi.

## Görevler

1. `action.yml` dosyasını okuyun ve adayın kullandığı her girdiyi, çıktıyı, çalışma zamanını ve izni listeleyin.
2. Kaynağı, bağımlılıkları, sürüm geçmişini ve bakım sinyallerini inceleyin.
3. Değişken etiketi, doğrulanmış tam bir commit SHA ile değiştirin.
4. Hassas olmayan girdiler sağlayan ve beklenen çıktıyı doğrulayan odaklanmış bir iş akışı ekleyin.
5. Güncelleme önerilerinin nasıl incelenip test edileceğini kaydedin.

## Beklenen Sonuç

İş akışı, incelenmiş değişmez bir referans ve asgari izinler kullanır; ayrıca eylemin arayüzünün beklendiği gibi davrandığına dair kanıt bulunur.

## Doğrulama Kontrol Listesi

- [ ] SHA, amaçlanan sürüme göre doğrulanmıştır.
- [ ] Girdiler ve çıktılar metadata ile eşleşir.
- [ ] Gizli bilgiler gereksiz yere yazdırılmaz veya aktarılmaz.
- [ ] Güncelleme ve geri alma süreci belgelenmiştir.

### İlgili İçerik

- Önceki not defteri: [GitHub Actions Runner'ları](../../notebooks/tr/32-github-runners.md)
- Not Defteri: [GitHub Marketplace Eylemleri](../../notebooks/tr/33-github-marketplace-actions.md)
- Alıştırma: [Bir Marketplace Eylemini İnceleme](../../exercises/tr/33-review-a-marketplace-action.md)
- Kısa Sınav: [GitHub Marketplace Eylemleri Kısa Sınavı](../../quizzes/tr/33-github-marketplace-actions-quiz.md)
