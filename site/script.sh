#!/bin/bash
filename="files"
i=0

echo "Missing Files" > log

while read -r line
do
	name="$line"
	if [ ! -e $name ]; then
		i=$(($i+1));
		echo $name >> log;
	fi
done < "$filename"
sed -i -e 's/<!-- -->/<p>Missing files: '$i' <\/p>/g' index.html

cat log
