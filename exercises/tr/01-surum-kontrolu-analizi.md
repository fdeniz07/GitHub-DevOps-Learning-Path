---
chapter: 01
title: "Sürüm Kontrolü Analizi"
related_notebook: "Sürüm Kontrolü Neden Gerekli?"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md) | [Laboratuvar](../../labs/tr/01-el-ile-surumlendirme-laboratuvari.md) | [Quiz](../../quizzes/tr/01-surum-kontrolu-neden-gerekli-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Sürüm Kontrolü Analizi

## Amaç

El ile adlandırılmış proje kopyalarının risklerini analiz etmek ve sürüm kontrolünün bu riskleri nasıl azalttığını açıklamak.

## Öğrenme Çıktıları

- Elle sürümlenmiş klasörlerde eksik olan bilgiyi belirlersiniz.
- Kurtarma, izlenebilirlik ve ortak doğruluk kaynağını proje sorunlarıyla ilişkilendirirsiniz.
- Yedek ile sürüm kontrolünün farklı sorumluluklarını açıklarsınız.

## Önkoşullar

- [Bölüm 01'i](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md) tamamlayın.
- Kısa analiz yazmak için metin düzenleyici kullanın.

## Senaryo

Bir sınıf arkadaşınızdan `portfolyo-son`, `portfolyo-son-v2`, `portfolyo-son-v2-duzeltildi` ve `portfolyo-bunu-kullan` klasörlerini devraldınız. Tek not şöyledir: "Form değişti, ana sayfa düzeltildi."

## Görevler

### Görev 1 - Kanıtı İnceleyin

Hangi klasörü güncel kabul edeceğinizi yazın. Ardından klasör adının neden güvenilir kanıt olmadığını açıklayın.

#### Beklenen Sonuç: Kanıt

Hiçbir adın, klasörün yetkili, eksiksiz veya güvenli olduğunu kanıtlamadığını belirtirsiniz.

### Görev 2 - Yanıtsız Soruları Belirleyin

Klasörlerin ve notun cevaplayamadığı en az dört soru yazın. Sorular değişikliğin ne, neden, ne zaman ve kim tarafından yapıldığıyla ilgili olsun.

#### Beklenen Sonuç: Sorular

Dosya adlarının kullanılabilir geçmiş veya değişiklik bağlamı sağlamadığını gösterirsiniz.

### Görev 3 - Güvenli Akış Önerin

Aşağıdaki risklerin her biri için ilgili sürüm kontrolü yeteneğini ve faydasını yazın:

- Bir geliştirici eski klasörden çalışmaya başlar.
- Form bilinmeyen bir değişiklikten sonra bozulur.
- Ekip arkadaşı bir ayar değerinin neden değiştiğini sorar.
- Geliştirici kararlı sürümü kaybetmeden riskli tasarımı denemek ister.

#### Beklenen Sonuç: Güvenli Akış

Riskleri ortak doğruluk kaynağı, kurtarma, izlenebilirlik ve güvenli denemeyle ilişkilendirirsiniz.

## Öz Değerlendirme

- [ ] Eski kopya ile belgelenmiş proje geçmişini ayırt edebiliyorum.
- [ ] Bu senaryoda yetkili sürümün neden belirsiz olduğunu açıklayabiliyorum.
- [ ] Proje riskini sürüm kontrolü faydasıyla ilişkilendirebiliyorum.
- [ ] Yedek ile sürüm kontrolünün birbirini tamamladığını açıklayabiliyorum.

## Özet

- Elle adlandırılan kopyalar dosyaları saklar, sürümler arası güvenilir ilişkiyi saklamaz.
- Sürüm kontrolü geçmiş, kurtarma, izlenebilirlik, deneme ve ortak doğruluk kaynağı sağlar.

### İlgili İçerik

- Not defteri: [Sürüm Kontrolü Neden Gerekli?](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md)
- Laboratuvar: [El ile Sürümlendirme Laboratuvarı](../../labs/tr/01-el-ile-surumlendirme-laboratuvari.md)
- Quiz: [Sürüm Kontrolü Neden Gerekli? Quiz](../../quizzes/tr/01-surum-kontrolu-neden-gerekli-quiz.md)
