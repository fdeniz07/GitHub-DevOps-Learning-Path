---
chapter: 29
title: "İş Akışı Çalıştırmasını İnceleme"
related_notebook: "GitHub Actions İş Akışı Anatomisi"
related_exercise: "Bir GitHub Actions İş Akışını İzleme"
level: Beginner
estimated_time: 50 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/29-github-actions-workflow-anatomy.md) | [Alıştırma](../../exercises/tr/29-trace-a-github-actions-workflow.md) | [Kısa Sınav](../../quizzes/tr/29-workflow-anatomy-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Amaç

Bir olayın işlere, adımlara, günlüklerine ve son duruma nasıl dönüştüğünü incelemek için Actions arayüzünü kullanın.

## Öğrenme Çıktıları

- bir çalıştırmayı onu tetikleyen olay ve commitle ilişkilendirmek;
- iş durumunu tek tek adımların durumundan ayırmak;
- bağımlılığa dayalı bir yürütme sırasını belirlemek.

## Senaryo

`inspect` işi ve buna bağımlı `report` işi bulunan bir iş akışını inceleyin. Göreviniz yalnızca başarılı olup olmadığını değil, nasıl çalıştığını açıklayan kanıt oluşturmaktır.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- En az iki iş içeren bir iş akışına sahip depo.
- Actions çalıştırmalarını görüntüleme izni.

## Ortam Kurulumu

| Gereksinim      | Değer                                        |
| --------------- | -------------------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS                    |
| Yazılım         | Tarayıcı ve metin düzenleyici                |
| Depo            | İş akışı geçmişi bulunan bir uygulama deposu |

## Görevler

### Görev 1 - Çalıştırma sınırını belirleme

#### Adımlar: Çalıştırma Sınırını Belirleme

1. Tamamlanmış bir iş akışı çalıştırmasını açın.
2. Olayını, dalını, commitini, aktörünü ve iş akışı adını kaydedin.
3. Bu değerleri `on` bloğuyla karşılaştırın.

#### Beklenen Sonuç: Eşleşen Tetikleyici

Bu çalıştırmanın neden başladığını ve hangi tetikleyicinin eşleştiğini açıklayabilirsiniz.

### Görev 2 - İşleri ve adımları izleme

#### Adımlar: İşleri ve Adımları İzleme

1. Her iş tanımlayıcısını ve runner etiketini kaydedin.
2. Her adımı genişletin ve bir eylem kullanıp kullanmadığını veya bir komut çalıştırıp çalıştırmadığını not edin.
3. Her `needs` ilişkisini bulun ve gözlemlenen sırayı doğrulayın.

#### Beklenen Sonuç: Yürütme Grafiği

İzlemeniz, iş akışının yürütme grafiğini ve her iş içindeki sıralı adımları gösterir.

### Görev 3 - Sonucu inceleme

#### Adımlar: Sonucu İnceleme

1. Çalıştırma başarısız olduysa ilk başarısız adımı bulun.
2. Bir YAML/yapılandırma sorununu komut veya ortam sorunundan ayırın.
3. Kanıta dayalı bir sonraki eylemi yazın.

#### Beklenen Sonuç: Sonraki Eylem

İnceleme, tüm iş akışını tek ve anlaşılmaz bir hata olarak görmek yerine olası bir kontrol noktası belirtir.

## Doğrulama Kontrol Listesi

- [ ] Olay, dal ve commit kaydedilmiştir.
- [ ] Her iş ve runner belirlenmiştir.
- [ ] Eylem adımları ile komut adımları birbirinden ayrılmıştır.
- [ ] `needs` ilişkileri açıklanmıştır.
- [ ] Her hata için belirli bir sonraki eylem vardır.

## Sorun Giderme

| Sorun                           | Olası Neden                        | Çözüm                                                                              |
| ------------------------------- | ---------------------------------- | ---------------------------------------------------------------------------------- |
| İş sırası beklenmedik görünüyor | Bağımlılık tanımlanmamıştır.       | `needs` değerini inceleyin ve bağımsız işlerin paralel çalışabileceğini unutmayın. |
| Sonraki iş dosyaları bulamıyor  | İşler ayrı runner kullanıyor.      | Sonraki işe kurulum ekleyin veya bir artifact aktarın.                             |
| Günlükler çok geniş             | İncelemenin başlangıç noktası yok. | İlk başarısız adımı bulun ve bağlamını inceleyin.                                  |

## En İyi Uygulamalar

- Mümkün olduğunda commit SHA gibi değişmez bağlamı kaydedin.
- Daha sonraki zincirleme hatalardan önce ilk hatayı inceleyin.
- Günlükleri kanıt olarak ele alın ve hassas değerleri notlara kopyalamaktan kaçının.

## Özet

Çalıştırma olay, iş, bağımlılık, adım, günlük ve sonuç olarak ayrıştırıldığında iş akışını incelemek yönetilebilir hale gelir.

### İlgili İçerik

- Not Defteri: [GitHub Actions İş Akışı Anatomisi](../../notebooks/tr/29-github-actions-workflow-anatomy.md)
- Alıştırma: [Bir GitHub Actions İş Akışını İzleme](../../exercises/tr/29-trace-a-github-actions-workflow.md)
- Kısa Sınav: [İş Akışı Anatomisi Kısa Sınavı](../../quizzes/tr/29-workflow-anatomy-quiz.md)
