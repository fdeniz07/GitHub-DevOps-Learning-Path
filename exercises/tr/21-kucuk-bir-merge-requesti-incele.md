---
chapter: 21
title: "Küçük Bir Merge Request'i İncele"
related_notebook: "GitLab Merge Request'leri ve Code Review"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md) | [Notebook](../../notebooks/tr/21-gitlab-merge-requestleri-ve-code-review.md) | [Laboratuvar](../../labs/tr/21-kucuk-degisikligi-incele-ve-merge-et.md) | [Quiz](../../quizzes/tr/21-gitlab-merge-requestleri-ve-code-review-quiz.md)

## Küçük Bir Merge Request'i İncele

## Amaç

Bir dokümantasyon MR'ı için odaklı ve yapıcı inceleme yapmayı uygulayın.

## Senaryo

Bir MR, README'ye kurulum komutu ekliyor. Açıklama komutun test edildiğini söylüyor; ancak diff ayrıca ilgisiz başlık büyük-küçük harf değişiklikleri içeriyor.

## Görevler

### Görev 1 - Amacı incele

Başlığı, bağlı work item'ı, hedef branch'i ve kabul kriterini doğrulayın: Yeni katılımcı belgelenmiş komutu bulup çalıştırabilmelidir.

### Görev 2 - Değişikliği incele

Komutu proje dokümantasyonu ile karşılaştırın. İlgisiz biçimlendirme değişikliğinin bu MR'a ait olup olmadığına karar verin.

### Görev 3 - Geri bildirim yaz

Komut yanlış veya eksikse gerekli yorum yazın; doğruysa onaylayın. Biçimlendirme için ayrı, engelleyici olmayan bir öneri yazın.

**Örnek:** `Soru: Bu komut güncel projede doğrulandı mı? Kabul kriteri çalıştırılabilir bir komut istiyor.`

### Görev 4 - Merge hazır oluşunu belirle

Gerekli kanıtları listeleyin: zorunlu onaylar, çözülmüş gerekli tartışmalar ve başarılı zorunlu pipeline.

## Öz Değerlendirme

- [ ] Stil hakkında yorum yapmadan önce amacı kontrol ettim.
- [ ] Engelleyici bulgu ile öneriyi ayırabiliyorum.
- [ ] Gerekli merge kanıtlarını biliyorum.

## İlgili İçerik

- Önceki bölüm: [GitLab İş Ögeleri, Issue'lar ve Planlama](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md)
- Notebook: [GitLab Merge Request'leri ve Code Review](../../notebooks/tr/21-gitlab-merge-requestleri-ve-code-review.md)
- Laboratuvar: [Küçük Değişikliği İncele ve Merge Et](../../labs/tr/21-kucuk-degisikligi-incele-ve-merge-et.md)
- Quiz: [GitLab Merge Request'leri ve Code Review Quiz'i](../../quizzes/tr/21-gitlab-merge-requestleri-ve-code-review-quiz.md)
