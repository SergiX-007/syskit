#!/bin/bash

# Affiche l'espace disque de tous les montages lisibles

disk_usage()
{
    clear
    echo -e "$( cat << "EOF"

        \033[032m === Utilisation disque ===\033[0m


    
EOF
)"
    df -h | sort -k5 -rn
}

# Affiche les N processus par consomation CPU

# Usage : top_processes [N]

top_processes()
{
    clear
    local n=${1:-10}
    echo -e "$( cat << EOF

        \033[032m === Top $n processus (CPU) ===\033[0m



EOF
)"
    ps aux --sort=-%cpu | head -n $((n + 1))
}

# Cherche les fichiers > SIZE Mo dans DIR

# Usage : find_large_files <dir> <size_mo>

find_large_files()
{
    local dir=${1:-.}
    local size=${2:-100}
    clear
    echo -e "$( cat << EOF

        \033[032m === Fichiers > ${size} Mo dans $dir ===\033[0m
EOF
)"
    find "$dir" -type f -size +"${size}"M -exec ls -lh {} \;
}
