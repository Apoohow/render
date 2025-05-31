#!/usr/bin/env bash
# exit on error
set -o errexit

# 安裝 Python 依賴
pip install -r requirements.txt

# 進入 Django 專案目錄
cd foodmap/NCUFOODMAP_DJANGO

# 收集靜態檔案
python manage.py collectstatic --no-input

# 執行資料庫遷移
python manage.py migrate 