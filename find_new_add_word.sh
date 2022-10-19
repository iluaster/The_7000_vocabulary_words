#!/bin/bash
IFS=$'\n'
for i in `cat new_7000.txt`
do
	grep "$i" old_7000.txt
	if [ "$?" -ne 0 ]; then
		echo "$i" >> new_add_word.txt
	fi
done

#find special words
grep '\/' new_add_word.txt > special_words.txt
grep '(' new_add_word.txt >> special_words.txt

#remove special words
sed -i -e 's/^.*\/.*//g' new_add_word.txt
sed -i -e 's/^.*(.*//g' new_add_word.txt

#remove blank lines
sed -i '/^$/d' new_add_word.txt
