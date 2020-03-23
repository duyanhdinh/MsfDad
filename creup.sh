#!/bin/bash


path_id=$HOME/Softwares/msfdad/data
path_ip=$HOME/Softwares/msfdad/plist
path_run=$HOME/Softwares/msfdad/run
path_album=$HOME/Softwares/msfdad/album

#---------------------------------------
trap "exit 0" 2
#---------------------------------------
press(){
bash $path_run/$*.sh
}

#---------------------------------------
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

#---------------------------------------
clear
check_album
touch $path_id/list
[ "`wc -l< $path_id/list_album`" == "0" ] && {
	wc -l< $path_id/list
	echo -e "\e[1;31m The first, you need to create albums\e[0m"
	sleep 2
	exit 0
}
while [ 0 ]; do
	echo -e "\e[1;36m\t\t\t Create and update Playlist\e[0m"
	echo
	echo -e "Press\e[31m 1\e[0m to create Playlist"
	echo -e "Press\e[31m 2\e[0m to update Playlist"
	echo -e "Press\e[31m Ctrl C\e[0m to return menu"
	echo -n "Your choice: "
	read x
	case "$x" in
		1) press crepl;;
		2) press updpl;;
		*) echo -e "\e[31m Please select the character choices are indications"
		sleep 2;;
	esac
#	clear
done
 
exit 0
