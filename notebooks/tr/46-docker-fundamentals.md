---
chapter: 46
title: "Docker Temelleri: İmajlar, Konteynerler ve Ağlar"
part: "DevOps"
level: Beginner
estimated_time: 75 min
language: TR
status: Draft
version: 1.0
last_updated: 2026-09-23
---

> **Gezinme:** [Önceki Bölüm](45-security-best-practices.md) | [Yol Haritası](../../ROADMAP.md)

## Öğrenme Hedefleri

Bu bölümün sonunda şunları yapabileceksiniz:

- İmajların, konteynerlerin, katmanların, volume'ların ve ağların nasıl birlikte çalıştığını açıklamak.
- Öngörülebilir yapılandırma ve port eşlemesiyle küçük bir imaj oluşturup çalıştırmak.
- Bir konteyneri root olmayan kullanıcıyla çalıştırmak ve uygun bir depolama stratejisi seçmek.

## Giriş

Docker, bir uygulamayı ve çalışma zamanı bağımlılıklarını bir imaj içinde paketler. Konteyner, bu imajdan oluşturulan çalışan bir süreçtir. Bu yaklaşım geliştiricilere ve teslimat sistemlerine dizüstü bilgisayarda, CI runner'ında veya bulut platformunda çalışabilen tekrarlanabilir bir birim sağlar.

## Bu Neden Önemli?

Bir konteyner imajı çalışma zamanı sözleşmesini açık hale getirir: temel işletim sistemi kütüphaneleri, uygulama dosyaları, başlangıç komutu ve dışa açılan arayüzler birlikte tanımlanır. Değişmez imaj katmanları ile yazılabilir konteyner durumu arasındaki sınırları anlamak; veri kaybını, kırılgan derlemeleri ve güvensiz varsayılanları önlemenize yardımcı olur.

## Temel Terimler

| Terim                  | Tanım                                                                                          |
| ---------------------- | ---------------------------------------------------------------------------------------------- |
| İmaj                   | Konteyner oluşturmak için kullanılan değişmez, katmanlı paket.                                 |
| Konteyner              | Bir imajdan türetilen dosya sistemi ve ağ görünümüne sahip yalıtılmış süreç.                   |
| Volume                 | Bir veya daha fazla konteynere bağlanan Docker yönetimli kalıcı depolama.                      |
| Ağ                     | Konteynerlerin ad ve ilke üzerinden iletişim kurmasını sağlayan sanal bağlantı.                |
| Registry               | İmajları depolayan ve dağıtan hizmet.                                                          |
| Root olmayan kullanıcı | Varsayılan olarak ana makineyi veya korumalı konteyner yollarını değiştiremeyen süreç kimliği. |

## Teori

Bir imaj katmanlardan oluşturulur. Her Dockerfile yönergesi bir katman ekleyebilir; bu nedenle kararlı bağımlılık adımlarını sık değişen uygulama dosyalarından önce sıralamak önbelleğin yeniden kullanılmasını iyileştirebilir. Konteynerler imajın üzerine yazılabilir bir katman ekler, ancak bu katman geçicidir. Değiştirme sonrasında korunması gereken veriler bir volume'a veya harici bir hizmete ait olmalıdır.

Bir bridge ağı, hizmet adları üzerinden konteynerler arası iletişim sağlar. Yayınlanan portlar bir konteyner portunu ana makineye bağlar; örneğin `-p 8080:8080`. Port yayınlamak Dockerfile içinde port açmaktan farklıdır: `EXPOSE` hedeflenen portu belgeler, `-p` ise ana makine bağlantısını oluşturur.

Uygulama süreçlerini özel bir root olmayan kullanıcıyla çalıştırın. Root olmayan varsayılan, süreç ele geçirilmesinin etkisini azaltır ve dosya sahipliği sorunlarını erkenden görünür kılar. Uygulama dizini okunabilir olmalı ve yazılabilir her dizinin sahibi bu kullanıcı olmalıdır.

## Uygulamalı Örnekler

### Küçük bir imaj oluşturma

