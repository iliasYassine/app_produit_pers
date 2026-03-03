#!/bin/bash
# =============================================================
# Script de déploiement VPS — app_produit_pers
# Usage : bash deploy.sh
# =============================================================

set -e  # Arrête le script en cas d'erreur

# ---- CONFIGURATION (adapte ces chemins à ton VPS) ----
BACKEND_DIR="/var/www/caisse-ih/backend"
FRONTEND_DIR="/var/www/caisse-ih/frontend"
NGINX_ROOT="/var/www/caisse-ih/html"
SERVICE_NAME="caisse"
# -------------------------------------------------------

echo ""
echo "=== [1/4] Migrations Django ==="
cd "$BACKEND_DIR"
source venv/bin/activate
python manage.py migrate --run-syncdb

echo ""
echo "=== [2/4] Build Angular ==="
cd "$FRONTEND_DIR"
npm run build -- --configuration=production

echo ""
echo "=== [3/4] Déploiement frontend → nginx ==="
sudo cp -r dist/personnes/browser/* "$NGINX_ROOT/"

echo ""
echo "=== [4/4] Redémarrage Django ==="
sudo systemctl restart "$SERVICE_NAME"

echo ""
echo "✓ Déploiement terminé !"
