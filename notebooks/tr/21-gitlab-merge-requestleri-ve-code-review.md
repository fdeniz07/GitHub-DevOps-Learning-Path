---
chapter: 21
title: "GitLab Merge Request'leri ve Code Review"
part: "GitLab DevOps"
level: Başlangıç
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Önceki Bölüm](20-gitlab-is-ogeleri-issuelar-ve-planlama.md) | [Alıştırma](../../exercises/tr/21-kucuk-bir-merge-requesti-incele.md) | [Laboratuvar](../../labs/tr/21-kucuk-degisikligi-incele-ve-merge-et.md) | [Quiz](../../quizzes/tr/21-gitlab-merge-requestleri-ve-code-review-quiz.md)

## Öğrenme Hedefleri

- bağlamı açık, odaklı bir merge request (MR) açmak;
- kodu, onayları ve tartışmaları yapıcı biçimde incelemek;
- merge öncesinde pipeline ve merge gereksinimlerini değerlendirmek.

## Giriş

Merge request, bir branch değişikliğini ortak branch'e girmeden önce görünür yapar. Önerilen değişikliğin, inceleme konuşmalarının, onayların ve otomatik kanıtların kaydıdır.

## Kuram

| Terim         | Tanım                                                       |
| ------------- | ----------------------------------------------------------- |
| Merge request | Kaynak branch'i hedef branch'e birleştirme önerisi.         |
| Onay          | Proje kuralının istediği veya isteğe bağlı reviewer kararı. |
| Tartışma      | Genellikle belirli bir satıra bağlı yorum zinciri.          |
| Pipeline      | Test, lint veya build gibi otomatik işler.                  |

### İncelenebilir MR

Bir MR, reviewer'ın amacını ve riskini anlayabileceği kadar küçük olmalıdır. Problemi, çözümü, doğrulamayı ve takip işini yazın. Doğru hedef branch'i seçin ve ilgili issue veya work item'ı bağlayın.

```text
Başlık: Proje kontrol komutunu açıklığa kavuştur
Neden: Yeni katılımcılar komutu bulamıyor.
Ne: Doğrulanmış komutu README.md dosyasına ekle.
Doğrulama: Komutu yerelde çalıştırdım.
```

### Pratik İnceleme Akışı

1. Açıklamayı ve kabul kriterlerini okuyun.
2. Diff'i doğruluk, kapsam, testler ve istenmeyen değişiklikler için inceleyin.
3. Tartışmaları, gerekli onayları ve pipeline'ı kontrol edin.
4. Gerekli thread'leri çözün; güncellenen kodu yeniden inceleyin.
5. Yalnızca proje gereksinimleri karşılandığında merge edin.

### Yapıcı Yorumlar

Gözlemi, etkisini ve yardımcı bir sonraki adımı yazın. Yalnızca hata, güvenlik riski, karşılanmayan gereksinim veya kabul edilen standart için engelleyici yorum yapın.

```text
Öneri: Bu metin hesap durumunu açığa çıkarıyor. Kabul kriterindeki nötr mesajı
kullanıp bunun için bir test ekleyebilir miyiz?
```

## İnceleme Türleri ve Gereksinimler

- **Yazarın öz incelemesi:** İstek göndermeden önce diff'i inceleme.
- **Akran incelemesi:** Başka bir katılımcının davranışı ve sürdürülebilirliği kontrol etmesi.
- **Gerekli onay:** Kurallar, belirli rolü veya reviewer sayısını zorunlu kılabilir.
- **Tartışma incelemesi:** Gerekli thread'ler merge öncesinde çözülmelidir.
- **Pipeline incelemesi:** Başarılı zorunlu işler kanıttır, insan incelemesinin yerine geçmez.

Korunan branch'ler onay, başarılı pipeline, çözülmüş tartışma veya güncel kaynak branch isteyebilir. Kesin kurallar proje ayarlarına bağlıdır.

## En İyi Uygulamalar

- Her MR'ı tek bir tutarlı, test edilebilir değişiklikte tutun.
- Amacı ve doğrulama kanıtını açık yazın.
- Zorunlu bulguları isteğe bağlı önerilerden ayırın.
- Başarısız zorunlu kontrolleri atlamayın.

## Yaygın Hatalar

| Hata                                             | Daha iyi yaklaşım                        |
| ------------------------------------------------ | ---------------------------------------- |
| Özellik, temizlik ve biçimlendirmeyi karıştırmak | Bağımsız işleri odaklı MR'lara bölün.    |
| Her tercihi engelleyici saymak                   | Etkiyi açıklayın ve öneriyi işaretleyin. |
| Diff'i incelemeden pipeline'a güvenmek           | Kodu ve gereksinimleri de inceleyin.     |

## Özet

Küçük MR'lar, net yorumlar, tamamlanmış onaylar, çözülmüş tartışmalar ve zorunlu pipeline'lar merge kararını güvenilir kılar.

## Uygulama

[Alıştırma](../../exercises/tr/21-kucuk-bir-merge-requesti-incele.md), [laboratuvar](../../labs/tr/21-kucuk-degisikligi-incele-ve-merge-et.md) ve [quiz](../../quizzes/tr/21-gitlab-merge-requestleri-ve-code-review-quiz.md) ile devam edin.
