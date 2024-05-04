#!/bin/bash

dzisiaj=$(date +"%Y-%m-%d")

if [[ "$1" == "--date" ]]; then
    echo "Dzisiaj jest: $dzisiaj"
elif [[ "$1" == "--logs" ]]; then
    for ((i=1; i<=100; i++)); do
        echo "Nazwa pliku: log$i.txt" > "log$i.txt"
        echo "Utworzony przez: $0" >> "log$i.txt"
        echo "Data utworzenia: $dzisiaj" >> "log$i.txt"
    done
else
    echo "Użycie: $0 [--date | --logs]"
fi
