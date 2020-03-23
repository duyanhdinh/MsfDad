#!/bin/bash


path_id=$HOME/Softwares/msfdad/data
path_run=$HOME/Softwares/msfdad/run

#-----------------------------------
trap "exit 0" 2
#-----------------------------------
intro(){
	clear
	echo -e "\e[1;36m\t\t\t Create New Playlist\e[0m"
	echo
	echo -e "Press\e[1;31m Ctrl C\e[0m to return"
	echo
}

#-----------------------------------
intro
echo -n "New Playlist name: "
read name
echo "$name" >> $path_id/list
echo
bash $path_run/addlist.sh $name 
clear
echo -e "\t\t\t\e[1;32m Complete\e[0m"
sleep 2

exit 0

