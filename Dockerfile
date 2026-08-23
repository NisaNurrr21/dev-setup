# 1. AŞAMA: Kurulum (Builder)
FROM python:3.12-slim AS builder

# uv aracını resmi kaynağından alıp kopyalıyoruz
COPY --from=ghcr.io/astral-sh/uv:0.5.0 /uv /uvx /bin/

WORKDIR /app

# Proje bağımlılık dosyasını kopyalıyoruz
COPY pyproject.toml README.md ./

# Proje kodlarını (ve oluşturduğumuz __init__.py dosyasını) kopyalıyoruz
COPY src/ src/

# uv ile bağımlılıkları sistem ortamına (sanal ortam olmadan) kuruyoruz
RUN uv pip install --system .


# 2. AŞAMA: Çalıştırma (Runner)
FROM python:3.12-slim

# Gereksiz önbellek dosyalarının oluşmasını engelliyoruz
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# 1. aşamada kurulan temiz Python kütüphanelerini kopyalıyoruz
COPY --from=builder /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

# Kaynak kodumuzu çalıştırma ortamına kopyalıyoruz
COPY src/ src/

# Konteyner çalıştığında devreye girecek varsayılan komut
CMD ["python", "src/main.py"]
