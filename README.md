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
