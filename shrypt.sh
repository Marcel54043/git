#!/bin/bash

dzisiaj=$(date +"%Y-%m-%d")

if [[ "$1" == "--date" ]]; then
    echo "Dzisiaj jest: $dzisiaj"
elif [[ "$1" == "--logs" ]]; then
    if [[ $# -ne 2 || ! $2 =~ ^[0-9]+$ ]]; then
        echo "Użycie: $0 --logs <liczba_plików>"
        exit 1
    fi

    liczba_plikow=$2

    for ((i=1; i<=$liczba_plikow; i++)); do
        echo "Nazwa pliku: log$i.txt" > "log$i.txt"
        echo "Utworzony przez: $0" >> "log$i.txt"
        echo "Data utworzenia: $dzisiaj" >> "log$i.txt"
    done

    echo "$liczba_plikow plików zostało utworzonych."
elif [[ "$1" == "--help" || "$1" == "-h" ]]; then
    echo "Użycie: $0 [--date | --logs]"
    echo "Opcje:"
    echo "  --date  -d    Wyświetla dzisiejszą datę."
    echo "  --logs <n>  -l   Tworzy n plików dziennika z datą i nazwą skryptu."
elif [[ "$1" == "--init" ]]; then
    git clone <https://github.com/Marcel54043/git.git>

    repo_path=$(pwd)

    echo "export PATH=\"\$PATH:$repo_path\"" >> ~/.bashrc
    source ~/.bashrc

    echo "Repozytorium zostało pomyślnie zainicjowane."
else
    echo "Użycie: $0 [--date | --logs | --init]"
    echo "Opcje:"
    echo "  --date   -d    Wyświetla dzisiejszą datę."
    echo "  --logs <n>  -l  Tworzy n plików dziennika z datą i nazwą skryptu."
    echo "  --init   Inicjuje środowisko pracy, klonując repozytorium do bieżącego katalogu i ustawiając ścieżkę w zmiennej PATH."
fi
