#!/bin/bash
# Gian Casutt
#
# Name: Umgestalten.sh - Umgestalten grosser Datenmengen
#
if test $# -ne 2; then
    echo "Sie müssen Dateinnamen als Argumente eingeben."
    echo "Anwendung: ./Umgestalten.sh Eingabefile Ausgabefile"
    exit 1
fi
if [ ! -f "$1" ]; then
    echo "Error, $1 existiert nicht."
    exit 1
fi
if [ ! -f "$2" ]; then
    echo "Error, $2 existiert nicht."
    exit 1
fi
grep -w "2  [0-9][  ,0-9]" "$1" | cut -f 3,4 | tr -d "'" | sort -k 1 -V >"$2"