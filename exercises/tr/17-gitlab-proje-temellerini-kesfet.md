---
chapter: 17
title: "GitLab Proje Temellerini Keşfet"
related_notebook: "GitLab Temelleri"
level: Başlangıç
estimated_time: 25 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-29
---

> **Gezinme:** [Notebook](../../notebooks/tr/17-gitlab-temelleri.md) | [Laboratuvar](../../labs/tr/17-gitlab-degisikligi-olustur-ve-incele.md) | [Quiz](../../quizzes/tr/17-gitlab-temelleri-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# GitLab Proje Temellerini Keşfet

## Amaç

Bir GitLab projesinin yapısını ve erişim ihtiyacını inceleyerek iş birliği özelliklerini doğru konumlandırmak.

## Öğrenme Çıktıları

- bir proje yolundan namespace, group, project ve repository bilgilerini belirlemek;
- görünürlük ile rolü ayırt etmek;
- en az ayrıcalık ilkesine göre erişim kararı gerekçelendirmek.

## Ön Koşullar

- [GitLab Temelleri notebooku](../../notebooks/tr/17-gitlab-temelleri.md) tamamlandı.
- Görüntüleyebileceğin bir GitLab projesi ve web tarayıcısı var.

## Senaryo

Yeni bir katkıcı `acme/training/demo-app` projesindeki README dosyasını iyileştirecek. Branch ve merge request oluşturabilmeli; ancak proje ayarlarını veya üyeleri yönetememeli.

## Görevler

### Görev 1

Proje yolunu namespace, group ve project olarak ayır. Ardından repository, varsayılan branch, Issues ve Merge requests alanlarını bul.

**Beklenen Sonuç:** Organizasyon yapısını ve projenin temel alanlarını açıklayabilirsin.

### Görev 2

Katkıcının branch ve merge request çalışmasına izin veren en düşük rolü proje yapılandırmasına göre seç. Maintainer rolünün neden gereksiz olduğunu açıkla.

**Beklenen Sonuç:** Görünürlük ile rolü ayırır ve erişimi iş gereksinimiyle gerekçelendirirsin.

### Görev 3

README değişikliği için issue, branch, commit, merge request ve pipeline sırasını yaz. Pipeline başarısız olursa ne yapılacağını ekle.

**Beklenen Sonuç:** Aynı branchte düzeltme ve yeniden doğrulama içeren incelemeye açık bir akış oluşturursun.

## Ek Görev (İsteğe Bağlı)

Bir alt group bul ve düz proje listesinden daha düzenli olmasının bir faydasını yaz.

## Öz Değerlendirme

- [ ] Group ile projecti ayırt edebilirim.
- [ ] Görünürlük ile rol arasındaki farkı biliyorum.
- [ ] Issue, merge request ve pipelineın amacını açıklayabilirim.

## Yaygın Hatalar

| Hata                                               | Çözüm                                                     |
| -------------------------------------------------- | --------------------------------------------------------- |
| Görünürlüğün değiştirme yetkisi verdiğini sanmak   | Üyelik ve rolü görünürlükten ayrı kontrol et.             |
| Gereğinden fazla yetki vermek                      | En düşük uygun rol ile başla.                             |
| Pipeline hatasını merge requestten bağımsız görmek | Job çıktısını oku, sorunu düzelt ve aynı branche push et. |

## Özet

- Proje yolu, projenin GitLab hiyerarşisindeki yerini gösterir.
- Görünürlük ve roller erişimin farklı boyutlarını yönetir.
- Issue, merge request ve pipeline değişiklik akışında birbirini tamamlar.

## Sonraki Adım

Küçük bir GitLab katkısını uçtan uca uygulamak için laboratuvara geç.

### İlgili İçerik

- Notebook: [GitLab Temelleri](../../notebooks/tr/17-gitlab-temelleri.md)
- Laboratuvar: [GitLab Değişikliği Oluştur ve İncele](../../labs/tr/17-gitlab-degisikligi-olustur-ve-incele.md)
- Quiz: [GitLab Temelleri Quiz'i](../../quizzes/tr/17-gitlab-temelleri-quiz.md)
