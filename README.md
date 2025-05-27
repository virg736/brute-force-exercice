# Brute Force

**Exercice pédagogique de démonstration d'une attaque par force brute sur un mot de passe fictif, à des fins éducatives seulement.**

## Sommaire

- [Avertissement](#avertissement)
- [Objectif de l'exercice](#objectif-de-lexercice)
- [Outils utilisés](#outils-utilisés)
- [Étapes pas à pas](#étapes-pas-à-pas)
- [1. Cloner le dépôt CUPP](#1-cloner-le-dépôt-cupp)
- [2. Lancer le script pour générer un dictionnaire](#2-lancer-le-script-pour-générer-un-dictionnaire)
- [3. Créer un hash simulé](#3-créer-un-hash-simulé)
- [4. Vérifier que le mot est dans le dictionnaire](#4-vérifier-que-le-mot-est-dans-le-dictionnaire)
- [5. Casser le hash avec Hashcat](#5-casser-le-hash-avec-hashcat)
- [Conclusion](#conclusion)
- [Licence](#licence)

---

## Avertissement

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

## Étapes pas à pas

 Cloner le dépôt CUPP

cd /opt

git clone https://github.com/Mebus/cupp.git

cd cupp

---
























Ce projet montre comment une simple recherche d’information sur une “victime” peut aider à générer des mots de passe très probables. C’est pourquoi il est important :

• De ne pas utiliser d’informations personnelles pour ses mots de passe.

• D’utiliser des gestionnaires de mots de passe et des mots de passe complexes.
