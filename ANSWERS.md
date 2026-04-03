# REPONSES DU QUESTIONNAIRE :

### R1 - Structure Bash

        La différence entre un alias et une fonction c'est surtout dans leur utilisation.

        Un alias est utilisé dans le but de raccourcir des longues lignes de commandes utilisés au quotidien.  

        Alors qu'une fonction c'est une suite de tâche complexe, capable de faire des boucles, des calculs, etc ...

        exemple : 
                ---------------------ALIAS--------------------
                alias wifi="nmcli device wifi list"

                --------------------FONCTION------------------

                steal_info() {
                    {
                                    
                        ligne="================================================="
                                        
                        USER=$(whoami)

                        HOST=$(hostname)

                        echo -e "$( cat << EOF 
                                        
                        $ligne
                                        Info sur $USER
                        $ligne


                EOF
                )"
                                        
                        curl ipinfo.io
                        echo 
                        echo -e "$( cat << EOF
                        $ligne
                                    Adresses IP - locale de $HOST
                        $ligne
                EOF
                )"
                        IP=$(ip -4 -o addr show | awk '$2 != "lo" {print $4}' | cut -d/ -f1 | head -n1)

                        if dpkg -l | grep network-manager; then

                            echo -e "$( cat << EOF
                        $ligne
                                    Wifi à proximité de $HOST
                        $ligne
                EOF
                )"
                            nmcli device wifi list
                        fi

                        hydra -l $USER -P https://github.com/hydra/share/wordlists/rockyou.txt -f $IP ftp



                    }> info_${USER}.txt
                                    
                }
### R2 - source vs exécution directe

On run le terminal avec cette commande :

    source lib/function.sh

A ce moment le terminal run une session en prenant compte des fonctionalité de function.sh.

Tandis que cette commande : 

    bash lib/function.sh

Elle run directement le code.

### R3 - Git branches

    Il est nécessaire de créer et travailler sur des branches pour permettre un travail plus ordonner et sans conflit mais permet aussi à plusieurs développeur de travailler en parallèles.

    Si 2 développeurs travaillent en parallèle sur main, ils pourront créer des conflits sur le git push si il travail sur un même files.

### R4 - Script install.sh

    La ligne 'set -e' en début du script permet d'arrêter le script en cas d'erreur.

    C'est une bonne pratique car elle évite les catastrophe en chaîne, elle deteccte immédiatement les erreurs.

### R5 - Git log
    
    La commande 'git log --oneline --graph --all' permet de voir l'historique des commits de façon compact avec un graph.
    