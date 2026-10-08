---
chapter: 43
title: "Bir CodeQL Bulgusunu İnceleme"
related_notebook: "CodeQL Analizi"
related_exercise: "CodeQL Analizini Tanıtma"
related_quiz: "CodeQL Quiz'i"
level: Intermediate
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/43-codeql.md) | [Alıştırma](../../exercises/tr/43-introduce-codeql-analysis.md) | [Yol Haritası](../../ROADMAP.md)

# Bir CodeQL Bulgusunu İnceleme

## Amaç

CodeQL analizini çalıştırın veya inceleyin ve kod tarama bulgusu hakkında belgelenmiş karar verin.

## Sonuçlar

- CodeQL iş akışı izinlerini ve sonuçlarını doğrulamak.
- Bir bulguyu kaynaktan hedefe izlemek.
- Bir uyarıyı kanıtla düzeltmek, izlemek veya reddetmek.

## Ön Koşullar

- Notebook'u ve alıştırmayı tamamlayın.
- Desteklenen bir dil için CodeQL etkinleştirilmiş depo.
- Kod tarama uyarılarını görme izni.

## Senaryo

CodeQL bir web hizmetinde olası enjeksiyon yolu bildiriyor. Güvenilmeyen girdinin hassas hedefe ulaşıp ulaşmadığını belirlemeli ve düzeltme önermelisiniz.

## Ortam

| Gereksinim      | Değer                                            |
| --------------- | ------------------------------------------------ |
| İşletim Sistemi | Windows, Linux veya macOS                        |
| Yazılım         | GitHub Actions ve CodeQL etkin depo              |
| Erişim          | Kod tarama uyarıları ve pull request kontrolleri |

## Görevler

### Görev 1 — Analizi doğrulayın

İş akışını `github/codeql-action/init@v3`, `github/codeql-action/analyze@v3`, dil seçimi, tetikleyiciler ve `security-events: write` için inceleyin.

**Beklenen Sonuç:** İş akışı SARIF sonuçları üretip yükleyebilir.

### Görev 2 — Uyarıyı izleyin

Uyarıyı açın; kaynağını, hedefini, veri akışını, temizlemeyi, önem derecesini ve erişilebilir yürütme yolunu belirleyin.

**Beklenen Sonuç:** Uyarı gerçek uygulama davranışı bağlamında anlaşılır.

### Görev 3 — Sorumlu biçimde çözün

Bir düzeltme uygulayıp test edin veya kanıta dayalı gerekçeyle bulguyu reddedin. Kararı ve takip sahibini kaydedin.

**Beklenen Sonuç:** Uyarı sessizce yok sayılmaz ve seçilen işlem denetlenebilir.

## Doğrulama Kontrol Listesi

- [ ] İş akışı izinleri en az düzeyde.
- [ ] CodeQL hedeflenen olaylarda çalışıyor.
- [ ] Kaynak ve hedef belirlendi.
- [ ] Düzeltme test edildi veya reddetme kanıtı kaydedildi.
- [ ] Uyarı durumu güncellendi.

## Sorun Giderme

| Sorun                       | Olası Neden                      | Çözüm                                                |
| --------------------------- | -------------------------------- | ---------------------------------------------------- |
| Sonuç görünmüyor            | Yükleme izni eksik               | `security-events: write` ekleyin.                    |
| Uyarı ilgisiz görünüyor     | Veri akışı anlaşılmadı           | Kaynaktan hedefe yolu takip edin.                    |
| Düzeltme uyarıyı kapatmıyor | Sorgu güvensiz yolu hâlâ görüyor | Temizlemeyi yeniden kontrol edip analizi çalıştırın. |

## En İyi Uygulamalar

- Bulguları kesin karar değil, araştırma ipucu sayın.
- Güvenlik düzeltmelerini küçük tutun ve testlerle kapsayın.
- Sorgu iyileştirmelerinin uygulanması için analizi zamanlayın.

## Özet

CodeQL incelemesi otomatik analizi dikkatli kaynak incelemesi, test ve sorumlu kararlarla birleştirir.

## İlgili Bağlantılar

- Notebook: [CodeQL Analizi](../../notebooks/tr/43-codeql.md)
- Alıştırma: [CodeQL Analizini Tanıtma](../../exercises/tr/43-introduce-codeql-analysis.md)
- Quiz: [CodeQL Quiz'i](../../quizzes/tr/43-codeql-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
