#!/bin/bash

path_album=$HOME/Softwares/msfdad/album
path_run=$HOME/Softwares/msfdad/run

#--------------------------------
trap "exit 0" 2

#--------------------------------
press(){
bash $path_run/$*.sh
}

#--------------------------------
intro(){
	clear
	echo -e "\t\t\t\e[1;36m Play music\e[0m"
	echo
	echo -e "Press\e[31m Ctl C\e[0m to return menu"
	echo
}
#--------------------------------
check_mpg(){
	t="`dpkg -l |grep mpg321`"
	if [ "$t" == "" ]; then
		echo -e "\e[33m To be used this feature, you need to install software\e[1;36m mpg321\e[0m"
		echo -en "Insall\e[1;36m mpg321\e[0m [Press 'Y' to install or everything to return menu]: "	
		read x
		[ "$x" != 'Y' ] && [ "$x" != 'y' ] && exit 0
		sudo apt-get install mpg321
		clear
		intro
		echo -e "\e[32m Install completed\e[0m"
		sleep 2
		clear
		intro
	fi
	return
}

#----------------------------------
check_album(){
	t="`ls $path_album`"
	[ "$t" == "" ] && {
		echo "You must have at least one album to listen to music"
		echo -n "Create album [Y/n]: "
		read x
		[ "$x" == "y" ] || [ "$x" == "Y" ] && bash $path_run/addalbum.sh || exit 0
	}
	return
}

#----------------------------------
intro
check_mpg
check_album
d=0
while [ "$d" == "0" ]; do
	intro
	echo -e "Press\e[31m 1\e[0m to play an album"
	echo -e "Press\e[31m 2\e[0m to play a playlist"
	echo -n "Your choice: "
	read d
	case "$d" in
		1)press listen_album;;
		2)press listen_list;;
		*)echo "I don't understand"
		sleep 2
		clear
		d=0
	esac 
done


exit 0
