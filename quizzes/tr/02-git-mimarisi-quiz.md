---
chapter: 02
title: "Git Mimarisi Quiz"
related_notebook: "Git Mimarisi"
related_exercise: "Git Alanlarını Sınıflandırma"
related_lab: "Git Değişiklik Akışı Laboratuvarı"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/02-git-mimarisi.md) | [Alıştırma](../../exercises/tr/02-git-alanlarini-siniflandirma.md) | [Laboratuvar](../../labs/tr/02-git-degisiklik-akisi-laboratuvari.md) | [Yol Haritası](../../ROADMAP.md)

# Git Mimarisi Quiz

## Amaç

Bu quiz, Git'in üç yerel alanını ve düzenlenen dosyadan kayıtlı geçmişe giden yolu anladığınızı değerlendirir.

## Öğrenme Hedefleri

- Çalışma dizinini, sahneleme alanını ve yerel depoyu tanımlamak.
- `git add`, `git commit` ve `git status` amaçlarını açıklamak.
- Odaklı committe hangi değişikliklerin yer alacağını belirlemek.

## Bölüm A - Çoktan Seçmeli

### Soru 1

Proje klasörünüzde düzenlediğiniz dosyalar hangi Git alanındadır?

- A. Yerel depo
- B. Çalışma dizini
- C. Uzak depo
- D. Sürüm arşivi

#### Cevap ve Açıklama: Soru 1

**B.** Çalışma dizini, düzenlemeye açık güncel proje dosyalarını içerir.

### Soru 2

Sahneleme alanının ana amacı nedir?

- A. Değişikliği kalıcı olarak yayımlamak
- B. Her dosyanın yedeğini tutmak
- C. Sonraki commit için tam dosya sürümlerini seçmek
- D. Değişikliği ekip arkadaşlarına göndermek

#### Cevap ve Açıklama: Soru 2

**C.** Sahneleme alanı, sonraki kayıtlı anlık görüntü için bilinçli seçimdir.

## Bölüm B - Doğru / Yanlış

### Soru 3

Düzenlenmiş dosyayı kaydetmek onu otomatik olarak Git geçmişine ekler.

#### Cevap ve Açıklama: Soru 3

**Yanlış.** Kaydetme çalışma dizinini değiştirir. Seçilmiş sürüm, ancak committen sonra yerel geçmiş olur.

### Soru 4

Commit oluşturmak değişikliği otomatik olarak ekip arkadaşlarıyla paylaşır.

#### Cevap ve Açıklama: Soru 4

**Yanlış.** Commit geçmişi yerel olarak kaydeder. Uzak paylaşım sonraki bölümlerde anlatılır.

## Bölüm C - Kısa Cevap

### Soru 5

`git status` size neyi anlamada yardım eder?

#### Beklenen Cevap: Soru 5

Dosyaların izlenmeyen, çalışma dizininde değiştirilmiş veya sonraki commit için sahnelenmiş olup olmadığını raporlar.

### Soru 6

README düzeltmesi sahnelendi, sonra committen önce README yeniden düzenlendi. Hangi sürüm commit için hazırdır?

#### Beklenen Cevap: Soru 6

`git add` çalıştığı andaki sürüm sahnelenmiştir. Sonraki düzenleme, yeniden seçilene kadar ayrı çalışma dizini değişikliği olarak kalır.

## Bölüm D - Uygulamalı Senaryo

### Senaryo

`README.md` içindeki bozuk bağlantıyı düzelttiniz, `index.html` içinde tamamlanmamış menü tasarımına başladınız ve geçici `notes.txt` oluşturdunuz. Ekip bugün net bir belge commit'i istiyor.

### Soru

Hangi dosya sahnelenip commit edilmelidir? Hangi dosyalar neden commit dışında kalmalıdır?

#### Beklenen Cevap: Senaryo

Yalnızca README düzeltmesini sahneleyip commit edin; çünkü commit amacına uyar. Tamamlanmamış menü tasarımı ve geçici notlar, geçmiş odaklı ve anlaşılır kalsın diye dışarıda kalmalıdır.

## Puanlama Rehberi

| Puan     | Değerlendirme                                         |
| -------- | ----------------------------------------------------- |
| 90-100%  | Çok iyi                                               |
| 75-89%   | İyi                                                   |
| 60-74%   | Yeterli                                               |
| 60% altı | Not defteri, alıştırma ve laboratuvarı gözden geçirin |

## Sonraki Adım

Git'i günlük kullanım için kurmak ve yapılandırmak üzere Bölüm 03'e geçin.

### İlgili İçerik

- Not defteri: [Git Mimarisi](../../notebooks/tr/02-git-mimarisi.md)
- Alıştırma: [Git Alanlarını Sınıflandırma](../../exercises/tr/02-git-alanlarini-siniflandirma.md)
- Laboratuvar: [Git Değişiklik Akışı Laboratuvarı](../../labs/tr/02-git-degisiklik-akisi-laboratuvari.md)
