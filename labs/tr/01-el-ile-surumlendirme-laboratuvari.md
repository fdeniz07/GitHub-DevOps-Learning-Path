---
chapter: 01
title: "El ile Sürümlendirme Laboratuvarı"
related_notebook: "Sürüm Kontrolü Neden Gerekli?"
related_exercise: "Sürüm Kontrolü Analizi"
level: Beginner
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md) | [Alıştırma](../../exercises/tr/01-surum-kontrolu-analizi.md) | [Quiz](../../quizzes/tr/01-surum-kontrolu-neden-gerekli-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# El ile Sürümlendirme Laboratuvarı

## Amaç

El ile oluşturulan proje kopyalarının doğurduğu belirsizliği deneyimlemek ve küçük bir projenin neden kayıtlı geçmişe ihtiyaç duyduğunu belirlemek. Bu laboratuvarda özellikle Git kullanılmaz.

## Öğrenme Çıktıları

- Birden çok el ile sürümlenmiş proje kopyası oluşturursunuz.
- Çalışan durumun veya değişiklik nedeninin güvenle belirlenemediği anları tespit edersiniz.
- Belirsizliği geçmiş, kurtarma, izlenebilirlik ve ortak doğruluk kaynağıyla ilişkilendirirsiniz.

## Senaryo

Bir öğrenciyle kampüs etkinlik sitesi hazırlıyorsunuz. Büyük bir tasarıma başlamadan önce "güvende kalmak" için klasör kopyaları alıyorsunuz. Görev sonunda ikiniz de hangi kopyaya devam edilmesi gerektiğini açıklayabilmelisiniz.

## Önkoşullar

- [Bölüm 01'i](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md) ve [alıştırmayı](../../exercises/tr/01-surum-kontrolu-analizi.md) tamamlayın.
- Dosya yöneticisi ve metin düzenleyici kullanın.

## Ortam Kurulumu

| Gereksinim      | Değer                                 |
| --------------- | ------------------------------------- |
| İşletim sistemi | Windows, Linux veya macOS             |
| Yazılım         | Dosya yöneticisi ve metin düzenleyici |
| Sürüm           | Güncel herhangi bir sürüm             |

Boş bir `el-ile-surumlendirme-lab` klasörü oluşturun.

## Görevler

### Görev 1 - İlk Projeyi Oluşturun

1. `kampus-etkinlikleri` klasörü içinde etkinlik başlığı ve kayıt mesajı içeren `index.html` oluşturun.
2. Sayfanın incelemeye hazır olduğunu yazan `README.md` ekleyin.
3. Klasörü `kampus-etkinlikleri-son` adıyla kopyalayın.

#### Beklenen Sonuç: İlk Proje

Geçerli görünen iki proje klasörünüz olur.

### Görev 2 - Değişiklik ve Hata Ekleyin

1. Asıl klasörde etkinlik başlığını değiştirin ve kayıt son tarihi ekleyin.
2. Kayıt mesajını anlaşılmaz yapan bir ifadeyi silin.
3. Klasörü `kampus-etkinlikleri-son-v2` adıyla kopyalayın.

#### Beklenen Sonuç: Değişmiş Kopya

Hem istenen değişiklik hem gizli sorun içeren daha yeni görünen bir kopyanız olur.

### Görev 3 - Çelişen Düzeltmeler Oluşturun

1. `kampus-etkinlikleri-son` klasöründe kayıt mesajını düzeltin ve README durumunu "onaylandı" yapın.
2. Bu klasörü `kampus-etkinlikleri-bunu-kullan` adıyla kopyalayın.
3. Tüm klasörleri karşılaştırın: Hangi etkinlik başlığı isteniyor? Hangi mesaj doğru? Hangi README güncel? Her klasörde ne ve neden değişti?
4. Güvenle cevaplayamadığınız her soru için eksik sürüm kontrolü yeteneğini yazın.

#### Beklenen Sonuç: Çelişen Düzeltmeler

İkna edici klasör adlarının güvenilir geçmiş, kurtarma noktası veya ortak doğruluk kaynağı sağlamadığını gösterirsiniz.

## Doğrulama Listesi

- [ ] En az üç olası proje kopyası oluşturdum.
- [ ] En az iki kopyada birden fazla dosya farkı var.
- [ ] Klasör adlarının cevaplayamadığı soruları kaydettim.
- [ ] Her belirsizliği bir sürüm kontrolü faydasına bağladım.

## En İyi Uygulamalar

- Rakip "son" klasörleri yerine tek yetkili proje geçmişi kullanın.
- Anlamlı değişikliğin amacını bağlam kaybolmadan kaydedin.
- Kayıp için yedek, proje evrimi için sürüm kontrolü kullanın.

## Sonraki Adım

[Sürüm Kontrolü Neden Gerekli? Quiz](../../quizzes/tr/01-surum-kontrolu-neden-gerekli-quiz.md) ile anlayışınızı kontrol edin.

### İlgili İçerik

- Not defteri: [Sürüm Kontrolü Neden Gerekli?](../../notebooks/tr/01-surum-kontrolu-neden-gerekli.md)
- Alıştırma: [Sürüm Kontrolü Analizi](../../exercises/tr/01-surum-kontrolu-analizi.md)
- Quiz: [Sürüm Kontrolü Neden Gerekli? Quiz](../../quizzes/tr/01-surum-kontrolu-neden-gerekli-quiz.md)
