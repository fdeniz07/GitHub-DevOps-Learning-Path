---
chapter: 32
title: "Runner Seçimini Yapılandırma"
related_notebook: "GitHub Actions Runner'ları"
related_exercise: "GitHub Runner'larını Seçme"
level: Beginner
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/31-github-actions-jobs-and-steps.md) | [Not Defteri](../../notebooks/tr/32-github-runners.md) | [Alıştırma](../../exercises/tr/32-select-github-runners.md) | [Kısa Sınav](../../quizzes/tr/32-github-runners-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Runner Seçimini Yapılandırma

## Amaç

Olağan doğrulama ve hassas entegrasyon çalışmaları için runner yönlendirmesini yapılandırın ve belgeleyin.

## Gereksinimler

- Depo veya kuruluş yöneticisi erişimi ya da yalnızca tasarım yapılan laboratuvar modu için yazılı bir tasarım.
- Zararsız bir doğrulama komutu çalıştıran bir iş akışı.
- Self-hosted altyapının gerekip gerekmediğine dair net bir karar.

## Görevler

1. Doğrulamayı GitHub tarafından barındırılan bir runner'da çalıştırın ve imajını ve araçlarını kaydedin.
2. `self-hosted`, `linux` ve `integration` gibi özel bir self-hosted etiket kümesi tanımlayın; güvenilmeyen pull request'leri bu kümeye yönlendirmeyin.
3. Runner grubu erişimini, yama uygulama, temizleme, izleme ve kaldırma sorumluluklarını belgeleyin.
4. Eşleşmeyen etiketlere sahip bir işin yanlış makinede çalışmak yerine kuyrukta kaldığını test edin.

## Beklenen Sonuç

Depoda belgelenmiş bir yönlendirme kararı vardır ve incelenmemiş kodu hassas bir runner'a gönderen hiçbir iş akışı yolu yoktur.

## Doğrulama Kontrol Listesi

- [ ] Barındırılan ve self-hosted seçeneklerin ödünleşimleri kaydedilmiştir.
- [ ] Etiketler yetenekleri doğru şekilde tanımlar.
- [ ] Hassas erişim gruplar veya onaylarla sınırlandırılmıştır.
- [ ] Runner temizliği ve bakımı için bir sorumlu vardır.

### İlgili İçerik

- Önceki not defteri: [GitHub Actions İşleri ve Adımları](../../notebooks/tr/31-github-actions-jobs-and-steps.md)
- Not Defteri: [GitHub Actions Runner'ları](../../notebooks/tr/32-github-runners.md)
- Alıştırma: [GitHub Runner'larını Seçme](../../exercises/tr/32-select-github-runners.md)
- Kısa Sınav: [GitHub Actions Runner'ları Kısa Sınavı](../../quizzes/tr/32-github-runners-quiz.md)
