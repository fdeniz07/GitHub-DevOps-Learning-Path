---
chapter: 20
title: "Küçük Bir GitLab Teslimatını Planla"
related_notebook: "GitLab İş Ögeleri, Issue'lar ve Planlama"
related_exercise: "GitLab İş Ögelerini Önceliklendir"
level: Başlangıç
estimated_time: 45 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-30
---

> **Gezinme:** [Notebook](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md) | [Alıştırma](../../exercises/tr/20-gitlab-is-ogelerini-onceliklendir.md) | [Quiz](../../quizzes/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama-quiz.md) | [Yol Haritası](../../ROADMAP.md)

## Küçük Bir GitLab Teslimatını Planla

## Amaç

Küçük bir dokümantasyon iyileştirmesini GitLab work item veya issue'dan incelenebilir merge request'e kadar planlamak ve takip etmek.

## Senaryo

Yeni katkıcılar proje kontrollerini çalıştıran komutu bulamıyor. Ekip, komutu mevcut dokümantasyon milestone'unda README'ye eklemek istiyor.

## Ön Koşullar

- [Notebook](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md) ve [alıştırma](../../exercises/tr/20-gitlab-is-ogelerini-onceliklendir.md) tamamlandı.
- Issue, branch ve merge request oluşturabileceğiniz bir GitLab projesine erişiminiz var.
- Git ve web tarayıcısı kullanılabilir.

## Görevler

### Görev 1 - Teslime hazır iş ögesi oluşturma

1. Sonuç odaklı başlıklı bir work item veya issue oluşturun.
2. Eksik bilgiyi, hedef kitleyi ve kapsam dışını açıklayın.
3. Kabul kriterleri, label'lar, assignee ve mevcut milestone'u ekleyin.

**Beklenen Sonuç:** İş ögesi kriterleriyle kabul edilebilir ve destekleniyorsa planlama görünümünde görünürdür.

### Görev 2 - Uygulamayı bağlama

1. `123-kontrol-komutunu-belgele` gibi odaklı bir branch oluşturun.
2. En küçük tam README değişikliğini yapın ve diff'i yerelde inceleyin.
3. Branch'i push edin ve doğru target branch için merge request açın.

**Beklenen Sonuç:** Branch ve merge request, uyguladıkları iş ögesini açıkça tanımlar.

### Görev 3 - İnceleme kaydını tamamlama

1. Merge request'i iş ögesine bağlayın; gerekirse desteklenen kapatma referansını kullanın.
2. Ne değiştiğini ve nasıl kontrol ettiğinizi yazın.
3. Merge öncesinde yorumları, pipeline durumunu ve kriterleri inceleyin.

**Beklenen Sonuç:** Plan, uygulama, doğrulama ve kapanış tek bir izlenebilir kayıtta birleşir.

## Doğrulama Kontrol Listesi

- [ ] Başlık bir sonucu anlatır.
- [ ] Kriterler gözlemlenebilirdir.
- [ ] Label ve milestone ortak sözlüğe uygundur.
- [ ] Branch ve merge request iş ögesine bağlıdır.
- [ ] İnceleme ve zorunlu kontroller tamamlanmıştır.

## Sorun Giderme

| Sorun                            | Olası Neden                            | Çözüm                                                                               |
| -------------------------------- | -------------------------------------- | ----------------------------------------------------------------------------------- |
| Planlama board'u görünmüyor      | Sürüm veya izin desteklemiyor.         | Label ve milestone kullanın; kullanılabilir görünümleri proje sahibiyle doğrulayın. |
| İş ögesi merge sonrası kapanmadı | Referans veya target branch tanınmadı. | Proje kurallarını kontrol edin; kriterler sağlanınca gerekirse elle kapatın.        |

## İlgili İçerik

- Notebook: [GitLab İş Ögeleri, Issue'lar ve Planlama](../../notebooks/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama.md)
- Alıştırma: [GitLab İş Ögelerini Önceliklendir](../../exercises/tr/20-gitlab-is-ogelerini-onceliklendir.md)
- Quiz: [GitLab İş Ögeleri, Issue'lar ve Planlama Quiz'i](../../quizzes/tr/20-gitlab-is-ogeleri-issuelar-ve-planlama-quiz.md)
