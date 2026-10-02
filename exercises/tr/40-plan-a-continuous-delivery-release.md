---
chapter: 40
title: "Sürekli Teslimat Sürümü Planlama"
related_notebook: "Sürekli Teslimat"
related_lab: "Sürekli Teslimat Sürümünü Hazırlama"
related_quiz: "Sürekli Teslimat Quiz'i"
level: Intermediate
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/40-continuous-delivery.md) | [Lab](../../labs/tr/40-stage-a-continuous-delivery-release.md) | [Yol Haritası](../../ROADMAP.md)

# Sürekli Teslimat Sürümü Planlama

## Amaç

Bir kez derleyen, sonucu test eden, değişmez bir yapıt yayımlayan ve üretim sürümünü isteğe bağlı hâle getiren bir sürüm hattı planlayın.

## Sonuçlar

- Sürüme hazır olmayı otomatik üretim dağıtımından ayırmak.
- Yapıt, hazırlama, onay ve geri alma sınırlarını tanımlamak.
- İzlenebilirliğin nasıl korunacağını açıklamak.

## Ön Koşullar

- [Sürekli Teslimat notebook'unu](../../notebooks/tr/40-continuous-delivery.md) okuyun.
- GitHub Actions içinde işleri, `needs` değerini ve yapıtları anlayın.
- Hazırlama ile üretim arasındaki farkı bilin.

## Senaryo

Bir web hizmeti hazırlama ve üretim için ayrı ayrı derleniyor. Ekip bir test edilmiş sürüm adayı oluşturan ve yetkili bir kişinin üretimi daha sonra onaylamasına izin veren daha güvenli bir süreç istiyor.

## Görevler

### Görev 1 — Aşamaları eşleyin

`package`, `staging` ve `production` aşamalarını tasarlayın. Hangi işin hangi önceki işe bağlı olduğunu belirtin.

**Beklenen Sonuç:** Plan ilerletme sırasını açıkça gösterir.

### Görev 2 — Yapıt kanıtını tanımlayın

Bir yapıt adı, sağlama toplamı, sürüm tanımlayıcısı ve test kanıtı seçin. Üretimin package aşamasında oluşturulan yapıtı neden indirmesi gerektiğini açıklayın.

**Beklenen Sonuç:** Sürüm tek bir test edilmiş değişmez yapıta izlenebilir.

### Görev 3 — Onay sınırını tanımlayın

Korumalı bir `production` ortamının sürüm onayını nasıl kontrol edeceğini ve geri almanın nasıl isteneceğini açıklayın.

**Beklenen Sonuç:** Plan sürekli teslimatı korur ve sessizce sürekli dağıtıma dönüşmez.

## Meydan Okuma

Commit SHA, bağımlılık kilit dosyası özeti, test sonucu ve derleme zaman damgası içeren bir sürüm bildirimi ekleyin. Hangi değerlerin değişmez olması gerektiğini açıklayın.

## Öz Değerlendirme

- [ ] Sürekli teslimatı tek cümleyle açıklayabiliyorum.
- [ ] Bir kez derleme ve ilerletme tasarladım.
- [ ] Onay ve geri alma kanıtını ekledim.
- [ ] Yeniden derlemenin izlenebilirliği neden zayıflattığını biliyorum.

## Yaygın Hatalar

| Hata                            | Çözüm                                               |
| ------------------------------- | --------------------------------------------------- |
| Üretim için yeniden derlemek    | Test edilmiş yapıtı ilerletin.                      |
| Hazırlamayı üretim onayı saymak | Onay sınırını açık tutun.                           |
| Geri almayı belirtmemek         | Bilinen iyi yapıtı ve kurtarma işlemini adlandırın. |

## Özet

Sürekli teslimat her kabul edilen değişikliği sürümlenebilir kılarken bilinçli üretim kararını korur.

## İlgili Bağlantılar

- Notebook: [Sürekli Teslimat](../../notebooks/tr/40-continuous-delivery.md)
- Lab: [Sürekli Teslimat Sürümünü Hazırlama](../../labs/tr/40-stage-a-continuous-delivery-release.md)
- Quiz: [Sürekli Teslimat Quiz'i](../../quizzes/tr/40-continuous-delivery-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
