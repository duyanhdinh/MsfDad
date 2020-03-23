#!/bin/bash

clear

path_sw=$HOME/Softwares/msfdad/data
path_al=$HOME/Softwares/msfdad/album
path_tmp=/tmp
link=$*

#--------------------------------------
what_space_al(){
echo -n $1
w_s=$(($# - 1))
while [ $w_s != 0 ]; do
        shift
        echo -n $1
        w_s=$((w_s - 1))
done
}

#-------------------------------------
track_tmp(){
cd "$link"
rm $path_tmp/"$al" 
clear
for i in "`ls *.mp3`"; do
	echo "$i" >> $path_tmp/"$al"
done
}

#-------------------------------------
imp_track(){
sed -i 's/ /?/g' $path_tmp/"$al"
mkdir $path_al/"$al" 
echo "$al" >>$path_sw/list_album

if [ "$1" == "0" ]; then
	for i in `grep .mp3 $path_tmp/"$al"`; do
		echo $i >>$path_sw/"$al".txt
		cp "$link"/"$i" $path_al/"$al"
	done
	return
fi
while [ "$1" != "" ]; do
	t=$1
	for i in `grep .mp3 $path_tmp/"$al"`; do
		t=$((t - 1))
		[ $t == 0 ] && {
			echo $i >>$path_sw/"$al".txt
			cp "$link"/"$i" $path_al/"$al"
			}	
	done
	shift
done
}

#-------------------------------------
chs_track(){
echo -e "\e[32m List Song: \e[0m"
cat -n $path_tmp/"$al" # |sed 's/@/ /g'
echo
echo "Choosing the song to the new album"  
echo -e "Enter\e[1;31m 0\e[0m to choose all song"
echo -en "Press numerical order of songs to album (separated by Space)"
echo -e " (exam:\e[33m 1 3 5 7 8\e[0m )"
echo -n "Your choice: "
echo -ne "\e[33m "
read song 
echo -e "\e[0m"
imp_track $song
return
}

#--------------------------------------
echo -e "\e[1;32m                         Create new Album "
echo -e "\e[0m"
echo -e "Press\e[1;31m Ctrl C\e[0m to menu"
echo
echo -n "New Album name: "
echo -ne "\e[33m "
read al
echo -e "\e[0m"
track_tmp
chs_track

rm $path_tmp/"$al"
clear
echo -e "\t\t\t\e[1;32m Creating successful album! \e[0m"
sleep 2


clear
exit 0
