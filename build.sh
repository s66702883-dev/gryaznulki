#!/bin/sh
# Собирает index.html для GitHub Pages из исходника страницы и подключает Firebase.
src="$1"; out="$(dirname "$0")/index.html"; shim="$(dirname "$0")/firebase-shim.html"
{
printf '<!doctype html>\n<html lang="ru">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n<meta name="description" content="Шуточный сайт про тренд «грязнулька vs серьёзка»: приложение знакомств с анкетами, мэтчем и перепиской, конструктор образа, игры и бинго.">\n<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}body{margin:0}img{max-width:100%%}[hidden]{display:none!important}</style>\n'
sed -n '1,/<\/style>/p' "$src" | grep -v 'claude:viewport-fit-sides'
cat "$shim"
printf '</head>\n<body>\n'
sed -n '/<\/style>/,$p' "$src" | tail -n +2
printf '</body>\n</html>\n'
} > "$out"
