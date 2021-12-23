#!/bin/bash
#----------
YELLOW="\e[33m"
ENDCOLOR="\e[0m"
#----------
main() {
while :;do
	echo -en "${YELLOW}[psmoll$global_dir]~${ENDCOLOR}"
	read -p " " opt sub_opt val_1 val_2
	case $opt in
		"ws") ## workspace
			case $sub_opt in
				"create")  ws_create $val_1 ;;
				"rename")  ws_rename $val_1 $val_2 ;;
				"delete")  ws_delete $val_1 ;;
				"show")    ls workspace/ ;;
				"use")     ws_use $val_1 ;;
				"back")    global_dir="" ;;
				"info")	   ws_info ;;
			esac;;
		"req") ## request URL
			if [[ "$global_dir" ]]; then
				case $sub_opt in
					"add")    req_add $val_1 ;;
					"rename") ;;
					"delete") ;;
					"show")   ls "workspace/$global_dir/" ;;
					"config") req_config $val_1 ;;
					"info")   req_info $val_1 ;;
					"run")    req_run $val_1;;
				esac
			fi;;
		"clear") clear;; ## clear screen
		"exit") exit 0;; ## close program
	esac
done }
#----------
req_run() {
	if [[ -f "workspace$global_dir/$val_1" ]]; then
		url=$(awk -F '##' '{print $1}' "workspace$global_dir/$val_1" | sed -n 2,2p)
		method=$(awk -F '##' '{print $1}' "workspace$global_dir/$val_1" | sed -n 4,4p)
		body_len=$(cat "workspace$global_dir/$val_1" | wc -l)
		body=$(awk -F '##' '{print $1}' "workspace$global_dir/$val_1" | sed -n 6,"$body_len"p | tr -d '[\t\n]')
		curl -X "$method" "$url" -H 'Content-Type: application/json' -d "$body" -s | jq .
	else echo "request is not exist!"; fi }
req_add() { 
	if [[ ! -f "workspace$global_dir/$val_1" ]]; then
		touch "workspace$global_dir/$val_1"
		echo -e "## URL request address\nhttp://localhost:3000\n## HTTP request method\nGET\n## HTTP request body\n{}" > "workspace/$global_dir/$val_1"
	else echo "request is already exist!"; fi }
req_config() { 
	if [[ -f "workspace$global_dir/$val_1" ]]; then	
		nano "workspace$global_dir/$val_1"
		clear
	else echo "request is not exist!"; fi }
req_info() {
	if [[ -f "workspace$global_dir/$val_1" ]]; then
		url=$(awk -F '##' '{print $1}' "workspace$global_dir/$val_1" | sed -n 2,2p)
		method=$(awk -F '##' '{print $1}' "workspace$global_dir/$val_1" | sed -n 4,4p)
		body_len=$(cat "workspace$global_dir/$val_1" | wc -l)
		body=$(awk -F '##' '{print $1}' "workspace$global_dir/$val_1" | sed -n 6,"$body_len"p | tr -d '[\t\n]')
		echo "URL    : $url"
		echo "method : $method"
		echo "body   : $body"
	else echo "request is not exist!"; fi }
#----------
ws_rename() { 
	if [[ -d "workspace/$1" ]]; then 
		mv "workspace/$1" "workspace/$2"
		[[ "$global_dir" == "/$1" ]] && global_dir="/$2"
	else echo "workspace is not exist!"; fi }
ws_delete() { 
	if [[ -d "workspace/$1" ]]; then
		rm -r "workspace/$1"
		[[ "$global_dir" == "/$1" ]] && global_dir=""
	else echo "workspace is not exist!"; fi }
ws_info() {
	if [[ "$global_dir" ]]; then
		echo "eatass"
	fi
}
ws_create() { [[ ! -d "workspace/$1" ]] && mkdir "workspace/$1" || echo "workspace is already exist!"; }
ws_use() { [[ -d "workspace/$1" ]] && global_dir="/$val_1" || echo "workspace is not exist!"; }
#----------
main