---
chapter: 35
title: "Yeniden Kullanılabilir Bir Composite Action Oluşturun"
related_notebook: "GitHub Actions Composite Action'ları"
level: Orta
estimated_time: 30 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/35-composite-actions.md) | [Lab](../../labs/tr/35-package-a-composite-action.md) | [Kısa Sınav](../../quizzes/tr/35-composite-actions-quiz.md) | [Roadmap](../../ROADMAP.md)

# Yeniden Kullanılabilir Bir Composite Action Oluşturun

## Amaç

Gerekli bir input ve yararlı bir output içeren yerel bir composite action oluşturun.

## Öğrenme Kazanımları

- geçerli action metadata'sı oluşturmak;
- değerleri kabuk adımlarına güvenli biçimde aktarmak;
- bir iş akışından action output'u tüketmek.

## Ön Koşullar

- [GitHub Actions Composite Action'ları](../../notebooks/tr/35-composite-actions.md) konusunu tamamlayın.
- Actions etkin bir GitHub repository'si.
- YAML ve shell komutlarına aşinalık.

## Senaryo

Birden çok iş akışının project name ve çalışma dizinini aynı formatta raporlaması gerekiyor. Bu tekrarlanan davranışı yerel bir action olarak bir kez uygulayın.

## Görevler

### Görev 1

Gerekli `project` input'u ve `summary` output'u içeren `.github/actions/report-project/action.yml` dosyasını oluşturun. `runs.using: composite` kullanın.

### Beklenen Sonuç

Metadata input'u açıkça tanımlar ve public output'u bir step output'una eşler.

### Görev 2

Güvenli bir summary'yi `GITHUB_OUTPUT` dosyasına yazan bir Bash adımı ekleyin. Input'u doğrudan shell sözdizimine yerleştirmek yerine bir environment variable aracılığıyla aktarın.

### Beklenen Sonuç

Action, input metnini shell kodu olarak ele almadan öngörülebilir bir output sunar.

### Görev 3

Action'ı bir workflow'dan çağırın, output'u yazdırın ve çalıştırma log'unu kazara oluşan secret'lar veya kafa karıştıran değerler açısından inceleyin.

### Beklenen Sonuç

Workflow başarılı olur ve sonraki adımlar `${{ steps.report.outputs.summary }}` değerini okuyabilir.

## Zorluk

Güvenli bir varsayılan değere sahip isteğe bağlı bir `prefix` input'u ekleyin ve hem varsayılan hem de özel değeri test edin.

## Öz Değerlendirme

- [ ] Action metadata contract'ını açıklayabilirim.
- [ ] Açık bir shell ve güvenli environment variable'lar kullandım.
- [ ] Bir output'u eşledim ve tükettim.

## Yaygın Hatalar

| Hata                           | Çözüm                                                        |
| ------------------------------ | ------------------------------------------------------------ |
| Bir run adımında `shell` eksik | `shell: bash` veya desteklenen başka bir shell ekleyin.      |
| Yanlış output id kullanmak     | Output eşlemesini step `id` değeriyle aynı yapın.            |
| Hassas input'u yazdırmak       | Log'ları inceleyin ve secret'ları summary'lerden uzak tutun. |

## Özet

Input ve output'u yeniden kullanılabilir bir contract oluşturan, odaklanmış bir yerel action oluşturdunuz.

### İlgili İçerik

- Not Defteri: [GitHub Actions Composite Action'ları](../../notebooks/tr/35-composite-actions.md)
- Lab: [Bir Composite Action'ı Paketleme](../../labs/tr/35-package-a-composite-action.md)
- Kısa Sınav: [Composite Action'ları Kısa Sınavı](../../quizzes/tr/35-composite-actions-quiz.md)
