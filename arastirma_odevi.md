# Python Ekosisteminde Paket Yönetimi Analizi

Modern Python projelerinde sürdürülebilir bir mimari kurmanın en kritik adımı, doğru paket ve ortam yöneticisini seçmektir. Geliştirme süreçlerinin hızlanması, CI/CD hatlarının optimize edilmesi ve "benim bilgisayarımda çalışıyordu" sorununun ortadan kaldırılması için `uv`, `poetry`, `pip-tools` ve `conda` gibi farklı felsefelere sahip araçlar geliştirilmiştir. Bu raporda, söz konusu araçların mimari yapıları incelenmiş ve yerel ortamda yapılan ampirik ölçümlerle performansları karşılaştırılmıştır.

## Araçların Mimari Özellikleri

Her paket yöneticisi, farklı bir mühendislik problemini çözmek üzere tasarlanmıştır:

* **uv:** Rust diliyle sıfırdan geliştirilen, ekosistemin en yeni ve en hızlı paket yöneticisidir. Geleneksel `pip` ve `pip-tools`'un yerini alarak kurulum ve bağımlılık çözme sürelerini minimize etmeyi hedefler. Arka planda agresif bir önbellekleme (caching) mekanizması kullanır.
* **Poetry:** Gelişmiş bir bağımlılık çözücüye (dependency resolver) sahiptir. `pyproject.toml` standartlarını benimser ve `poetry.lock` dosyası ile projedeki tüm alt bağımlılıkların sürümlerini milimetrik olarak kilitler. Özellikle açık kaynak kütüphane yayınlayanlar için standart bir araçtır.
* **pip-tools:** Unix felsefesini benimseyen minimalist bir araçtır. Standart `pip`'in üzerine sadece küçük bir katman ekleyerek `.in` dosyalarından deterministik `.txt` kilit dosyaları üretir. Öğrenme eğrisi en düşük olan seçenektir.
* **Conda:** Yalnızca bir Python paket yöneticisi değil, dil bağımsız bir çevre yöneticisidir. Özellikle C++ gibi dış derleyicilere ihtiyaç duyan ağır kütüphanelerin işletim sistemi seviyesindeki bağımlılıklarını (binary pre-compiled paketler) yönetmek için tasarlanmıştır.

## Ampirik Performans Ölçümleri

Paket yöneticilerinin kurulum hızlarını analiz etmek amacıyla, yerel bir macOS terminalinde (Apple Silicon mimarisi) eşzamanlı bir test gerçekleştirilmiştir. Backend geliştirme süreçlerinde sıklıkla kullanılan `fastapi`, `uvicorn`, `numpy` ve `pandas` paketlerinin, tüm önbellekler temizlenerek (`--force-reinstall`) sıfırdan kurulma süreleri `time` komutu ile ölçülmüştür.

* **Geleneksel pip Kurulumu:** `python3 -m pip install ...` komutu ile yapılan standart kurulum, terminal üzerinde **13.90 saniye** (4.10s user, 0.96s system) sürmüştür.
* **uv Kurulumu:** Aynı paketler `uv pip install ...` komutu ile kurulduğunda, işlem yalnızca **2.82 saniye** (0.27s user, 0.38s system) sürmüştür.

Test sonuçları, `uv` aracının ağır veri paketi (numpy/pandas) içeren senaryolarda bile geleneksel yöntemlere kıyasla yaklaşık **5 kat (5x)** daha yüksek performans gösterdiğini kanıtlamaktadır.

## Hangi Durumda Hangisi Kullanılmalı?

Yapılan analizler ve performans testleri ışığında, proje gereksinimlerine göre şu tercihler yapılmalıdır:

1. **Hızlı API Geliştirme ve Konteynerizasyon:** Docker üzerinde çalışan mikroservisler veya CI/CD süreçlerinin hızının kritik olduğu projelerde kesinlikle **uv** tercih edilmelidir. Kurulum sürelerindeki 5 katlık fark, bulut maliyetlerini ve bekleme sürelerini doğrudan düşürür.
2. **Veri Bilimi ve Yapay Zeka:** Projede TensorFlow, PyTorch gibi donanım (GPU) veya alt seviye C kütüphanelerine bağımlı ağır araçlar kullanılacaksa, ortamı en güvenli şekilde izole eden **Conda** kullanılmalıdır.
3. **Büyük Ölçekli Takım Çalışmaları:** Çok sayıda geliştiricinin çalıştığı, bağımlılık çakışmalarının sıfıra indirilmesi gereken kurumsal projelerde katı kilit mekanizması nedeniyle **Poetry** seçilmelidir.
4. **Sadelik ve Geleneksellik:** Projede yeni bir araç öğrenme maliyetine girilmek istenmiyorsa, standart araçların hafif bir eklentisi olan **pip-tools** yeterli olacaktır.
