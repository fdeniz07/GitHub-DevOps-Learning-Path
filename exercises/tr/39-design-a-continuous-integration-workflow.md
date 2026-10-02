---
chapter: 39
title: "Sürekli Entegrasyon İş Akışı Tasarlama"
related_notebook: "Sürekli Entegrasyon"
related_lab: "Sürekli Entegrasyon Hattı Oluşturma"
related_quiz: "Sürekli Entegrasyon Quiz'i"
level: Beginner
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/39-continuous-integration.md) | [Lab](../../labs/tr/39-build-a-continuous-integration-pipeline.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Entegrasyon İş Akışı Tasarlama

## Amaç

Pull request'leri doğrulayan ve `main` dalını sağlıklı tutan bir GitHub Actions iş akışı tasarlayın.

## Sonuçlar

Şunları yapabileceksiniz:

- Uygun `pull_request` ve `push` tetikleyicilerini seçmek.
- Derleme ve test sorumluluklarını ayırmak.
- En az iş akışı `permissions` uygulamak.

## Ön Koşullar

- [Sürekli Entegrasyon notebook'unu](../../notebooks/tr/39-continuous-integration.md) okuyun.
- YAML eşlemelerini, listelerini ve girintisini anlayın.
- Tekrarlanabilir bir test komutuna sahip bir deponuz olsun.

## Senaryo

Bir ekip değişiklikleri otomatik kontroller olmadan birleştiriyor. Göreviniz küçük bir Python hizmeti için ilk CI iş akışını tasarlamaktır. İş akışı pull request'lerde ve `main` dalına push'larda çalışmalı, bağımlılıkları kurmalı ve gereksiz yazma erişimi istemeden testleri çalıştırmalıdır.

## Görevler

### Görev 1 — İş akışı sözleşmesini tanımlayın

İş akışı adını, `on` tetikleyicilerini, `permissions` değerini, çalıştırıcıyı ve iş tanımlayıcısını yazın. Varsayılan depo izni olarak `contents: read` kullanın.

**Beklenen Sonuç:** İş akışı önerilen değişiklikleri ve varsayılan dalı salt okunur depo erişimiyle doğrular.

### Görev 2 — Tekrarlanabilir doğrulama ekleyin

Checkout, `cache: pip` ile Python kurulumu, bağımlılık kurulumu ve `python -m pytest` adımlarını ekleyin. Her adıma açık bir `name` verin.

**Beklenen Sonuç:** Başka bir öğrenci projenin nasıl kurulduğunu ve test edildiğini tam olarak anlayabilir.

### Görev 3 — Birleştirme kuralını tanımlayın

Dal korumada hangi kontrolün zorunlu durum kontrolü olması gerektiğini belirtin. Test komutu başarısız olduğunda ne olduğunu açıklayın.

**Beklenen Sonuç:** Başarısız test birleştirmeyi engeller ve görünür geri bildirim üretir.

## Meydan Okuma

İş akışını bağımsız `build`, `test` ve `lint` işlerine ayırın. Hangi işlerin paralel çalışabileceğini ve birleştirmeden önce hangi sonuçların zorunlu olduğunu açıklayın.

## Öz Değerlendirme

- [ ] Pull request'ler ve `main` için tetikleyicileri seçtim.
- [ ] En az ayrıcalıklı `permissions` kullandım.
- [ ] Başarısız bir testin birleştirmeyi nasıl engellediğini açıklayabiliyorum.
- [ ] Belirlenebilir bir CI kontrolü tanımlayabiliyorum.

## Yaygın Hatalar

| Hata                                          | Çözüm                                             |
| --------------------------------------------- | ------------------------------------------------- |
| Yalnızca elle tetiklemek                      | `pull_request` ve `main` için `push` ekleyin.     |
| `write-all` izinleri kullanmak                | Yalnızca işin ihtiyaç duyduğu erişimi tanımlayın. |
| Test komutunu genel bir betik adında gizlemek | Adımı adlandırın ve komutu belgeleyin.            |

## Özet

İyi bir CI tasarımı sık ve tekrarlanabilir geri bildirim ile açık bir birleştirme kararı sağlar. Zorunlu kontroller geri bildirimi uygulanabilir kılar.

## İlgili Bağlantılar

- Notebook: [Sürekli Entegrasyon](../../notebooks/tr/39-continuous-integration.md)
- Lab: [Sürekli Entegrasyon Hattı Oluşturma](../../labs/tr/39-build-a-continuous-integration-pipeline.md)
- Quiz: [Sürekli Entegrasyon Quiz'i](../../quizzes/tr/39-continuous-integration-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
