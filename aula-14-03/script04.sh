#!/bin/bash

if [ -z "$1" ]; then
    echo "Uso: $0 <arquivo_texto>"
    exit 1
fi

arquivo_texto="$1"
arquivo_html="${arquivo_texto%.*}.html"

titulo=$(basename "$arquivo_texto" .txt)

conteudo=$(sed -e 's/amor/<a href="https:\/\/pt.wikipedia.org\/wiki\/Amor">amor<\/a>/g' "$arquivo_texto")

data_hora=$(date +'%d/%m/%Y às %H:%M horas')

cat <<EOF > "$arquivo_html"
<!DOCTYPE html>
<html lang="pt-br">
  <head>
    <title>$titulo</title>
    <meta charset="utf-8">
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        color: #333;
        margin: 0;
        padding: 20px;
      }
      h1 {
        color: #4CAF50;
        text-align: center;
      }
      pre {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        white-space: pre-wrap;
        word-wrap: break-word;
      }
      a {
        color: #4CAF50;
        text-decoration: none;
      }
      a:hover {
        text-decoration: underline;
      }
      .footer {
        text-align: center;
        margin-top: 20px;
        font-size: 0.9em;
        color: #777;
      }
    </style>
  </head>
  <body>
    <h1>$titulo</h1>
    <pre>$conteudo</pre>
    <div class="footer">Criado em $data_hora</div>
  </body>
</html>
EOF

echo "Arquivo HTML gerado: $arquivo_html"
