#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <arquivo>"
    exit 1
fi

c=$(cat "$1")

v=$(echo "$c" | sed -e 's/\t/>/g' -e 's/ /./g')

echo "$v"
