---
chapter: 32
title: "GitHub Runner'larını Seçin"
related_notebook: "GitHub Actions Runner'ları"
level: Başlangıç
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/31-github-actions-jobs-and-steps.md) | [Not Defteri](../../notebooks/tr/32-github-runners.md) | [Lab](../../labs/tr/32-configure-runner-selection.md) | [Kısa Sınav](../../quizzes/tr/32-github-runners-quiz.md) | [Roadmap](../../ROADMAP.md)

# GitHub Runner'larını Seçin

## Amaç

Güven sınırlarını zayıflatmadan teknik gereksinimleri karşılayan bir runner stratejisi seçin.

## Senaryo

Bir iş akışının Linux, Docker ve özel bir integration service erişimine ihtiyacı var. Bir fork'tan gelen pull request doğrulamayı başlatabilir, ancak dağıtım yalnızca onaydan sonra çalışır.

## Görevler

1. Doğrulama için hosted veya self-hosted runner seçin ve güven kararınızı açıklayın.
2. Özel bir integration runner için label'lar tanımlayın.
3. İncelenmemiş fork kodunu veya production kimlik bilgilerini hangi job'ın asla almaması gerektiğini belirleyin.

## Beklenen Sonuç

Güvenilmeyen doğrulama için hosted runner'lar, özel integration için yalıtılmış ve etiketlenmiş runner'lar ve dağıtımdan önce bir onay sınırı önerirsiniz.

## Öz Değerlendirme

- [ ] Label'ların yetkilendirmeyi değil, kapasiteyi açıkladığını anlıyorum.
- [ ] Self-hosting bakım sorumluluklarını sayabilirim.
- [ ] Bir runner güven sınırını belirleyebilirim.

### İlgili İçerik

- Not Defteri: [GitHub Actions Runner'ları](../../notebooks/tr/32-github-runners.md)
- Lab: [Runner Seçimini Yapılandırma](../../labs/tr/32-configure-runner-selection.md)
- Kısa Sınav: [GitHub Actions Runner'ları Kısa Sınavı](../../quizzes/tr/32-github-runners-quiz.md)
