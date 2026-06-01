#!/bin/bash

read -p "Podaj plik do podpisania" plik
plik_klucz="${plik}.klucz"

if [ ! -f "$plik_klucz" ]; then
    echo "[-] Błąd: Brak pliku z kluczem ($plik_klucz). Najpierw zaszyfruj plik!"
    exit 1
fi

openssl dgst -sha256 -hmac "$(cat "$plik_klucz")" -out "${plik}.sig" "$plik"
