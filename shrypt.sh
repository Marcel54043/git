#!/bin/bash

dzisiaj=$(date +"%Y-%m-%d")

if [[ "$1" == "--date" ]]; then
    echo "Dzisiaj jest: $dzisiaj"
else
    echo "Spróbuj: $0 --date"
fi