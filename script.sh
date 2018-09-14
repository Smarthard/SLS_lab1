#!/bin/sh

p_help() {
	eval "echo '=== MENU ===
1|pwd) 		print working directory
2|cd)		change working directory
3|ls)		list files
4|touch)	create files
5|rm)		remove files
6|exit)		exit script'"
}

menu_off=false
bash_like=false

while : ; do

	p_help
	
	read command

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
			read -r files
			eval "touch $files"
			;;
		5|rm)
			read files
			eval "rm $files"
			;;
		6|exit)
			break;;
	esac
	echo	
done
