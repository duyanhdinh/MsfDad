#!/bin/bash


path_album=$HOME/Softwares/msfdad/album
path_data=$HOME/Softwares/msfdad/data
path_run=$HOME/Softwares/msfdad/run

#-------------------------------------
trap "exit 0" 2

#-------------------------------------
choi=""

#-------------------------------------
intro(){
	clear
	echo -e "\t\t\t\e[1;36m Listen music to play list\e[0m"
	echo
	echo -e "Press\e[31m Ctrl C\e[0m to return"
	echo
}

#-------------------------------------
choice(){
	echo -e "\e[33m List:\e[0m"
	cat -n $path_data/list
	echo -en "\nYour choice:"
	read t
	choi="`head -$t $path_data/list |tail -1`"
	return
}

#-------------------------------------
intro
choice
gnome-terminal -e "bash $path_run/play_list.sh $choi" &
exit 0







