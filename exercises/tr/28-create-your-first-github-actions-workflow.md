---
chapter: 28
title: "İlk GitHub Actions İş Akışınızı Oluşturun"
related_notebook: "GitHub Actions'a Giriş"
level: Başlangıç
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/28-introduction-to-github-actions.md) | [Lab](../../labs/tr/28-run-a-github-actions-workflow.md) | [Kısa Sınav](../../quizzes/tr/28-introduction-to-github-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

## Amaç

Bir push işlemine yanıt veren ve manuel olarak da başlatılabilen küçük, okunabilir bir iş akışı oluşturun.

## Öğrenme Kazanımları

- gerekli `.github/workflows` konumunu belirlemek;
- bir olay ve yalnızca okuma amaçlı contents izni yapılandırmak;
- bir action adımını kabuk komutu adımından ayırt etmek.

## Ön Koşullar

- Bölüm 28 not defterini okuyun.
- Uygulama amaçlı bir GitHub repository'sine ve dosya ekleme iznine sahip olun.
- Bir branch oluşturmayı ve dosya commit etmeyi bilin.

## Senaryo

Küçük bir repository'yi yönetiyorsunuz ve kod `main` branch'ine ulaştığında görünür bir ilk kontrol istiyorsunuz. Bu kontrol henüz derleme veya dağıtım yapmaz; repository'nin bir Actions iş akışını güvenli biçimde başlatabildiğini kanıtlar.

## Görevler

### Görev 1

Açıklayıcı bir `name`, `main` için bir `push` tetikleyicisi ve `workflow_dispatch` içeren `.github/workflows/first-check.yml` dosyasını oluşturun.

### Beklenen Sonuç: İş Akışının Konumu

Dosya, GitHub'ın taradığı tam dizinin içindedir ve geçerli bir YAML yapısı içerir.

### Görev 2

`permissions: contents: read` ekleyin ve `ubuntu-latest` üzerinde bir job tanımlayın. `actions/checkout@v4` kullanan bir checkout adımı ile `git status --short` çalıştıran ikinci bir adım ekleyin.

### Beklenen Sonuç: Job Tanımı

İş akışı, yeniden kullanılabilir action sözdizimi ile kabuk komutunu net biçimde ayırır ve geniş yazma erişimi istemez.

### Görev 3

İş akışını bir branch üzerinde commit edin, bir pull request açın ve yapılandırılmış her çalıştırmayı hangi olayın başlattığını açıklayın.

### Beklenen Sonuç: Çalıştırma Açıklaması

Görünür çalıştırmayı olayıyla ilişkilendirebilir ve iznin neden yeterli olduğunu açıklayabilirsiniz.

## Zorluk

Ek izin vermeden ikinci bir korumalı branch için branch filtresi ekleyin. Filtrenin iş akışının davranışını nasıl değiştirdiğini açıklayın.

## Öz Değerlendirme

- [ ] Dosya `.github/workflows` altındadır.
- [ ] Dosyadaki her tetikleyiciyi açıklayabilirim.
- [ ] Geniş yazma erişimi yerine `contents: read` kullandım.
- [ ] `uses` ile `run` arasındaki farkı açıklayabilirim.

## Yaygın Hatalar

| Hata                                  | Çözüm                                                         |
| ------------------------------------- | ------------------------------------------------------------- |
| İş akışı Actions bölümünde görünmüyor | Dizini ve commit edilmiş branch'i kontrol edin.               |
| YAML ayrıştırıcı hatası               | Girintiyi inceleyin ve tab yerine boşluk kullanın.            |
| Gereğinden fazla token erişimi        | Kontrol için gereken izni yalnızca onu belirterek tanımlayın. |

## Özet

- Yararlı bir ilk iş akışı küçük, görünür ve yalnızca okuma amaçlıdır.
- Olay seçimi ve dosya konumu, GitHub'ın iş akışını keşfedip başlatıp başlatmayacağını belirler.

### İlgili İçerik

- Not Defteri: [GitHub Actions'a Giriş](../../notebooks/tr/28-introduction-to-github-actions.md)
- Lab: [Bir GitHub Actions İş Akışını Çalıştırma](../../labs/tr/28-run-a-github-actions-workflow.md)
- Kısa Sınav: [GitHub Actions'a Giriş Kısa Sınavı](../../quizzes/tr/28-introduction-to-github-actions-quiz.md)
