#!/bin/bash

# 安裝系統依賴
apt-get update
apt-get install -y python3-dev default-libmysqlclient-dev build-essential pkg-config

# 創建必要的目錄
mkdir -p /app/static
mkdir -p /app/media

# 安裝 Python 依賴
pip install -r requirements.txt

# 收集靜態文件
python manage.py collectstatic --noinput

# 運行數據庫遷移
python manage.py migrate

# 啟動 Gunicorn
gunicorn ncufoodmap_backend.wsgi:application --bind 0.0.0.0:$PORT --workers 4 --threads 4 