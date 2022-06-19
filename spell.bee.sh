!#/bin/bash

#  DO WHAT THE F... YOU WANT TO PUBLIC LICENSE
#
#  Copyright (C) 2022 Jaziel Lopez <jazlopez@github.com>
#
#  Everyone is permitted to copy and distribute verbatim or modified
#  copies of this license document, and changing it is allowed as long
#  as the name is changed.
#                                 
#  DO WHAT THE F... YOU WANT TO PUBLIC LICENSE
#  TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#  0. You just DO WHAT THE F... YOU WANT TO.

WORD=""

while true
  tput clear
  do
    tput sgr 0
    tput cup 0 0
    
    echo "=============================================================================="
    echo "                       SPELL BEE CONTEST PREPARATION"
    echo "                      Enter a word you want to spell."
    echo "                   Hear pronunciation and practice yourself."
    echo "                                Good luck"
    echo "==============================================================================="
   
    if [[ -z $WORD ]]; then
      read -p ">:" WORD
    else
      echo ">:$WORD"
    fi

    printf "  "
    tput smul
    for (( i=0; i<${#WORD}; i++ ))
      do
        CHAR="${WORD:$i:1}"
        printf "$CHAR"
        say "$CHAR" 
        sleep 0.66
    done
    say "$WORD"
    echo

    tput rmul
    tput setaf 6
    echo 
    echo "................ What to do next ................"
    echo " [Y|y] to repeat word"
    echo " [Q|q] to close program"
    echo
    echo "... press any other key to spell another word..."
    echo 
    read -n 1 -p ">:" OPT
  
    [[ $OPT =~ [Q|q] ]] && break
    [[ ! $OPT =~ [Yy] ]] && WORD=""

done

