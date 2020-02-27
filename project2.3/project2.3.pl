#!/usr/bin/perl

#Ask for user input of file and then remove any new line characters that may be.
print "Please enter a full directory to file: ";
$inputfilename = <>;
chomp $inputfilename;


#Check if file exists and is readable, if not die else continue
if (-e $inputfilename && -r $inputfilename) {
    print "'$inputfilename' exists, continuing..\n";
} else {
    die "'$inputfilename' either does not exist or fails to have read permissions.\n";
}

#open the file to memory
open(inputfile, "$inputfilename");



print "Please enter the output file name: ";
$outputfilename = <>;
$outputfilename = "/tmp/" . $outputfilename;
chomp $outputfilename;

if (-e $outputfilename && -w $outputfilename) {
    print "'$outputfilename' is writeable, continuing..\n";
} else {
    print "'$outputfilename' does not have write permissions or perhaps does not exist.\n";
}

open(outputfile, ">$outputfilename");

while (<inputfile>) {
    s/\/home/\/export\/home/;
    print outputfile $_;
}