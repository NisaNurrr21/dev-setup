from src.main import karsilama_mesaji


def test_karsilama_mesaji_dogru_calisiyor():
    # Fonksiyona bir girdi (isim) veriyoruz
    sonuc = karsilama_mesaji("Nisa")

    # Çıktının beklediğimiz gibi olup olmadığını (assert) kontrol ediyoruz
    assert sonuc == "Merhaba, Nisa! Staj projesine hos geldin."
