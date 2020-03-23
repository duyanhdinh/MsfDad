#!/bin/bash

path_list=$HOME/Softwares/msfdad/data/list
path_run=$HOME/Softwares/msfdad/run
path_tmp=/tmp
path_p_list=$HOME/Softwares/msfdad/plist

#-----------------------------------
trap "exit 0" 2

#-----------------------------------
press(){
t=$1
shift
bash $path_run/$t.sh $*
}

#-----------------------------------
intro(){
        clear
        echo -e "\e[1;36m\t\t\t Update Playlist\e[0m"
        echo
        echo -e "Press\e[1;31m Ctrl C\e[0m to return"
        echo
}

#-----------------------------------
ychoice(){
	clear
	echo -e "Update playlist:\e[1;36m $*\e[0m"
	echo "List song:"
	cat -n $path_p_list/"$*.txt"
	echo
	echo -e "Press\e[31m 1\e[0m to add song"
	echo -e "Press\e[31m 2\e[0m to delete song"
	echo -e "Press\e[31m 3\e[0m to rename playlist"
	echo -e "Press\e[31m 4\e[0m to remove playlist"
	echo -n "Your choice: "
}

#-----------------------------------
rname(){
	echo -n "New name: "
	read x
	sed -i "s/$*/$x/g" $path_list	
	mv $path_p_list/"$*.txt" $path_p_list/"$x.txt"
	return
}

#-----------------------------------
rmpl(){
	grep -v "^$*$" $path_list > $path_tmp/list
	cat $path_tmp/list > $path_list
	rm $path_tmp/list
	rm $path_p_list/"$*.txt"
	return
}

#-----------------------------------
intro
echo "List of your playlist: "
cat -n $path_list
echo -n "Option 1 playlist to update: "
read upd
upd=`head -n $upd $path_list |tail -1`
t=0
while [ $t == "0" ]; do
    ychoice $upd
    read req
    t=1
    case "$req" in
	1) press addlist $upd;;
	2) press dlt_list $upd;;
	3) rname $upd;;
	4) rmpl $upd;;
	*) echo -e "\e[1;31m Please choose according to the proposal!\e[0m"
	   t=0;;
    esac
done


exit 0
