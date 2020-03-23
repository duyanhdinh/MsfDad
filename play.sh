#!/bin/bash

path_album=$HOME/Softwares/msfdad/album
path_data=$HOME/Softwares/msfdad/data

choi="$*"
d=`wc -l < $path_data/"$choi.txt"`
        i=0
        while [ "$i" != "$d" ]; do
                i=$((i + 1));
                clear;
                t="`head -$i $path_data/"$choi.txt" |tail -1`";
                kt="`pgrep mpg321`"
                while [ "$kt" != "" ]; do
                        sleep 2
                        kt="`pgrep mpg321`"
                done
                gnome-terminal -e "mpg321 -v $path_album/\"$choi\"/\"$t\" &" &
                sleep 5
        done

exit 0
