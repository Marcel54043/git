#!/bin/bash

dzisiaj=$(date +"%Y-%m-%d")

if [[ "$1" == "--date" ]]; then
    echo "Dzisiaj jest: $dzisiaj"
elif [[ "$1" == "--logs" || "$1" == "-l" ]]; then
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
    echo "  --date       Wyświetla dzisiejszą datę."
    echo "  --logs <n>   Tworzy n plików dziennika z datą i nazwą skryptu."
else
    echo "Użycie: $0 [--date | --logs]"
    echo "Opcje:"
    echo "  --date       Wyświetla dzisiejszą datę."
    echo "  --logs <n>   Tworzy n plików dziennika z datą i nazwą skryptu."
fi
