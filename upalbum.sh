#!/bin/bash

path_run=$HOME/Softwares/msfdad/run
path_data=$HOME/Softwares/msfdad/data
path_lalbum=$path_data/list_album
path_llist=$path_data/list
path_list=$HOME/Softwares/msfdad/plist
path_album=$HOME/Softwares/msfdad/album

#--------------------------------
trap "exit 0" 2

#--------------------------------
intro(){
	echo -e "\t\t\t\e[1;33m Upload Album\n\n\e[0m"
	echo -e "Press\e[31m 1\e[0m to rename album"
	echo -e "Press\e[31m 2\e[0m to delete album"
	echo -e "Press\e[31m 3\e[0m to rename song of album"
	echo -e "Press\e[31m 4\e[0m to remove song of album"
	echo -e "Press\e[31m 5\e[0m to add new song to album"
	echo -e "Press\e[31m Ctrl C\e[0m to back\n\n"
	return
}

#---------------------------------
rname(){
	clear
	echo -e "\e[1;36m Rename Album\e[0m"	
	echo -e "\nList album:"
	cat -n $path_lalbum
	echo -n "You choice album: "	
	read ona
	echo -n "New name to album: "
	read nna

	ona="`head -$ona $path_lalbum |tail -1`"
	sed -i "s/^$ona$/$nna/g" $path_lalbum
	mv $path_data/"$ona.txt" $path_data/"$nna.txt"
	t="`wc -l < $path_llist`"
	i=0
	while [ "$i" != "$t" ]; do
		i=$((i + 1))
		dl="`head -$i $path_llist |tail -1`"	
		sed -i "s/$ona:-/$nna:-/g" $path_list/"$dl.txt"
	done
	mv $path_album/"$ona" $path_album/"$nna"
	return
}

#---------------------------------
dlt(){
        clear
        echo -e "\e[1;36m Delete Album\e[0m"
        echo -e "\nList album:"
        cat -n $path_lalbum
        echo -n "You choice album: "
        read dle
        dle="`head -$dle $path_lalbum |tail -1`"
	echo -e "\e[1;33m This behavior can not be returned"	
	echo -ne "Do you really want to delete album\e[1;31m $dla\e[0m [Y/n]: "
	read de 
	[ "$de" != "Y" ] && [ "$de" != "y" ] && return
	sed -i "/^$dle$/d" $path_lalbum
	cd $path_data
	rm "$dle.txt"
        t="`wc -l < $path_llist`"
        i=0
        while [ "$i" != "$t" ]; do
                i=$((i + 1))
		dl="`head -$i $path_llist |tail -1`"	
		sed -i "/$dle:-*/d" $path_list/"$dl.txt"
        done
	rm -rf $path_album/"$dle"

}
#---------------------------------
pre=""
while [ "$pre" == "" ]; do
   clear
   intro
   echo -n "Your choice: "
   read pre
   case "$pre" in
	1) rname;;
	2) dlt;;
	3) rsong;;
	4) dsong;;
	5) asong;;
	*) echo -e "\e[1;31m I do not understand\e[0m";
	   sleep 2;
	   pre="";;
   esac
done

exit 0
