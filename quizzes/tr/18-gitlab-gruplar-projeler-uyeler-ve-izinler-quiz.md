---
chapter: 18
title: "GitLab Gruplar, Projeler, Üyeler ve İzinler Quiz'i"
related_notebook: "GitLab Gruplar, Projeler, Üyeler ve İzinler"
related_exercise: "GitLab Proje Erişimini Planla"
related_lab: "GitLab Proje Erişimini Yapılandır"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md) | [Alıştırma](../../exercises/tr/18-gitlab-proje-erisimini-planla.md) | [Laboratuvar](../../labs/tr/18-gitlab-proje-erisimini-yapilandir.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Gruplar, Projeler, Üyeler ve İzinler Quiz'i

## Amaç

Basit bir GitLab erişim modelini en az ayrıcalıkla tasarlayıp tasarlayamadığını kontrol et.

## Bölüm A - Çoktan Seçmeli

### Soru 1

Group üyeliği neden yararlıdır?

- A. Her kullanıcıya otomatik Owner verir.
- B. İlişkili projectler arasında ortak erişim sağlayabilir.
- C. Project görünürlüğü ayarını kaldırır.
- D. Branch korumasını devre dışı bırakır.

**Cevap:** B

**Açıklama:** Bir group ilişkili projectlere ortak erişim verebilir. Atanan rolün yine uygun olması gerekir.

### Soru 2

`main` branchine normal doğrudan pushları en iyi hangi kontrol engeller?

- A. Korunan branch kuralı
- B. Project açıklaması
- C. Issue etiketi
- D. Public görünürlük

**Cevap:** A

**Açıklama:** Korunan branchler, yapılandırılmış kurala göre push ve merge işlemlerini sınırlar.

## Bölüm B - Doğru veya Yanlış

### Soru 3

Private project ile Developer rolü aynı tür erişim kontrolüdür.

- Doğru
- Yanlış

**Cevap:** Yanlış

**Açıklama:** Görünürlük keşfetme ve okumayı; üyelik ile rol ise yetkili işlemleri kontrol eder.

### Soru 4

Erişim incelemesi, kalıtımlı group üyeliğini ve doğrudan project üyeliğini kapsamalıdır.

- Doğru
- Yanlış

**Cevap:** Doğru

**Açıklama:** Kullanıcı üst group üzerinden etkin erişimi sürdürebilir.

## Bölüm C - Kısa Yanıt

### Soru 5

GitLab rolü atarken en az ayrıcalık ne anlama gelir?

**Beklenen Cevap:** Belgelenmiş görev için en düşük rolü ve en dar kapsamı vermek; ihtiyaç bittiğinde erişimi incelemek veya kaldırmaktır.

### Soru 6

Project üyeliği ne zaman group üyeliğinden daha uygundur?

**Beklenen Cevap:** Erişim yalnızca tek bir project veya dar bir istisna için gerekiyorsa, ilişkili birkaç projectte kalıcı ihtiyaç yoksa uygundur.

## Bölüm D - Pratik Senaryo

### Senaryo

Morgan kısa bir denetim için özel bir projectte salt-okunur erişime ihtiyaç duyuyor. Projectin grubu üretim repositorylerini de içeriyor.

### Soru

En güvenli erişim kararı nedir?

**Beklenen Cevap:** Morgan'a yalnızca denetlenen projectte en düşük salt-okunur rolü ver, bitiş veya inceleme tarihi kaydet ve geniş group üyeliğinden kaçın. Korunan branch kuralını değiştirme.

## Puanlama Rehberi

| Puan     | Değerlendirme                                             |
| -------- | --------------------------------------------------------- |
| 90-100%  | Çok iyi: GitLab erişim kontrollerini bilinçli uygularsın. |
| 75-89%   | İyi: Üyelik kapsamını ve branch korumasını tekrar et.     |
| 75% altı | Notebooku gözden geçir ve laboratuvarı tekrarla.          |

### İlgili İçerik

- Notebook: [GitLab Gruplar, Projeler, Üyeler ve İzinler](../../notebooks/tr/18-gitlab-gruplar-projeler-uyeler-ve-izinler.md)
- Alıştırma: [GitLab Proje Erişimini Planla](../../exercises/tr/18-gitlab-proje-erisimini-planla.md)
- Laboratuvar: [GitLab Proje Erişimini Yapılandır](../../labs/tr/18-gitlab-proje-erisimini-yapilandir.md)
- [Yol Haritası](../../ROADMAP.md)
