#!/bin/sh

p_help() {
	eval "echo 'h|?|help)	this text
1|pwd) 		print working directory
2|cd)		change working directory
3|ls)		list files
4|touch)	create files
5|rm)		remove files
6|exit)		exit script'"
}

menu_off=false
bash_like=false

while getopts "mb" opt; do
	case $opt in
		m)
			menu_off=true;;
		b)	
			bash_like=true;;
	esac
done

while : ; do

	case $command in
		1|pwd)
			echo `pwd`
			;;
		2|cd)	
			echo "type directory path" 
			read dir
			eval "cd $dir"
			;;
		3|ls)
			ls -a
			;;
		4|touch)
			read files
			touch $files
			;;
		5|rm)
			read files
			rm $files
			;;
		6|exit)
			break;;
		h|?|help)
			p_help
			;;
	esac
	
	if [ ! $menu_off ] && [ ! $bash_like ];
	then
		p_help
	elif [ $bash_like ];
	then
		echo -n "$(pwd)$ "
	fi

	read command
done
