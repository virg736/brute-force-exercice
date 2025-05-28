#!/bin/bash

# ============================================================
# EDUCATIONAL SCRIPT - Dictionary generation with CUPP + Hashcat
# Author : Virginie Lechene
# License : MIT (see Licence-Mit-Script)
# ============================================================

# ⚠️ WARNING :
# This script is for educational purposes only, using fictitious data.
# Any use for illegal or unethical purposes is strictly forbidden.
# ============================================================

# Step 1: Clone CUPP if not already installed
echo "[*] Checking if CUPP is already installed..."
if [ ! -d "/opt/cupp" ]; then
git clone https://github.com/Mebus/cupp.git /opt/cupp
else
echo "[*] CUPP is already installed."
fi

cd /opt/cupp || exit

# Step 2: Run CUPP with fictitious data
echo "[*] Running CUPP with fictitious data..."

python3 cupp.py -i <<EOF
Alice
Dupont
al
01011990
Bob
Camille
Milou
CyberSec
Y
alice2025,password,cybersecurite,hacker
Y
Y
Y
N
EOF

# Step 3: Generate a simulated SHA-256 hash
echo "[*] Generating SHA-256 hash for 'alice2025'..."
echo -n "alice2025" | sha256sum | awk '{print $1}' > hash.txt

# Step 4: Check if the password is in the dictionary
echo "[*] Checking if password is in the wordlist..."
grep "alice2025" alice.txt

# Step 5: Crack the hash using Hashcat
echo "[*] Cracking the hash with Hashcat..."
hashcat -m 1400 -a 0 hash.txt alice.txt --show

echo "[*] Attack completed."
