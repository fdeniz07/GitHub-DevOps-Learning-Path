---
chapter: 38
title: "Derleme Artifact'larını İşler Arasında Paylaşma"
related_notebook: "GitHub Actions Artifact'ları"
related_exercise: "İş Akışı Artifact'larını Yayımlama ve Tüketme"
level: Intermediate
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Not Defteri](../../notebooks/tr/37-github-actions-dependency-caching.md) | [Not Defteri](../../notebooks/tr/38-github-actions-artifacts.md) | [Alıştırma](../../exercises/tr/38-publish-and-consume-workflow-artifacts.md) | [Kısa Sınav](../../quizzes/tr/38-artifacts-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Derleme Artifact'larını İşler Arasında Paylaşma

## Amaç

Derleme dosyalarını güvenli biçimde aktaran, doğrulayan ve saklayan bir üretici-tüketici iş akışı oluşturun.

## Öğrenme Çıktıları

- `needs` ile iş sınırlarını modellemek;
- adlandırılmış artifact'ları yüklemek ve indirmek;
- saklama ve doğrulama kontrolleri uygulamak.

## Senaryo

Bir derleme işi bir paket ve test raporu üretir. Bir inceleme işi raporu doğrular ve sürüm hazırlama işi yalnızca doğrulanmış paketi alır. Hiçbir iş dosyaların kendi runner'ında kalıcı olduğunu varsayamaz.

## Ön Koşullar

- İlgili not defterini ve alıştırmayı tamamlamış olmak.
- Deterministik bir derleme veya test komutu.
- İş akışı çalıştırmalarının incelenebileceği bir depo.

## Ortam Kurulumu

| Gereksinim      | Değer                                            |
| --------------- | ------------------------------------------------ |
| İşletim Sistemi | GitHub tarafından barındırılan Ubuntu runner'ı   |
| Yazılım         | GitHub Actions ve projenin derleme aracı         |
| Sürüm           | Uygulama projesi tarafından desteklenen sürümler |

## Görevler

### Görev 1 — Dar kapsamlı artifact'lar üretme

1. Ayrılmış bir çıktı klasörüne derleyin.
2. Paketi ve raporu ayrı adlandırılmış artifact'lar olarak yükleyin.
3. Rapor için kısa, paket için politika tarafından onaylanmış bir saklama süresi ayarlayın.

**Beklenen Sonuç:** Artifact'lar yalnızca amaçlanan dosyaları içerir ve yaşam döngüleri açıktır.

### Görev 2 — Bir sınırın ötesinde inceleme

1. İnceleme işini derleme işine bağımlı yapın.
2. Raporu temiz bir klasöre indirin.
3. Devam etmeden önce beklenen dosya adlarını ve içeriği doğrulayın.

**Beklenen Sonuç:** Tüketici açık bir girdi alır ve geçersiz bir raporu reddeder.

### Görev 3 — Bir sürüm hazırlama

1. Sürüm işine yalnızca paket artifact'ını indirin.
2. Bir sağlama toplamını veya projeye uygun başka bir bütünlük sinyalini doğrulayın.
3. Doğrulama başarılı olana kadar yayımlamayı devre dışı tutun.

**Beklenen Sonuç:** Sürüm hazırlama, en az ayrıcalıklı bir dosya aktarımı kullanır.

## Doğrulama Kontrol Listesi

- [ ] Her tüketicinin açık bir `needs` ilişkisi vardır.
- [ ] Artifact adları matris işleri arasında çakışamaz.
- [ ] Saklama süresi değer ve hassasiyetle eşleşir.
- [ ] İndirilen dosyalar kullanılmadan önce doğrulanır.
- [ ] Hiçbir gizli bilgi veya tam çalışma alanı yüklenmez.

## Sorun Giderme

| Sorun                          | Olası Neden                          | Çözüm                                                         |
| ------------------------------ | ------------------------------------ | ------------------------------------------------------------- |
| Artifact eksik                 | Üretici başarısız veya ad farklı     | Üreticiyi ve tam adı inceleyin.                               |
| Dosyalar mevcut değil          | İşler ayrı runner kullanıyor         | Artifact'ı açıkça indirin.                                    |
| Sürüm yanlış dosyayı tüketiyor | Geniş yol veya yeniden kullanılan ad | Yolları daraltın ve çalıştırma veya matris kimliğini ekleyin. |

## En İyi Uygulamalar

- Kontrol edilene kadar artifact içeriğini güvenilmeyen kabul edin.
- Sürüm izinlerini mümkün olan en küçük işte tutun.
- Saklama değerlerinin neden uygun olduğunu belgeleyin.

## Özet

Laboratuvar, iş sınırları arasındaki dosya hareketini açık, sınırlı ve doğrulanabilir hale getirir.

### İlgili İçerik

- Not Defteri: [GitHub Actions Artifact'ları](../../notebooks/tr/38-github-actions-artifacts.md)
- Alıştırma: [İş Akışı Artifact'larını Yayımlama ve Tüketme](../../exercises/tr/38-publish-and-consume-workflow-artifacts.md)
- Kısa Sınav: [Artifact'lar Kısa Sınavı](../../quizzes/tr/38-artifacts-quiz.md)
