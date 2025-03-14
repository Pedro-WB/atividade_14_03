#!/bin/bash

USER_ID=$((RANDOM % 100 + 1))

API_URL="https://dummyjson.com/user/$USER_ID"
RESPONSE=$(curl -s "$API_URL")

if [[ $(echo "$RESPONSE" | jq -r '.id') != null ]]; then

    FIRST_NAME=$(echo "$RESPONSE" | jq -r '.firstName')
    LAST_NAME=$(echo "$RESPONSE" | jq -r '.lastName')
    USERNAME=$(echo "$RESPONSE" | jq -r '.username')
    PASSWORD=$(echo "$RESPONSE" | jq -r '.password')
    IP=$(echo "$RESPONSE" | jq -r '.ip')
    EMAIL=$(echo "$RESPONSE" | jq -r '.email')

    FORMATTED_DATA="$FIRST_NAME $LAST_NAME::$USERNAME::$PASSWORD::$IP::$EMAIL"

    
    echo "$FORMATTED_DATA" > user_data.txt

    echo "Dados salvos com sucesso em user_data.txt!"
else
    echo "Erro ao acessar a API."
fi
