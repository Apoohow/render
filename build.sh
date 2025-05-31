#!/bin/bash
set -e

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Entering Django project directory..."
ls -la
pwd
cd NCUFOODMAP_DJANGO || cd foodmap/NCUFOODMAP_DJANGO

echo "Collecting static files..."
python manage.py collectstatic --no-input

echo "Running migrations..."
python manage.py migrate 