---
chapter: 43
title: "CodeQL Quiz'i"
related_notebook: "CodeQL Analizi"
related_exercise: "CodeQL Analizini Tanıtma"
related_lab: "Bir CodeQL Bulgusunu İnceleme"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/43-codeql.md) | [Alıştırma](../../exercises/tr/43-introduce-codeql-analysis.md) | [Lab](../../labs/tr/43-triage-a-codeql-finding.md) | [Yol Haritası](../../ROADMAP.md)

# CodeQL Quiz'i

## Öğrenme Hedefleri

- Anlamsal CodeQL analizini açıklamak.
- Gerekli iş akışı izinlerini tanımak.
- Veri akışı kanıtıyla uyarıları incelemek.

## Sorular

### Soru 1

CodeQL neyi analiz eder?

- A. Yalnızca commit mesajlarını
- B. Sorguları kullanarak kodu veri olarak
- C. Yalnızca dağıtım çalışma süresini
- D. Paket indirme hızını

**Yanıt:** B.

### Soru 2

Kod tarama sonuçlarının yüklenmesine genellikle hangi izin olanak tanır?

**Beklenen Yanıt:** `security-events: write`.

### Soru 3

Doğru mu yanlış mı: Her CodeQL uyarısı kullanılabilir bir güvenlik açığının varlığını kanıtlar.

**Yanıt:** Yanlış. Uyarı erişilebilirlik, temizleme ve bağlam açısından incelenmelidir.

### Soru 4

Veri akışı bulgusunda kaynak ve hedef nedir?

**Beklenen Yanıt:** Kaynak verinin girdiği veya güvenilmeyen hâle geldiği yerdir; hedef bu veriyle güvensiz olabilecek hassas işlemdir.

### Soru 5 — Uygulamalı Senaryo

Bir uyarı kullanıcı girdisini veritabanı sorgusuna kadar izliyor ancak sorgudan önce doğrulanmış parametreleme kullanılıyor. Ne yapmalısınız?

**Beklenen Yanıt:** Uygulamayı ve çağrı yolunu inceleyin, davranışı test edin ve yalnızca temizlemenin etkili olduğu kanıtlanırsa gerekçeli reddetmeyi belgeleyin.

## İnceleme Kontrol Listesi

- [ ] Anlamsal analizi anlıyorum.
- [ ] Yükleme iznini biliyorum.
- [ ] Kaynaktan hedefe incelemeyi açıklayabiliyorum.
- [ ] Düzeltmeyi veya reddetmeyi belgeleyebiliyorum.

## İlgili Bağlantılar

- Notebook: [CodeQL Analizi](../../notebooks/tr/43-codeql.md)
- Alıştırma: [CodeQL Analizini Tanıtma](../../exercises/tr/43-introduce-codeql-analysis.md)
- Lab: [Bir CodeQL Bulgusunu İnceleme](../../labs/tr/43-triage-a-codeql-finding.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
