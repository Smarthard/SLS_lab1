#!/bin/sh

declare -a dirs=`find "$1" -maxdepth 1 -type d -print | egrep -v '^[.]{,2}$'`
declare -a targets

for dir in ${dirs[@]}; do
	check=`find "$dir" -maxdepth 1 -type d | grep -v "^$dir$"`
	if [ $? -eq 0 -a -n "$check" ]; then
		targets+="$dir"$'\n'
	fi
done

echo "$targets"
