---
chapter: 34
title: "Özel GitHub Action'ları Yazma Quiz'i"
related_notebook: "Özel GitHub Action'ları Yazma"
related_exercise: "Özel Bir GitHub Action'ı Tasarla"
related_lab: "Özel Bir Action Oluştur ve Test Et"
level: Intermediate
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Önceki Notebook](../../notebooks/tr/33-github-marketplace-actions.md) | [Notebook](../../notebooks/tr/34-writing-custom-github-actions.md) | [Alıştırma](../../exercises/tr/34-design-a-custom-github-action.md) | [Laboratuvar](../../labs/tr/34-build-and-test-a-custom-action.md) | [Yol Haritası](../../ROADMAP.md)

# Özel GitHub Action'ları Yazma Quiz'i

### Soru 1

`action.yml` dosyasının amacı nedir?

**Cevap:** Action'ın adını, arayüzünü, runtime'ını, input'larını, output'larını ve yürütme metadatasını tanımlar.

### Soru 2

Yeniden kullanılabilir bir workflow ne zaman özel bir action'a tercih edilebilir?

**Cevap:** Yeniden kullanılabilir birim birden fazla job, izin, ortam, matrix veya deployment orkestrasyonu gerektirdiğinde.

### Soru 3

Doğru mu, yanlış mı: Runner commit edilmiş bir dağıtım dosyasını çalıştırıyorsa yalnızca JavaScript action kaynağı yeterlidir.

**Cevap:** Yanlış. Çalıştırılan giriş noktasının kaynakla eşleşmesi için dağıtım paketi yeniden oluşturulmalı ve test edilmelidir.

### Soru 4

Özel bir action, başarılı senaryosunun yanı sıra neyi test etmelidir?

**Cevap:** Geçersiz input'ları, açık hata durumlarını, output değerlerini ve desteklenen runner'larda gerçek bir çağıran workflow'u.

### Soru 5

Normalde ne tür bir değişiklik yeni bir major action sürümü gerektirir?

**Cevap:** Belgelenmiş input'larda, output'larda, davranışta veya runtime sözleşmesinde yapılan geriye dönük uyumsuz bir değişiklik.

### İlgili İçerik

- Önceki notebook: [GitHub Marketplace Action'ları](../../notebooks/tr/33-github-marketplace-actions.md)
- Notebook: [Özel GitHub Action'ları Yazma](../../notebooks/tr/34-writing-custom-github-actions.md)
- Alıştırma: [Özel Bir GitHub Action'ı Tasarla](../../exercises/tr/34-design-a-custom-github-action.md)
- Laboratuvar: [Özel Bir Action Oluştur ve Test Et](../../labs/tr/34-build-and-test-a-custom-action.md)
