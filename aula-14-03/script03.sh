#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <arquivo_python>"
    exit 1
fi

sed -e 's/#.*$//' -e '/^[[:space:]]*$/d' "$1"