```dockerfile
FROM python:3.12-slim

WORKDIR /app
RUN useradd --create-home --uid 10001 appuser
COPY --chown=appuser:appuser requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY --chown=appuser:appuser . .
USER appuser
EXPOSE 8080
CMD ["python", "app.py"]
```

Oluşturup çalıştırın:

```bash
docker build --tag demo-service:1.0 .
docker run --rm --name demo-service --publish 8080:8080 demo-service:1.0
```

İmaj uygulamayı ve bağımlılıklarını kaydeder. Konteyner geçicidir ve süreç root yerine `appuser` olarak çalışır.

### Volume ve ağ kullanma

```bash
docker network create demo-network
docker volume create demo-data
docker run -d --name database --network demo-network --mount source=demo-data,target=/var/lib/data busybox sleep 3600
docker run --rm --network demo-network demo-service:1.0
```

Adlandırılmış volume konteyner kaldırıldıktan sonra da kalır. Kullanıcı tanımlı ağ, `database` gibi kararlı bir DNS adı sağlar.

## Kendiniz Deneyin

1. `/health` uç noktası olan minimal bir HTTP hizmeti oluşturun.
2. Dockerfile'a root olmayan bir kullanıcı ekleyin ve `docker exec <container> id` ile doğrulayın.
3. Kullanıcı tanımlı bir ağda iki konteyner çalıştırıp birine hizmet adıyla bağlanın.
4. Bir konteyneri durdurup kaldırın; volume'da hangi verilerin kaldığını doğrulayın.

## En İyi Uygulamalar

- Küçük ve bakımı yapılan temel imajlar kullanın; önemli çalışma zamanı sürümlerini sabitleyin.
- İmajları değişmez tutun; ortama özgü yapılandırmayı çalışma zamanında enjekte edin.
- Kimlik bilgilerini, derleme çıktısını ve yerel önbellekleri dışarıda bırakmak için `.dockerignore` kullanın.
- Konteynerlere açık adlar, health check'ler, kaynak sınırları ve root olmayan kullanıcılar verin.
- Volume'ları yalnızca kalıcı olması gereken durum için kullanın; üretim verileri için yönetilen veritabanlarını tercih edin.

## Yaygın Hatalar

| Hata                                            | Neden sorun çıkarır                                      | Nasıl önlenir                                          |
| ----------------------------------------------- | -------------------------------------------------------- | ------------------------------------------------------ |
| Verileri yalnızca yazılabilir katmanda saklamak | Konteyner değiştirildiğinde veri kaybolur.               | Bir volume bağlayın veya harici veri hizmeti kullanın. |
| Her portu yayınlamak                            | İç hizmetler ana makineden veya ağdan erişilebilir olur. | Yalnızca gerekli giriş noktalarını yayınlayın.         |
| Varsayılan olarak root çalıştırmak              | Ele geçirmenin etkisi büyür.                             | Özel bir `USER` oluşturup seçin.                       |
| `EXPOSE` ile port yayınlamayı karıştırmak       | Belgeleme bağlantı oluşturmaz.                           | `--publish` veya platform hizmet tanımı kullanın.      |

## Özet

- İmajlar değişmez katmanlı paketlerdir; konteynerler geçici çalışma zamanı süreçleridir.
- Volume'lar durumu yazılabilir konteyner katmanının dışında tutar, ağlar kontrollü hizmet iletişimi sağlar.
- Root olmayan çalışma ve açık port/depolama tercihleri temel konteyner güvenliği uygulamalarıdır.

## İlgili Bağlantılar

- Önceki bölüm: [Güvenlik İçin En İyi Uygulamalar](45-security-best-practices.md)
- Alıştırma: [Bir uygulamayı konteynerleştirme](../../exercises/tr/46-containerize-an-application.md)
- Lab: [Konteyner oluşturma ve çalıştırma](../../labs/tr/46-build-and-run-a-container.md)
- Quiz: [Docker temelleri quizi](../../quizzes/tr/46-docker-fundamentals-quiz.md)
- Yol haritası: [Kurs yol haritası](../../ROADMAP.md)
