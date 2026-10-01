---
chapter: 36
title: "Bir Matrix İş Akışını Test Edin"
related_notebook: "GitHub Actions Matrix Build'leri"
level: Orta
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Bölüm](../../notebooks/tr/35-composite-actions.md) | [Not Defteri](../../notebooks/tr/36-github-actions-matrix-builds.md) | [Lab](../../labs/tr/36-run-a-multi-platform-matrix.md) | [Kısa Sınav](../../quizzes/tr/36-matrix-builds-quiz.md) | [Roadmap](../../ROADMAP.md)

# Bir Matrix İş Akışını Test Edin

## Amaç

Desteklenmeyen durumları gizlemeden desteklenen runtime ve işletim sistemi kombinasyonlarını test eden bir matrix tasarlayın.

## Öğrenme Kazanımları

- bir matrix'in oluşturduğu kombinasyonları hesaplamak;
- `include` ve `exclude` ifadelerini bilinçli kullanmak;
- yararlı bir `fail-fast` policy seçmek.

## Ön Koşullar

- [GitHub Actions Matrix Build'leri](../../notebooks/tr/36-github-actions-matrix-builds.md) konusunu tamamlayın.
- Küçük bir test komutu içeren bir repository.

## Senaryo

Projeniz Ubuntu ve Windows üzerinde iki runtime'ı destekliyor, ancak eski bir runtime Windows'ta desteklenmiyor. Bu policy'yi tek bir job içinde ifade edin.

## Görevler

### Görev 1

`os: [ubuntu-latest, windows-latest]` ve iki runtime değeri içeren bir matrix yazın. Başlangıçtaki her kombinasyonu listeleyin.

### Beklenen Sonuç

Exclusion uygulamadan önce Cartesian product'ı ifade edebilirsiniz.

### Görev 2

Desteklenmeyen kombinasyonu dışlayın ve cross-platform teşhisinin önemli olup olmadığına göre `fail-fast` ayarlayın.

### Beklenen Sonuç

Yalnızca desteklenen kombinasyonlar çalışır ve failure policy bilinçli biçimde seçilmiştir.

### Görev 3

Her iki matrix değerini job içinde yazdırın ve çalıştırma özetinin her kombinasyon için tek bir net sonuç içerdiğini doğrulayın.

### Beklenen Sonuç

Her job işletim sistemi ve runtime'ı ile tanımlanabilir.

## Zorluk

Bir deneysel kombinasyonu non-blocking olarak işaretlemek için `include` kullanın, ardından ödünleşimi açıklayın.

## Öz Değerlendirme

- [ ] Genişletilmiş kombinasyonları tahmin edebilirim.
- [ ] Bir exclusion'ı gerekçelendirebilirim.
- [ ] `fail-fast` etkisini açıklayabilirim.

## Yaygın Hatalar

| Hata                                      | Çözüm                                     |
| ----------------------------------------- | ----------------------------------------- |
| Desteklenmeyen kombinasyonları test etmek | Support policy'yi `exclude` ile kodlayın. |
| Belirsiz log'lar                          | Her job'da matrix boyutlarını yazdırın.   |
| Yararlı teşhisleri iptal etmek            | `fail-fast` seçimini amaca göre yapın.    |

## Özet

Job'ları tekrarlamak yerine bir support policy'yi okunabilir ve sınırlandırılmış bir matrix olarak ifade ettiniz.

### İlgili İçerik

- Not Defteri: [GitHub Actions Matrix Build'leri](../../notebooks/tr/36-github-actions-matrix-builds.md)
- Lab: [Çok Platformlu Bir Matrix Çalıştırma](../../labs/tr/36-run-a-multi-platform-matrix.md)
- Kısa Sınav: [Matrix Build'leri Kısa Sınavı](../../quizzes/tr/36-matrix-builds-quiz.md)
