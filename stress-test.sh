#!/bin/bash
#----------
bars="---------------------------"
avg=0
#----------
while getopts ":i:n:k:m: :r :s" opt; do
	case $opt in
		i)	i="${OPTARG}" ;;
		m)	m="${OPTARG}" ;;
		k)	k="${OPTARG}" ;;
		n)	n="${OPTARG}" ;;
		r)  [[ -f "$i" ]] && w=$(cat $i) || w=$i; len=$(echo $w | wc -c)
			echo -e "Process : Ceasar ROT-$k ($m)"
			echo -e "Input   : $len bytes\n$bars"
			echo -e "SEQ\t| ELAPSED (SECONDS)\n$bars"
			for i in `seq 1 $n`; do
				echo -ne "$i\t| "
				run=$(./main rot $m "$w" $k | grep "finished")
				time=$(echo "$run" | cut -d ' ' -f 2); echo $time; printf "\033[1A"
				avg=$(bc -l <<< "$avg+$time")
			done;
			avg=$(bc -l <<< "scale=6; $avg/$n"); echo -e "AVERAGE\t| $avg"
			;;
		s) echo "upcoming opt" ;;
	esac
done

#----------
# [1] ./stress-test.sh -n 15 -k 13 -m enc -i asset/longtext.txt -r
