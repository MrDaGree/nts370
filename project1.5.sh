#!/bin/bash

#guide on how to make jail taken from https://www.tecmint.com/restrict-ssh-user-to-directory-using-chrooted-jail/
#then made into script for quicker jail setup :)
echo "Path for SSH jail to be?"
read filePath


#check if above path is already created, if not create the directory and sub directories needed
if [ ! -d $filePath ]
then
	mkdir -p "$filePath"
	mkdir -p "$filePath/lib"
	mkdir -p "$filePath/lib64"
	mkdir -p "$filePath/dev"
	mkdir -p "$filePath/bin"
	mkdir -p "$filepath/etc"
fi


#create files, ownerships, and copy required files for it
mknod -m 666 "$filePath/dev/null" c 1 3
mknod -m 666 "$filePath/dev/tty" c 5 0
mknod -m 666 "$filePath/dev/zero" c 1 5
mknod -m 666 "$filePath/dev/random" c 1 8

#change ownership and execuatble state in file path specified.
chown root:root $filePath
chmod 0755 $filePath

#copy /bin/bash to the SSH directory under "bin"
cp -v /bin/bash "$filePath/bin"


#loop through required dependancies for /bin/bash
while read -r line
do
    path=$(echo $line | awk -F' ' '{ print $3 ;}')

    if [[ ${path:0:1} == "/" ]]
    then
	    pathDir=$(echo $path | tr "/" " " | awk -F' ' '{ print $1 ;}')

	    cp -v $path "$filePath/$pathDir"
    else
	    path=$(echo $line | awk -F' ' '{ print $1 ;}')
        if [[ ${path:0:1} == "/" ]]
        then
            pathDir=$(echo $path | tr "/" " " | awk -F' ' '{ print $1 ;}')

            cp -v $path "$filePath/$pathDir"
        fi
    fi

done < <(ldd /bin/bash)


#get all users, loop into long string with commas for sshd config
allUsers=$(awk -F':' '{ print $1 }' /etc/passwd)
for users in $allUsers
do
    if [ ! -z "$userList" ]
    then
        userList="${userList},$users"
    else
        userList="$users"
    fi
done


#echo user list into config with new ssh directory
echo "Match User $userList" >> /etc/ssh/sshd_config
echo "ChrootDirectory $filePath" >> /etc/ssh/sshd_config