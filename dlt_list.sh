#!/bin/bash

path_id=$HOME/Softwares/msfdad/data
path_ip=$HOME/Softwares/msfdad/plist
path_tmp=/tmp

#------------------------------------
name="$*"
#------------------------------------
dele(){
	grep -n ".*" $path_ip/"$name.txt" > $path_tmp/del
	t="$path_tmp/del"
	while [ "$1" != "" ]; do
		grep -v "^$1:" $t > $path_tmp/$1
		rm "$t"
		t="$path_tmp/$1"
		shift
	done
	rm $path_ip/"$name.txt"
	d="`wc -l < $t`"
	i=0
	while [ "$d" != "$i" ]; do
		i=$((i + 1))
		k="`head -$i $t |tail -1`"
		k=${k#*:}	
		echo $k >>$path_ip/"$name.txt"
	done
	rm $t
	return
}

#------------------------------------
echo "List song of playlist $*: "
cat -n $path_ip/"$name.txt"
echo -n "Choose song to delete (in numerical order): "
read num
dele $num
clear 
echo -e "\t\t\t\e[1;32m Complete\e[0m"
sleep 2
clear

exit 0
