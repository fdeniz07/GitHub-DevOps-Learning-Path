---
chapter: 44
title: "Dependabot Quiz'i"
related_notebook: "Dependabot Güncellemeleri"
related_exercise: "Dependabot Güncellemelerini Yapılandırma"
related_lab: "Bir Dependabot Güncellemesini İnceleme"
level: Intermediate
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/44-dependabot.md) | [Alıştırma](../../exercises/tr/44-configure-dependabot-updates.md) | [Lab](../../labs/tr/44-review-a-dependabot-update.md) | [Yol Haritası](../../ROADMAP.md)

# Dependabot Quiz'i

## Öğrenme Hedefleri

- Dependabot'un neyi otomatikleştirdiğini açıklamak.
- Doğrudan, geçişli ve eylem güncellemelerini incelemek.
- Güvenli birleştirme ve yok sayma politikaları uygulamak.

## Sorular

### Soru 1

Dependabot öncelikle ne oluşturur?

- A. Otomatik üretim dağıtımları
- B. Bağımlılık güncellemesi pull request'leri
- C. Kullanıcı hesapları
- D. CodeQL sorguları

**Yanıt:** B.

### Soru 2

Kilit dosyası neden incelenmelidir?

**Beklenen Yanıt:** Bildirim farkı küçük olsa bile değişebilecek geçişli paketler dahil çözümlenen bağımlılık grafiğini kaydeder.

### Soru 3

Doğru mu yanlış mı: Dependabot oluşturduğu için bir PR test olmadan birleştirilebilir.

**Yanıt:** Yanlış. Güncellemeler inceleme, uyumluluk testi ve güvenlik kontrolleri gerektirir.

### Soru 4

`github-actions` ekosistemini izlemenin bir nedenini belirtin.

**Beklenen Yanıt:** İş akışı eylemleri yazılım tedarik zincirinin parçasıdır; düzeltmeler alabilir veya kırıcı değişiklikler getirebilir.

### Soru 5 — Uygulamalı Senaryo

Gruplanmış güncelleme birim testlerini geçiyor ancak major sürümü değiştiriyor ve sürüm notları kaldırılmış bir API'den söz ediyor. Sıradaki adım nedir?

**Beklenen Yanıt:** Otomatik birleştirmeyin. Geçiş rehberini okuyun, daha geniş testler çalıştırın, gerekirse kodu uyarlayın ve bir sahibin incelemesini isteyin.

## İnceleme Kontrol Listesi

- [ ] Dependabot önerilerini anlıyorum.
- [ ] Kilit dosyası ve geçişli değişiklikleri inceliyorum.
- [ ] Eylem güncellemelerini inceliyorum.
- [ ] Sahipli ve süre sınırlı yok sayma kuralları kullanıyorum.

## İlgili Bağlantılar

- Notebook: [Dependabot Güncellemeleri](../../notebooks/tr/44-dependabot.md)
- Alıştırma: [Dependabot Güncellemelerini Yapılandırma](../../exercises/tr/44-configure-dependabot-updates.md)
- Lab: [Bir Dependabot Güncellemesini İnceleme](../../labs/tr/44-review-a-dependabot-update.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
