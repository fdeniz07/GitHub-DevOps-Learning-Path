---
chapter: 04
title: "İlk Deponuzu Oluşturma"
part: "Git Temelleri"
level: Başlangıç
estimated_time: 60 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Önceki: Bölüm 03](03-git-kurulumu.md) | [Yol Haritası](../../ROADMAP.md) | Sonraki: Bölüm 05 yakında
>
> **Seviye:** Başlangıç · **Tahmini Süre:** 60 dakika · **Önkoşullar:** [Bölüm 03: Git Kurulumu](03-git-kurulumu.md)

## Öğrenme Hedefleri

Bu bölümün sonunda:

- bilinçli bir proje klasörü seçebilecek;
- `git init` ile yerel depo oluşturabilecek;
- `git status` ile durumu inceleyebilecek;
- proje dosyaları ile gizli `.git` klasörünü ayırt edebilecek;
- deponun neden net bir sınırı olması gerektiğini açıklayabileceksiniz.

## Giriş

Git deposu, dosyalarınıza ek olarak sürüm geçmişini ve yapılandırmayı da taşıyan bir proje klasörüdür. Git bu bilgileri gizli `.git` klasöründe saklar. Normal dosyalarınız görünür kalır ve herhangi bir düzenleyiciyle değiştirilebilir.

En önemli ilk adım komut değil, doğru konumu seçmektir. `git init` komutunu yalnızca gerçekten bu projeye ait klasörde çalıştırın. Üst klasörde başlatmak, farklı projelerin dosyalarını aynı geçmişe dahil edebilir.

## Görsel Öğrenme

```mermaid
flowchart LR
    A[Proje klasörünü seç] --> B[git init]
    B --> C[.git oluşturulur]
    C --> D[git status çalıştır]
    D --> E[Proje dosyalarını ekle]
```

_Şekil 1. Depo, bilinçli olarak seçilmiş bir proje klasöründe oluşturulur._

## Neden Önemli?

Net bir depo sınırı; durum mesajlarını, commitleri ve ekip çalışmasını anlaşılır kılar. Yanlış klasörde Git başlatılırsa başka projelerin dosyaları da izlenmemiş olarak görünebilir ve yanlışlıkla commitlenebilir.

## Temel Kavramlar

| Kavram         | Açıklama                                                        |
| -------------- | --------------------------------------------------------------- |
| Depo           | Proje dosyaları ile Git metadata bilgilerinin bulunduğu klasör. |
| Çalışma dizini | Dosyaları düzenlediğiniz görünür alan.                          |
| `.git`         | Git geçmişini ve yapılandırmasını içeren gizli klasör.          |
| İzlenmeyen     | Git'in gördüğü ancak henüz geçmişe kaydetmediği dosya.          |
| Proje kökü     | Projenin bilinçli olarak seçilmiş en üst klasörü.               |

## Kuram

### Depo oluşturmak

```bash
mkdir team-handbook
cd team-handbook
git init
git status
```

`git init` yerel Git yapısını oluşturur. `git status` dosyaların izlenmeyen, hazırlanmış veya değiştirilmiş durumunu gösterir. Commit olmasa bile depo geçerli olabilir.

### İzlenmeyen dosyayı gözlemlemek

```bash
printf "# Ekip El Kitabı\n" > README.md
git status
```

`README.md` izlenmeyen dosya olarak görünür. Git dosyayı görür, ancak henüz `git add` veya `git commit` ile geçmişe kaydetmemiştir.

### Durum mesajlarını okumak

`git status` şu sorulara cevap verir:

- Hangi branch'teyim?
- Değişiklik var mı?
- Hangi dosyalar izlenmiyor?
- Bir sonraki commit için ne hazırlandı?

## Uygulamalı Örnekler

### Örnek 1: Proje sınırını kontrol etmek

```bash
pwd
mkdir release-notes
cd release-notes
git init
git status
```

`git init` çalıştırmadan önce yolun doğru projeyi gösterdiğini kontrol edin.

### Örnek 2: Dosyayı henüz kaydetmeden gözlemlemek

```bash
echo "# Release Notes" > README.md
git status
```

Dosya görünürdür, fakat henüz geçmişin parçası değildir.

## En İyi Uygulamalar

- `git init` öncesinde mevcut yolu kontrol edin.
- Mantıksal olarak bağımsız her proje için ayrı depo kullanın.
- `git status` komutunu düzenli çalıştırın.
- Dosyaları eklemeden önce değişiklikleri inceleyin.

## Yaygın Hatalar

- genel çalışma klasöründe Git başlatmak;
- `git init` komutunun otomatik commit oluşturduğunu sanmak;
- izlenmeyen dosyayı commitlenmiş dosyayla karıştırmak;
- önemli komutlardan önce durumu kontrol etmemek.

## Alıştırmalar ve Çözümler

`team-handbook` klasöründe depo oluşturun, bir `README.md` ekleyin ve `.git` ile çalışma dizini arasındaki farkı açıklayın.

**Çözüm:** Görünür proje dosyaları çalışma dizinindedir; Git yönetim bilgileri `.git` içindedir. README, `git add` ve `git commit` çalıştırılana kadar izlenmeyendir.

## Özet

`git init` geçerli klasörde yerel depo oluşturur. `git status` çalışma alanının durumunu gösterir. Bilinçli proje kökü seçmek, ilgisiz dosyaların geçmişe girmesini önler.

## Sonraki Bölüm

Bölüm 05, değişiklikleri commitlerle Git geçmişine kaydetmeyi ele alır.

### İlgili İçerik

- Alıştırma: [İlk Deponuzu Oluşturma](../../exercises/tr/04-ilk-depoyu-olusturma.md)
- Laboratuvar: [Proje Deposunu Başlatma](../../labs/tr/04-proje-deposunu-baslatma.md)
- Quiz: [İlk Depo Quiz'i](../../quizzes/tr/04-ilk-depo-quiz.md)
