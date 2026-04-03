# syskit

Collection d'outils système Bash pour Linux, facilitant l'administration et la gestion quotidienne du système.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Bash](https://img.shields.io/badge/bash-4.0+-green)
![Linux](https://img.shields.io/badge/Linux-Compatible-orange)

## Fonctionnalités
___________________________________________

### Aliases disponibles

| Alias | Commande équivalente | Description |
|-------|---------------------|-------------|
| `syskit` | `source ~/.bashrc` | Recharge la configuration syskit |
| `..` | `cd ..` | Remonte d'un dossier |
| `...` | `cd ../..` | Remonte de deux dossiers |
| `ll` | `ls -lah --color=auto` | Liste détaillée avec droits et couleurs |
| `la` | `ls -A` | Liste tous les fichiers (cachés inclus) |
| `meminfo` | `free -h` | Affiche l'état de la RAM |
| `cpuinfo` | `lscpu \| grep -E "Model name\|CPU(s)\|MHz"` | Infos processeur (modèle, coeurs, fréquence) |
| `ports` | `ss -tulnp` | Affiche les ports ouverts |
| `rm` | `rm -i` | Suppression avec confirmation |

### Fonctions disponibles

| Fonction | Description | Exemple |
|----------|-------------|---------|
| `disk_usage` | Affiche l'espace disque trié par utilisation | `disk_usage` |
| `top_processes [N]` | Affiche les N processus les plus gourmands en CPU (défaut: 10) | `top_processes 5` |
| `find_large_files [dir] [size_mo]` | Cherche fichiers > size Mo dans dir (défaut: . et 100) | `find_large_files /var 50` |

## Prérequis
___________________________________________

- **Linux** (Ubuntu, Debian, Arch Linux, Fedora, etc.)
- **Bash** >= 4.0
- Commandes standards : `ls`, `cd`, `df`, `ps`, `find`, `grep`, `ss`

### Vérification de Bash

`bash --version`

##  Installation
___________________________________________

### Méthode rapide (recommandée)

        git clone https://github.com/SergiX-007/syskit.git

        cd syskit

        bash install.sh

#### Le script va :

    1-Créer le dossier ~/syskit

    2-Sauvegarder votre .bashrc existant dans ~/syskit/save/

    3-Copier aliases.sh et functions.sh dans ~/syskit/

    4-Ajouter automatiquement les sources dans .bashrc

    5-Recharger la configuration


## Désinstallation
___________________________________________

Utilisez la fonction : `rmvSyskit`

### Cette fonction va : 

##### Réinitialise le bashrc
    cp ~/syskit/save/save_bashrc.txt ~/.bashrc

##### suppression de syskit
    rm ~/syskit/

##### Recharger
    source ~/.bashrc

## Utilisation
___________________________________________

### Exemples concrets
===========================================
#### Navigation rapide
|----------------------|--------------------------|
|`..`                  | Remonte d'un dossier     |
|`...`                 | Remonte de deux dossiers |
|`ll`                  | Liste détaillée colorée  |
|`la`                  | Liste tous les fichiers  |

#### Surveillance système
|---------------------|-------------------------|
|`meminfo`            | État de la RAM          |
|`cpuinfo`            | Infos processeur        |
|`ports`              | Ports ouverts           |
|`top_processes`      | Top 10 processus CPU    |
|`top_processes 5`    | Top 5 processus CPU     |

#### Gestion disque
|-------------------------------|-------------------------------------------|
|`disk_usage`                   | Espace disque trié                        |
|`find_large_files`             | Fichiers > 100 Mo dans dossier courant    |
|`find_large_files /home 50`    | Fichiers > 50 Mo dans /home               |

#### Sécurité
|----------------------|------------------------------|
|`rm fichier`          | Suppression avec confirmation|

### Exemples de sorties
===========================================

#### disk_usage :

=== Utilisation disque ===

|Filesystem      |Size|  Used| Avail| Use%| Mounted on  |
|----------------|----|------|------|-----|-------------|
|/dev/sda1       |100G|   45G|   55G|  45%| /           |
|/dev/sdb1       |500G|  200G|  300G|  40%| /home       |

#### top_processes :

=== Top 10 processus (CPU) ===

|USER     |PID |%CPU |%MEM|    VSZ|   RSS| TTY|      STAT| START|   TIME |COMMAND|
|---------|----|-----|----|-------|------|----|----------|-------|-------|-------|
|user     |1234| 12.5| 5.2| 123456| 65432| ?  |      Ssl | 10:00 |  1:23 |firefox|
|root     |5678|  8.3| 1.2|  45678| 12345| ?  |      Ss  | 09:00 |  0:45 |systemd|

## Structure du projet
___________________________________________

syskit/  
├── install.sh              # Script d'installation principal  
├── README.md               # Documentation  
├── lib/  
│   ├── aliases.sh          # Définition des alias  
│   └── functions.sh        # Définition des fonctions  
└── save/                   # Créé automatiquement lors de l'installation  
    └── save_bashrc.txt     # Backup de votre .bashrc original  

## Personnalisation
___________________________________________

        Ajouter vos propres alias

        Éditez ~/syskit/aliases.sh :

#### Exemple d'alias personnalisé

        alias monalias='ma_commande'

        alias gs='git status'

        alias gpl='git pull'

        Ajouter vos propres fonctions

        Éditez ~/syskit/functions.sh :

#### Exemple de fonction personnalisée
maj()  
{  

    echo "Mise à jour du système..."  

    sudo apt update && sudo apt upgrade -y

}

##### Rechargez ensuite avec source ~/.bashrc ou syskit.


## Changelog
___________________________________________

### v1.0.0 (2026)

- Version initiale

- 9 alias système

- 4 fonctions utilitaires

- Installation automatique avec backup

- Interface colorée

ASCII art final




# AUTEUR

### Harena Sergio

### GitHub: SergiX-007

##### SYSKIT - Simplifiez l'administration système avec Bash