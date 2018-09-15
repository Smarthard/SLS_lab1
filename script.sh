#!/bin/sh

exec 2>>~/lab1_err

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

e_handle() {
	err=$?
	if [ $err -ne 0 ];
		then echo "Ошибка выполнения команды #$err"
	fi
}

menu_off=false
bash_like=false

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
			eval "touch '$files'"
			
			e_handle
			;;
		5|rm)
			read files
			while true; do
				echo -n "Вы уверенны, что хотите удалить файлы? [y/n]"
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
