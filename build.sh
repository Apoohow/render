#!/usr/bin/env bash
# exit on error
set -o errexit

# 安裝 Python 依賴
pip install -r requirements.txt

# 收集靜態檔案
python foodmap/manage.py collectstatic --no-input

# 執行資料庫遷移
python foodmap/manage.py migrate 