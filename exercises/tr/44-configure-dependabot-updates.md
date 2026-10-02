---
chapter: 44
title: "Dependabot Güncellemelerini Yapılandırma"
related_notebook: "Dependabot Güncellemeleri"
related_lab: "Bir Dependabot Güncellemesini İnceleme"
related_quiz: "Dependabot Quiz'i"
level: Intermediate
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/44-dependabot.md) | [Lab](../../labs/tr/44-review-a-dependabot-update.md) | [Yol Haritası](../../ROADMAP.md)

# Dependabot Güncellemelerini Yapılandırma

## Amaç

İnceleme kalitesini korurken uygulama bağımlılıklarını ve GitHub Actions'ı güncel tutan bir Dependabot politikası oluşturun.

## Sonuçlar

- Ekosistem, dizin, aralık ve pull request sınırı yapılandırmak.
- Gruplamanın ne zaman yararlı olduğuna karar vermek.
- Güncellemeyi birleştirmeden önce gereken kontrolleri tanımlamak.

## Ön Koşullar

- [Dependabot Güncellemeleri notebook'unu](../../notebooks/tr/44-dependabot.md) okuyun.
- Bildirimleri ve kilit dosyalarını anlayın.
- CI durum kontrollerinin nasıl çalıştığını bilin.

## Senaryo

Bir depoda eski Python paketleri ve eylem sürümleri var. Dependabot yönetilebilir sayıda pull request açmalı ve güvenlik güncellemelerini görünür tutmalıdır.

## Görevler

### Görev 1 — Politikayı yazın

`version: 2`, `/` için haftalık `pip` güncellemesi ve aylık `github-actions` güncellemesi içeren `.github/dependabot.yml` oluşturun.

**Beklenen Sonuç:** Her iki ekosistem açık bir zamanlamayla izlenir.

### Görev 2 — Gürültüyü kontrol edin

`open-pull-requests-limit: 5` ayarlayın ve uyumlu üretim bağımlılığı güncellemelerini gruplayın. Gruplamanın bir riskini açıklayın.

**Beklenen Sonuç:** Ekip inceleme bağlamını kaybetmeden yönetilebilir öneriler alır.

### Görev 3 — İnceleme kanıtını tanımlayın

Birleştirmeden önce incelenmesi gereken sürüm notlarını, kilit dosyası farkını, CI kontrollerini, güvenlik sonucunu ve uyumluluk davranışını listeleyin.

**Beklenen Sonuç:** Güncelleme Dependabot açtığı için değil, kanıt desteklediği için birleştirilir.

## Meydan Okuma

Her yok sayma kuralı için bir sahip ve bitiş tarihi tasarlayın. Kalıcı yok saymaların neden riskli olduğunu açıklayın.

## Öz Değerlendirme

- [ ] İki ekosistemi yapılandırabiliyorum.
- [ ] Gruplama ödünleşimini açıklayabiliyorum.
- [ ] Kilit dosyalarını ve geçişli değişiklikleri inceliyorum.
- [ ] Dependabot PR'larının yine de test gerektirdiğini biliyorum.

## Yaygın Hatalar

| Hata                                    | Çözüm                                             |
| --------------------------------------- | ------------------------------------------------- |
| Yalnızca uygulama paketlerini izlemek   | `github-actions` güncellemelerini de ekleyin.     |
| CI olmadan birleştirmek                 | Testleri ve güvenlik kontrollerini zorunlu tutun. |
| Bir güvenlik açığını süresiz yok saymak | Sahip ve inceleme tarihi atayın.                  |

## Özet

Dependabot değişiklik önerir; bakımcılar birleştirmeden önce sürüm notlarını, bağımlılık grafiklerini, testleri ve riski inceler.

## İlgili Bağlantılar

- Notebook: [Dependabot Güncellemeleri](../../notebooks/tr/44-dependabot.md)
- Lab: [Bir Dependabot Güncellemesini İnceleme](../../labs/tr/44-review-a-dependabot-update.md)
- Quiz: [Dependabot Quiz'i](../../quizzes/tr/44-dependabot-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
