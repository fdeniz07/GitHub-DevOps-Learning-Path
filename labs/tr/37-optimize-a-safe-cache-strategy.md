---
chapter: 37
title: "Güvenli Bir Önbellek Stratejisini İyileştirme"
related_notebook: "GitHub Actions Bağımlılık Önbelleğe Alma"
related_exercise: "Güvenli Bir Bağımlılık Önbelleği Tasarlama"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/36-github-actions-matrix-builds.md) | [Not Defteri](../../notebooks/tr/37-github-actions-dependency-caching.md) | [Alıştırma](../../exercises/tr/37-design-a-safe-dependency-cache.md) | [Kısa Sınav](../../quizzes/tr/37-dependency-caching-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Güvenli Bir Önbellek Stratejisini İyileştirme

## Amaç

Yeniden üretilebilirliği ve önbellek güvenliğini korurken bağımlılık kurulum süresini ölçün ve iyileştirin.

## Öğrenme Çıktıları

- önbelleğe alınabilir bağımlılık verilerini belirlemek;
- bir anahtar ve geri yükleme ön ekini oluşturmak ve test etmek;
- güvenli olmayan veya etkisiz önbelleğe almayı tespit etmek.

## Senaryo

Matris iş akışınız aynı bağımlılıkları tekrar tekrar kuruyor. Paket yöneticisi önbelleğe almasını ekleyin, çalıştırmaları karşılaştırın ve değişen bir lockfile'ın tam anahtarı geçersiz kıldığını doğrulayın.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- Bir lockfile ve tekrarlanabilir bağımlılık kurulum komutu.
- İş akışını birkaç kez çalıştırma izni.

## Ortam Kurulumu

| Gereksinim      | Değer                                                     |
| --------------- | --------------------------------------------------------- |
| İşletim Sistemi | Projenin kullandığı GitHub tarafından barındırılan runner |
| Yazılım         | Projenin paket yöneticisi ve GitHub Actions               |
| Sürüm           | Depo lockfile'ında bildirilen sürümler                    |

## Görevler

### Görev 1 — Başlangıç ölçümü

1. İş akışını önbellek olmadan çalıştırın.
2. Kurulum süresini ve bağımlılık komutunu kaydedin.
3. Önbelleğe alınmaması gereken yolları belirleyin.

**Beklenen Sonuç:** Ölçülebilir bir başlangıç değeri ve veri sınıflandırmanız vardır.

### Görev 2 — Önbelleği ekleme

1. Paket yöneticisinin indirme klasörünü önbelleğe alın.
2. Anahtarı runner sistemi ve lockfile özeti ile oluşturun.
3. Aynı sistem için bir geri yükleme ön eki ekleyin.

**Beklenen Sonuç:** Önbellek uyumlu girdilerle sınırlandırılır ve lockfile değişikliklerinden sonra önbellek kaçırması gerçekleşir.

### Görev 3 — Güvenliği ve faydayı doğrulama

1. İş akışını iki kez çalıştırın ve isabet durumunu ve süreyi karşılaştırın.
2. Kontrollü bir dalda lockfile'ı değiştirin ve tekrar çalıştırın.
3. Kilitli kurulumun hâlâ çalıştığını ve hiçbir gizli yolun önbelleğe alınmadığını doğrulayın.

**Beklenen Sonuç:** Önbellek tekrarlanan çalıştırmaları iyileştirir, ancak bağımlılıkların gerçek kaynağı haline gelmez.

## Doğrulama Kontrol Listesi

- [ ] Önbellek yolu yalnızca bağımlılık verilerini içerir.
- [ ] Tam anahtar ilgili tüm lockfile'ları içerir.
- [ ] Geri yükleme anahtarı bilerek geniş, ancak sınırlandırılmıştır.
- [ ] Kilitli kurulum geri yüklemeden sonra çalışır.
- [ ] Sonuçlar önbelleğe almanın fayda sağlayıp sağlamadığını gösterir.

## Sorun Giderme

| Sorun                     | Olası Neden                           | Çözüm                                                      |
| ------------------------- | ------------------------------------- | ---------------------------------------------------------- |
| Her çalıştırma kaçırıyor  | Anahtar beklenmedik şekilde değişiyor | Lockfile yollarını ve matris değerlerini inceleyin.        |
| Kurulum hâlâ başarısız    | Önbellek eksik veya eski              | Normal kilitli kurulumu koruyun.                           |
| Hassas dosyalar görünüyor | Önbellek yolu çok geniş               | Yolu daraltın ve açığa çıkan kimlik bilgilerini yenileyin. |

## En İyi Uygulamalar

- İyileştirmeden önce bir başlangıç ölçümü tutun.
- Paket yöneticisiyle eşleştiğinde setup-action önbelleğe almasını tercih edin.
- Ölçülebilir bir fayda sağlamadan karmaşıklık ekleyen önbelleği kaldırın.

## Özet

Önbelleğe almayı ölçülebilir bir iyileştirme olarak değerlendirdiniz ve yeniden üretilebilir kurulumu kontrol altında tuttunuz.

### İlgili İçerik

- Not Defteri: [GitHub Actions Bağımlılık Önbelleğe Alma](../../notebooks/tr/37-github-actions-dependency-caching.md)
- Alıştırma: [Güvenli Bir Bağımlılık Önbelleği Tasarlama](../../exercises/tr/37-design-a-safe-dependency-cache.md)
- Kısa Sınav: [Bağımlılık Önbelleğe Alma Kısa Sınavı](../../quizzes/tr/37-dependency-caching-quiz.md)
