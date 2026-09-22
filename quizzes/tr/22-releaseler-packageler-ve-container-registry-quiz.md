---
chapter: 22
title: "Release'ler, Package'ler ve Container Registry Quiz"
related_notebook: "Release'ler, Package'ler ve Container Registry"
related_exercise: "Sürümlü bir release planla"
related_lab: "Sürümlü bir package yayınla ve kullan"
level: Başlangıç
estimated_time: 15 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/22-releaseler-packageler-ve-container-registry.md) | [Alıştırma](../../exercises/tr/22-surumlu-bir-release-planla.md) | [Laboratuvar](../../labs/tr/22-surumlu-package-yayinla-ve-kullan.md) | [Yol Haritası](../../ROADMAP.md)

## Release'ler, Package'ler ve Container Registry Quiz

### Soru 1

`2.3.1` içindeki `MINOR` sayısı genellikle neyi gösterir?

- A. Kırıcı genel değişiklik
- B. Geriye uyumlu yeni özellik
- C. Değiştirilmiş artefakt
- D. Gizli kimlik bilgisi

**Cevap:** B. Minor sürüm, uyumlu yeni yeteneği belirtir.

### Soru 2

Tag ile release'i doğru ayıran ifade hangisidir?

- A. Tag bir commit'i işaretler; release sürümü ve notlarını duyurur.
- B. Release kaynak kodu değiştirir; tag container image saklar.
- C. Her zaman ilgisiz sürümleri vardır.

**Cevap:** A. Release kaydı kaynak tag'ine teslim bağlamı ekler.

### Soru 3

Doğru mu yanlış mı: Hata bulunduğunda `1.2.0` yeniden oluşturulup üzerine yazılabilir.

**Cevap:** Yanlış. Değişmez sürüm korunur; örneğin `1.2.1` yayınlanır.

### Soru 4

Neden üretimde `latest` yerine sabit image sürümü veya digest kullanılmalıdır?

**Cevap:** Sabit referans, dağıtılan artefaktı tekrarlanabilir ve incelenebilir yapar.

### Soru 5

Registry yayınlama erişimi kime verilmelidir?

**Cevap:** Yalnızca sorumlu sahip veya onaylı otomasyona; mümkün olduğunda okuyuculara salt okuma izni verilir.

## İlgili İçerik

- [Notebook](../../notebooks/tr/22-releaseler-packageler-ve-container-registry.md)
- [Alıştırma](../../exercises/tr/22-surumlu-bir-release-planla.md)
- [Laboratuvar](../../labs/tr/22-surumlu-package-yayinla-ve-kullan.md)
