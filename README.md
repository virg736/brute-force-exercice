# brute-force-exercice
Exercice pédagogique de démonstration d'une attaque par force brute sur un mot de passe fictif, à des fins éducatives seulement.

Exercice OSINT & Brute Force — CUPP + Hashcat (Kali Linux)


# Exercice pédagogique : OSINT & Brute Force avec CUPP et Hashcat


## **Avertissement**


> **Ce projet est réalisé dans un cadre pédagogique.**  

> **Toutes les données utilisées sont fictives.**  

> **Il est strictement interdit de reproduire cette méthode sur des personnes réelles ou sans autorisation.**


Ce projet a pour objectif de démontrer comment des informations simples trouvées par OSINT peuvent être utilisées pour générer des dictionnaires de mots de passe, et comment ceux-ci peuvent être testés avec Hashcat dans un environnement **local** et **contrôlé**.

---

## **Objectif de l'exercice**


- Utiliser l'outil CUPP pour générer un fichier de mots de passe.

- Simuler un mot de passe réel (hash SHA-256).

- Utiliser Hashcat pour retrouver ce mot de passe à partir du dictionnaire généré.

---

## **Outils utilisés**

- Kali Linux (en VM)

- [CUPP](https://github.com/Mebus/cupp)

- Hashcat

- Terminal Bash

---
## **Étapes pas à pas**

### **1. Cloner le dépôt CUPP**

```bash

cd /opt

git clone https://github.com/Mebus/cupp.git

cd cupp 

2. Lancer le script pour générer un dictionnaire

python3 cupp.py -i

Répondre aux questions avec des données fictives, par exemple :

First name: Alice

Surname: Dupont

Nickname: al

Birthdate: 01011990

Partner's name: Bob

Child's name: Camille

Pet's name: Milou

Company: CyberSec

Puis, à la suite :

• Ajouter des mots-clés ? Oui

• Entrer : alice2025,password,cybersecurite,hacker

• Ajouter caractères spéciaux ? Oui

• Ajouter des chiffres aléatoires ? Oui

• Mode leet ? Oui

• Hyperspeed Print ? Non



Le fichier alice.txt sera généré avec plusieurs milliers de mots.



3. Créer un hash simulé



On imagine que alice2025 est le mot de passe “réel”.



echo -n "alice2025" | sha256sum | awk '{print $1}' > hash.txt



4. Vérifier qu’il est bien dans le dictionnaire



grep alice2025 alice.txt



5. Utiliser Hashcat pour “casser” le hash



hashcat -m 1400 -a 0 hash.txt alice.txt --show



Tu verras un résultat de ce type :



f9335706... : alice2025



Cela montre que le mot de passe alice2025 a été trouvé car il était présent dans le dictionnaire généré.



⸻



Conclusion



Ce projet montre comment une simple recherche d’information sur une “victime” peut aider à générer des mots de passe très probables. C’est pourquoi il est important :

• De ne pas utiliser d’informations personnelles pour ses mots de passe.

• D’utiliser des gestionnaires de mots de passe et des mots de passe complexes.
