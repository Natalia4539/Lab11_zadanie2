#!/bin/bash 

read -p "Podaj plik" plik 
read -sp "podaj klucz AES" klucz

Zaszyfrowany="${plik}.enc"
plik_klucz="${plik}.klucz" 

echo -n "$klucz" > "$plik_klucz"

openssl aes-256-cbc -salt -pbkdf2 -in "$plik" -out "$Zaszyfrowany" -pass pass:"$klucz"
