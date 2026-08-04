---
chapter: 03
title: "Git Kurulumunu Doğrulama"
related_notebook: "Git Kurulumu"
level: Başlangıç
estimated_time: 20 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-03
---

> **Gezinme:** [Not defteri](../../notebooks/tr/03-git-kurulumu.md) | [Laboratuvar](../../labs/tr/03-git-kurma-ve-yapilandirma.md) | [Quiz](../../quizzes/tr/03-git-kurulumu-quiz.md) | [Yol Haritası](../../ROADMAP.md)

# Git Kurulumunu Doğrulama

## Amaç

Terminalin Git'i çalıştırabildiğini ve Git'in bilinçli bir genel commit kimliğine sahip olduğunu doğrulamak.

## Senaryo

Bir ekip arkadaşı Git'in kurulduğunu, ancak commit oluştururken hata aldığını söylüyor. Ayar değiştirmeden önce terminalden kanıt toplayın.

## Görevler

### Görev 1 - Komutun Bulunabilirliğini Kontrol Edin

`git --version` çalıştırın. Sürüm yazdırıldığını veya komutun bulunamadığını kaydedin.

#### Beklenen Sonuç: Kurulum Kanıtı

Çalışan Git kurulumu ile terminalin Git'i bulamadığı durumu ayırt edersiniz.

### Görev 2 - Kimliği İnceleyin

```bash
git config --global --get user.name
git config --global --get user.email
```

Her değerin commit geçmişi için uygun olup olmadığını açıklayın.

#### Beklenen Sonuç: Yapılandırma Kanıtı

Eksik, örnek veya bilinçli olarak ayarlanmış ad ve e-posta değerlerini tanırsınız.

### Görev 3 - En Küçük Düzeltmeyi Belirleyin

| Durum                                               | En küçük sonraki adım                                           |
| --------------------------------------------------- | --------------------------------------------------------------- |
| Git, kurulumdan önce açılmış terminalde bulunamıyor | Yeni terminal açıp `git --version` komutunu yeniden çalıştırın. |
| Git sürümü var, ancak `user.email` yazdırılmıyor    | `user.email` değerini ayarlayıp yeniden okuyun.                 |
| İş deposu onaylı kurumsal e-posta gerektiriyor      | Commit oluşturmadan önce onaylı e-postayı yapılandırın.         |

## Öz Değerlendirme

- [ ] Depo oluşturmadan Git'i doğrulayabiliyorum.
- [ ] Kurulumdan sonra yeni terminalin neden önemli olduğunu biliyorum.
- [ ] Committen önce ad ve e-postayı inceleyebiliyorum.

### İlgili İçerik

- Not defteri: [Git Kurulumu](../../notebooks/tr/03-git-kurulumu.md)
- Laboratuvar: [Git'i Kurma ve Yapılandırma](../../labs/tr/03-git-kurma-ve-yapilandirma.md)
- Quiz: [Git Kurulumu Quiz](../../quizzes/tr/03-git-kurulumu-quiz.md)
