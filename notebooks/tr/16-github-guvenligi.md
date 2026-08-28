---
chapter: 16
title: "GitHub Güvenliği"
part: "GitHub"
level: Başlangıç
estimated_time: 80 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Önceki: Bölüm 15](15-github-surumleri.md) | [Yol Haritası](../../ROADMAP.md) | Sonraki: Bölüm 17 yakında

## Öğrenme Hedefleri

- en az ayrıcalık ilkesini açıklamak;
- secretları kaynak koddan ve loglardan uzak tutmak;
- dependency alert, Dependabot ve code scanning farkını anlamak;
- önemli branchleri korumak;
- açığa çıkan secret sonrasında doğru tepki vermek.

## Giriş

Depo güvenliği önleme, tespit ve tepki katmanlarından oluşur. Erişim kontrolü, branch protection, secret scanning, dependency alert ve code scanning birbirini tamamlar; ancak ekip sorumluluğunun yerini tutmaz.

## Kuram

İnsanlara ve workflowlara yalnızca ihtiyaç duydukları izinleri verin. Önemli branchlerde PR incelemesi, başarılı kontroller, çözülmüş konuşmalar ve force push kısıtlaması kullanılabilir.

Secretları kaynak dosyaya yazmayın:

```yaml
env:
  API_TOKEN: ${{ secrets.API_TOKEN }}
```

Token açığa çıkarsa hemen iptal edin, yenileyin, kullanıldığı sistemleri inceleyin, içeriği ve gerekirse geçmişi temizleyin, sorumluları bilgilendirin ve iyileştirmeleri belgeleyin.

Dependency alert bilinen riskleri bildirir. Dependabot güncelleme PR'leri açabilir; bunlar test edilmelidir. Code scanning kaynak kodda olası güvenlik sorunlarını bulur ve insan incelemesi gerektirir.

## En İyi Uygulamalar

- İnsan ve workflowlar için en az ayrıcalık kullanın.
- Varsayılan branchi koruyun.
- Alertleri düzenli takip edin.
- `SECURITY.md` içinde özel bildirim yolu belirtin.
- Secretları issue, log veya PR içine yazmayın.

## Yaygın Hatalar

Secretı yalnızca güncel dosyadan silmenin geçmişi temizlediğini sanmak, workflowlara geniş yazma izni vermek ve güvenlik uyarılarını görmezden gelmek risklidir.

## Özet

GitHub Security; erişim kuralları, branch protection, secret güvenliği, dependency bakımı, code scanning ve incident response birlikte kullanıldığında anlamlıdır.

## Sonraki Bölüm

Bölüm 17 GitLab DevOps track'ini başlatır.

### İlgili İçerik

- Alıştırma: [GitHub Güvenlik Kontrollerini İnceleme](../../exercises/tr/16-github-guvenlik-kontrollerini-incele.md)
- Laboratuvar: [GitHub Deposunu Güvenli Hale Getirme](../../labs/tr/16-github-deposunu-guvenlikli-hale-getir.md)
- Quiz: [GitHub Güvenliği Quiz'i](../../quizzes/tr/16-github-guvenligi-quiz.md)
