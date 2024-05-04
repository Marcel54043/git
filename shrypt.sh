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
else
    echo "Użycie: $0 [--date | --logs]"
fi
