#!/bin/bash

clear

path_sv=$HOME/Softwares/msfdad
path_sw=$path_sv/run
cd $path_sv

trap "clear; exit 0" 2

control_w=1
cd $HOME

#---------------------------------------
intro_al(){
clear
echo -e "\e[1;32m                         Create new Album "
echo -e "\e[0m"
echo -e "Press\e[1;31m Ctrl C\e[0m to menu"
echo -e "Press\e[1;31m pkk\e[0m to return directory"
echo -e "Press\e[1;31m pcc\e[0m to stop move directory"
echo
}

#---------------------------------------
what_space(){
echo -n $1
w_s=$(($# - 1))
while [ $w_s != 0 ]; do
        shift
        echo -n ?$1
        w_s=$((w_s - 1))
done
}
#---------------------------------------
co_direc(){
        printf 'This directory [Y/n]: '
        read d
        [ $d == 'Y' ] || [ $d == 'y' ] && control_w="no"
}

#main-----------------------------------
while [ "$control_w" != "no" ]; do
   kt=`ls -l |grep ^d`
   if [ "$kt" != "" ]; then
        intro_al
        echo -e "Load albums in folders:\e[1;34m $PWD\e[0;34m"
        ls -d */
        echo -e "\e[0m"
        echo -n "Next directory: "
        read di_rec
        case "$di_rec" in
                pkk) cd ..; clear; continue;;
                pcc) co_direc; continue;;
                *) ;;
        esac
        cd "$di_rec"
   else
        co_direc
   fi
   clear
done

bash $path_sw/addtrack.sh $PWD





clear
exit 0
