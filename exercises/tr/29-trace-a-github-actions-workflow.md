---
chapter: 29
title: "Bir GitHub Actions İş Akışını İzleyin"
related_notebook: "GitHub Actions İş Akışı Anatomisi"
level: Başlangıç
estimated_time: 35 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-22
---

> **Gezinme:** [Not Defteri](../../notebooks/tr/29-github-actions-workflow-anatomy.md) | [Lab](../../labs/tr/29-review-workflow-execution.md) | [Kısa Sınav](../../quizzes/tr/29-workflow-anatomy-quiz.md) | [Roadmap](../../ROADMAP.md)

## Amaç

Bir iş akışını tetikleyicisinden job'lara ve adımlara kadar izleyin, ardından çalıştırma sırasını açıklayın.

## Öğrenme Kazanımları

- üst düzey anahtarları sorumluluklarıyla eşleştirmek;
- `needs` tarafından oluşturulan bir job bağımlılığını belirlemek;
- ayrı job'ların neden ayrı kurulumlara ihtiyaç duyduğunu fark etmek.

## Ön Koşullar

- Bölüm 29 not defterini okuyun.
- Temel YAML map ve listelerini okuyabiliyor olun.

## Senaryo

Bu iş akışını bir inceleme alıştırması olarak kullanın:

```yaml
name: Review gate
on:
  pull_request:
    branches: [main]
permissions:
  contents: read
jobs:
  inspect:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - run: git ls-files
  report:
    needs: inspect
    runs-on: ubuntu-latest
    steps:
      - run: echo "Inspection completed"
```

## Görevler

### Görev 1

Üst düzey anahtarları listeleyin ve her birinin amacını açıklayan bir cümle yazın.

### Beklenen Sonuç: Üst Düzey Anahtarlar

`name`, `on`, `permissions` ve `jobs` anahtarlarını iç içe anahtarlarla karıştırmadan belirleyebilirsiniz.

### Görev 2

Çalıştırma sırasını çizin ve `report` job'ının `inspect` job'ını beklediği noktayı işaretleyin.

### Beklenen Sonuç: Çalıştırma Sırası

Olayın `inspect` job'ını başlatmasını, sıralı adımlarını, başarılı tamamlanmasını ve ardından `report` job'ını gösterirsiniz.

### Görev 3

`inspect` içindeki checkout işleminin dosyaları otomatik olarak `report` için kullanılabilir hâle getirmediğini açıklayın.

### Beklenen Sonuç: Job Yalıtımı

Job'ların normalde ayrı runner'lar kullandığını ve kendi kurulumlarına ya da açık bir artifact aktarımına ihtiyaç duyduğunu fark edersiniz.

## Zorluk

Yalnızca `report` job'ından sonra çalışan üçüncü bir job ekleyin, ardından checkout gerekip gerekmediğine karar verip cevabınızı gerekçelendirin.

## Öz Değerlendirme

- [ ] Bir iş akışını kökten aşağıya doğru okuyabilirim.
- [ ] `needs` ifadesinin neyi bağladığını biliyorum.
- [ ] Job yalıtımını anlıyorum.

## Yaygın Hatalar

| Hata                                                          | Çözüm                                                            |
| ------------------------------------------------------------- | ---------------------------------------------------------------- |
| `needs` ifadesini bir step anahtarı olarak ele almak          | Job sıralamasını ifade etmek için onu bir job üzerinde kullanın. |
| Checkout işleminin job'lar arasında kalıcı olduğunu varsaymak | Kurulumu tekrarlayın veya veriyi açıkça aktarın.                 |
| Tetikleyici filtrelerini yok saymak                           | Olay map'ini ve branch filtrelerini birlikte okuyun.             |

## Özet

Bir iş akışını izlemek; olay, izin, job, runner, bağımlılık ve adım ilişkilerini sırayla takip etmek anlamına gelir.

### İlgili İçerik

- Not Defteri: [GitHub Actions İş Akışı Anatomisi](../../notebooks/tr/29-github-actions-workflow-anatomy.md)
- Lab: [İş Akışı Çalıştırmasını İnceleme](../../labs/tr/29-review-workflow-execution.md)
- Kısa Sınav: [İş Akışı Anatomisi Kısa Sınavı](../../quizzes/tr/29-workflow-anatomy-quiz.md)
