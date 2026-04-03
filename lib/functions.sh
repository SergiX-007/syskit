#!/bin/bash

# ========================================================

#   Affiche l'espace disque de tous les montages lisibles

# ========================================================

disk_usage()
{
    clear
    echo -e "$( cat << "EOF"

        \033[032m === Utilisation disque ===\033[0m


    
EOF
)"
    df -h | sort -k5 -rn
}

# ========================================================

#   Affiche les N processus par consomation CPU

# ========================================================

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

# ========================================================

#   Cherche les fichiers > SIZE Mo dans DIR

# ========================================================

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

# ========================================================

# Affiche l'IP locale, la passerelle et les DNS

# ========================================================


net_info()
{
    clear
    echo -e "$( cat << "EOF"

        \033[032m === Informations réseau ===\033[0m


    
EOF
)"
    
    # IP locale
    echo -e "\033[036m◆ Adresse IP locale :\033[0m"
    hostname -I 2>/dev/null | tr ' ' '\n' | grep -v '^$' | while read -r ip; do
        echo "  └─ $ip"
    done
    
    # Passerelle
    echo -e "\n\033[036m◆ Passerelle par défaut :\033[0m"
    route -n 2>/dev/null | grep '^0.0.0.0' | awk '{print "  └─ "$2}' || \
    ip route | grep default | awk '{print "  └─ "$3}'
    
    # DNS
    echo -e "\n\033[036m◆ Serveurs DNS :\033[0m"
    cat /etc/resolv.conf 2>/dev/null | grep nameserver | awk '{print "  └─ "$2}'
    
    echo ""
}
# ========================================================

#      Résumé système

# ========================================================

sys_summary()
{
    clear
    echo -e "$( cat << "EOF"

        \033[032m === Résumé système ===\033[0m


    
EOF
)"
    
    # OS
    echo -e "\033[036m◆ Système d'exploitation :\033[0m"
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        echo "  └─ $NAME $VERSION"
    else
        echo "  └─ $(uname -s) $(uname -r)"
    fi
    
    # Kernel
    echo -e "\n\033[036m◆ Noyau :\033[0m"
    echo "  └─ $(uname -r)"
    
    # Uptime
    echo -e "\n\033[036m◆ Uptime :\033[0m"
    uptime | awk -F 'up ' '{print "  └─ " $2}' | awk -F ' users' '{print $1}'
    
    # RAM
    echo -e "\n\033[036m◆ Mémoire RAM :\033[0m"
    free -h | grep -E '^Mem:' | awk '{print "  └─ Total : "$2"  |  Utilisée : "$3"  |  Libre : "$4}'
    
    echo ""
}

# ========================================================

#   POUR LA DÉSINSTALLATION DE SYSKIT

# ========================================================

# Usage : rmvSyskit

rmvSyskit()
{
    clear
    echo -e "$( cat << EOF

                \033[031m === Désinstallation de syskit ===\033[0m

            \033[037m Attention : cette action est irréversible\033[0m

            \033[037m Veuillez confirmer la désinstallation (y/n) : \033[0m
EOF
)" && read -r REPLY 
case "$REPLY" in
    [Yy]* ) 
        cp ~/syskit/save/save_bashrc.txt ~/.bashrc
        rm -rf ~/syskit/
        echo "Désinstallation terminée." 
        source ~/.bashrc
    
    ;;
    * ) echo "Désinstallation annulée." ; return ;;
esac

}
