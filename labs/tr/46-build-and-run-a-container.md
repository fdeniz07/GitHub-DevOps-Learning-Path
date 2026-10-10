---
chapter: 46
title: "Konteyner Oluşturma ve Çalıştırma"
related_notebook: "Docker Temelleri: İmajlar, Konteynerler ve Ağlar"
related_exercise: "Bir Uygulamayı Konteynerleştirme"
level: Beginner
estimated_time: 90 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Notebook](../../notebooks/tr/46-docker-fundamentals.md) | [Alıştırma](../../exercises/tr/46-containerize-an-application.md) | [Yol Haritası](../../ROADMAP.md)

# Konteyner Oluşturma ve Çalıştırma

## Amaç

Küçük bir hizmet imajı oluşturun, root olmayan konteyner olarak çalıştırın ve ağ ile volume davranışını gösterin.

## Çıktılar

- Çalışan bir Dockerfile ve imaj üretin.
- Port yayınlamayı, root olmayan çalışmayı ve health davranışını doğrulayın.
- Seçili verileri adlandırılmış volume ile kalıcılaştırın.

## Ön Koşullar

Bu lab'a başlamadan önce şunlara sahip olmalısınız:

- İlgili notebook ve alıştırmayı tamamlamış olmak.
- Docker Desktop veya Docker Engine.
- Terminal ve başlangıç komutuna sahip yerel HTTP hizmeti.

## Senaryo

Bir hizmeti ortak geliştirme ortamına hazırlıyorsunuz. Lab, tekrarlanabilir bir imaj ve çalışma zamanı varsayımlarının açık olduğuna dair kanıt üretir.

## Ortam

| Gereksinim       | Değer                                                  |
| ---------------- | ------------------------------------------------------ |
| İşletim sistemi  | Windows, Linux veya macOS                              |
| Yazılım          | Docker Engine veya Docker Desktop, Git, HTTP istemcisi |
| İmaj             | `demo-service:1.0`                                     |
| Ana makine portu | `8080`                                                 |

## Görevler

### Görev 1 - İmajı oluşturma

`.dockerignore` ve özel root olmayan kullanıcıya sahip bir Dockerfile oluşturun. `docker build --tag demo-service:1.0 .` ile derleyin.

**Beklenen Sonuç:** İmaj yerel sırları veya gereksiz çıktıyı içermeden oluşturulur.

### Görev 2 - Çalıştırma ve inceleme

`docker run --detach --name demo-service --publish 8080:8080 demo-service:1.0` çalıştırın. Health endpoint'ini çağırın, günlükleri inceleyin ve `docker exec demo-service id` çalıştırın.

**Beklenen Sonuç:** Endpoint yanıt verir ve süreç kimliği root değildir.

### Görev 3 - Ağ ve depolamayı test etme

`docker network create demo-network` ve `docker volume create demo-data` çalıştırın. Hizmeti ağa bağlayıp volume'u belgelenmiş veri yoluna bağlayın. Konteyneri kaldırıp yeniden oluşturun.

**Beklenen Sonuç:** Adlandırılmış volume konteyner değişiminden sonra kalır ve ağ iletişimi amaçlanan sınırı kullanır.

## Doğrulama Checklist'i

- [ ] İmaj beklenen etikete sahip.
- [ ] Health endpoint'i 8080 portunda yanıt veriyor.
- [ ] Konteyner süreci root değil.
- [ ] Konteyner günlüklerinde kimlik bilgisi yok.
- [ ] Gerekli veri adlandırılmış volume'da konteyner değişiminden sonra kalıyor.

## Sorun Giderme

| Problem                     | Olası neden                       | Çözüm                                                    |
| --------------------------- | --------------------------------- | -------------------------------------------------------- |
| Port zaten ayrılmış         | Başka bir süreç 8080'i kullanıyor | Süreci durdurun veya farklı ana makine portu yayınlayın. |
| Konteynerde izin reddedildi | Dosyaların sahibi root            | `COPY --chown` ve yazılabilir uygulama dizini kullanın.  |
| Veri kayboluyor             | Veri konteyner katmanına yazıldı  | `demo-data`'yı doğru yola bağlayın.                      |

## En İyi Uygulamalar

- Lab'dan sonra test konteynerlerini `docker rm --force demo-service` ile kaldırın.
- İmajları değişmez tutun ve açık etiketler kullanın.
- Sır içeren `.env` dosyalarını derleme bağlamına hiçbir zaman kopyalamayın.

## Özet

Bu lab Docker kavramlarını kanıta dönüştürür: root olmayan süreç, amaçlı bağlantı ve konteyner katmanı dışında kalıcı veri.

## İlgili Bağlantılar

- Notebook: [Docker Temelleri](../../notebooks/tr/46-docker-fundamentals.md)
- Alıştırma: [Bir uygulamayı konteynerleştirme](../../exercises/tr/46-containerize-an-application.md)
- Quiz: [Docker temelleri quizi](../../quizzes/tr/46-docker-fundamentals-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
