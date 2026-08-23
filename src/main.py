def karsilama_mesaji(isim: str) -> str:
    """Verilen isme özel bir karşılama mesajı döndürür."""
    return f"Merhaba, {isim}! Staj projesine hos geldin."


def main() -> None:
    mesaj = karsilama_mesaji("Nisa Nur")
    print(mesaj)


if __name__ == "__main__":
    main()
