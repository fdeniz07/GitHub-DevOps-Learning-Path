---
chapter: 46
title: "Docker Temelleri Quizi"
related_notebook: "Docker Temelleri: İmajlar, Konteynerler ve Ağlar"
related_exercise: "Bir Uygulamayı Konteynerleştirme"
related_lab: "Konteyner Oluşturma ve Çalıştırma"
level: Beginner
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/46-docker-fundamentals.md) | [Alıştırma](../../exercises/tr/46-containerize-an-application.md) | [Lab](../../labs/tr/46-build-and-run-a-container.md) | [Yol Haritası](../../ROADMAP.md)

# Docker Temelleri Quizi

## Öğrenme Hedefleri

- İmajları, konteynerleri, volume'ları ve ağları açıklamak.
- Açık port ve depolama davranışı seçmek.
- Root olmayan konteyner çalışmasını uygulamak.

## Sorular

### Soru 1

Docker imajı nedir?

- A. Yalnızca çalışan bir süreç
- B. Konteyner oluşturmak için kullanılan değişmez, katmanlı paket
- C. Ana makine güvenlik duvarı kuralı
- D. Registry kimlik bilgisi

**Cevap:** B. İmaj, konteynerin oluşturulduğu katmanlı pakettir.

### Soru 2

Yalnızca konteynerin yazılabilir katmanına yazılan veriler konteyner kaldırıldığında ne olur?

**Cevap:** Kaybolur. Değiştirme sonrasında kalması gereken durum için adlandırılmış volume veya harici veri hizmeti kullanın.

### Soru 3

Doğru mu yanlış mı: `EXPOSE 8080`, 8080 portunu ana makinede otomatik olarak yayınlar.

**Cevap:** Yanlış. `EXPOSE` amacı belgeler; `--publish 8080:8080` ana makine eşlemesini oluşturur.

### Soru 4

Bir uygulama neden normalde root olmayan kullanıcı olarak çalışmalıdır?

**Cevap:** Ele geçirmenin etkisini azaltır ve sahiplik ile izin varsayımlarını açıklaştırır.

### Soru 5

İki konteyner portlarını ana makineye yayınlamadan nasıl iletişim kurabilir?

**Cevap:** Aynı kullanıcı tanımlı Docker ağına bağlanıp diğer konteynerin hizmet adını kullanarak.

### Soru 6

Geçici bir önbellek için hangi depolama uygundur?

- A. Konteyner yazılabilir katmanı veya geçici volume
- B. İmajda production veritabanı parolası
- C. Genel registry etiketi
- D. Ana makine portu

**Cevap:** A. Uygulama önbelleği yeniden oluşturabiliyorsa kalıcı depolama gerektirmez.

## Uygulamalı Senaryo

Bir hizmet yüklemeleri `/app/uploads` içine yazıyor, root olarak çalışıyor ve `-p 8080:8080` ile başlatılıyor. Daha güvenli bir dağıtım için üç değişiklik önerin.

**Beklenen Cevap:** Özel kullanıcı oluşturun, `/app/uploads`'ı adlandırılmış volume'a veya harici depolamaya bağlayın ve yalnızca gereken ana makine portunu yayınlayın. Ayrıca health davranışı ekleyin ve sırları imaja kopyalamayın.

## İnceleme Checklist'i

- [ ] İmaj ile konteyneri ayırt edebilirim.
- [ ] Volume kalıcılığını açıklayabilirim.
- [ ] Kullanıcı tanımlı ağ kullanabilirim.
- [ ] Root olmayan süreci doğrulayabilirim.
- [ ] `EXPOSE` ile `--publish` farkını anlıyorum.

## İlgili Bağlantılar

- Notebook: [Docker Temelleri](../../notebooks/tr/46-docker-fundamentals.md)
- Alıştırma: [Bir uygulamayı konteynerleştirme](../../exercises/tr/46-containerize-an-application.md)
- Lab: [Konteyner oluşturma ve çalıştırma](../../labs/tr/46-build-and-run-a-container.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
