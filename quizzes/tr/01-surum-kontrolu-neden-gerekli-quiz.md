---
chapter: 01
title: "Sürüm Kontrolü Neden Gerekli? Quiz"
related_notebook: "Sürüm Kontrolü Neden Gerekli?"
related_exercise: "Sürüm Kontrolü Analizi"
related_lab: "El ile Sürümlendirme Laboratuvarı"
level: Beginner
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md) | [Alıştırma](../../exercises/tr/01-surum-kontrolu-analizi.md) | [Laboratuvar](../../labs/tr/01-el-ile-surumlendirme-laboratuvari.md) | [Yol Haritası](../../ROADMAP.md)

# Sürüm Kontrolü Neden Gerekli? Quiz

## Amaç

Bu quiz, yazılım projelerinin neden anlamlı değişikliklerden oluşan bir geçmişe ihtiyaç duyduğunu anlamanızı değerlendirir.

## Öğrenme Hedefleri

- Sürüm kontrolünün çözdüğü sorunları açıklamak.
- Sürüm kontrolünü yedekten ayırmak.
- Kurtarma, izlenebilirlik ve ortak doğruluk kaynağını gerçek senaryoya uygulamak.

## Bölüm A - Çoktan Seçmeli

### Soru 1

Daha önce çalışan bir özelliği hangi değişikliğin bozduğunu bulmak için en yararlı yetenek hangisidir?

- A. Dosya sıkıştırma
- B. Sürüm geçmişi
- C. Daha uzun dosya adı
- D. İkinci ekran

#### Cevap ve Açıklama: Soru 1

**B.** Sürüm geçmişi, son çalışan durum ile ilk hatalı durum arasındaki değişiklikleri incelemeyi sağlar.

### Soru 2

Ortak doğruluk kaynağı ekibe ne sağlar?

- A. Her kişi için ayrı son kopya
- B. Koordine çalışma için tek yetkili proje geçmişi
- C. Kodun asla hata içermeyeceği garantisi
- D. İletişimin yerine geçen bir araç

#### Cevap ve Açıklama: Soru 2

**B.** Ekip, hangi kişisel kopyanın güncel olduğunu tahmin etmek yerine tek güvenilir geçmişte çalışır.

## Bölüm B - Doğru / Yanlış

### Soru 3

Yedek ile sürüm kontrolü tamamen aynı amaca hizmet eder.

#### Cevap ve Açıklama: Soru 3

**Yanlış.** Yedek veri kaybına karşı korur; sürüm kontrolü projenin zaman içinde nasıl değiştiğini kaydeder ve açıklar.

### Soru 4

Sürüm kontrolü yalnızca birden fazla geliştiricinin olduğu projelerde yararlıdır.

#### Cevap ve Açıklama: Soru 4

**Yanlış.** Tek geliştirici de kurtarma, deneme ve değişiklik nedenlerini anlama ihtiyacı duyar.

## Bölüm C - Kısa Cevap

### Soru 5

`proje-son-son` adlı klasör neden doğru proje durumunun güvenilir kanıtı değildir?

#### Beklenen Cevap: Soru 5

Ad, neyin ne zaman ve neden değiştiğini, kopyanın çalışıp çalışmadığını veya başka kopyanın yetkili olup olmadığını göstermez.

### Soru 6

Git ile GitHub arasındaki bir farkı yazın.

#### Beklenen Cevap: Soru 6

Git, depo geçmişini kaydeden sürüm kontrol sistemidir. GitHub ise Git depoları etrafında iş birliği sağlayan platformdur.

## Bölüm D - Uygulamalı Senaryo

### Senaryo

Etkinlik sitesi pazartesi çalışıyordu, perşembe kayıt işlemi bozuldu. Ekipte farklı adlara sahip dört klasör ve çarşamba gecesinden bir yedek var; ancak hafta içindeki düzenlemelerin kaydı yok.

### Soru

Sürüm kontrolü incelemeyi daha güvenli ve odaklı hale getirmek için hangi bilgileri sağlar? Yedek neden tek başına yeterli değildir?

#### Beklenen Cevap: Senaryo

Sürüm kontrolü son çalışan ve ilk hatalı durum arasındaki değişiklik sırasını ve bağlamını gösterir. Ekip farkları inceleyebilir, çalışan durumu belirleyebilir ve geri getirebilir. Yedek veriyi kurtarabilir; fakat hataya hangi düzenlemenin yol açtığını veya neden yapıldığını açıklamayabilir.

## Puanlama Rehberi

| Puan     | Değerlendirme                                         |
| -------- | ----------------------------------------------------- |
| 90-100%  | Çok iyi                                               |
| 75-89%   | İyi                                                   |
| 60-74%   | Yeterli                                               |
| 60% altı | Not defteri, alıştırma ve laboratuvarı gözden geçirin |

## Sonraki Adım

Bir sonraki bölümde Git'in proje geçmişini nasıl modellediğini öğrenin.

### İlgili İçerik

- Not defteri: [Sürüm Kontrolü Neden Gerekli?](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md)
- Alıştırma: [Sürüm Kontrolü Analizi](../../exercises/tr/01-surum-kontrolu-analizi.md)
- Laboratuvar: [El ile Sürümlendirme Laboratuvarı](../../labs/tr/01-el-ile-surumlendirme-laboratuvari.md)
