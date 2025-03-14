#!/bin/bash

arquivo="$1"

nome_base="${arquivo%.*}"

contador=1

while IFS= read -r linha; do
    # Se a linha for "----", cria um novo arquivo
    if [[ "$linha" == "----" ]]; then
        contador=$((contador + 1))
        continue
    fi

    echo "$linha" >> "${nome_base}_parte_${contador}.txt"
done < "$arquivo"

echo "Arquivo dividido em ${contador} partes."
