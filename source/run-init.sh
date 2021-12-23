#!/bin/bash
#----------
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
#----------
check_curl=$(dpkg -s curl 2>/dev/null)
check_jq=$(dpkg -s jq 2>/dev/null)
check_nano=$(dpkg -s nano 2>/dev/null)
#----------
[[ ! -d workspace ]] && mkdir workspace; 
#----------
if [[ ! "$check_curl" || ! "$check_jq" ]]; then
	echo -e "${YELLOW}[psmoll]${ENDCOLOR}: perform dependencies checking ..."
	[[ ! "$check_curl" ]] && echo -e "${YELLOW}[psmoll]${ENDCOLOR}: installing curl ...\n--"; apt-get install curl -y & wait; echo "--"
	[[ ! "$check_jq" ]] && echo -e "${YELLOW}[psmoll]${ENDCOLOR}: installing jq ...\n--"; apt-get install jq -y & wait; echo "--"
fi
echo -e "${YELLOW}[psmoll]${ENDCOLOR}: all package have been met"
echo -e "${YELLOW}[psmoll]${ENDCOLOR}: redirecting to main menu ..."; sleep 2s; echo "--"
bash source/run-menu.sh
