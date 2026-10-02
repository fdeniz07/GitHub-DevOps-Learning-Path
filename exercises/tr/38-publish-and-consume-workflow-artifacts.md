---
chapter: 38
title: "İş Akışı Artifact'larını Yayımlayın ve Tüketin"
related_notebook: "GitHub Actions Artifact'ları"
level: Orta
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/37-github-actions-dependency-caching.md) | [Not Defteri](../../notebooks/tr/38-github-actions-artifacts.md) | [Lab](../../labs/tr/38-share-build-artifacts-between-jobs.md) | [Kısa Sınav](../../quizzes/tr/38-artifacts-quiz.md) | [Roadmap](../../ROADMAP.md)

# İş Akışı Artifact'larını Yayımlayın ve Tüketin

## Amaç

Açık bir artifact contract ile bir build sonucunu yalıtılmış iki job arasında taşıyın.

## Öğrenme Kazanımları

- yalnızca gerekli dosyaları yüklemek;
- producer ve consumer job'larını `needs` ile koordine etmek;
- bir retention period seçmek ve indirilen içeriği doğrulamak.

## Ön Koşullar

- [GitHub Actions Artifact'ları](../../notebooks/tr/38-github-actions-artifacts.md) konusunu tamamlayın.
- Küçük bir build komutu içeren bir repository.

## Senaryo

Bir build job'ı bir report ve bir package oluşturuyor. Ayrı bir inspection job'ı report'u okumalı, release job'ı ise validation sonrasında yalnızca package'ı almalı.

## Görevler

### Görev 1

Dosyaları ayrı `reports/` ve `dist/` dizinlerine yazan bir build job'ı oluşturun. Gerekli dosyaları açıklayıcı adlarla yükleyin.

### Beklenen Sonuç

Artifact yolları dardır ve secret'ları veya tüm workspace'i içermez.

### Görev 2

`needs: build` içeren bir consumer job ekleyin, beklenen artifact'ı bilinen bir dizine indirin ve içeriğini listeleyin.

### Beklenen Sonuç

Consumer, farklı bir runner kullansa bile producer'ın dosyalarını görür.

### Görev 3

Bir test report'u için uygun retention ayarlayın ve herhangi bir publish action'ından önce bir validation adımı ekleyin.

### Beklenen Sonuç

Yaşam döngüsü ve güven sınırı açıkça tanımlanmıştır.

## Zorluk

İş akışını matrix build'leri için uyarlayın ve artifact adlarını işletim sistemi başına benzersiz hâle getirin.

## Öz Değerlendirme

- [ ] Bir artifact'ı bir cache'den ayırt edebilirim.
- [ ] Job sınırını modellemek için `needs` kullandım.
- [ ] İndirilen dosyaları kullanmadan önce doğruluyorum.

## Yaygın Hatalar

| Hata                                             | Çözüm                             |
| ------------------------------------------------ | --------------------------------- |
| Workspace dosyalarının kalıcı olduğunu varsaymak | Bir artifact yükleyin ve indirin. |
| Tüm workspace'i yüklemek                         | Yalnızca gerekli yolları seçin.   |
| İndirilen dosyaları kontrol etmeden çalıştırmak  | Önce içeriği doğrulayın.          |

## Özet

Yalıtılmış iş akışı job'ları arasında açık ve incelenebilir bir dosya aktarımı oluşturdunuz.

### İlgili İçerik

- Not Defteri: [GitHub Actions Artifact'ları](../../notebooks/tr/38-github-actions-artifacts.md)
- Lab: [Build Artifact'larını Job'lar Arasında Paylaşma](../../labs/tr/38-share-build-artifacts-between-jobs.md)
- Kısa Sınav: [Artifact'lar Kısa Sınavı](../../quizzes/tr/38-artifacts-quiz.md)
