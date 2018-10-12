#!/bin/sh

declare -a dirs_1l
dirs_1l=`find -maxdepth 1 -type d | grep -v ^.$`

declare dtargets
for dir in $dirs; do
	check=`find "$dir" -maxdepth 1 -type d`
	if [[ $? -eq 0 ]] && [[ ! -z $check ]]; then
		dtargets+="$dir"$'\n'
	fi
done

echo "$dirs_1l" 
echo
echo "$dtargets"
