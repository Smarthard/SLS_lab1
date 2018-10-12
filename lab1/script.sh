#!/bin/sh

log=$HOME/lab1_err

p_help() {
	echo "1. Напечатать имя текущего каталога" 
	echo "2. Сменить текущий каталог"
	echo "3. Напечатать содержимое текущего каталога"
	echo "4. Создать файл"
	echo "5. Удалить файл"
	echo "6. Выйти из программы"
}

while : ; do

	p_help
	
	read command

	case $command in
		1|pwd)
			echo `pwd` | tee $log
			;;
		2|cd)	
			echo "Введите путь"
			read dir
			eval "cd $dir | tee $log"
			;;
		3|ls)
			ls -a | tee $log
			;;
		4|touch)
			read -r files
			eval "touch $files | tee $log"
			;;
		5|rm)
			read files
			while true; do
				echo "Вы уверенны, что хотите удалить файлы? [y/n]"
				read confirm
				case $confirm in
					y|Y) 
						eval "rm $files | tee $log"
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
		*)
			echo "Неверная команда"
	esac
done
