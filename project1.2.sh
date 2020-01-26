#!/bin/bash

cat /etc/passwd | sort | awk -F':' '{ print($1,$6,$7) }' > users.txt
#cat outputs the /etc/passwd file, that is then pipped into the sort
#command that sorts it alphabetically. Once it is sorted the output
#is pipped into awk looking for ':' to split the string and outputting
#the 1st,6th, and 7th value in the array. That is then printed to users.txt
#file in the current directory
