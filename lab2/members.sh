#!/bin/sh

if [[ $1 =~ ^[+-]?[0-9]+$ ]];
then
	declare -a gids=$(getent passwd | awk -F: '{printf $4 "\n"}' | uniq | sort)

	for gid in $gids; do
		count=$(getent passwd | awk -F: '{printf $4 "\n"}' | grep "$gid" | wc -l)	
		if [ $count -gt $1 ]
		then
			echo $(getent group "$gid" | cut -d: -f1)
		fi
	done
else
	echo "Argument must to be an integer number"
	exit 1
fi
