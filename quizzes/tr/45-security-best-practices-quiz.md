---
chapter: 45
title: "Güvenlik En İyi Uygulamaları Quiz'i"
related_notebook: "Teslimat İş Akışları için Güvenlik En İyi Uygulamaları"
related_exercise: "Güvenli Teslimat İş Akışını Denetleme"
related_lab: "Güvenlik Kontrolleri İncelemesi Çalıştırma"
level: Intermediate
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/45-security-best-practices.md) | [Alıştırma](../../exercises/tr/45-audit-a-secure-delivery-workflow.md) | [Lab](../../labs/tr/45-run-a-security-controls-review.md) | [Yol Haritası](../../ROADMAP.md)

# Güvenlik En İyi Uygulamaları Quiz'i

## Öğrenme Hedefleri

- Derinlemesine savunma ve en az ayrıcalık uygulamak.
- Sabitlemenin, dal korumasının ve ortamların rolünü tanımak.
- Teslimat güvenliğini incelemek için denetim kanıtı kullanmak.

## Sorular

### Soru 1

Derinlemesine savunma ne demektir?

- A. Tek ve kusursuz tarayıcı
- B. Birden çok bağımsız kontrol
- C. Tüm otomasyonu kaldırmak
- D. Tek ortak kimlik bilgisi kullanmak

**Yanıt:** B.

### Soru 2

Dağıtım izinleri neden işe özel olmalıdır?

**Beklenen Yanıt:** Ele geçirilmiş bir test adımı otomatik olarak dağıtım veya ilgisiz kaynakları değiştirme yetkisi kazanmamalıdır.

### Soru 3

Doğru mu yanlış mı: Tek başına dal koruması üretim dağıtım kimlik bilgilerini korur.

**Yanıt:** Yanlış. Üretim ortamları ve gizli bilgi kapsamı ek dağıtım kontrolleri sağlar.

### Soru 4

Birbirini güçlendiren üç güvenlik kontrolü belirtin.

**Beklenen Yanıt:** En az izinler, sabitlenmiş eylemler, dal koruması, korumalı ortamlar, CodeQL, Dependabot ve denetim günlükleri örneklerdir.

### Soru 5 — Uygulamalı Senaryo

Bir iş akışı `write-all` kullanıyor, pull request kodunu kabul ediyor ve depo çapında bulut belirteciyle dağıtım yapıyor. Öncelik ne olmalıdır?

**Beklenen Yanıt:** İzinleri azaltın, güvenilmeyen kodun üretim gizli bilgilerine erişmesini engelleyin, belirteci korumalı ortama kapsamlandırın, dal kontrolleri ve incelemeleri zorunlu tutun ve yakın etkinliği denetleyin.

## İnceleme Kontrol Listesi

- [ ] Derinlemesine savunmayı açıklayabiliyorum.
- [ ] En az ayrıcalık uygulayabiliyorum.
- [ ] Korumalı ortamları ve dalları anlıyorum.
- [ ] Yararlı denetim kanıtını adlandırabiliyorum.

## İlgili Bağlantılar

- Notebook: [Teslimat İş Akışları için Güvenlik En İyi Uygulamaları](../../notebooks/tr/45-security-best-practices.md)
- Alıştırma: [Güvenli Teslimat İş Akışını Denetleme](../../exercises/tr/45-audit-a-secure-delivery-workflow.md)
- Lab: [Güvenlik Kontrolleri İncelemesi Çalıştırma](../../labs/tr/45-run-a-security-controls-review.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
