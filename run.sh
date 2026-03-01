#!/bin/bash
# Script de démarrage Django — vide le cache .pyc avant chaque lancement
echo "Nettoyage cache Python..."
find . -path ./venv -prune -o -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null
find . -path ./venv -prune -o -name "*.pyc" -exec rm -f {} + 2>/dev/null
echo "Démarrage du serveur..."
PYTHONDONTWRITEBYTECODE=1 venv/Scripts/python manage.py runserver
