---
chapter: 28
title: "Bir GitHub Actions İş Akışı Çalıştırma"
related_notebook: "GitHub Actions'a Giriş"
related_exercise: "İlk GitHub Actions İş Akışınızı Oluşturma"
level: Beginner
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/28-introduction-to-github-actions.md) | [Alıştırma](../../exercises/tr/28-create-your-first-github-actions-workflow.md) | [Kısa Sınav](../../quizzes/tr/28-introduction-to-github-actions-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Amaç

Basit bir GitHub Actions iş akışı oluşturun, commit edin, çalıştırın ve inceleyin.

## Öğrenme Çıktıları

- GitHub'ın keşfedebilmesi için bir iş akışını doğru konuma yerleştirmek;
- bir iş akışını bir depo olayı ve manuel gönderim aracılığıyla başlatmak;
- hassas verileri açığa çıkarmadan iş ve adım sonuçlarını incelemek.

## Senaryo

Bir depoya otomasyon ekliyorsunuz. Bu laboratuvar, sonraki bölümlerde derleme ve test mantığı eklenmeden önce, zararsız bir durum komutuyla teslim yolunu doğrular.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- Bir GitHub deposu ve iş akışına commit gönderme izni.
- Bir tarayıcı ve Git istemcisi.

## Ortam Kurulumu

| Gereksinim      | Değer                           |
| --------------- | ------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS       |
| Yazılım         | Git ve bir metin düzenleyici    |
| Depo            | Üretim dışı bir uygulama deposu |

## Görevler

### Görev 1 - İş akışını oluşturma

#### Adımlar: İş Akışını Oluşturma

1. `.github/workflows` klasörünü oluşturun.
2. `main` için `push`, `workflow_dispatch`, `contents: read` ve bir iş içeren bir iş akışı ekleyin.
3. checkout ve `git status --short` adımlarını kullanın.

#### Beklenen Sonuç: Commit Edilmiş İş Akışı

Commit edilmiş dosya, depoda `.github/workflows` altında görünür.

### Görev 2 - Bir çalıştırmayı başlatma ve inceleme

#### Adımlar: Başlatma ve İnceleme

1. Deponun Actions görünümünü açın.
2. İş akışını seçin ve manuel gönderim denetimini kullanın veya tetikleyicisine göre iş akışı dalını gönderin.
3. İşi açın ve her iki adımı genişletin.

#### Beklenen Sonuç: Başarılı Çalıştırma

Çalıştırma, checkout ve durum komutu için ayrı günlüklerle başarılı bir iş gösterir.

### Görev 3 - Kanıt kaydetme

#### Adımlar: Kanıtı Kaydetme

1. Olayı, commiti, iş akışı adını, iş adını ve son durumu kaydedin.
2. Günlüklerde hiçbir gizli bilgi veya token değerinin görünmediğini doğrulayın.
3. `contents: read` izninin neden yeterli olduğunu açıklayın.

#### Beklenen Sonuç: Çalıştırma Kaydı

Başka bir gözden geçirenin anlayabileceği küçük ve güvenli bir çalıştırma kaydı üretirsiniz.

## Doğrulama Kontrol Listesi

- [ ] İş akışı `.github/workflows` altındadır.
- [ ] İş akışı yapılandırılmış bir olayla başlar.
- [ ] İş ve her iki adım başarıyla tamamlanır.
- [ ] İzinler açıkça belirtilmiş ve salt okunurdur.
- [ ] Günlüklerde hassas değer bulunmaz.

## Sorun Giderme

| Sorun                             | Olası Neden                             | Çözüm                                                              |
| --------------------------------- | --------------------------------------- | ------------------------------------------------------------------ |
| İş akışı eksik                    | Dosya yolu veya commit yanlıştır.       | `.github/workflows` klasörünü ve dosyayı içeren dalı kontrol edin. |
| Manuel gönderim kullanılamıyor    | İş akışında `workflow_dispatch` yoktur. | Tetikleyiciyi ekleyip commit edin.                                 |
| İş komuttan önce başarısız oluyor | YAML veya eylem referansı geçersizdir.  | İlk başarısız adımı okuyun, girintiyi ve sürümü doğrulayın.        |

## En İyi Uygulamalar

- İlk çalıştırma için bir uygulama deposu kullanın.
- Günlükleri iş arkadaşlarınızın görebileceğini varsayın ve gizli bilgileri hiçbir zaman yazdırmayın.
- Kanıt kaydederken olayı ve commiti yakalayın.

## Özet

Bu laboratuvar, bir iş akışı tanımını gözlemlenebilir kanıta dönüştürür: yapılandırılmış bir olay çalıştırmayı başlatır, bir runner adımları yürütür ve günlükler sonucu gösterir.

### İlgili İçerik

- Not Defteri: [GitHub Actions'a Giriş](../../notebooks/tr/28-introduction-to-github-actions.md)
- Alıştırma: [İlk GitHub Actions İş Akışınızı Oluşturma](../../exercises/tr/28-create-your-first-github-actions-workflow.md)
- Kısa Sınav: [GitHub Actions'a Giriş Kısa Sınavı](../../quizzes/tr/28-introduction-to-github-actions-quiz.md)
