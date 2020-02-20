#!/usr/bin/perl

#prompt for user to enter the file name
print "Please enter the name of a filename: ";

#open a file and save to "fileName" variable with input from console
open(FILENAME,<STDIN>);

#print message before content stating the start of the file content
print "\nHere are the contents of the file:\n\n";

#loop through each line in the file and print the content 
while (<FILENAME>) {
    print $_;
}
