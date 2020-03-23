#!/bin/bash

path_sw=$HOME/Softwares/msfdad/run
cd $HOME/Softwares
mkdir msfdad
cd msfdad
mkdir -p ./album data plist

press(){
bash $path_sw/$*.sh
}

set_mchoice(){
#clear
#echo -e "\e[42m"
echo
echo -e "\e[1;33m                            USE MUSIC "
echo -e "\e[0m"
#echo -e "\e[1;42m"
echo "Menu:"
echo
echo 'p - Play'
echo 'cu - Create and update Playlist'
echo 'a - Add new Album'
echo 'sh - Show Datashore'
echo 'u - Update Album'
echo 'sc - Save in Cloud********'
echo 'c - Creator'
echo 'q - Quit'
echo
#echo -e "\e[0;42m"
echo -n "Your choice: "
read mchoice
return
}

qu_it(){
clear
echo -n "You really want to quit [Y/n]: "
read x
[ $x == "Y" ] || [ $x == "y" ] && exit 0
clear
return
}

#------------------------------------------
clear
mchoice=""
quit=n
echo
while [ "$quit" != "y" ]; do
	set_mchoice
        case "$mchoice" in
                p) press plist;;
                cu) press creup;;
                a) press addalbum;;
                sh) press showw;;
                u) press upalbum;;
                sc) press scloud;;
                c)  press cdad;;
                q) qu_it;;
                *) {
                        clear
                        echo -e "\e[31m Please select the character choices are indications!"
                        }
        esac
done

exit 0
