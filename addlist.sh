#!/bin/bash

path_id=$HOME/Softwares/msfdad/data
path_ip=$HOME/Softwares/msfdad/plist

#-----------------------------------
t=""
name="$*"
#-----------------------------------
ali(){
        if [ "$1" == "0" ]; then
		k="`wc -l < $path_id/"$t.txt"`"
		i=0
		while [ "$i" != "$k" ]; do
			i=$((i + 1))
			d="`head -$i $path_id/"$t.txt" |tail -1`"
                	echo "$t:-$d" >> $path_ip/"$name.txt"
		done
                return
        fi
        while [ "$1" != "" ]; do
                d="`head -$1 $path_id/"$t.txt" |tail -1`"
                echo "$t:-$d" >> $path_ip/"$name.txt"
                shift
        done
        return
}

#-----------------------------------
ala(){
   while [ "$1" != "" ]; do
        clear
        t=`grep -n ".*" $path_id/list_album |grep "^$1:"`
        t=${t#*:}
        echo -e "Song of album\e[1;32m $t\e[0m : "
        cat -n $path_id/"$t.txt"
        echo
        echo -en "Press your choice (\e[31m 0\e[0m to all): "
        read so
        ali $so
        shift
   done
}

#-----------------------------------
echo "Please select albums containing songs to put on the playlist"
cat -n $path_id/list_album
echo -en "Your choice: "
read x
ala $x
clear
echo -e "\e[1;32m Complete\e[0m"
sleep 2
clear

exit 0
