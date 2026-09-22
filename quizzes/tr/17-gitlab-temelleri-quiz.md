---
chapter: 17
title: "GitLab Temelleri Quiz'i"
related_notebook: "GitLab Temelleri"
related_exercise: "GitLab Proje Temellerini Keşfet"
related_lab: "GitLab Değişikliği Oluştur ve İncele"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Gezinme:** [Notebook](../../notebooks/tr/17-gitlab-temelleri.md) | [Alıştırma](../../exercises/tr/17-gitlab-proje-temellerini-kesfet.md) | [Laboratuvar](../../labs/tr/17-gitlab-degisikligi-olustur-ve-incele.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Temelleri Quiz'i

## Amaç

Bu quiz GitLab'ın temel nesnelerini, erişim kararlarını ve değişiklik akışını açıklayabildiğini ölçer.

## Yönergeler

- Ezber yerine anlayarak yanıtla.
- Namespace, group, project ve role terimlerini doğru kullan.

## Öğrenme Hedefleri

- group ile projecti ayırt etmek;
- görünürlük, rol ve en az ayrıcalık ilişkisini açıklamak;
- issue, merge request ve pipelineı aynı akışta konumlandırmak.

## Bölüm A - Çoktan Seçmeli

### Soru 1

GitLab groupun temel amacı nedir?

- A. Her repositoryyi tek dosya listesine dönüştürmek.
- B. İlişkili projeleri ve ortak üyelikleri düzenlemek.
- C. Her branchi otomatik merge etmek.
- D. Yerel bir Git yapılandırma dosyası olmak.

**Cevap:** B

**Açıklama:** Group, ilişkili projeleri bir araya getirir ve ekip erişimini merkezi olarak yönetebilir.

### Soru 2

Merge requesti en doğru biçimde hangi ifade tanımlar?

- A. Bir source branchi target branche birleştirme önerisi.
- B. Commit yerine kullanılan kayıt.
- C. Tüm üyelerin listesi.
- D. Branch silme komutu.

**Cevap:** A

**Açıklama:** Merge request, önerilen değişikliğin diffini, açıklamasını, reviewlarını ve pipeline durumunu bir araya getirir.

## Bölüm B - Doğru veya Yanlış

### Soru 3

Proje görünürlüğü ile üye rolü aynı erişim ayarıdır.

**Cevap:** Yanlış

**Açıklama:** Görünürlük projenin bulunmasını veya okunmasını; rol ise yetkili üyenin yapabileceği işlemleri belirler.

### Soru 4

Merge requestin source branchine yeni commit pushlamak, açık merge requesti ve pipelineı güncelleyebilir.

**Cevap:** Doğru

**Açıklama:** Merge request source branche bağlı kalır; yeni commit ilgili değişikliği ve otomasyonu günceller.

## Bölüm C - Kısa Yanıt

### Soru 5

Katkıcı davet ederken en az ayrıcalık neden önemlidir?

**Beklenen Yanıt:** Kişiyi görevi için gerekli işlemlerle sınırlar; hata veya ele geçirilmiş hesap etkisini azaltır ve önemli ayarları korur.

### Soru 6

Issue ile merge requestin amaçları nasıl farklıdır?

**Beklenen Yanıt:** Issue işin bağlamını ve beklenen sonucu kaydeder. Merge request uygulamayı review, otomatik kontroller ve merge kararı için sunar.

## Bölüm D - Pratik Senaryo

### Senaryo

`docs/kurulum-komutu` branchindeki README değişikliği için pipeline başarısız oldu ve reviewer açıklamanın netleştirilmesini istedi.

### Soru

Merge öncesinde ne yapılmalıdır?

**Beklenen Yanıt:** Job çıktısını oku, README'yi aynı source branchte düzelt, yerelde kontrol et, commit ve pushla. Zorunlu pipeline ve review koşulları sağlanana kadar merge etme.

## Puanlama Rehberi

| Puan      | Değerlendirme                                               |
| --------- | ----------------------------------------------------------- |
| 90-100 %  | Çok iyi: Temel GitLab akışını güvenle açıklıyorsun.         |
| 75-89 %   | İyi: Belirsiz terimleri tekrar et.                          |
| 60-74 %   | Yeterli: Notebook ve alıştırmaya dön.                       |
| 60 % altı | Sonraki bölüme geçmeden notebook ve laboratuvarı tekrar et. |

## Öz Değerlendirme

- [ ] Namespace, group, project ve repositoryyi ayırt edebilirim.
- [ ] Görünürlük, rol ve en az ayrıcalığı anlıyorum.
- [ ] Issue, merge request ve pipeline ilişkisini açıklayabilirim.

## Sonraki Adım

Bölüm 18'de group, project, member ve permission yapılarını ayrıntılı inceleyeceksin.

### İlgili İçerik

- Notebook: [GitLab Temelleri](../../notebooks/tr/17-gitlab-temelleri.md)
- Alıştırma: [GitLab Proje Temellerini Keşfet](../../exercises/tr/17-gitlab-proje-temellerini-kesfet.md)
- Laboratuvar: [GitLab Değişikliği Oluştur ve İncele](../../labs/tr/17-gitlab-degisikligi-olustur-ve-incele.md)
