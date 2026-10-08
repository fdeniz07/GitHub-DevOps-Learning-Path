---
chapter: 41
title: "Denetimli Dağıtım Çalıştırma"
related_notebook: "Sürekli Dağıtım"
related_exercise: "Denetimli Dağıtım Tasarlama"
related_quiz: "Sürekli Dağıtım Quiz'i"
level: Intermediate
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/41-continuous-deployment.md) | [Alıştırma](../../exercises/tr/41-design-a-controlled-deployment.md) | [Yol Haritası](../../ROADMAP.md)

# Denetimli Dağıtım Çalıştırma

## Amaç

Sağlık kontrolleri, eşzamanlılık koruması ve geri alma içeren otomatik bir canary dağıtımını simüle edin.

## Sonuçlar

- Test edilmiş bir yapıtı canary aşamasından ilerletmek.
- Sağlıksız sinyalde durmak.
- Dağıtım ve geri alma kanıtını kaydetmek.

## Ön Koşullar

- Notebook'u ve alıştırmayı tamamlayın.
- Bir hazırlama yapıtına ve test uç noktasına sahip olun.
- GitHub ortamı ve eşzamanlılık ayarlarını anlayın.

## Senaryo

Bir hizmet sürekli dağıtıma hazırdır ancak üretim trafiği kademeli açılmalıdır. %10 trafik dağıtacak, sağlığı doğrulayacak ve ilerletecek veya geri alacaksınız.

## Ortam

| Gereksinim      | Değer                                           |
| --------------- | ----------------------------------------------- |
| İşletim Sistemi | Windows, Linux veya macOS                       |
| Yazılım         | GitHub Actions, shell, test hizmeti             |
| Erişim          | Üretim olmayan veya sandbox `production` ortamı |

## Görevler

### Görev 1 — Dağıtım işini yapılandırın

`environment: production`, `concurrency.group: production` ve `cancel-in-progress: false` içeren bir üretim işi oluşturun.

**Beklenen Sonuç:** Çakışan üretim dağıtımları önlenir.

### Görev 2 — Canary'yi dağıtın

%10 trafik ayarıyla bir dağıtım komutu çalıştırın. Commit SHA, yapıt tanımlayıcısı, başlangıç zamanı ve operatör veya iş akışı çalışmasını kaydedin.

**Beklenen Sonuç:** Canary izlenebilir ve kapsamı sınırlıdır.

### Görev 3 — Doğrulayın ve kurtarın

Sağlık kontrolleri çalıştırın. Başarısızlıkta geri alma yapın ve başarısız sürüm kanıtını koruyun. Başarıda trafiği ilerletin.

**Beklenen Sonuç:** Karar ölçülebilir sağlığa dayanır ve hizmet kurtarılabilir.

## Doğrulama Kontrol Listesi

- [ ] Tam trafikten önce canary dağıtıldı.
- [ ] Sağlık kontrollerinin açık eşikleri var.
- [ ] Üretim eşzamanlılığı yapılandırıldı.
- [ ] Geri alma çalıştırılabilir.
- [ ] Dağıtım kanıtı saklandı.

## Sorun Giderme

| Sorun                                 | Olası Neden                     | Çözüm                                                 |
| ------------------------------------- | ------------------------------- | ----------------------------------------------------- |
| İki sürüm çakışıyor                   | `concurrency` eksik veya yanlış | Tek ve sabit üretim grubu kullanın.                   |
| Canary başarısızlığa rağmen ilerliyor | Sağlık sonucu yok sayılıyor     | Adımı başarısız yapın ve ilerletmeyi koşula bağlayın. |
| Geri alma eski sürümü bulamıyor       | Yapıt saklama yetersiz          | Bilinen iyi yapıtı saklayın.                          |

## En İyi Uygulamalar

- Dağıtım alıştırması için sandbox kullanın.
- Eşikleri açık ve gözlemlenebilir tutun.
- Otomatik ilerletmeyi etkinleştirmeden önce geri almayı prova edin.

## Özet

Denetimli dağıtım, otomasyonu ölçülebilir güvenlik sınırlarıyla birleştirir; elle umuda dayanmaz.

## İlgili Bağlantılar

- Notebook: [Sürekli Dağıtım](../../notebooks/tr/41-continuous-deployment.md)
- Alıştırma: [Denetimli Dağıtım Tasarlama](../../exercises/tr/41-design-a-controlled-deployment.md)
- Quiz: [Sürekli Dağıtım Quiz'i](../../quizzes/tr/41-continuous-deployment-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
