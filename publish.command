#!/bin/bash
# Double-click this file in Finder to upload any new/changed photos
# (and any other changes) in this folder to the live website.

cd "$(dirname "$0")"

echo "=================================================="
echo "  Публікація фото на сайт secondhand-catalog"
echo "=================================================="
echo ""

git add -A

if git diff --cached --quiet; then
  echo "Нових файлів або змін не знайдено — публікувати нічого."
  echo ""
  read -n 1 -s -r -p "Натисніть будь-яку клавішу, щоб закрити..."
  exit 0
fi

echo "Знайдено зміни:"
git diff --cached --stat
echo ""

git commit -q -m "Add/update photos ($(date '+%Y-%m-%d %H:%M'))"
echo "Завантажую на GitHub..."

if git push origin main; then
  echo ""
  echo "✅ Готово! Фото завантажені."
  echo "Сайт: https://djys0912.github.io/secondhand-catalog/"
  echo "(оновлення сайту зазвичай займає 30-60 секунд)"
else
  echo ""
  echo "❌ Щось пішло не так під час завантаження."
  echo "Покажіть це вікно Claude — розберемось."
fi

echo ""
read -n 1 -s -r -p "Натисніть будь-яку клавішу, щоб закрити..."
