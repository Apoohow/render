#!/bin/bash
set -e

echo "Current directory:"
pwd
ls -la

echo "Installing dependencies..."
pip install -r requirements.txt

echo "Entering Django project directory..."
if [ -d "NCUFOODMAP_DJANGO" ]; then
    cd NCUFOODMAP_DJANGO
elif [ -d "foodmap/NCUFOODMAP_DJANGO" ]; then
    cd foodmap/NCUFOODMAP_DJANGO
else
    echo "Error: Cannot find Django project directory"
    exit 1
fi

echo "Current directory after cd:"
pwd
ls -la

echo "Collecting static files..."
python manage.py collectstatic --no-input

echo "Running migrations..."
python manage.py migrate 