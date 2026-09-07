---
chapter: 21
title: "Küçük Değişikliği İncele ve Merge Et"
related_notebook: "GitLab Merge Request'leri ve Code Review"
related_exercise: "Küçük Bir Merge Request'i İncele"
level: Başlangıç
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md) | [Notebook](../../notebooks/tr/21-gitlab-merge-requestleri-ve-code-review.md) | [Alıştırma](../../exercises/tr/21-kucuk-bir-merge-requesti-incele.md) | [Quiz](../../quizzes/tr/21-gitlab-merge-requestleri-ve-code-review-quiz.md)

## Küçük Değişikliği İncele ve Merge Et

## Amaç

Küçük bir dokümantasyon iyileştirmesini GitLab merge request üzerinden teslim edin.

## Ön Koşullar

- [Bölüm 20 notebook'u](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md) tamamlandı.
- Branch ve merge request oluşturma izniniz olan bir GitLab projesi.

## Görevler

1. Gözlemlenebilir kabul kriteri olan bir dokümantasyon düzeltmesi için work item oluşturun veya seçin.
2. `123-kurulum-komutunu-netlestir` gibi bir branch oluşturun, yalnızca gereken değişikliği yapın ve diff'i kendiniz inceleyin.
3. Doğru hedef branch'e MR açın. Neden, ne değişti, nasıl doğrulandı ve work item bağlantısını yazın.
4. Reviewer isteyin. Gerekli bulgu veya öneri olan yapıcı bir satır yorumu ekleyin.
5. Gerekli onayları, çözülmüş tartışmaları ve pipeline'ı kontrol edin. Geri bildirim varsa branch'i güncelleyin.
6. Yalnızca proje gereksinimleri geçtiğinde merge edin ve sonucu hedef branch'te doğrulayın.

## Beklenen Sonuç

MR odaklı ve anlaşılırdır, work item'a bağlıdır ve gerekli inceleme ile pipeline kanıtlarına sahiptir.

## Doğrulama Kontrol Listesi

- [ ] MR tek bir tutarlı değişiklik içeriyor.
- [ ] Açıklama doğrulama kanıtını içeriyor.
- [ ] Yorumlar açık ve saygılı.
- [ ] Zorunlu onaylar ve tartışmalar tamamlandı.
- [ ] Pipeline'ın zorunlu işleri merge öncesinde başarılı.

## İlgili İçerik

- Notebook: [GitLab Merge Request'leri ve Code Review](../../notebooks/tr/21-gitlab-merge-requestleri-ve-code-review.md)
- Alıştırma: [Küçük Bir Merge Request'i İncele](../../exercises/tr/21-kucuk-bir-merge-requesti-incele.md)
- Quiz: [GitLab Merge Request'leri ve Code Review Quiz'i](../../quizzes/tr/21-gitlab-merge-requestleri-ve-code-review-quiz.md)
