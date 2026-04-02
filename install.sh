#!/bin/bash
set -e  # arrête le script en cas d'erreur

clear

# Message de bienvenue et d'installation
echo -e "$( cat << EOF


                                \033[037m === BIENVENU DANS SYSKIT ===\033[0m


                    \033[037m === Un ensemble d'outils pour les administrateurs système ===\033[0m


                        \033[036m === Installation des alias et fonctions ===\033[0m
EOF
)" && sleep 4 && clear && echo -e "$( cat << EOF
    

                                \033[031m Ne fermer pas le terminal\033[0m

                                \033[037m Installation en cours ...\033[0m\033[31m0% \033[0m

EOF
)" && INSTALL_DIR="$HOME/syskit" && BASHRC="$HOME/.bashrc"

# Correction de la ligne SCRIPT_DIR (il y avait une erreur dans l'image)

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Créer le répertoire d'installation si absent
mkdir -p "$INSTALL_DIR" && sleep 4 && clear && echo -e "$( cat << EOF 


\033[032m 1 - Dossier source implanté ---- Fait\033[0m
                                
                                
                                
                                \033[037m Installation en cours ...\033[0m\033[0m10%\033[0m

EOF
)"

# Sauvegarde du .bashrc actuel avant modification

mkdir -p "$INSTALL_DIR/save" && cp "$BASHRC" "$INSTALL_DIR/save/save_bashrc.txt"

# Copie de aliases.sh et functions.sh dans ~/syskit

cp "$SCRIPT_DIR/lib/aliases.sh" "$INSTALL_DIR/aliases.sh" && cp "$SCRIPT_DIR/lib/functions.sh" "$INSTALL_DIR/functions.sh" &&sleep 4 && clear && echo -e "$( cat << EOF 


\033[032m 1 - Dossier source implanté\033[0m
\033[032m 2 - Implantation des fichiers source\033[0m
                               
                                
                                
                                \033[037m Installation en cours ...\033[0m\033[0m30%\033[0m

EOF
)" && sleep 5

# Vérifier si syskit est déjà chargé dans .bashrc

if grep -q "SYSKIT" "$BASHRC"; then

    echo "syskit est déjà présent dans $BASHRC, on ne modifie pas."

else
    # Ajouter les deux lignes source dans .bashrc
    echo -e "$(cat << EOF
# === SYSKIT Aliases and Functions ===

source $INSTALL_DIR/aliases.sh
source $INSTALL_DIR/functions.sh

# ====================================
EOF


)" >> "$BASHRC"


fi && sleep 4 && clear && echo -e "$( cat << EOF 


\033[032m 1 - Dossier source implanté\033[0m
\033[032m 2 - Fichiers source implantés\033[0m
\033[032m 3 - Implantation dans .bashrc\033[0m                               
                                
                                
                                \033[037m Installation en cours ...\033[0m\033[0m60%\033[0m
                                
                            \033[031m Attention : ne fermez pas le terminal\033[0m


EOF

)" && sleep 3 && clear && echo -e "$( cat << EOF 


\033[032m 1 - Dossier source implanté\033[0m
\033[032m 2 - Fichiers source implantés\033[0m
\033[032m 3 - Lignes implantées dans .bashrc\033[0m                               
                                
                                
                                \033[037m Installation terminée ...\033[0m\033[32m100%\033[0m
                                

EOF

)" && sleep 3 && clear && echo -e "$( cat << EOF
    
                                
                                \033[036m
                                ===========================

                                    Installation réussie

                                ===========================
                                \033[0m

EOF

)" && sleep 2 && clear && echo -e "$( cat << EOF
    
\033[37m  ─────────────────────────────────────────────────────────────
\033[36m       ███████╗██╗   ██╗███████╗\033[37m██╗  ██╗██╗████████╗     
\033[36m       ██╔════╝╚██╗ ██╔╝██╔════╝\033[37m██║ ██╔╝██║╚══██╔══╝
\033[36m       ███████╗ ╚████╔╝ ███████╗\033[37m█████╔╝ ██║   ██║   
\033[36m       ╚════██║  ╚██╔╝  ╚════██║\033[37m██╔═██╗ ██║   ██║   
\033[36m       ███████║   ██║   ███████║\033[37m██║  ██╗██║   ██║   
\033[36m       ╚══════╝   ╚═╝   ╚══════╝\033[37m╚═╝  ╚═╝╚═╝   ╚═╝   
\033[37m  ─────────────────────────────────────────────────────────────
\033[0m
EOF

)" && source "$BASHRC" && echo -e "$( cat << EOF

               \033[37m ➜  Lancez la commande  : \033[31msyskit
EOF

)"
