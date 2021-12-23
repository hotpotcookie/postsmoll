#!/bin/bash
#----------
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
#----------
[[ $UID == 0 ]] && bash source/run-init.sh || echo -e "${YELLOW}[psmoll]${ENDCOLOR}: require root privileges"
