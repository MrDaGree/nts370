#!/bin/bash

input_number_check(){
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        return 1
    else
        return 0
    fi
}

printf "Enter start: "
read -r startInput

printf "\nEnter end: "
read -r endInput

if input_number_check $startInput;
then
        echo "One of the inputs were not numbers"
        exit 1
fi

if input_number_check $endInput;
then
        echo "One of the inputs were not numbers"
        exit 1
fi

for ((i=$startInput;i<=$endInput;i++))
do
    echo "Starting scan of 192.168.1.$i..."
    nmap "192.168.1.$i" >> project1.3_output
done