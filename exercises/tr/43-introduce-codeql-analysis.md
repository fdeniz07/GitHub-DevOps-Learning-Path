---
chapter: 43
title: "CodeQL Analizini Tanıtma"
related_notebook: "CodeQL Analizi"
related_lab: "Bir CodeQL Bulgusunu İnceleme"
related_quiz: "CodeQL Quiz'i"
level: Intermediate
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/43-codeql.md) | [Lab](../../labs/tr/43-triage-a-codeql-finding.md) | [Yol Haritası](../../ROADMAP.md)

# CodeQL Analizini Tanıtma

## Amaç

Değişiklikler ve zamanlama üzerinde güvenlik bulguları raporlayan bir CodeQL iş akışını planlayın ve inceleyin.

## Sonuçlar

- CodeQL tetikleyicilerini ve dil yapılandırmasını seçmek.
- `security-events: write` değerini açıklamak.
- Kaynak, hedef ve temizleme kanıtıyla bir bulguyu incelemek.

## Ön Koşullar

- [CodeQL Analizi notebook'unu](../../notebooks/tr/43-codeql.md) okuyun.
- GitHub Actions işlerini ve izinlerini anlayın.
- Temel güvenli kodlama terimlerini bilin.

## Senaryo

Bir Python hizmetinde statik güvenlik analizi yok. Yeni iş akışı pull request'leri, `main` push'larını ve haftalık zamanlanmış kodu analiz etmelidir. Güvenlik ekibinin belgelenmiş bir uyarı inceleme sürecine de ihtiyacı var.

## Görevler

### Görev 1 — Analizi yapılandırın

`CodeQL` iş akışı adını, tetikleyicileri, matris dilini, checkout'u, `github/codeql-action/init@v3` ve `github/codeql-action/analyze@v3` adımlarını yazın.

**Beklenen Sonuç:** İş akışı Python'u analiz edebilir ve sonuçları yükleyebilir.

### Görev 2 — İzinleri uygulayın

`contents: read` ve `security-events: write` ekleyin. İkincisinin neden gerekli olduğunu ve daha geniş izinlerin neden gereksiz olduğunu açıklayın.

**Beklenen Sonuç:** Sonuçlar en az ayrıcalıkla yüklenebilir.

### Görev 3 — İncelemeyi tanımlayın

Varsayımsal bir uyarı için kaynağı, hedefi, veri akışını, temizlemeyi, önem derecesini ve düzeltme kararını kaydedin.

**Beklenen Sonuç:** Karar genel bir reddetmeye değil kanıta dayanır.

## Meydan Okuma

Kaynak kod değişmemiş olsa bile zamanlanmış bir çalışmanın ne zaman yeni bir uyarı bulabileceğini açıklayın.

## Öz Değerlendirme

- [ ] Gerekli CodeQL eylemlerini yapılandırabiliyorum.
- [ ] `security-events: write` değerini anlıyorum.
- [ ] Kaynaktan hedefe bir yolu açıklayabiliyorum.
- [ ] Bir düzeltmeyi veya reddetmeyi belgeleyebiliyorum.

## Yaygın Hatalar

| Hata                                   | Çözüm                                                     |
| -------------------------------------- | --------------------------------------------------------- |
| Sonuç yükleme iznini unutmak           | Yalnızca `security-events: write` ekleyin.                |
| Her uyarıyı kullanılabilir açık saymak | Erişilebilirliği ve temizlemeyi inceleyin.                |
| Analizi yalnızca bir kez çalıştırmak   | Pull request, push ve zamanlanmış tetikleyiciler ekleyin. |

## Özet

CodeQL, iş akışı doğru izinlerle yapılandırıldığında ve bulgular tutarlı biçimde incelendiğinde en değerlidir.

## İlgili Bağlantılar

- Notebook: [CodeQL Analizi](../../notebooks/tr/43-codeql.md)
- Lab: [Bir CodeQL Bulgusunu İnceleme](../../labs/tr/43-triage-a-codeql-finding.md)
- Quiz: [CodeQL Quiz'i](../../quizzes/tr/43-codeql-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
