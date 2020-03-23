#!/bin/bash

#-------------------------------------
path_album=$HOME/Softwares/msfdad/album
path_data=$HOME/Softwares/msfdad/data

#-------------------------------------
previous(){
        i=$((i - 2));
        t="`head -$i $path_data/"$choi.txt" |tail -1`";
	pkill mpg321
}

#-------------------------------------
timee(){
	read -t 1 np
	[ "$np" == "2" ] && pkill mpg321
	[ "$np" == "1" ] && previous
}

#-------------------------------------
choi="$*"
d=`wc -l < $path_data/"$choi.txt"`
i=0
while [ "$i" != "$d" ]; do
        i=$((i + 1));
        t="`head -$i $path_data/"$choi.txt" |tail -1`";
        kt="`pgrep mpg321`"
        while [ "$kt" != "" ]; do
		timee
                kt="`pgrep mpg321`"
        done
	sleep 1
	clear
	echo -e "\t\t\t\e[1;33m Track no: 0$i\n\n\e[0m"
	mpg321 -v $path_album/"$choi"/"$t" &
	echo -ne "Press\e[1;31m 1\e[0m to previous"
	echo -e "\t\t\tPress\e[1;31m 2\e[0m to next"
	echo
done

exit 0
