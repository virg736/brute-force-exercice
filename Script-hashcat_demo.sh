#!/bin/bash
# ========================================================================
# SCRIPT D'EXERCICE PEDAGOGIQUE - Génération de dictionnaire CUPP + Hashcat
# Auteur : Virginie Lechene
# Licence : MIT (voir Licence-Mit-Script)
#
# ⚠️ AVERTISSEMENT :
# Ce script est fourni uniquement à des fins pédagogiques, avec des données fictives.
# Toute utilisation à des fins réelles ou illégales est strictement interdite.
# ========================================================================

# 📍 Étape 1 : Cloner CUPP (si nécessaire)
echo "[*] Vérification de CUPP..."
if [ ! -d "/opt/cupp" ]; then
sudo git clone https://github.com/Mebus/cupp.git /opt/cupp
else
echo "[+] CUPP déjà présent."
fi

cd /opt/cupp || exit

# 📍 Étape 2 : Générer un dictionnaire avec données fictives
echo "[*] Lancement de CUPP avec données fictives..."
python3 cupp.py -i <<EOF
Alice
Dupont
al
01011990
Bob
Camille
Milou
CyberSec
y
alice2025
password
cybersecurite
hacker
y
y
y
n
EOF

# 📍 Étape 3 : Vérification du fichier généré
DICT_FILE="alice.txt"
if [ ! -f "$DICT_FILE" ]; then
echo "❌ Dictionnaire non généré."
exit 1
fi

echo "[+] Dictionnaire généré : $DICT_FILE"

# 📍 Étape 4 : Création d’un hash SHA-256 simulé
PASSWORD="alice2025"
HASH=$(echo -n "$PASSWORD" | sha256sum | awk '{print $1}')
echo "$HASH" > hash.txt
echo "[+] Hash SHA-256 simulé : $HASH (stocké dans hash.txt)"

# 📍 Étape 5 : Vérifier que le mot figure dans le dictionnaire
echo "[*] Vérification dans le dictionnaire..."
grep -q "$PASSWORD" "$DICT_FILE" && echo "✅ Mot de passe trouvé dans le dictionnaire." || echo "❌ Mot de passe non trouvé."

# 📍 Étape 6 : Cracker le hash avec Hashcat
echo "[*] Lancement de Hashcat..."
hashcat -m 1400 -a 0 hash.txt "$DICT_FILE" --show

# 📍 Étape 7 : Résultat attendu
echo "[+] Résultat attendu : le hash doit correspondre à '$PASSWORD'"

# 📍 Fin du script
echo "🎓 Exercice terminé. Ce script ne reflète pas la complexité réelle d'une attaque."
