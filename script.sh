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

e_handle() {
	err=$?
	if [ $err -ne 0 ];
		then echo "Ошибка выполнения команды #$err" | tee $log
	fi
}

while : ; do

	p_help
	
	read command

	case $command in
		1|pwd)
			echo `pwd`

			e_handle
			;;
		2|cd)	
			echo "Введите путь"
			read dir
			eval "cd $dir"
			
			e_handle
			;;
		3|ls)
			ls -a

			e_handle
			;;
		4|touch)
			read -r files
			eval "touch $files"
			
			e_handle
			;;
		5|rm)
			read files
			while true; do
				echo "Вы уверенны, что хотите удалить файлы? [y/n]"
				read confirm
				case $confirm in
					y|Y) 
						eval "rm $files"
					
						e_handle
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
