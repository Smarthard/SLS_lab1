#!/bin/sh

p_help() {
	local menu=(	"Напечатать имя текущего каталога" 
			"Сменить текущий каталог"
			"Напечатать содержимое текущего каталога"
			"Создать файл"
			"Удалить файл"
			"Выйти из программы")

	for i in ${!menu[*]}
       	do
		printf "%d. %s\n" $(($i + 1)) "${menu[$i]}"
	done
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
			while true; do
				echo -n "Are you sure you want to remove this files? [y/n] "
				read confirm
				case $confirm in
					y|Y) 
						eval "rm $files"
						break
						;;
					n|N)
						break
						;;
				esac
			done
			;;
		6|exit)
			break;;
	esac
done
