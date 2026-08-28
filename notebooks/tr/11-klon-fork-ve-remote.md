---
chapter: 11
title: "Klon, Fork ve Remote"
part: "GitHub"
level: Başlangıç
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-08-17
---

> **Gezinme:** [Önceki: Bölüm 10](10-github-temelleri.md) | [Yol Haritası](../../ROADMAP.md) | Sonraki: Bölüm 12 yakında
>
> **Seviye:** Başlangıç · **Önkoşullar:** [Bölüm 10: GitHub Temelleri](10-github-temelleri.md)

## Öğrenme Hedefleri

- clone ile fork farkını açıklamak;
- `origin` ve `upstream` ilişkisini anlamak;
- birden fazla remote yönetmek;
- yerel çalışmayı orijinal projeyle senkronize etmek;
- açık kaynak katkı akışını açıklamak.

## Kuram

Clone depoyu bilgisayara indirir; fork ise GitHub hesabınız altında kendi çevrimiçi kopyanızı oluşturur.

```bash
git clone https://github.com/your-user/project.git
cd project
git remote add upstream https://github.com/project-owner/project.git
git fetch upstream
git switch main
git merge upstream/main
```

`origin` genellikle kendi forkunuza, `upstream` orijinal projeye işaret eder. Değişiklikler origin'e gönderilir; pull request upstream'e açılır.

## Remote yönetimi

```bash
git remote -v
git remote get-url origin
git remote rename origin github-origin
git remote remove upstream
```

Remote adları etikettir; açık ve amaçlı adlar kullanın.

## En İyi Uygulamalar

- Fetch ve push öncesinde remote'u kontrol edin.
- Upstream'i düzenli senkronize edin.
- Korunan yabancı branchlere doğrudan push etmeyin.
- Fork, clone ve remote kavramlarını karıştırmayın.

## Yaygın Hatalar

Origin ile upstream'i ters çevirmek, orijinal değişiklikleri çekmemek ve yanlış fork'a push etmekten kaçının.

## Özet

Clone yerel kopya, fork GitHub üzerindeki kişisel kopyadır. Origin ve upstream sayesinde yerel çalışma hem forkla hem de orijinal projeyle doğru şekilde ilişkilendirilir.

## Sonraki Bölüm

Bölüm 12 pull request ve kod inceleme akışını ele alır.

### İlgili İçerik

- Alıştırma: [Remote Depoyu İnceleme](../../exercises/tr/11-uzak-depoyu-incele.md)
- Laboratuvar: [Fork Etme ve Senkronize Etme](../../labs/tr/11-fork-et-ve-sinkronize-et.md)
- Quiz: [Klon, Fork ve Remote Quiz'i](../../quizzes/tr/11-klon-fork-ve-remote-quiz.md)
