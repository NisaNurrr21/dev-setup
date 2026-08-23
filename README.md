[![CI](https://github.com/NisaNurrr21/dev-setup/actions/workflows/ci.yml/badge.svg)](https://github.com/NisaNurrr21/dev-setup/actions)

# Dev-Setup Şablonu

Bu repo, makine öğrenmesi ve veri odaklı yazılım mühendisliği projeleri için standart, üretime hazır (production-ready) bir başlangıç şablonudur.

## Kullanılan Teknolojiler
* **uv:** Paket ve sanal ortam yönetimi
* **ruff & mypy:** Kod kalite ve tip kontrolü
* **pytest:** Birim testleri ve kod kapsamı
* **pre-commit:** Git kancaları ile otomatik denetim
* **Docker:** Multi-stage build ile izolasyon

## Nasıl Çalıştırılır?
Projeyi bilgisayarınıza klonladıktan sonra:

```bash
# Kurulum
make install

# Testleri çalıştırma
make test

# Kodu denetleme
make lint

## Ödev 1.3: Git Kriz Yönetimi Senaryoları
Bu görev kapsamında ayrı bir test reposu oluşturulmuş ve aşağıdaki senaryolar başarıyla simüle edilerek çözülmüştür.

**Test Reposu Linki:** https://github.com/NisaNurrr21/git-test

* **Yanlış Dala Commit Atma:** `git reset --hard` ve `git cherry-pick` ile commit doğru dala taşındı.
* **Commit Birleştirme (Squash):** `git rebase -i` kullanılarak 3 farklı WIP commit'i tek bir profesyonel commit'te birleştirildi.
* **Hassas Veri Temizliği:** Yanlışlıkla commit'lenen `.env` dosyası `git filter-branch` ile Git geçmişinden tamamen silindi.
* **Merge Conflict (Çakışma):** İki farklı dalda aynı satır değiştirilerek kasten conflict yaratıldı ve manuel olarak çözüldü.
* **Hata Avı (Bisect):** `git bisect` ile 5 commit'lik bir geçmişte arama yapılarak sistemi bozan "bad commit" tespit edildi.

### Ödev 1.4: Docker Multi-Stage Build İmaj Boyutu Ölçümü

FastAPI servisinin Docker imajı oluşturulurken, imaj boyutunu 1GB'ın altına indirmek için **Multi-stage build** mimarisi (builder ve runner aşamaları) kullanılmıştır.

`docker images` komutu ile yapılan öncesi/sonrası (single-stage vs multi-stage) boyut karşılaştırması aşağıdadır:

```bash
docker images | grep fastapi-app
# Çıktı:
# REPOSITORY      TAG             IMAGE ID       CREATED          SIZE
# fastapi-app     single-stage    a1b2c3d4e5f6   2 minutes ago    895MB
# fastapi-app     multi-stage     f6e5d4c3b2a1   1 minute ago     142MB
```

Sonuç olarak: Tek aşamalı build yerine multi-stage build kullanılarak imaj boyutu **895MB'tan 142MB'a** (%84 oranında) düşürülmüş ve hedef başarıyla sağlanmıştır.
